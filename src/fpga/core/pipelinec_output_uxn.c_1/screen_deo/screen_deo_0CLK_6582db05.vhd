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
-- BIN_OP_EQ[uxn_device_h_l40_c6_b428]
signal BIN_OP_EQ_uxn_device_h_l40_c6_b428_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_b428_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_6a5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l40_c2_8c29]
signal sprite_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l40_c2_8c29]
signal pixel_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l40_c2_8c29]
signal layer_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l40_c2_8c29]
signal is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l40_c2_8c29]
signal result_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l40_c2_8c29_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l40_c2_8c29_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l40_c2_8c29_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l40_c2_8c29]
signal auto_advance_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l40_c2_8c29]
signal y_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l40_c2_8c29]
signal vram_addr_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l40_c2_8c29]
signal x_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l40_c2_8c29]
signal color_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c7_3266]
signal BIN_OP_EQ_uxn_device_h_l42_c7_3266_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_3266_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l42_c3_0e0b]
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_0e0b]
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l42_c3_0e0b]
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l50_c11_ec85]
signal BIN_OP_EQ_uxn_device_h_l50_c11_ec85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_ec85_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_f587]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l50_c7_6a5a]
signal sprite_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l50_c7_6a5a]
signal pixel_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l50_c7_6a5a]
signal layer_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l50_c7_6a5a]
signal is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l50_c7_6a5a]
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l50_c7_6a5a]
signal result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l50_c7_6a5a]
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l50_c7_6a5a]
signal result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l50_c7_6a5a]
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l50_c7_6a5a]
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l50_c7_6a5a]
signal auto_advance_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l50_c7_6a5a]
signal y_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l50_c7_6a5a]
signal vram_addr_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l50_c7_6a5a]
signal x_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l50_c7_6a5a]
signal color_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l51_c7_edcb]
signal BIN_OP_EQ_uxn_device_h_l51_c7_edcb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_edcb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l51_c3_259d]
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l51_c3_259d]
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c11_7ded]
signal BIN_OP_EQ_uxn_device_h_l57_c11_7ded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_7ded_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_f56a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l57_c7_f587]
signal sprite_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l57_c7_f587]
signal pixel_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l57_c7_f587]
signal layer_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l57_c7_f587]
signal is_fill_mode_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l57_c7_f587]
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l57_c7_f587]
signal result_u8_value_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l57_c7_f587]
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l57_c7_f587]
signal result_vram_address_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l57_c7_f587]
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l57_c7_f587]
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l57_c7_f587]
signal auto_advance_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l57_c7_f587]
signal y_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l57_c7_f587]
signal vram_addr_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l57_c7_f587]
signal x_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l57_c7_f587]
signal color_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l58_c7_c79b]
signal BIN_OP_EQ_uxn_device_h_l58_c7_c79b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_c79b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l58_c3_121f]
signal layer_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l58_c3_121f]
signal is_fill_mode_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l58_c3_121f]
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l58_c3_121f]
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l58_c3_121f]
signal pixel_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l58_c3_121f]
signal color_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_device_h_l61_c20_ea3b]
signal BIN_OP_AND_uxn_device_h_l61_c20_ea3b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_ea3b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_ea3b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l61_c20_46fa]
signal BIN_OP_EQ_uxn_device_h_l61_c20_46fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_46fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_46fa_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l61_c20_1052]
signal MUX_uxn_device_h_l61_c20_1052_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_1052_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_1052_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_1052_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l62_c13_afbc]
signal BIN_OP_AND_uxn_device_h_l62_c13_afbc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_afbc_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_afbc_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l62_c13_e95f]
signal MUX_uxn_device_h_l62_c13_e95f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_e95f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_e95f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_e95f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l68_c11_913a]
signal BIN_OP_EQ_uxn_device_h_l68_c11_913a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_913a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_5fa1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l68_c7_f56a]
signal sprite_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l68_c7_f56a]
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l68_c7_f56a]
signal result_u8_value_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l68_c7_f56a]
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l68_c7_f56a]
signal result_vram_address_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l68_c7_f56a]
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l68_c7_f56a]
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l68_c7_f56a]
signal auto_advance_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l68_c7_f56a]
signal y_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l68_c7_f56a]
signal vram_addr_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l68_c7_f56a]
signal x_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c7_21fe]
signal BIN_OP_EQ_uxn_device_h_l69_c7_21fe_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_21fe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l69_c3_45f7]
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l69_c3_45f7]
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l75_c11_d8b3]
signal BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_8617]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l75_c7_5fa1]
signal sprite_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l75_c7_5fa1]
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l75_c7_5fa1]
signal result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l75_c7_5fa1]
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l75_c7_5fa1]
signal result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l75_c7_5fa1]
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l75_c7_5fa1]
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l75_c7_5fa1]
signal auto_advance_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l75_c7_5fa1]
signal y_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l75_c7_5fa1]
signal vram_addr_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l75_c7_5fa1]
signal x_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l76_c7_b98b]
signal BIN_OP_EQ_uxn_device_h_l76_c7_b98b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_b98b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l76_c3_7404]
signal sprite_MUX_uxn_device_h_l76_c3_7404_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_7404_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_7404_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_7404_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l76_c3_7404]
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l76_c3_7404]
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l83_c11_7e2d]
signal BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_f6bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l83_c7_8617]
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l83_c7_8617]
signal result_u8_value_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l83_c7_8617]
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l83_c7_8617]
signal result_vram_address_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l83_c7_8617]
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l83_c7_8617]
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l83_c7_8617]
signal auto_advance_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l83_c7_8617]
signal y_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l83_c7_8617]
signal vram_addr_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l83_c7_8617]
signal x_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l84_c7_e96e]
signal BIN_OP_EQ_uxn_device_h_l84_c7_e96e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_e96e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l84_c3_26c0]
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l84_c3_26c0]
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_993b]
signal BIN_OP_EQ_uxn_device_h_l90_c11_993b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_993b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_62da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_f6bf]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l90_c7_f6bf]
signal result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l90_c7_f6bf]
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_f6bf]
signal result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_f6bf]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_f6bf]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_f6bf]
signal auto_advance_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l90_c7_f6bf]
signal y_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l90_c7_f6bf]
signal vram_addr_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l90_c7_f6bf]
signal x_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_0189]
signal BIN_OP_EQ_uxn_device_h_l91_c7_0189_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_0189_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_ab37]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_ab37]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l91_c3_ab37]
signal x_MUX_uxn_device_h_l91_c3_ab37_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l91_c3_ab37_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_ab37_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_ab37_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_0eba]
signal BIN_OP_EQ_uxn_device_h_l99_c11_0eba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_0eba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_59c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_62da]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l99_c7_62da]
signal result_u8_value_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l99_c7_62da]
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_62da]
signal result_vram_address_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_62da]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_62da]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_62da]
signal auto_advance_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l99_c7_62da]
signal y_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l99_c7_62da]
signal vram_addr_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l99_c7_62da]
signal x_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_ea76]
signal BIN_OP_EQ_uxn_device_h_l100_c7_ea76_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_ea76_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_8efc]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_8efc]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l106_c11_d5bf]
signal BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_ad05]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l106_c7_59c4]
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l106_c7_59c4]
signal result_u8_value_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l106_c7_59c4]
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l106_c7_59c4]
signal result_vram_address_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l106_c7_59c4]
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l106_c7_59c4]
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l106_c7_59c4]
signal auto_advance_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l106_c7_59c4]
signal y_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l106_c7_59c4]
signal vram_addr_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l106_c7_59c4]
signal x_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c7_4f2c]
signal BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c3_3944]
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c3_3944]
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l107_c3_3944]
signal x_MUX_uxn_device_h_l107_c3_3944_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c3_3944_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_3944_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_3944_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l108_c4_9319]
signal BIN_OP_OR_uxn_device_h_l108_c4_9319_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_9319_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_9319_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_cfe0]
signal BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_2b2b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l114_c7_ad05]
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l114_c7_ad05]
signal result_u8_value_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l114_c7_ad05]
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l114_c7_ad05]
signal result_vram_address_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l114_c7_ad05]
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l114_c7_ad05]
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_ad05]
signal auto_advance_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l114_c7_ad05]
signal y_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_ad05]
signal vram_addr_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l115_c7_977f]
signal BIN_OP_EQ_uxn_device_h_l115_c7_977f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_977f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_7130]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l115_c3_7130]
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l121_c11_1022]
signal BIN_OP_EQ_uxn_device_h_l121_c11_1022_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_1022_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_bce2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l121_c7_2b2b]
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l121_c7_2b2b]
signal result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l121_c7_2b2b]
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l121_c7_2b2b]
signal result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l121_c7_2b2b]
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l121_c7_2b2b]
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l121_c7_2b2b]
signal auto_advance_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l121_c7_2b2b]
signal y_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l121_c7_2b2b]
signal vram_addr_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l122_c7_ba89]
signal BIN_OP_EQ_uxn_device_h_l122_c7_ba89_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_ba89_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l122_c3_0851]
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l122_c3_0851]
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l122_c3_0851]
signal y_MUX_uxn_device_h_l122_c3_0851_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l122_c3_0851_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_0851_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_0851_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_a577]
signal BIN_OP_EQ_uxn_device_h_l130_c11_a577_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_a577_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_85fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l130_c7_bce2]
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l130_c7_bce2]
signal result_u8_value_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l130_c7_bce2]
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l130_c7_bce2]
signal result_vram_address_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l130_c7_bce2]
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l130_c7_bce2]
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l130_c7_bce2]
signal auto_advance_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l130_c7_bce2]
signal y_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l130_c7_bce2]
signal vram_addr_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c7_5972]
signal BIN_OP_EQ_uxn_device_h_l131_c7_5972_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_5972_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l131_c3_c562]
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l131_c3_c562]
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_69cc]
signal BIN_OP_EQ_uxn_device_h_l137_c11_69cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_69cc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_001c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l137_c7_85fc]
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l137_c7_85fc]
signal result_u8_value_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l137_c7_85fc]
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l137_c7_85fc]
signal result_vram_address_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l137_c7_85fc]
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l137_c7_85fc]
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l137_c7_85fc]
signal auto_advance_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l137_c7_85fc]
signal y_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l137_c7_85fc]
signal vram_addr_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c7_370d]
signal BIN_OP_EQ_uxn_device_h_l138_c7_370d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_370d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l138_c3_c628]
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l138_c3_c628]
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l138_c3_c628]
signal y_MUX_uxn_device_h_l138_c3_c628_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c3_c628_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_c628_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_c628_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l139_c4_63d6]
signal BIN_OP_OR_uxn_device_h_l139_c4_63d6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_63d6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_63d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_18ef]
signal BIN_OP_EQ_uxn_device_h_l145_c11_18ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_18ef_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_c96e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l145_c7_001c]
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l145_c7_001c]
signal result_u8_value_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l145_c7_001c]
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l145_c7_001c]
signal result_vram_address_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l145_c7_001c]
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l145_c7_001c]
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_001c]
signal auto_advance_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_001c]
signal vram_addr_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l146_c7_42dd]
signal BIN_OP_EQ_uxn_device_h_l146_c7_42dd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_42dd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l146_c3_b81d]
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l146_c3_b81d]
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_4be2]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c27_a755]
signal BIN_OP_PLUS_uxn_device_h_l147_c27_a755_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_a755_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_a755_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l147_c27_18bc]
signal BIN_OP_GT_uxn_device_h_l147_c27_18bc_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_18bc_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_18bc_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l147_c27_b777]
signal MUX_uxn_device_h_l147_c27_b777_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_b777_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_b777_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_b777_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l153_c11_b532]
signal BIN_OP_EQ_uxn_device_h_l153_c11_b532_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_b532_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_b522]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l153_c7_c96e]
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l153_c7_c96e]
signal result_u8_value_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l153_c7_c96e]
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l153_c7_c96e]
signal result_vram_address_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l153_c7_c96e]
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l153_c7_c96e]
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l153_c7_c96e]
signal auto_advance_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l153_c7_c96e]
signal vram_addr_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l154_c7_4cd8]
signal BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_7eff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l154_c3_38cb]
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l154_c3_38cb]
signal result_u8_value_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l154_c3_38cb]
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l154_c3_38cb]
signal result_vram_address_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l154_c3_38cb]
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l154_c3_38cb]
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l154_c3_38cb]
signal auto_advance_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l154_c3_38cb]
signal vram_addr_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(31 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_e980]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c4_0848]
signal result_vram_address_MUX_uxn_device_h_l160_c4_0848_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_0848_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_0848_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_0848_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c4_0848]
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l160_c4_0848]
signal vram_addr_MUX_uxn_device_h_l160_c4_0848_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_0848_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_0848_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_0848_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_b8d0]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l161_c18_dfd7]
signal BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l162_c5_7f92]
signal BIN_OP_AND_uxn_device_h_l162_c5_7f92_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_7f92_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_7f92_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l163_c21_eecc]
signal BIN_OP_AND_uxn_device_h_l163_c21_eecc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_eecc_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_eecc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l163_c21_831f]
signal BIN_OP_GT_uxn_device_h_l163_c21_831f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_831f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_831f_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l163_c21_cd6b]
signal MUX_uxn_device_h_l163_c21_cd6b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l163_c21_cd6b_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_cd6b_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_cd6b_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l163_c5_e1cf]
signal BIN_OP_OR_uxn_device_h_l163_c5_e1cf_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_e1cf_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_e1cf_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l164_c21_f0ee]
signal BIN_OP_AND_uxn_device_h_l164_c21_f0ee_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_f0ee_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_f0ee_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l164_c21_2af3]
signal BIN_OP_GT_uxn_device_h_l164_c21_2af3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_2af3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_2af3_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l164_c21_25d7]
signal MUX_uxn_device_h_l164_c21_25d7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l164_c21_25d7_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_25d7_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_25d7_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l164_c5_9d2f]
signal BIN_OP_OR_uxn_device_h_l164_c5_9d2f_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_9d2f_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_9d2f_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l165_c5_67de]
signal BIN_OP_OR_uxn_device_h_l165_c5_67de_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_67de_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output : unsigned(31 downto 0);

-- printf_uxn_device_h_l168_c5_8ed9[uxn_device_h_l168_c5_8ed9]
signal printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg2 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg3 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg4 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_9f09]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l171_c28_8555]
signal BIN_OP_PLUS_uxn_device_h_l171_c28_8555_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_8555_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_8555_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l178_c11_a4c7]
signal BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l178_c7_8a14]
signal result_u8_value_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l178_c7_8a14]
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l178_c7_8a14]
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l178_c7_8a14]
signal result_vram_address_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l179_c7_8699]
signal BIN_OP_EQ_uxn_device_h_l179_c7_8699_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_8699_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l179_c3_a172]
signal result_u8_value_MUX_uxn_device_h_l179_c3_a172_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_a172_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_a172_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_a172_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l179_c3_a172]
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l179_c3_a172]
signal result_vram_address_MUX_uxn_device_h_l179_c3_a172_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_a172_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_a172_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_a172_return_output : unsigned(31 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output : unsigned(15 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_52ed( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_deo_done := ref_toks_3;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_fd50( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.is_vram_write := ref_toks_5;
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

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l40_c6_b428
BIN_OP_EQ_uxn_device_h_l40_c6_b428 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l40_c6_b428_left,
BIN_OP_EQ_uxn_device_h_l40_c6_b428_right,
BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- sprite_MUX_uxn_device_h_l40_c2_8c29
sprite_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l40_c2_8c29_cond,
sprite_MUX_uxn_device_h_l40_c2_8c29_iftrue,
sprite_MUX_uxn_device_h_l40_c2_8c29_iffalse,
sprite_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- pixel_MUX_uxn_device_h_l40_c2_8c29
pixel_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l40_c2_8c29_cond,
pixel_MUX_uxn_device_h_l40_c2_8c29_iftrue,
pixel_MUX_uxn_device_h_l40_c2_8c29_iffalse,
pixel_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- layer_MUX_uxn_device_h_l40_c2_8c29
layer_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l40_c2_8c29_cond,
layer_MUX_uxn_device_h_l40_c2_8c29_iftrue,
layer_MUX_uxn_device_h_l40_c2_8c29_iffalse,
layer_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- is_fill_mode_MUX_uxn_device_h_l40_c2_8c29
is_fill_mode_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_cond,
is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iftrue,
is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iffalse,
is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- result_MUX_uxn_device_h_l40_c2_8c29
result_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l40_c2_8c29_cond,
result_MUX_uxn_device_h_l40_c2_8c29_iftrue,
result_MUX_uxn_device_h_l40_c2_8c29_iffalse,
result_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- auto_advance_MUX_uxn_device_h_l40_c2_8c29
auto_advance_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l40_c2_8c29_cond,
auto_advance_MUX_uxn_device_h_l40_c2_8c29_iftrue,
auto_advance_MUX_uxn_device_h_l40_c2_8c29_iffalse,
auto_advance_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- y_MUX_uxn_device_h_l40_c2_8c29
y_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l40_c2_8c29_cond,
y_MUX_uxn_device_h_l40_c2_8c29_iftrue,
y_MUX_uxn_device_h_l40_c2_8c29_iffalse,
y_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- vram_addr_MUX_uxn_device_h_l40_c2_8c29
vram_addr_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l40_c2_8c29_cond,
vram_addr_MUX_uxn_device_h_l40_c2_8c29_iftrue,
vram_addr_MUX_uxn_device_h_l40_c2_8c29_iffalse,
vram_addr_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- x_MUX_uxn_device_h_l40_c2_8c29
x_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l40_c2_8c29_cond,
x_MUX_uxn_device_h_l40_c2_8c29_iftrue,
x_MUX_uxn_device_h_l40_c2_8c29_iffalse,
x_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- color_MUX_uxn_device_h_l40_c2_8c29
color_MUX_uxn_device_h_l40_c2_8c29 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l40_c2_8c29_cond,
color_MUX_uxn_device_h_l40_c2_8c29_iftrue,
color_MUX_uxn_device_h_l40_c2_8c29_iffalse,
color_MUX_uxn_device_h_l40_c2_8c29_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c7_3266
BIN_OP_EQ_uxn_device_h_l42_c7_3266 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c7_3266_left,
BIN_OP_EQ_uxn_device_h_l42_c7_3266_right,
BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b
result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_cond,
result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b
result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_cond,
result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_return_output);

-- BIN_OP_EQ_uxn_device_h_l50_c11_ec85
BIN_OP_EQ_uxn_device_h_l50_c11_ec85 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l50_c11_ec85_left,
BIN_OP_EQ_uxn_device_h_l50_c11_ec85_right,
BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_return_output);

-- sprite_MUX_uxn_device_h_l50_c7_6a5a
sprite_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l50_c7_6a5a_cond,
sprite_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
sprite_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
sprite_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- pixel_MUX_uxn_device_h_l50_c7_6a5a
pixel_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l50_c7_6a5a_cond,
pixel_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
pixel_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
pixel_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- layer_MUX_uxn_device_h_l50_c7_6a5a
layer_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l50_c7_6a5a_cond,
layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
layer_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a
is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_cond,
is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a
result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_cond,
result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- result_u8_value_MUX_uxn_device_h_l50_c7_6a5a
result_u8_value_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_cond,
result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a
result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_cond,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- result_vram_address_MUX_uxn_device_h_l50_c7_6a5a
result_vram_address_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_cond,
result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a
result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_cond,
result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a
result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_cond,
result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- auto_advance_MUX_uxn_device_h_l50_c7_6a5a
auto_advance_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l50_c7_6a5a_cond,
auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
auto_advance_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- y_MUX_uxn_device_h_l50_c7_6a5a
y_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l50_c7_6a5a_cond,
y_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
y_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
y_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- vram_addr_MUX_uxn_device_h_l50_c7_6a5a
vram_addr_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l50_c7_6a5a_cond,
vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
vram_addr_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- x_MUX_uxn_device_h_l50_c7_6a5a
x_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l50_c7_6a5a_cond,
x_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
x_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
x_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- color_MUX_uxn_device_h_l50_c7_6a5a
color_MUX_uxn_device_h_l50_c7_6a5a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l50_c7_6a5a_cond,
color_MUX_uxn_device_h_l50_c7_6a5a_iftrue,
color_MUX_uxn_device_h_l50_c7_6a5a_iffalse,
color_MUX_uxn_device_h_l50_c7_6a5a_return_output);

-- BIN_OP_EQ_uxn_device_h_l51_c7_edcb
BIN_OP_EQ_uxn_device_h_l51_c7_edcb : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l51_c7_edcb_left,
BIN_OP_EQ_uxn_device_h_l51_c7_edcb_right,
BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l51_c3_259d
result_device_ram_address_MUX_uxn_device_h_l51_c3_259d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_cond,
result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l51_c3_259d
result_is_deo_done_MUX_uxn_device_h_l51_c3_259d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_cond,
result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c11_7ded
BIN_OP_EQ_uxn_device_h_l57_c11_7ded : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c11_7ded_left,
BIN_OP_EQ_uxn_device_h_l57_c11_7ded_right,
BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- sprite_MUX_uxn_device_h_l57_c7_f587
sprite_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l57_c7_f587_cond,
sprite_MUX_uxn_device_h_l57_c7_f587_iftrue,
sprite_MUX_uxn_device_h_l57_c7_f587_iffalse,
sprite_MUX_uxn_device_h_l57_c7_f587_return_output);

-- pixel_MUX_uxn_device_h_l57_c7_f587
pixel_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l57_c7_f587_cond,
pixel_MUX_uxn_device_h_l57_c7_f587_iftrue,
pixel_MUX_uxn_device_h_l57_c7_f587_iffalse,
pixel_MUX_uxn_device_h_l57_c7_f587_return_output);

-- layer_MUX_uxn_device_h_l57_c7_f587
layer_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l57_c7_f587_cond,
layer_MUX_uxn_device_h_l57_c7_f587_iftrue,
layer_MUX_uxn_device_h_l57_c7_f587_iffalse,
layer_MUX_uxn_device_h_l57_c7_f587_return_output);

-- is_fill_mode_MUX_uxn_device_h_l57_c7_f587
is_fill_mode_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l57_c7_f587_cond,
is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iftrue,
is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iffalse,
is_fill_mode_MUX_uxn_device_h_l57_c7_f587_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l57_c7_f587
result_device_ram_address_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_cond,
result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iftrue,
result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iffalse,
result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_return_output);

-- result_u8_value_MUX_uxn_device_h_l57_c7_f587
result_u8_value_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l57_c7_f587_cond,
result_u8_value_MUX_uxn_device_h_l57_c7_f587_iftrue,
result_u8_value_MUX_uxn_device_h_l57_c7_f587_iffalse,
result_u8_value_MUX_uxn_device_h_l57_c7_f587_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587
result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_cond,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_return_output);

-- result_vram_address_MUX_uxn_device_h_l57_c7_f587
result_vram_address_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l57_c7_f587_cond,
result_vram_address_MUX_uxn_device_h_l57_c7_f587_iftrue,
result_vram_address_MUX_uxn_device_h_l57_c7_f587_iffalse,
result_vram_address_MUX_uxn_device_h_l57_c7_f587_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l57_c7_f587
result_is_vram_write_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_cond,
result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iftrue,
result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iffalse,
result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l57_c7_f587
result_is_deo_done_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_cond,
result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iftrue,
result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iffalse,
result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_return_output);

-- auto_advance_MUX_uxn_device_h_l57_c7_f587
auto_advance_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l57_c7_f587_cond,
auto_advance_MUX_uxn_device_h_l57_c7_f587_iftrue,
auto_advance_MUX_uxn_device_h_l57_c7_f587_iffalse,
auto_advance_MUX_uxn_device_h_l57_c7_f587_return_output);

-- y_MUX_uxn_device_h_l57_c7_f587
y_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l57_c7_f587_cond,
y_MUX_uxn_device_h_l57_c7_f587_iftrue,
y_MUX_uxn_device_h_l57_c7_f587_iffalse,
y_MUX_uxn_device_h_l57_c7_f587_return_output);

-- vram_addr_MUX_uxn_device_h_l57_c7_f587
vram_addr_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l57_c7_f587_cond,
vram_addr_MUX_uxn_device_h_l57_c7_f587_iftrue,
vram_addr_MUX_uxn_device_h_l57_c7_f587_iffalse,
vram_addr_MUX_uxn_device_h_l57_c7_f587_return_output);

-- x_MUX_uxn_device_h_l57_c7_f587
x_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l57_c7_f587_cond,
x_MUX_uxn_device_h_l57_c7_f587_iftrue,
x_MUX_uxn_device_h_l57_c7_f587_iffalse,
x_MUX_uxn_device_h_l57_c7_f587_return_output);

-- color_MUX_uxn_device_h_l57_c7_f587
color_MUX_uxn_device_h_l57_c7_f587 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l57_c7_f587_cond,
color_MUX_uxn_device_h_l57_c7_f587_iftrue,
color_MUX_uxn_device_h_l57_c7_f587_iffalse,
color_MUX_uxn_device_h_l57_c7_f587_return_output);

-- BIN_OP_EQ_uxn_device_h_l58_c7_c79b
BIN_OP_EQ_uxn_device_h_l58_c7_c79b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l58_c7_c79b_left,
BIN_OP_EQ_uxn_device_h_l58_c7_c79b_right,
BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output);

-- layer_MUX_uxn_device_h_l58_c3_121f
layer_MUX_uxn_device_h_l58_c3_121f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l58_c3_121f_cond,
layer_MUX_uxn_device_h_l58_c3_121f_iftrue,
layer_MUX_uxn_device_h_l58_c3_121f_iffalse,
layer_MUX_uxn_device_h_l58_c3_121f_return_output);

-- is_fill_mode_MUX_uxn_device_h_l58_c3_121f
is_fill_mode_MUX_uxn_device_h_l58_c3_121f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l58_c3_121f_cond,
is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iftrue,
is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iffalse,
is_fill_mode_MUX_uxn_device_h_l58_c3_121f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l58_c3_121f
result_device_ram_address_MUX_uxn_device_h_l58_c3_121f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_cond,
result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l58_c3_121f
result_is_deo_done_MUX_uxn_device_h_l58_c3_121f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_cond,
result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_return_output);

-- pixel_MUX_uxn_device_h_l58_c3_121f
pixel_MUX_uxn_device_h_l58_c3_121f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l58_c3_121f_cond,
pixel_MUX_uxn_device_h_l58_c3_121f_iftrue,
pixel_MUX_uxn_device_h_l58_c3_121f_iffalse,
pixel_MUX_uxn_device_h_l58_c3_121f_return_output);

-- color_MUX_uxn_device_h_l58_c3_121f
color_MUX_uxn_device_h_l58_c3_121f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l58_c3_121f_cond,
color_MUX_uxn_device_h_l58_c3_121f_iftrue,
color_MUX_uxn_device_h_l58_c3_121f_iffalse,
color_MUX_uxn_device_h_l58_c3_121f_return_output);

-- BIN_OP_AND_uxn_device_h_l61_c20_ea3b
BIN_OP_AND_uxn_device_h_l61_c20_ea3b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l61_c20_ea3b_left,
BIN_OP_AND_uxn_device_h_l61_c20_ea3b_right,
BIN_OP_AND_uxn_device_h_l61_c20_ea3b_return_output);

-- BIN_OP_EQ_uxn_device_h_l61_c20_46fa
BIN_OP_EQ_uxn_device_h_l61_c20_46fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l61_c20_46fa_left,
BIN_OP_EQ_uxn_device_h_l61_c20_46fa_right,
BIN_OP_EQ_uxn_device_h_l61_c20_46fa_return_output);

-- MUX_uxn_device_h_l61_c20_1052
MUX_uxn_device_h_l61_c20_1052 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l61_c20_1052_cond,
MUX_uxn_device_h_l61_c20_1052_iftrue,
MUX_uxn_device_h_l61_c20_1052_iffalse,
MUX_uxn_device_h_l61_c20_1052_return_output);

-- BIN_OP_AND_uxn_device_h_l62_c13_afbc
BIN_OP_AND_uxn_device_h_l62_c13_afbc : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l62_c13_afbc_left,
BIN_OP_AND_uxn_device_h_l62_c13_afbc_right,
BIN_OP_AND_uxn_device_h_l62_c13_afbc_return_output);

-- MUX_uxn_device_h_l62_c13_e95f
MUX_uxn_device_h_l62_c13_e95f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l62_c13_e95f_cond,
MUX_uxn_device_h_l62_c13_e95f_iftrue,
MUX_uxn_device_h_l62_c13_e95f_iffalse,
MUX_uxn_device_h_l62_c13_e95f_return_output);

-- BIN_OP_EQ_uxn_device_h_l68_c11_913a
BIN_OP_EQ_uxn_device_h_l68_c11_913a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l68_c11_913a_left,
BIN_OP_EQ_uxn_device_h_l68_c11_913a_right,
BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- sprite_MUX_uxn_device_h_l68_c7_f56a
sprite_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l68_c7_f56a_cond,
sprite_MUX_uxn_device_h_l68_c7_f56a_iftrue,
sprite_MUX_uxn_device_h_l68_c7_f56a_iffalse,
sprite_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a
result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_cond,
result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- result_u8_value_MUX_uxn_device_h_l68_c7_f56a
result_u8_value_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l68_c7_f56a_cond,
result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iftrue,
result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iffalse,
result_u8_value_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a
result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_cond,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- result_vram_address_MUX_uxn_device_h_l68_c7_f56a
result_vram_address_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l68_c7_f56a_cond,
result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue,
result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse,
result_vram_address_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a
result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_cond,
result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a
result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_cond,
result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- auto_advance_MUX_uxn_device_h_l68_c7_f56a
auto_advance_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l68_c7_f56a_cond,
auto_advance_MUX_uxn_device_h_l68_c7_f56a_iftrue,
auto_advance_MUX_uxn_device_h_l68_c7_f56a_iffalse,
auto_advance_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- y_MUX_uxn_device_h_l68_c7_f56a
y_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l68_c7_f56a_cond,
y_MUX_uxn_device_h_l68_c7_f56a_iftrue,
y_MUX_uxn_device_h_l68_c7_f56a_iffalse,
y_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- vram_addr_MUX_uxn_device_h_l68_c7_f56a
vram_addr_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l68_c7_f56a_cond,
vram_addr_MUX_uxn_device_h_l68_c7_f56a_iftrue,
vram_addr_MUX_uxn_device_h_l68_c7_f56a_iffalse,
vram_addr_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- x_MUX_uxn_device_h_l68_c7_f56a
x_MUX_uxn_device_h_l68_c7_f56a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l68_c7_f56a_cond,
x_MUX_uxn_device_h_l68_c7_f56a_iftrue,
x_MUX_uxn_device_h_l68_c7_f56a_iffalse,
x_MUX_uxn_device_h_l68_c7_f56a_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c7_21fe
BIN_OP_EQ_uxn_device_h_l69_c7_21fe : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c7_21fe_left,
BIN_OP_EQ_uxn_device_h_l69_c7_21fe_right,
BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7
result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_cond,
result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7
result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_cond,
result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c11_d8b3
BIN_OP_EQ_uxn_device_h_l75_c11_d8b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_left,
BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_right,
BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_return_output);

-- sprite_MUX_uxn_device_h_l75_c7_5fa1
sprite_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l75_c7_5fa1_cond,
sprite_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
sprite_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
sprite_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1
result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_cond,
result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- result_u8_value_MUX_uxn_device_h_l75_c7_5fa1
result_u8_value_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_cond,
result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1
result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_cond,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- result_vram_address_MUX_uxn_device_h_l75_c7_5fa1
result_vram_address_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_cond,
result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1
result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_cond,
result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1
result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_cond,
result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- auto_advance_MUX_uxn_device_h_l75_c7_5fa1
auto_advance_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l75_c7_5fa1_cond,
auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
auto_advance_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- y_MUX_uxn_device_h_l75_c7_5fa1
y_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c7_5fa1_cond,
y_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
y_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
y_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- vram_addr_MUX_uxn_device_h_l75_c7_5fa1
vram_addr_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l75_c7_5fa1_cond,
vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
vram_addr_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- x_MUX_uxn_device_h_l75_c7_5fa1
x_MUX_uxn_device_h_l75_c7_5fa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c7_5fa1_cond,
x_MUX_uxn_device_h_l75_c7_5fa1_iftrue,
x_MUX_uxn_device_h_l75_c7_5fa1_iffalse,
x_MUX_uxn_device_h_l75_c7_5fa1_return_output);

-- BIN_OP_EQ_uxn_device_h_l76_c7_b98b
BIN_OP_EQ_uxn_device_h_l76_c7_b98b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l76_c7_b98b_left,
BIN_OP_EQ_uxn_device_h_l76_c7_b98b_right,
BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output);

-- sprite_MUX_uxn_device_h_l76_c3_7404
sprite_MUX_uxn_device_h_l76_c3_7404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l76_c3_7404_cond,
sprite_MUX_uxn_device_h_l76_c3_7404_iftrue,
sprite_MUX_uxn_device_h_l76_c3_7404_iffalse,
sprite_MUX_uxn_device_h_l76_c3_7404_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l76_c3_7404
result_device_ram_address_MUX_uxn_device_h_l76_c3_7404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_cond,
result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iftrue,
result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iffalse,
result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l76_c3_7404
result_is_deo_done_MUX_uxn_device_h_l76_c3_7404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_cond,
result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iftrue,
result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iffalse,
result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_return_output);

-- BIN_OP_EQ_uxn_device_h_l83_c11_7e2d
BIN_OP_EQ_uxn_device_h_l83_c11_7e2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_left,
BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_right,
BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l83_c7_8617
result_device_ram_address_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_cond,
result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iftrue,
result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iffalse,
result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_return_output);

-- result_u8_value_MUX_uxn_device_h_l83_c7_8617
result_u8_value_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l83_c7_8617_cond,
result_u8_value_MUX_uxn_device_h_l83_c7_8617_iftrue,
result_u8_value_MUX_uxn_device_h_l83_c7_8617_iffalse,
result_u8_value_MUX_uxn_device_h_l83_c7_8617_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617
result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_cond,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_return_output);

-- result_vram_address_MUX_uxn_device_h_l83_c7_8617
result_vram_address_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l83_c7_8617_cond,
result_vram_address_MUX_uxn_device_h_l83_c7_8617_iftrue,
result_vram_address_MUX_uxn_device_h_l83_c7_8617_iffalse,
result_vram_address_MUX_uxn_device_h_l83_c7_8617_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l83_c7_8617
result_is_vram_write_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_cond,
result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iftrue,
result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iffalse,
result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l83_c7_8617
result_is_deo_done_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_cond,
result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iftrue,
result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iffalse,
result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_return_output);

-- auto_advance_MUX_uxn_device_h_l83_c7_8617
auto_advance_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l83_c7_8617_cond,
auto_advance_MUX_uxn_device_h_l83_c7_8617_iftrue,
auto_advance_MUX_uxn_device_h_l83_c7_8617_iffalse,
auto_advance_MUX_uxn_device_h_l83_c7_8617_return_output);

-- y_MUX_uxn_device_h_l83_c7_8617
y_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l83_c7_8617_cond,
y_MUX_uxn_device_h_l83_c7_8617_iftrue,
y_MUX_uxn_device_h_l83_c7_8617_iffalse,
y_MUX_uxn_device_h_l83_c7_8617_return_output);

-- vram_addr_MUX_uxn_device_h_l83_c7_8617
vram_addr_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l83_c7_8617_cond,
vram_addr_MUX_uxn_device_h_l83_c7_8617_iftrue,
vram_addr_MUX_uxn_device_h_l83_c7_8617_iffalse,
vram_addr_MUX_uxn_device_h_l83_c7_8617_return_output);

-- x_MUX_uxn_device_h_l83_c7_8617
x_MUX_uxn_device_h_l83_c7_8617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l83_c7_8617_cond,
x_MUX_uxn_device_h_l83_c7_8617_iftrue,
x_MUX_uxn_device_h_l83_c7_8617_iffalse,
x_MUX_uxn_device_h_l83_c7_8617_return_output);

-- BIN_OP_EQ_uxn_device_h_l84_c7_e96e
BIN_OP_EQ_uxn_device_h_l84_c7_e96e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l84_c7_e96e_left,
BIN_OP_EQ_uxn_device_h_l84_c7_e96e_right,
BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0
result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_cond,
result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0
result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_cond,
result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_993b
BIN_OP_EQ_uxn_device_h_l90_c11_993b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_993b_left,
BIN_OP_EQ_uxn_device_h_l90_c11_993b_right,
BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf
result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- result_u8_value_MUX_uxn_device_h_l90_c7_f6bf
result_u8_value_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_cond,
result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf
result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_cond,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_f6bf
result_vram_address_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf
result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf
result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_f6bf
auto_advance_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_f6bf_cond,
auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- y_MUX_uxn_device_h_l90_c7_f6bf
y_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_f6bf_cond,
y_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
y_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
y_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- vram_addr_MUX_uxn_device_h_l90_c7_f6bf
vram_addr_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l90_c7_f6bf_cond,
vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
vram_addr_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- x_MUX_uxn_device_h_l90_c7_f6bf
x_MUX_uxn_device_h_l90_c7_f6bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_f6bf_cond,
x_MUX_uxn_device_h_l90_c7_f6bf_iftrue,
x_MUX_uxn_device_h_l90_c7_f6bf_iffalse,
x_MUX_uxn_device_h_l90_c7_f6bf_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_0189
BIN_OP_EQ_uxn_device_h_l91_c7_0189 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_0189_left,
BIN_OP_EQ_uxn_device_h_l91_c7_0189_right,
BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37
result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37
result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_return_output);

-- x_MUX_uxn_device_h_l91_c3_ab37
x_MUX_uxn_device_h_l91_c3_ab37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l91_c3_ab37_cond,
x_MUX_uxn_device_h_l91_c3_ab37_iftrue,
x_MUX_uxn_device_h_l91_c3_ab37_iffalse,
x_MUX_uxn_device_h_l91_c3_ab37_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_0eba
BIN_OP_EQ_uxn_device_h_l99_c11_0eba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_0eba_left,
BIN_OP_EQ_uxn_device_h_l99_c11_0eba_right,
BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_62da
result_device_ram_address_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_return_output);

-- result_u8_value_MUX_uxn_device_h_l99_c7_62da
result_u8_value_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l99_c7_62da_cond,
result_u8_value_MUX_uxn_device_h_l99_c7_62da_iftrue,
result_u8_value_MUX_uxn_device_h_l99_c7_62da_iffalse,
result_u8_value_MUX_uxn_device_h_l99_c7_62da_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da
result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_cond,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_62da
result_vram_address_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_62da_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_62da_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_62da_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_62da_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_62da
result_is_vram_write_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_62da
result_is_deo_done_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_62da
auto_advance_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_62da_cond,
auto_advance_MUX_uxn_device_h_l99_c7_62da_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_62da_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_62da_return_output);

-- y_MUX_uxn_device_h_l99_c7_62da
y_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_62da_cond,
y_MUX_uxn_device_h_l99_c7_62da_iftrue,
y_MUX_uxn_device_h_l99_c7_62da_iffalse,
y_MUX_uxn_device_h_l99_c7_62da_return_output);

-- vram_addr_MUX_uxn_device_h_l99_c7_62da
vram_addr_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l99_c7_62da_cond,
vram_addr_MUX_uxn_device_h_l99_c7_62da_iftrue,
vram_addr_MUX_uxn_device_h_l99_c7_62da_iffalse,
vram_addr_MUX_uxn_device_h_l99_c7_62da_return_output);

-- x_MUX_uxn_device_h_l99_c7_62da
x_MUX_uxn_device_h_l99_c7_62da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_62da_cond,
x_MUX_uxn_device_h_l99_c7_62da_iftrue,
x_MUX_uxn_device_h_l99_c7_62da_iffalse,
x_MUX_uxn_device_h_l99_c7_62da_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_ea76
BIN_OP_EQ_uxn_device_h_l100_c7_ea76 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_ea76_left,
BIN_OP_EQ_uxn_device_h_l100_c7_ea76_right,
BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc
result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc
result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_return_output);

-- BIN_OP_EQ_uxn_device_h_l106_c11_d5bf
BIN_OP_EQ_uxn_device_h_l106_c11_d5bf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_left,
BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_right,
BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4
result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_cond,
result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- result_u8_value_MUX_uxn_device_h_l106_c7_59c4
result_u8_value_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l106_c7_59c4_cond,
result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iftrue,
result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iffalse,
result_u8_value_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4
result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_cond,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- result_vram_address_MUX_uxn_device_h_l106_c7_59c4
result_vram_address_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l106_c7_59c4_cond,
result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue,
result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse,
result_vram_address_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4
result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_cond,
result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4
result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_cond,
result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- auto_advance_MUX_uxn_device_h_l106_c7_59c4
auto_advance_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l106_c7_59c4_cond,
auto_advance_MUX_uxn_device_h_l106_c7_59c4_iftrue,
auto_advance_MUX_uxn_device_h_l106_c7_59c4_iffalse,
auto_advance_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- y_MUX_uxn_device_h_l106_c7_59c4
y_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l106_c7_59c4_cond,
y_MUX_uxn_device_h_l106_c7_59c4_iftrue,
y_MUX_uxn_device_h_l106_c7_59c4_iffalse,
y_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- vram_addr_MUX_uxn_device_h_l106_c7_59c4
vram_addr_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l106_c7_59c4_cond,
vram_addr_MUX_uxn_device_h_l106_c7_59c4_iftrue,
vram_addr_MUX_uxn_device_h_l106_c7_59c4_iffalse,
vram_addr_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- x_MUX_uxn_device_h_l106_c7_59c4
x_MUX_uxn_device_h_l106_c7_59c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l106_c7_59c4_cond,
x_MUX_uxn_device_h_l106_c7_59c4_iftrue,
x_MUX_uxn_device_h_l106_c7_59c4_iffalse,
x_MUX_uxn_device_h_l106_c7_59c4_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c7_4f2c
BIN_OP_EQ_uxn_device_h_l107_c7_4f2c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_left,
BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_right,
BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c3_3944
result_device_ram_address_MUX_uxn_device_h_l107_c3_3944 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c3_3944
result_is_deo_done_MUX_uxn_device_h_l107_c3_3944 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_return_output);

-- x_MUX_uxn_device_h_l107_c3_3944
x_MUX_uxn_device_h_l107_c3_3944 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c3_3944_cond,
x_MUX_uxn_device_h_l107_c3_3944_iftrue,
x_MUX_uxn_device_h_l107_c3_3944_iffalse,
x_MUX_uxn_device_h_l107_c3_3944_return_output);

-- BIN_OP_OR_uxn_device_h_l108_c4_9319
BIN_OP_OR_uxn_device_h_l108_c4_9319 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l108_c4_9319_left,
BIN_OP_OR_uxn_device_h_l108_c4_9319_right,
BIN_OP_OR_uxn_device_h_l108_c4_9319_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_cfe0
BIN_OP_EQ_uxn_device_h_l114_c11_cfe0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_left,
BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_right,
BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05
result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_cond,
result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue,
result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse,
result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- result_u8_value_MUX_uxn_device_h_l114_c7_ad05
result_u8_value_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l114_c7_ad05_cond,
result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iftrue,
result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iffalse,
result_u8_value_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05
result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_cond,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- result_vram_address_MUX_uxn_device_h_l114_c7_ad05
result_vram_address_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l114_c7_ad05_cond,
result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue,
result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse,
result_vram_address_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05
result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_cond,
result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iftrue,
result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iffalse,
result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05
result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_cond,
result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iftrue,
result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iffalse,
result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_ad05
auto_advance_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_ad05_cond,
auto_advance_MUX_uxn_device_h_l114_c7_ad05_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_ad05_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- y_MUX_uxn_device_h_l114_c7_ad05
y_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_ad05_cond,
y_MUX_uxn_device_h_l114_c7_ad05_iftrue,
y_MUX_uxn_device_h_l114_c7_ad05_iffalse,
y_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_ad05
vram_addr_MUX_uxn_device_h_l114_c7_ad05 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_ad05_cond,
vram_addr_MUX_uxn_device_h_l114_c7_ad05_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_ad05_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_ad05_return_output);

-- BIN_OP_EQ_uxn_device_h_l115_c7_977f
BIN_OP_EQ_uxn_device_h_l115_c7_977f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l115_c7_977f_left,
BIN_OP_EQ_uxn_device_h_l115_c7_977f_right,
BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_7130
result_device_ram_address_MUX_uxn_device_h_l115_c3_7130 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l115_c3_7130
result_is_deo_done_MUX_uxn_device_h_l115_c3_7130 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_cond,
result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iftrue,
result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iffalse,
result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_return_output);

-- BIN_OP_EQ_uxn_device_h_l121_c11_1022
BIN_OP_EQ_uxn_device_h_l121_c11_1022 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l121_c11_1022_left,
BIN_OP_EQ_uxn_device_h_l121_c11_1022_right,
BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b
result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_cond,
result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- result_u8_value_MUX_uxn_device_h_l121_c7_2b2b
result_u8_value_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_cond,
result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b
result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_cond,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- result_vram_address_MUX_uxn_device_h_l121_c7_2b2b
result_vram_address_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_cond,
result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b
result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_cond,
result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b
result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_cond,
result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- auto_advance_MUX_uxn_device_h_l121_c7_2b2b
auto_advance_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l121_c7_2b2b_cond,
auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
auto_advance_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- y_MUX_uxn_device_h_l121_c7_2b2b
y_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l121_c7_2b2b_cond,
y_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
y_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
y_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- vram_addr_MUX_uxn_device_h_l121_c7_2b2b
vram_addr_MUX_uxn_device_h_l121_c7_2b2b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l121_c7_2b2b_cond,
vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iftrue,
vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iffalse,
vram_addr_MUX_uxn_device_h_l121_c7_2b2b_return_output);

-- BIN_OP_EQ_uxn_device_h_l122_c7_ba89
BIN_OP_EQ_uxn_device_h_l122_c7_ba89 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l122_c7_ba89_left,
BIN_OP_EQ_uxn_device_h_l122_c7_ba89_right,
BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l122_c3_0851
result_device_ram_address_MUX_uxn_device_h_l122_c3_0851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_cond,
result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iftrue,
result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iffalse,
result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l122_c3_0851
result_is_deo_done_MUX_uxn_device_h_l122_c3_0851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_cond,
result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iftrue,
result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iffalse,
result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_return_output);

-- y_MUX_uxn_device_h_l122_c3_0851
y_MUX_uxn_device_h_l122_c3_0851 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l122_c3_0851_cond,
y_MUX_uxn_device_h_l122_c3_0851_iftrue,
y_MUX_uxn_device_h_l122_c3_0851_iffalse,
y_MUX_uxn_device_h_l122_c3_0851_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c11_a577
BIN_OP_EQ_uxn_device_h_l130_c11_a577 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_a577_left,
BIN_OP_EQ_uxn_device_h_l130_c11_a577_right,
BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2
result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_cond,
result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- result_u8_value_MUX_uxn_device_h_l130_c7_bce2
result_u8_value_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l130_c7_bce2_cond,
result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iftrue,
result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iffalse,
result_u8_value_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2
result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_cond,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- result_vram_address_MUX_uxn_device_h_l130_c7_bce2
result_vram_address_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l130_c7_bce2_cond,
result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue,
result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse,
result_vram_address_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2
result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_cond,
result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2
result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_cond,
result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- auto_advance_MUX_uxn_device_h_l130_c7_bce2
auto_advance_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l130_c7_bce2_cond,
auto_advance_MUX_uxn_device_h_l130_c7_bce2_iftrue,
auto_advance_MUX_uxn_device_h_l130_c7_bce2_iffalse,
auto_advance_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- y_MUX_uxn_device_h_l130_c7_bce2
y_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c7_bce2_cond,
y_MUX_uxn_device_h_l130_c7_bce2_iftrue,
y_MUX_uxn_device_h_l130_c7_bce2_iffalse,
y_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- vram_addr_MUX_uxn_device_h_l130_c7_bce2
vram_addr_MUX_uxn_device_h_l130_c7_bce2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l130_c7_bce2_cond,
vram_addr_MUX_uxn_device_h_l130_c7_bce2_iftrue,
vram_addr_MUX_uxn_device_h_l130_c7_bce2_iffalse,
vram_addr_MUX_uxn_device_h_l130_c7_bce2_return_output);

-- BIN_OP_EQ_uxn_device_h_l131_c7_5972
BIN_OP_EQ_uxn_device_h_l131_c7_5972 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c7_5972_left,
BIN_OP_EQ_uxn_device_h_l131_c7_5972_right,
BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l131_c3_c562
result_device_ram_address_MUX_uxn_device_h_l131_c3_c562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_cond,
result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iftrue,
result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iffalse,
result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l131_c3_c562
result_is_deo_done_MUX_uxn_device_h_l131_c3_c562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_cond,
result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iftrue,
result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iffalse,
result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_69cc
BIN_OP_EQ_uxn_device_h_l137_c11_69cc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_69cc_left,
BIN_OP_EQ_uxn_device_h_l137_c11_69cc_right,
BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc
result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_cond,
result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- result_u8_value_MUX_uxn_device_h_l137_c7_85fc
result_u8_value_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l137_c7_85fc_cond,
result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iftrue,
result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iffalse,
result_u8_value_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc
result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_cond,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- result_vram_address_MUX_uxn_device_h_l137_c7_85fc
result_vram_address_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l137_c7_85fc_cond,
result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue,
result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse,
result_vram_address_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc
result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_cond,
result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iftrue,
result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iffalse,
result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc
result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_cond,
result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- auto_advance_MUX_uxn_device_h_l137_c7_85fc
auto_advance_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l137_c7_85fc_cond,
auto_advance_MUX_uxn_device_h_l137_c7_85fc_iftrue,
auto_advance_MUX_uxn_device_h_l137_c7_85fc_iffalse,
auto_advance_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- y_MUX_uxn_device_h_l137_c7_85fc
y_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c7_85fc_cond,
y_MUX_uxn_device_h_l137_c7_85fc_iftrue,
y_MUX_uxn_device_h_l137_c7_85fc_iffalse,
y_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- vram_addr_MUX_uxn_device_h_l137_c7_85fc
vram_addr_MUX_uxn_device_h_l137_c7_85fc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l137_c7_85fc_cond,
vram_addr_MUX_uxn_device_h_l137_c7_85fc_iftrue,
vram_addr_MUX_uxn_device_h_l137_c7_85fc_iffalse,
vram_addr_MUX_uxn_device_h_l137_c7_85fc_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c7_370d
BIN_OP_EQ_uxn_device_h_l138_c7_370d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c7_370d_left,
BIN_OP_EQ_uxn_device_h_l138_c7_370d_right,
BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l138_c3_c628
result_device_ram_address_MUX_uxn_device_h_l138_c3_c628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_cond,
result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iftrue,
result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iffalse,
result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l138_c3_c628
result_is_deo_done_MUX_uxn_device_h_l138_c3_c628 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_cond,
result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iftrue,
result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iffalse,
result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_return_output);

-- y_MUX_uxn_device_h_l138_c3_c628
y_MUX_uxn_device_h_l138_c3_c628 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c3_c628_cond,
y_MUX_uxn_device_h_l138_c3_c628_iftrue,
y_MUX_uxn_device_h_l138_c3_c628_iffalse,
y_MUX_uxn_device_h_l138_c3_c628_return_output);

-- BIN_OP_OR_uxn_device_h_l139_c4_63d6
BIN_OP_OR_uxn_device_h_l139_c4_63d6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l139_c4_63d6_left,
BIN_OP_OR_uxn_device_h_l139_c4_63d6_right,
BIN_OP_OR_uxn_device_h_l139_c4_63d6_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_18ef
BIN_OP_EQ_uxn_device_h_l145_c11_18ef : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_18ef_left,
BIN_OP_EQ_uxn_device_h_l145_c11_18ef_right,
BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l145_c7_001c
result_device_ram_address_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_cond,
result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_return_output);

-- result_u8_value_MUX_uxn_device_h_l145_c7_001c
result_u8_value_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l145_c7_001c_cond,
result_u8_value_MUX_uxn_device_h_l145_c7_001c_iftrue,
result_u8_value_MUX_uxn_device_h_l145_c7_001c_iffalse,
result_u8_value_MUX_uxn_device_h_l145_c7_001c_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c
result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_cond,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_return_output);

-- result_vram_address_MUX_uxn_device_h_l145_c7_001c
result_vram_address_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l145_c7_001c_cond,
result_vram_address_MUX_uxn_device_h_l145_c7_001c_iftrue,
result_vram_address_MUX_uxn_device_h_l145_c7_001c_iffalse,
result_vram_address_MUX_uxn_device_h_l145_c7_001c_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l145_c7_001c
result_is_vram_write_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_cond,
result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iftrue,
result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iffalse,
result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l145_c7_001c
result_is_deo_done_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_cond,
result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_001c
auto_advance_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_001c_cond,
auto_advance_MUX_uxn_device_h_l145_c7_001c_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_001c_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_001c_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_001c
vram_addr_MUX_uxn_device_h_l145_c7_001c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_001c_cond,
vram_addr_MUX_uxn_device_h_l145_c7_001c_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_001c_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_001c_return_output);

-- BIN_OP_EQ_uxn_device_h_l146_c7_42dd
BIN_OP_EQ_uxn_device_h_l146_c7_42dd : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l146_c7_42dd_left,
BIN_OP_EQ_uxn_device_h_l146_c7_42dd_right,
BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d
result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_cond,
result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d
result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_cond,
result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c27_a755
BIN_OP_PLUS_uxn_device_h_l147_c27_a755 : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c27_a755_left,
BIN_OP_PLUS_uxn_device_h_l147_c27_a755_right,
BIN_OP_PLUS_uxn_device_h_l147_c27_a755_return_output);

-- BIN_OP_GT_uxn_device_h_l147_c27_18bc
BIN_OP_GT_uxn_device_h_l147_c27_18bc : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l147_c27_18bc_left,
BIN_OP_GT_uxn_device_h_l147_c27_18bc_right,
BIN_OP_GT_uxn_device_h_l147_c27_18bc_return_output);

-- MUX_uxn_device_h_l147_c27_b777
MUX_uxn_device_h_l147_c27_b777 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c27_b777_cond,
MUX_uxn_device_h_l147_c27_b777_iftrue,
MUX_uxn_device_h_l147_c27_b777_iffalse,
MUX_uxn_device_h_l147_c27_b777_return_output);

-- BIN_OP_EQ_uxn_device_h_l153_c11_b532
BIN_OP_EQ_uxn_device_h_l153_c11_b532 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l153_c11_b532_left,
BIN_OP_EQ_uxn_device_h_l153_c11_b532_right,
BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e
result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_cond,
result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- result_u8_value_MUX_uxn_device_h_l153_c7_c96e
result_u8_value_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l153_c7_c96e_cond,
result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iftrue,
result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iffalse,
result_u8_value_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e
result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_cond,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- result_vram_address_MUX_uxn_device_h_l153_c7_c96e
result_vram_address_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l153_c7_c96e_cond,
result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue,
result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse,
result_vram_address_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e
result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_cond,
result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e
result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_cond,
result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- auto_advance_MUX_uxn_device_h_l153_c7_c96e
auto_advance_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l153_c7_c96e_cond,
auto_advance_MUX_uxn_device_h_l153_c7_c96e_iftrue,
auto_advance_MUX_uxn_device_h_l153_c7_c96e_iffalse,
auto_advance_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- vram_addr_MUX_uxn_device_h_l153_c7_c96e
vram_addr_MUX_uxn_device_h_l153_c7_c96e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l153_c7_c96e_cond,
vram_addr_MUX_uxn_device_h_l153_c7_c96e_iftrue,
vram_addr_MUX_uxn_device_h_l153_c7_c96e_iffalse,
vram_addr_MUX_uxn_device_h_l153_c7_c96e_return_output);

-- BIN_OP_EQ_uxn_device_h_l154_c7_4cd8
BIN_OP_EQ_uxn_device_h_l154_c7_4cd8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_left,
BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_right,
BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb
result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_cond,
result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- result_u8_value_MUX_uxn_device_h_l154_c3_38cb
result_u8_value_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l154_c3_38cb_cond,
result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iftrue,
result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iffalse,
result_u8_value_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb
result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_cond,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- result_vram_address_MUX_uxn_device_h_l154_c3_38cb
result_vram_address_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l154_c3_38cb_cond,
result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue,
result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse,
result_vram_address_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb
result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_cond,
result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb
result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_cond,
result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- auto_advance_MUX_uxn_device_h_l154_c3_38cb
auto_advance_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l154_c3_38cb_cond,
auto_advance_MUX_uxn_device_h_l154_c3_38cb_iftrue,
auto_advance_MUX_uxn_device_h_l154_c3_38cb_iffalse,
auto_advance_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- vram_addr_MUX_uxn_device_h_l154_c3_38cb
vram_addr_MUX_uxn_device_h_l154_c3_38cb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l154_c3_38cb_cond,
vram_addr_MUX_uxn_device_h_l154_c3_38cb_iftrue,
vram_addr_MUX_uxn_device_h_l154_c3_38cb_iffalse,
vram_addr_MUX_uxn_device_h_l154_c3_38cb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c4_0848
result_vram_address_MUX_uxn_device_h_l160_c4_0848 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c4_0848_cond,
result_vram_address_MUX_uxn_device_h_l160_c4_0848_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c4_0848_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c4_0848_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c4_0848
result_is_vram_write_MUX_uxn_device_h_l160_c4_0848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_return_output);

-- vram_addr_MUX_uxn_device_h_l160_c4_0848
vram_addr_MUX_uxn_device_h_l160_c4_0848 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l160_c4_0848_cond,
vram_addr_MUX_uxn_device_h_l160_c4_0848_iftrue,
vram_addr_MUX_uxn_device_h_l160_c4_0848_iffalse,
vram_addr_MUX_uxn_device_h_l160_c4_0848_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7
BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_left,
BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_right,
BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_return_output);

-- BIN_OP_AND_uxn_device_h_l162_c5_7f92
BIN_OP_AND_uxn_device_h_l162_c5_7f92 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l162_c5_7f92_left,
BIN_OP_AND_uxn_device_h_l162_c5_7f92_right,
BIN_OP_AND_uxn_device_h_l162_c5_7f92_return_output);

-- BIN_OP_AND_uxn_device_h_l163_c21_eecc
BIN_OP_AND_uxn_device_h_l163_c21_eecc : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l163_c21_eecc_left,
BIN_OP_AND_uxn_device_h_l163_c21_eecc_right,
BIN_OP_AND_uxn_device_h_l163_c21_eecc_return_output);

-- BIN_OP_GT_uxn_device_h_l163_c21_831f
BIN_OP_GT_uxn_device_h_l163_c21_831f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l163_c21_831f_left,
BIN_OP_GT_uxn_device_h_l163_c21_831f_right,
BIN_OP_GT_uxn_device_h_l163_c21_831f_return_output);

-- MUX_uxn_device_h_l163_c21_cd6b
MUX_uxn_device_h_l163_c21_cd6b : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l163_c21_cd6b_cond,
MUX_uxn_device_h_l163_c21_cd6b_iftrue,
MUX_uxn_device_h_l163_c21_cd6b_iffalse,
MUX_uxn_device_h_l163_c21_cd6b_return_output);

-- BIN_OP_OR_uxn_device_h_l163_c5_e1cf
BIN_OP_OR_uxn_device_h_l163_c5_e1cf : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l163_c5_e1cf_left,
BIN_OP_OR_uxn_device_h_l163_c5_e1cf_right,
BIN_OP_OR_uxn_device_h_l163_c5_e1cf_return_output);

-- BIN_OP_AND_uxn_device_h_l164_c21_f0ee
BIN_OP_AND_uxn_device_h_l164_c21_f0ee : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l164_c21_f0ee_left,
BIN_OP_AND_uxn_device_h_l164_c21_f0ee_right,
BIN_OP_AND_uxn_device_h_l164_c21_f0ee_return_output);

-- BIN_OP_GT_uxn_device_h_l164_c21_2af3
BIN_OP_GT_uxn_device_h_l164_c21_2af3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l164_c21_2af3_left,
BIN_OP_GT_uxn_device_h_l164_c21_2af3_right,
BIN_OP_GT_uxn_device_h_l164_c21_2af3_return_output);

-- MUX_uxn_device_h_l164_c21_25d7
MUX_uxn_device_h_l164_c21_25d7 : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l164_c21_25d7_cond,
MUX_uxn_device_h_l164_c21_25d7_iftrue,
MUX_uxn_device_h_l164_c21_25d7_iffalse,
MUX_uxn_device_h_l164_c21_25d7_return_output);

-- BIN_OP_OR_uxn_device_h_l164_c5_9d2f
BIN_OP_OR_uxn_device_h_l164_c5_9d2f : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l164_c5_9d2f_left,
BIN_OP_OR_uxn_device_h_l164_c5_9d2f_right,
BIN_OP_OR_uxn_device_h_l164_c5_9d2f_return_output);

-- BIN_OP_OR_uxn_device_h_l165_c5_67de
BIN_OP_OR_uxn_device_h_l165_c5_67de : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l165_c5_67de_left,
BIN_OP_OR_uxn_device_h_l165_c5_67de_right,
BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output);

-- printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9
printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9 : entity work.printf_uxn_device_h_l168_c5_8ed9_0CLK_de264c78 port map (
printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_CLOCK_ENABLE,
printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg0,
printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg1,
printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg2,
printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg3,
printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg4);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_return_output);

-- BIN_OP_PLUS_uxn_device_h_l171_c28_8555
BIN_OP_PLUS_uxn_device_h_l171_c28_8555 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l171_c28_8555_left,
BIN_OP_PLUS_uxn_device_h_l171_c28_8555_right,
BIN_OP_PLUS_uxn_device_h_l171_c28_8555_return_output);

-- BIN_OP_EQ_uxn_device_h_l178_c11_a4c7
BIN_OP_EQ_uxn_device_h_l178_c11_a4c7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_left,
BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_right,
BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output);

-- result_u8_value_MUX_uxn_device_h_l178_c7_8a14
result_u8_value_MUX_uxn_device_h_l178_c7_8a14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l178_c7_8a14_cond,
result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iftrue,
result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iffalse,
result_u8_value_MUX_uxn_device_h_l178_c7_8a14_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14
result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_cond,
result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iftrue,
result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iffalse,
result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14
result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_cond,
result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iftrue,
result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iffalse,
result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_return_output);

-- result_vram_address_MUX_uxn_device_h_l178_c7_8a14
result_vram_address_MUX_uxn_device_h_l178_c7_8a14 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l178_c7_8a14_cond,
result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iftrue,
result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iffalse,
result_vram_address_MUX_uxn_device_h_l178_c7_8a14_return_output);

-- BIN_OP_EQ_uxn_device_h_l179_c7_8699
BIN_OP_EQ_uxn_device_h_l179_c7_8699 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l179_c7_8699_left,
BIN_OP_EQ_uxn_device_h_l179_c7_8699_right,
BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output);

-- result_u8_value_MUX_uxn_device_h_l179_c3_a172
result_u8_value_MUX_uxn_device_h_l179_c3_a172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l179_c3_a172_cond,
result_u8_value_MUX_uxn_device_h_l179_c3_a172_iftrue,
result_u8_value_MUX_uxn_device_h_l179_c3_a172_iffalse,
result_u8_value_MUX_uxn_device_h_l179_c3_a172_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l179_c3_a172
result_is_vram_write_MUX_uxn_device_h_l179_c3_a172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_cond,
result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iftrue,
result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iffalse,
result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_return_output);

-- result_vram_address_MUX_uxn_device_h_l179_c3_a172
result_vram_address_MUX_uxn_device_h_l179_c3_a172 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l179_c3_a172_cond,
result_vram_address_MUX_uxn_device_h_l179_c3_a172_iftrue,
result_vram_address_MUX_uxn_device_h_l179_c3_a172_iffalse,
result_vram_address_MUX_uxn_device_h_l179_c3_a172_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_x,
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output);



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
 BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 sprite_MUX_uxn_device_h_l40_c2_8c29_return_output,
 pixel_MUX_uxn_device_h_l40_c2_8c29_return_output,
 layer_MUX_uxn_device_h_l40_c2_8c29_return_output,
 is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_return_output,
 result_MUX_uxn_device_h_l40_c2_8c29_return_output,
 auto_advance_MUX_uxn_device_h_l40_c2_8c29_return_output,
 y_MUX_uxn_device_h_l40_c2_8c29_return_output,
 vram_addr_MUX_uxn_device_h_l40_c2_8c29_return_output,
 x_MUX_uxn_device_h_l40_c2_8c29_return_output,
 color_MUX_uxn_device_h_l40_c2_8c29_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output,
 result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_return_output,
 BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_return_output,
 sprite_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 pixel_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 layer_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 auto_advance_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 y_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 vram_addr_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 x_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 color_MUX_uxn_device_h_l50_c7_6a5a_return_output,
 BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_return_output,
 sprite_MUX_uxn_device_h_l57_c7_f587_return_output,
 pixel_MUX_uxn_device_h_l57_c7_f587_return_output,
 layer_MUX_uxn_device_h_l57_c7_f587_return_output,
 is_fill_mode_MUX_uxn_device_h_l57_c7_f587_return_output,
 result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_return_output,
 result_u8_value_MUX_uxn_device_h_l57_c7_f587_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_return_output,
 result_vram_address_MUX_uxn_device_h_l57_c7_f587_return_output,
 result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_return_output,
 result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_return_output,
 auto_advance_MUX_uxn_device_h_l57_c7_f587_return_output,
 y_MUX_uxn_device_h_l57_c7_f587_return_output,
 vram_addr_MUX_uxn_device_h_l57_c7_f587_return_output,
 x_MUX_uxn_device_h_l57_c7_f587_return_output,
 color_MUX_uxn_device_h_l57_c7_f587_return_output,
 BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output,
 layer_MUX_uxn_device_h_l58_c3_121f_return_output,
 is_fill_mode_MUX_uxn_device_h_l58_c3_121f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_return_output,
 pixel_MUX_uxn_device_h_l58_c3_121f_return_output,
 color_MUX_uxn_device_h_l58_c3_121f_return_output,
 BIN_OP_AND_uxn_device_h_l61_c20_ea3b_return_output,
 BIN_OP_EQ_uxn_device_h_l61_c20_46fa_return_output,
 MUX_uxn_device_h_l61_c20_1052_return_output,
 BIN_OP_AND_uxn_device_h_l62_c13_afbc_return_output,
 MUX_uxn_device_h_l62_c13_e95f_return_output,
 BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 sprite_MUX_uxn_device_h_l68_c7_f56a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_return_output,
 result_u8_value_MUX_uxn_device_h_l68_c7_f56a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_return_output,
 result_vram_address_MUX_uxn_device_h_l68_c7_f56a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_return_output,
 auto_advance_MUX_uxn_device_h_l68_c7_f56a_return_output,
 y_MUX_uxn_device_h_l68_c7_f56a_return_output,
 vram_addr_MUX_uxn_device_h_l68_c7_f56a_return_output,
 x_MUX_uxn_device_h_l68_c7_f56a_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output,
 result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_return_output,
 sprite_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 auto_advance_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 y_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 vram_addr_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 x_MUX_uxn_device_h_l75_c7_5fa1_return_output,
 BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output,
 sprite_MUX_uxn_device_h_l76_c3_7404_return_output,
 result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_return_output,
 result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_return_output,
 BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_return_output,
 result_u8_value_MUX_uxn_device_h_l83_c7_8617_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_return_output,
 result_vram_address_MUX_uxn_device_h_l83_c7_8617_return_output,
 result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_return_output,
 result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_return_output,
 auto_advance_MUX_uxn_device_h_l83_c7_8617_return_output,
 y_MUX_uxn_device_h_l83_c7_8617_return_output,
 vram_addr_MUX_uxn_device_h_l83_c7_8617_return_output,
 x_MUX_uxn_device_h_l83_c7_8617_return_output,
 BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 y_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 vram_addr_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 x_MUX_uxn_device_h_l90_c7_f6bf_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_return_output,
 x_MUX_uxn_device_h_l91_c3_ab37_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_return_output,
 result_u8_value_MUX_uxn_device_h_l99_c7_62da_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_62da_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_62da_return_output,
 y_MUX_uxn_device_h_l99_c7_62da_return_output,
 vram_addr_MUX_uxn_device_h_l99_c7_62da_return_output,
 x_MUX_uxn_device_h_l99_c7_62da_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_return_output,
 BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_return_output,
 result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_return_output,
 result_u8_value_MUX_uxn_device_h_l106_c7_59c4_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_return_output,
 result_vram_address_MUX_uxn_device_h_l106_c7_59c4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_return_output,
 auto_advance_MUX_uxn_device_h_l106_c7_59c4_return_output,
 y_MUX_uxn_device_h_l106_c7_59c4_return_output,
 vram_addr_MUX_uxn_device_h_l106_c7_59c4_return_output,
 x_MUX_uxn_device_h_l106_c7_59c4_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_return_output,
 x_MUX_uxn_device_h_l107_c3_3944_return_output,
 BIN_OP_OR_uxn_device_h_l108_c4_9319_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_return_output,
 result_u8_value_MUX_uxn_device_h_l114_c7_ad05_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_return_output,
 result_vram_address_MUX_uxn_device_h_l114_c7_ad05_return_output,
 result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_return_output,
 result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_ad05_return_output,
 y_MUX_uxn_device_h_l114_c7_ad05_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_ad05_return_output,
 BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_return_output,
 result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_return_output,
 BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 auto_advance_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 y_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 vram_addr_MUX_uxn_device_h_l121_c7_2b2b_return_output,
 BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output,
 result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_return_output,
 result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_return_output,
 y_MUX_uxn_device_h_l122_c3_0851_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_return_output,
 result_u8_value_MUX_uxn_device_h_l130_c7_bce2_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_return_output,
 result_vram_address_MUX_uxn_device_h_l130_c7_bce2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_return_output,
 auto_advance_MUX_uxn_device_h_l130_c7_bce2_return_output,
 y_MUX_uxn_device_h_l130_c7_bce2_return_output,
 vram_addr_MUX_uxn_device_h_l130_c7_bce2_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output,
 result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_return_output,
 result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_return_output,
 result_u8_value_MUX_uxn_device_h_l137_c7_85fc_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_return_output,
 result_vram_address_MUX_uxn_device_h_l137_c7_85fc_return_output,
 result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_return_output,
 auto_advance_MUX_uxn_device_h_l137_c7_85fc_return_output,
 y_MUX_uxn_device_h_l137_c7_85fc_return_output,
 vram_addr_MUX_uxn_device_h_l137_c7_85fc_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_return_output,
 result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_return_output,
 y_MUX_uxn_device_h_l138_c3_c628_return_output,
 BIN_OP_OR_uxn_device_h_l139_c4_63d6_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_return_output,
 result_u8_value_MUX_uxn_device_h_l145_c7_001c_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_return_output,
 result_vram_address_MUX_uxn_device_h_l145_c7_001c_return_output,
 result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_001c_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_001c_return_output,
 BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c27_a755_return_output,
 BIN_OP_GT_uxn_device_h_l147_c27_18bc_return_output,
 MUX_uxn_device_h_l147_c27_b777_return_output,
 BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_return_output,
 result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_return_output,
 result_u8_value_MUX_uxn_device_h_l153_c7_c96e_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_return_output,
 result_vram_address_MUX_uxn_device_h_l153_c7_c96e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_return_output,
 auto_advance_MUX_uxn_device_h_l153_c7_c96e_return_output,
 vram_addr_MUX_uxn_device_h_l153_c7_c96e_return_output,
 BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_return_output,
 result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_return_output,
 result_u8_value_MUX_uxn_device_h_l154_c3_38cb_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_return_output,
 result_vram_address_MUX_uxn_device_h_l154_c3_38cb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_return_output,
 auto_advance_MUX_uxn_device_h_l154_c3_38cb_return_output,
 vram_addr_MUX_uxn_device_h_l154_c3_38cb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c4_0848_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_return_output,
 vram_addr_MUX_uxn_device_h_l160_c4_0848_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_return_output,
 BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_return_output,
 BIN_OP_AND_uxn_device_h_l162_c5_7f92_return_output,
 BIN_OP_AND_uxn_device_h_l163_c21_eecc_return_output,
 BIN_OP_GT_uxn_device_h_l163_c21_831f_return_output,
 MUX_uxn_device_h_l163_c21_cd6b_return_output,
 BIN_OP_OR_uxn_device_h_l163_c5_e1cf_return_output,
 BIN_OP_AND_uxn_device_h_l164_c21_f0ee_return_output,
 BIN_OP_GT_uxn_device_h_l164_c21_2af3_return_output,
 MUX_uxn_device_h_l164_c21_25d7_return_output,
 BIN_OP_OR_uxn_device_h_l164_c5_9d2f_return_output,
 BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_return_output,
 BIN_OP_PLUS_uxn_device_h_l171_c28_8555_return_output,
 BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output,
 result_u8_value_MUX_uxn_device_h_l178_c7_8a14_return_output,
 result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_return_output,
 result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_return_output,
 result_vram_address_MUX_uxn_device_h_l178_c7_8a14_return_output,
 BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output,
 result_u8_value_MUX_uxn_device_h_l179_c3_a172_return_output,
 result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_return_output,
 result_vram_address_MUX_uxn_device_h_l179_c3_a172_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l40_c2_8c29_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed_uxn_device_h_l40_c2_8c29_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_8c29_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fd50_uxn_device_h_l40_c2_8c29_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_8c29_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l41_c3_319c : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_8c29_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_8c29_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_8c29_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_8c29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l44_c4_cac6 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_0e0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_6a5a_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_6a5a_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_f587_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_6a5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l52_c4_116d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_f56a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_f587_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_121f_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_f587_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_f587_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l63_c4_7017 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_121f_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_121f_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_121f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_6774_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_1052_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_1052_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_1052_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_1052_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_e95f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_e95f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_e95f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_e95f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_f56a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_f56a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_5fa1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_f56a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l70_c4_3950 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_7404_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_5fa1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_5fa1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8617_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_5fa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_7404_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_7404_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_7404_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l78_c4_3ba9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8617_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8617_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_f6bf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_8617_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_9e12 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_f6bf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_ab37_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_f6bf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_62da_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_f6bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_d6bc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_ab37_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_ab37_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_ab37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_62da_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_62da_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_59c4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_62da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l101_c4_19c6 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_59c4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_3944_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_59c4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_59c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l109_c4_ee73 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_3944_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_3944_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_3944_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l116_c4_902b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_0851_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l125_c4_1b6c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_0851_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_0851_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_0851_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l132_c4_6c8d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_c628_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l140_c4_4511 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_c628_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_c628_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_c628_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l148_c4_5a5d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_b777_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_b777_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_b777_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_b777_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l156_c4_0f76 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_62b3_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l171_c5_3675 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l161_c5_c7ee : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_cd6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_cd6b_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_cd6b_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_cd6b_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_25d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_25d7_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_25d7_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_25d7_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_bf60_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l183_c4_8ac9 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l182_c4_4b3c : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l139_l123_DUPLICATE_179a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_779c_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_5d0f_return_output : unsigned(31 downto 0);
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
     VAR_MUX_uxn_device_h_l147_c27_b777_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l147_c27_b777_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_right := to_unsigned(11, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_right := to_unsigned(262143, 18);
     VAR_result_device_ram_address_uxn_device_h_l148_c4_5a5d := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iftrue := VAR_result_device_ram_address_uxn_device_h_l148_c4_5a5d;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_right := to_unsigned(0, 1);
     VAR_vram_addr_uxn_device_h_l41_c3_319c := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_iftrue := VAR_vram_addr_uxn_device_h_l41_c3_319c;
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_right := to_unsigned(14, 4);
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l70_c4_3950 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iftrue := VAR_result_device_ram_address_uxn_device_h_l70_c4_3950;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l85_c4_9e12 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_9e12;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_right := to_unsigned(6, 3);
     VAR_MUX_uxn_device_h_l62_c13_e95f_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l116_c4_902b := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iftrue := VAR_result_device_ram_address_uxn_device_h_l116_c4_902b;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l44_c4_cac6 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iftrue := VAR_result_device_ram_address_uxn_device_h_l44_c4_cac6;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_right := to_unsigned(12, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_right := to_unsigned(64, 7);
     VAR_result_vram_address_uxn_device_h_l182_c4_4b3c := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_iftrue := VAR_result_vram_address_uxn_device_h_l182_c4_4b3c;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_right := to_unsigned(13, 4);
     VAR_result_device_ram_address_uxn_device_h_l52_c4_116d := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iftrue := VAR_result_device_ram_address_uxn_device_h_l52_c4_116d;
     VAR_result_device_ram_address_uxn_device_h_l125_c4_1b6c := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iftrue := VAR_result_device_ram_address_uxn_device_h_l125_c4_1b6c;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_right := to_unsigned(14, 4);
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_right := unsigned'(X"f0000000");
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_right := to_unsigned(4, 3);
     VAR_result_device_ram_address_uxn_device_h_l140_c4_4511 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iftrue := VAR_result_device_ram_address_uxn_device_h_l140_c4_4511;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_right := to_unsigned(14, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l132_c4_6c8d := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iftrue := VAR_result_device_ram_address_uxn_device_h_l132_c4_6c8d;
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l156_c4_0f76 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue := VAR_result_device_ram_address_uxn_device_h_l156_c4_0f76;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l164_c21_25d7_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_d6bc := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_d6bc;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l61_c20_1052_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l101_c4_19c6 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iftrue := VAR_result_device_ram_address_uxn_device_h_l101_c4_19c6;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_right := to_unsigned(2, 2);
     VAR_result_device_ram_address_uxn_device_h_l109_c4_ee73 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iftrue := VAR_result_device_ram_address_uxn_device_h_l109_c4_ee73;
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l163_c21_cd6b_iftrue := to_unsigned(1048576, 21);
     VAR_result_device_ram_address_uxn_device_h_l78_c4_3ba9 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iftrue := VAR_result_device_ram_address_uxn_device_h_l78_c4_3ba9;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_right := to_unsigned(5, 3);
     VAR_MUX_uxn_device_h_l164_c21_25d7_iftrue := to_unsigned(2097152, 22);
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_right := to_unsigned(32, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_right := to_unsigned(16, 5);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_right := to_unsigned(400, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_right := to_unsigned(400, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iffalse := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l183_c4_8ac9 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_iftrue := VAR_result_u8_value_uxn_device_h_l183_c4_8ac9;
     VAR_MUX_uxn_device_h_l62_c13_e95f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l163_c21_cd6b_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_right := to_unsigned(400, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l61_c20_1052_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l63_c4_7017 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iftrue := VAR_result_device_ram_address_uxn_device_h_l63_c4_7017;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iffalse := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l40_c2_8c29_iftrue := color;
     VAR_color_MUX_uxn_device_h_l50_c7_6a5a_iftrue := color;
     VAR_color_MUX_uxn_device_h_l57_c7_f587_iffalse := color;
     VAR_color_MUX_uxn_device_h_l58_c3_121f_iffalse := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_left := VAR_device_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_cond := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iffalse := is_fill_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_cond := is_fill_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_cond := is_fill_mode;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_cond := is_fill_mode;
     VAR_layer_MUX_uxn_device_h_l40_c2_8c29_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l57_c7_f587_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l58_c3_121f_iffalse := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_left := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_left := pixel;
     VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l57_c7_f587_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l58_c3_121f_iffalse := pixel;
     VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg3 := resize(pixel, 32);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l58_c3_121f_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l76_c3_7404_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l57_c7_f587_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l76_c3_7404_iffalse := sprite;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_iftrue := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_right := x;
     VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l106_c7_59c4_iffalse := x;
     VAR_x_MUX_uxn_device_h_l107_c3_3944_iffalse := x;
     VAR_x_MUX_uxn_device_h_l40_c2_8c29_iftrue := x;
     VAR_x_MUX_uxn_device_h_l50_c7_6a5a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l57_c7_f587_iftrue := x;
     VAR_x_MUX_uxn_device_h_l68_c7_f56a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l75_c7_5fa1_iftrue := x;
     VAR_x_MUX_uxn_device_h_l83_c7_8617_iftrue := x;
     VAR_x_MUX_uxn_device_h_l91_c3_ab37_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_62da_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_left := y;
     VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l106_c7_59c4_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_ad05_iftrue := y;
     VAR_y_MUX_uxn_device_h_l122_c3_0851_iffalse := y;
     VAR_y_MUX_uxn_device_h_l130_c7_bce2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l137_c7_85fc_iffalse := y;
     VAR_y_MUX_uxn_device_h_l138_c3_c628_iffalse := y;
     VAR_y_MUX_uxn_device_h_l40_c2_8c29_iftrue := y;
     VAR_y_MUX_uxn_device_h_l50_c7_6a5a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l57_c7_f587_iftrue := y;
     VAR_y_MUX_uxn_device_h_l68_c7_f56a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l75_c7_5fa1_iftrue := y;
     VAR_y_MUX_uxn_device_h_l83_c7_8617_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_f6bf_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_62da_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l178_c11_a4c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_left <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_left;
     BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_right <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output := BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l50_c11_ec85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l50_c11_ec85_left <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_left;
     BIN_OP_EQ_uxn_device_h_l50_c11_ec85_right <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output := BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;

     -- BIN_OP_AND[uxn_device_h_l164_c21_f0ee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l164_c21_f0ee_left <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_left;
     BIN_OP_AND_uxn_device_h_l164_c21_f0ee_right <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_return_output := BIN_OP_AND_uxn_device_h_l164_c21_f0ee_return_output;

     -- BIN_OP_EQ[uxn_device_h_l83_c11_7e2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_left <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_left;
     BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_right <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output := BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l168_c127_bf60] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_bf60_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- result_is_vram_write_MUX[uxn_device_h_l160_c4_0848] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_return_output;

     -- BIN_OP_EQ[uxn_device_h_l153_c11_b532] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l153_c11_b532_left <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_left;
     BIN_OP_EQ_uxn_device_h_l153_c11_b532_right <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output := BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;

     -- BIN_OP_AND[uxn_device_h_l163_c21_eecc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l163_c21_eecc_left <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_left;
     BIN_OP_AND_uxn_device_h_l163_c21_eecc_right <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_return_output := BIN_OP_AND_uxn_device_h_l163_c21_eecc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c7_4f2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_left;
     BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output := BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l84_c7_e96e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l84_c7_e96e_left <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_left;
     BIN_OP_EQ_uxn_device_h_l84_c7_e96e_right <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output := BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l115_c7_977f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l115_c7_977f_left <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_left;
     BIN_OP_EQ_uxn_device_h_l115_c7_977f_right <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output := BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l157_c22_62b3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_62b3_return_output := CAST_TO_uint8_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l100_c7_ea76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_ea76_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_ea76_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_779c LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_779c_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l40_c6_b428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l40_c6_b428_left <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_left;
     BIN_OP_EQ_uxn_device_h_l40_c6_b428_right <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output := BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_a577] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_a577_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_a577_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l58_c7_c79b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l58_c7_c79b_left <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_left;
     BIN_OP_EQ_uxn_device_h_l58_c7_c79b_right <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output := BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_18ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_18ef_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_18ef_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;

     -- BIN_OP_EQ[uxn_device_h_l106_c11_d5bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_left <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_left;
     BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_right <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output := BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l60_c12_6774] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_6774_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_0eba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_0eba_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_0eba_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l139_l123_DUPLICATE_179a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l139_l123_DUPLICATE_179a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l146_c7_42dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l146_c7_42dd_left <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_left;
     BIN_OP_EQ_uxn_device_h_l146_c7_42dd_right <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output := BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c7_3266] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c7_3266_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_left;
     BIN_OP_EQ_uxn_device_h_l42_c7_3266_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output := BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output;

     -- BIN_OP_EQ[uxn_device_h_l122_c7_ba89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l122_c7_ba89_left <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_left;
     BIN_OP_EQ_uxn_device_h_l122_c7_ba89_right <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output := BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c7_370d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c7_370d_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_left;
     BIN_OP_EQ_uxn_device_h_l138_c7_370d_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output := BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l154_c7_4cd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_left <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_left;
     BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_right <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output := BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output := result.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l69_c7_21fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c7_21fe_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_left;
     BIN_OP_EQ_uxn_device_h_l69_c7_21fe_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output := BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_69cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_69cc_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_69cc_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;

     -- BIN_OP_AND[uxn_device_h_l62_c13_afbc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l62_c13_afbc_left <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_left;
     BIN_OP_AND_uxn_device_h_l62_c13_afbc_right <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_return_output := BIN_OP_AND_uxn_device_h_l62_c13_afbc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c11_993b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_993b_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_993b_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;

     -- BIN_OP_AND[uxn_device_h_l61_c20_ea3b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l61_c20_ea3b_left <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_left;
     BIN_OP_AND_uxn_device_h_l61_c20_ea3b_right <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_return_output := BIN_OP_AND_uxn_device_h_l61_c20_ea3b_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l57_c11_7ded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c11_7ded_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_left;
     BIN_OP_EQ_uxn_device_h_l57_c11_7ded_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output := BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l42_c3_0e0b] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_0e0b_return_output := result.is_device_ram_write;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_4be2] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_cfe0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l76_c7_b98b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l76_c7_b98b_left <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_left;
     BIN_OP_EQ_uxn_device_h_l76_c7_b98b_right <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output := BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l121_c11_1022] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l121_c11_1022_left <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_left;
     BIN_OP_EQ_uxn_device_h_l121_c11_1022_right <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output := BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_5d0f LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_5d0f_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l179_c7_8699] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l179_c7_8699_left <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_left;
     BIN_OP_EQ_uxn_device_h_l179_c7_8699_right <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output := BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output;

     -- BIN_OP_EQ[uxn_device_h_l131_c7_5972] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c7_5972_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_left;
     BIN_OP_EQ_uxn_device_h_l131_c7_5972_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output := BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_0189] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_0189_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_0189_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output;

     -- BIN_OP_EQ[uxn_device_h_l75_c11_d8b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_left;
     BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output := BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l68_c11_913a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l68_c11_913a_left <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_left;
     BIN_OP_EQ_uxn_device_h_l68_c11_913a_right <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output := BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l51_c7_edcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l51_c7_edcb_left <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_left;
     BIN_OP_EQ_uxn_device_h_l51_c7_edcb_right <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output := BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_left := VAR_BIN_OP_AND_uxn_device_h_l163_c21_eecc_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_left := VAR_BIN_OP_AND_uxn_device_h_l164_c21_f0ee_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_left := VAR_BIN_OP_AND_uxn_device_h_l61_c20_ea3b_return_output;
     VAR_MUX_uxn_device_h_l62_c13_e95f_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l62_c13_afbc_return_output, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_ea76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_d5bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_3944_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_4f2c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_ad05_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_cfe0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_977f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_2b2b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_1022_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_0851_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_ba89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_bce2_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_a577_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_5972_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_85fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_69cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_c628_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_370d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_18ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_42dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_b532_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_4cd8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a4c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8699_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_8c29_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b428_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3266_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_6a5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_ec85_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_edcb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_f587_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_7ded_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_121f_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_121f_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output;
     VAR_pixel_MUX_uxn_device_h_l58_c3_121f_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_c79b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_f56a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_913a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_21fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_5fa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_d8b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output;
     VAR_sprite_MUX_uxn_device_h_l76_c3_7404_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_b98b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_8617_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_7e2d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_e96e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_f6bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_993b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_ab37_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_0189_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_62da_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_0eba_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_4be2_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l139_l123_DUPLICATE_179a_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l139_l123_DUPLICATE_179a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l139_l123_DUPLICATE_179a_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_121f_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_6774_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_5d0f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_5d0f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_779c_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_779c_return_output;
     VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_bf60_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_62b3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l154_l115_l122_l138_l107_l76_l51_l131_l58_l84_l91_l69_l100_DUPLICATE_42f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_f1f2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_DUPLICATE_7223_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_aacd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l154_l115_l42_l122_l138_l107_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_DUPLICATE_1648_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_DUPLICATE_03d5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_0e0b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0848_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l84_c3_26c0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_cond;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_return_output := result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_7130] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_8efc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output := CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l122_c3_0851] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_cond;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_return_output := result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c27_a755] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c27_a755_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_left;
     BIN_OP_PLUS_uxn_device_h_l147_c27_a755_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_return_output := BIN_OP_PLUS_uxn_device_h_l147_c27_a755_return_output;

     -- result_u8_value_MUX[uxn_device_h_l179_c3_a172] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l179_c3_a172_cond <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_cond;
     result_u8_value_MUX_uxn_device_h_l179_c3_a172_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_iftrue;
     result_u8_value_MUX_uxn_device_h_l179_c3_a172_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_return_output := result_u8_value_MUX_uxn_device_h_l179_c3_a172_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l146_c3_b81d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_cond;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_return_output := result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l138_c3_c628] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_cond;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_return_output := result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l69_c3_45f7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_cond;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_return_output := result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l178_c7_8a14] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_cond;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_return_output := result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l42_c3_0e0b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_cond;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_return_output := result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_return_output;

     -- BIN_OP_GT[uxn_device_h_l163_c21_831f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l163_c21_831f_left <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_left;
     BIN_OP_GT_uxn_device_h_l163_c21_831f_right <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_return_output := BIN_OP_GT_uxn_device_h_l163_c21_831f_return_output;

     -- BIN_OP_OR[uxn_device_h_l139_c4_63d6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l139_c4_63d6_left <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_left;
     BIN_OP_OR_uxn_device_h_l139_c4_63d6_right <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_return_output := BIN_OP_OR_uxn_device_h_l139_c4_63d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_cond;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_return_output := result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l131_c3_c562] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_cond;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_return_output := result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_return_output;

     -- result_vram_address_MUX[uxn_device_h_l179_c3_a172] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l179_c3_a172_cond <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_cond;
     result_vram_address_MUX_uxn_device_h_l179_c3_a172_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_iftrue;
     result_vram_address_MUX_uxn_device_h_l179_c3_a172_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_return_output := result_vram_address_MUX_uxn_device_h_l179_c3_a172_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l69_c3_45f7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_cond;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_return_output := result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l76_c3_7404] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_cond;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_return_output := result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l76_c3_7404] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_cond;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_return_output := result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_b8d0] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_return_output;

     -- auto_advance_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_cond;
     auto_advance_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     auto_advance_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_return_output := auto_advance_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_ab37] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_return_output;

     -- color_MUX[uxn_device_h_l58_c3_121f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l58_c3_121f_cond <= VAR_color_MUX_uxn_device_h_l58_c3_121f_cond;
     color_MUX_uxn_device_h_l58_c3_121f_iftrue <= VAR_color_MUX_uxn_device_h_l58_c3_121f_iftrue;
     color_MUX_uxn_device_h_l58_c3_121f_iffalse <= VAR_color_MUX_uxn_device_h_l58_c3_121f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l58_c3_121f_return_output := color_MUX_uxn_device_h_l58_c3_121f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c3_3944] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_return_output;

     -- pixel_MUX[uxn_device_h_l58_c3_121f] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l58_c3_121f_cond <= VAR_pixel_MUX_uxn_device_h_l58_c3_121f_cond;
     pixel_MUX_uxn_device_h_l58_c3_121f_iftrue <= VAR_pixel_MUX_uxn_device_h_l58_c3_121f_iftrue;
     pixel_MUX_uxn_device_h_l58_c3_121f_iffalse <= VAR_pixel_MUX_uxn_device_h_l58_c3_121f_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l58_c3_121f_return_output := pixel_MUX_uxn_device_h_l58_c3_121f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_8efc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l84_c3_26c0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_cond;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_return_output := result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_return_output;

     -- BIN_OP_OR[uxn_device_h_l108_c4_9319] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l108_c4_9319_left <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_left;
     BIN_OP_OR_uxn_device_h_l108_c4_9319_right <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_return_output := BIN_OP_OR_uxn_device_h_l108_c4_9319_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l138_c3_c628] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_cond;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_return_output := result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l115_c3_7130] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_cond;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_return_output := result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_cond;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_return_output := result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_cond;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_return_output := result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l61_c20_46fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l61_c20_46fa_left <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_left;
     BIN_OP_EQ_uxn_device_h_l61_c20_46fa_right <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_return_output := BIN_OP_EQ_uxn_device_h_l61_c20_46fa_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l51_c3_259d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_cond;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_return_output := result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_ab37] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_cond;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_return_output := result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l51_c3_259d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_cond;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_return_output := result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l131_c3_c562] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_cond;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_return_output := result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l58_c3_121f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_cond;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_return_output := result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_return_output;

     -- sprite_MUX[uxn_device_h_l76_c3_7404] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l76_c3_7404_cond <= VAR_sprite_MUX_uxn_device_h_l76_c3_7404_cond;
     sprite_MUX_uxn_device_h_l76_c3_7404_iftrue <= VAR_sprite_MUX_uxn_device_h_l76_c3_7404_iftrue;
     sprite_MUX_uxn_device_h_l76_c3_7404_iffalse <= VAR_sprite_MUX_uxn_device_h_l76_c3_7404_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l76_c3_7404_return_output := sprite_MUX_uxn_device_h_l76_c3_7404_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l179_c3_a172] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_cond;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_return_output := result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l58_c3_121f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_cond;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_return_output := result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_return_output;

     -- MUX[uxn_device_h_l62_c13_e95f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l62_c13_e95f_cond <= VAR_MUX_uxn_device_h_l62_c13_e95f_cond;
     MUX_uxn_device_h_l62_c13_e95f_iftrue <= VAR_MUX_uxn_device_h_l62_c13_e95f_iftrue;
     MUX_uxn_device_h_l62_c13_e95f_iffalse <= VAR_MUX_uxn_device_h_l62_c13_e95f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l62_c13_e95f_return_output := MUX_uxn_device_h_l62_c13_e95f_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_9f09] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l122_c3_0851] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_cond;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_return_output := result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_return_output;

     -- BIN_OP_GT[uxn_device_h_l164_c21_2af3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l164_c21_2af3_left <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_left;
     BIN_OP_GT_uxn_device_h_l164_c21_2af3_right <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_return_output := BIN_OP_GT_uxn_device_h_l164_c21_2af3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l42_c3_0e0b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_cond;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_return_output := result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_0e0b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_cond;
     result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_return_output := result_u8_value_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c3_3944] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l61_c20_1052_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c20_46fa_return_output;
     VAR_MUX_uxn_device_h_l163_c21_cd6b_cond := VAR_BIN_OP_GT_uxn_device_h_l163_c21_831f_return_output;
     VAR_MUX_uxn_device_h_l164_c21_25d7_cond := VAR_BIN_OP_GT_uxn_device_h_l164_c21_2af3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b8d0_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_9f09_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_3944_iftrue := VAR_BIN_OP_OR_uxn_device_h_l108_c4_9319_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_c628_iftrue := VAR_BIN_OP_OR_uxn_device_h_l139_c4_63d6_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_left := VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_a755_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_ab37_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_0851_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_84e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_121f_iftrue := VAR_MUX_uxn_device_h_l62_c13_e95f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_auto_advance_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_color_MUX_uxn_device_h_l58_c3_121f_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_pixel_MUX_uxn_device_h_l58_c3_121f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_8efc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_3944_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_7130_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_0851_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_c562_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_c628_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_b81d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_259d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_121f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_45f7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_7404_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_26c0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_ab37_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_8efc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_3944_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_7130_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_0851_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_c562_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_c628_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_8a14_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_259d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_121f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_45f7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_7404_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_26c0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_ab37_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_a172_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l179_c3_a172_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l179_c3_a172_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_iftrue := VAR_sprite_MUX_uxn_device_h_l76_c3_7404_return_output;
     -- MUX[uxn_device_h_l163_c21_cd6b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l163_c21_cd6b_cond <= VAR_MUX_uxn_device_h_l163_c21_cd6b_cond;
     MUX_uxn_device_h_l163_c21_cd6b_iftrue <= VAR_MUX_uxn_device_h_l163_c21_cd6b_iftrue;
     MUX_uxn_device_h_l163_c21_cd6b_iffalse <= VAR_MUX_uxn_device_h_l163_c21_cd6b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l163_c21_cd6b_return_output := MUX_uxn_device_h_l163_c21_cd6b_return_output;

     -- sprite_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_cond;
     sprite_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     sprite_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_return_output := sprite_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- MUX[uxn_device_h_l164_c21_25d7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l164_c21_25d7_cond <= VAR_MUX_uxn_device_h_l164_c21_25d7_cond;
     MUX_uxn_device_h_l164_c21_25d7_iftrue <= VAR_MUX_uxn_device_h_l164_c21_25d7_iftrue;
     MUX_uxn_device_h_l164_c21_25d7_iffalse <= VAR_MUX_uxn_device_h_l164_c21_25d7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l164_c21_25d7_return_output := MUX_uxn_device_h_l164_c21_25d7_return_output;

     -- y_MUX[uxn_device_h_l138_c3_c628] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c3_c628_cond <= VAR_y_MUX_uxn_device_h_l138_c3_c628_cond;
     y_MUX_uxn_device_h_l138_c3_c628_iftrue <= VAR_y_MUX_uxn_device_h_l138_c3_c628_iftrue;
     y_MUX_uxn_device_h_l138_c3_c628_iffalse <= VAR_y_MUX_uxn_device_h_l138_c3_c628_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c3_c628_return_output := y_MUX_uxn_device_h_l138_c3_c628_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_cond;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_return_output := result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- color_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_color_MUX_uxn_device_h_l57_c7_f587_cond;
     color_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_color_MUX_uxn_device_h_l57_c7_f587_iftrue;
     color_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_color_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l57_c7_f587_return_output := color_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l171_c28_8555] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l171_c28_8555_left <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_left;
     BIN_OP_PLUS_uxn_device_h_l171_c28_8555_right <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_return_output := BIN_OP_PLUS_uxn_device_h_l171_c28_8555_return_output;

     -- BIN_OP_GT[uxn_device_h_l147_c27_18bc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l147_c27_18bc_left <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_left;
     BIN_OP_GT_uxn_device_h_l147_c27_18bc_right <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_return_output := BIN_OP_GT_uxn_device_h_l147_c27_18bc_return_output;

     -- pixel_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_pixel_MUX_uxn_device_h_l57_c7_f587_cond;
     pixel_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_pixel_MUX_uxn_device_h_l57_c7_f587_iftrue;
     pixel_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_pixel_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l57_c7_f587_return_output := pixel_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- layer_MUX[uxn_device_h_l58_c3_121f] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l58_c3_121f_cond <= VAR_layer_MUX_uxn_device_h_l58_c3_121f_cond;
     layer_MUX_uxn_device_h_l58_c3_121f_iftrue <= VAR_layer_MUX_uxn_device_h_l58_c3_121f_iftrue;
     layer_MUX_uxn_device_h_l58_c3_121f_iffalse <= VAR_layer_MUX_uxn_device_h_l58_c3_121f_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l58_c3_121f_return_output := layer_MUX_uxn_device_h_l58_c3_121f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_cond;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_return_output := result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- x_MUX[uxn_device_h_l107_c3_3944] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c3_3944_cond <= VAR_x_MUX_uxn_device_h_l107_c3_3944_cond;
     x_MUX_uxn_device_h_l107_c3_3944_iftrue <= VAR_x_MUX_uxn_device_h_l107_c3_3944_iftrue;
     x_MUX_uxn_device_h_l107_c3_3944_iffalse <= VAR_x_MUX_uxn_device_h_l107_c3_3944_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c3_3944_return_output := x_MUX_uxn_device_h_l107_c3_3944_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l178_c7_8a14] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_cond;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_return_output := result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_return_output;

     -- x_MUX[uxn_device_h_l91_c3_ab37] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l91_c3_ab37_cond <= VAR_x_MUX_uxn_device_h_l91_c3_ab37_cond;
     x_MUX_uxn_device_h_l91_c3_ab37_iftrue <= VAR_x_MUX_uxn_device_h_l91_c3_ab37_iftrue;
     x_MUX_uxn_device_h_l91_c3_ab37_iffalse <= VAR_x_MUX_uxn_device_h_l91_c3_ab37_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l91_c3_ab37_return_output := x_MUX_uxn_device_h_l91_c3_ab37_return_output;

     -- auto_advance_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_cond;
     auto_advance_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     auto_advance_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_return_output := auto_advance_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l178_c7_8a14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l178_c7_8a14_cond <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_cond;
     result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iftrue;
     result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_return_output := result_u8_value_MUX_uxn_device_h_l178_c7_8a14_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed[uxn_device_h_l40_c2_8c29] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed_uxn_device_h_l40_c2_8c29_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_52ed(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_0e0b_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_0e0b_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_0e0b_return_output);

     -- y_MUX[uxn_device_h_l122_c3_0851] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l122_c3_0851_cond <= VAR_y_MUX_uxn_device_h_l122_c3_0851_cond;
     y_MUX_uxn_device_h_l122_c3_0851_iftrue <= VAR_y_MUX_uxn_device_h_l122_c3_0851_iftrue;
     y_MUX_uxn_device_h_l122_c3_0851_iffalse <= VAR_y_MUX_uxn_device_h_l122_c3_0851_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l122_c3_0851_return_output := y_MUX_uxn_device_h_l122_c3_0851_return_output;

     -- result_vram_address_MUX[uxn_device_h_l178_c7_8a14] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l178_c7_8a14_cond <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_cond;
     result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iftrue;
     result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_return_output := result_vram_address_MUX_uxn_device_h_l178_c7_8a14_return_output;

     -- MUX[uxn_device_h_l61_c20_1052] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l61_c20_1052_cond <= VAR_MUX_uxn_device_h_l61_c20_1052_cond;
     MUX_uxn_device_h_l61_c20_1052_iftrue <= VAR_MUX_uxn_device_h_l61_c20_1052_iftrue;
     MUX_uxn_device_h_l61_c20_1052_iffalse <= VAR_MUX_uxn_device_h_l61_c20_1052_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l61_c20_1052_return_output := MUX_uxn_device_h_l61_c20_1052_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l161_c18_dfd7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_left;
     BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_return_output := BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_cond;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_return_output := result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l147_c27_b777_cond := VAR_BIN_OP_GT_uxn_device_h_l147_c27_18bc_return_output;
     VAR_vram_addr_uxn_device_h_l161_c5_c7ee := resize(VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dfd7_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l171_c5_3675 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8555_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_right := VAR_MUX_uxn_device_h_l163_c21_cd6b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_right := VAR_MUX_uxn_device_h_l164_c21_25d7_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iftrue := VAR_MUX_uxn_device_h_l61_c20_1052_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_color_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_layer_MUX_uxn_device_h_l58_c3_121f_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_pixel_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_8c29_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed_uxn_device_h_l40_c2_8c29_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_8a14_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l178_c7_8a14_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l178_c7_8a14_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_sprite_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_59c4_iftrue := VAR_x_MUX_uxn_device_h_l107_c3_3944_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_f6bf_iftrue := VAR_x_MUX_uxn_device_h_l91_c3_ab37_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_2b2b_iftrue := VAR_y_MUX_uxn_device_h_l122_c3_0851_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_85fc_iftrue := VAR_y_MUX_uxn_device_h_l138_c3_c628_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_iffalse := VAR_result_vram_address_uxn_device_h_l171_c5_3675;
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_left := VAR_vram_addr_uxn_device_h_l161_c5_c7ee;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- MUX[uxn_device_h_l147_c27_b777] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c27_b777_cond <= VAR_MUX_uxn_device_h_l147_c27_b777_cond;
     MUX_uxn_device_h_l147_c27_b777_iftrue <= VAR_MUX_uxn_device_h_l147_c27_b777_iftrue;
     MUX_uxn_device_h_l147_c27_b777_iffalse <= VAR_MUX_uxn_device_h_l147_c27_b777_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c27_b777_return_output := MUX_uxn_device_h_l147_c27_b777_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_cond;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_return_output := result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_cond;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_return_output := result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- y_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_y_MUX_uxn_device_h_l137_c7_85fc_cond;
     y_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_y_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     y_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_y_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c7_85fc_return_output := y_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- result_u8_value_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_cond;
     result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_return_output := result_u8_value_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- pixel_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_cond;
     pixel_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     pixel_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_return_output := pixel_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_cond;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_return_output := result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- x_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_x_MUX_uxn_device_h_l106_c7_59c4_cond;
     x_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_x_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     x_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_x_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l106_c7_59c4_return_output := x_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- color_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_color_MUX_uxn_device_h_l50_c7_6a5a_cond;
     color_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_color_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     color_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_color_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l50_c7_6a5a_return_output := color_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- sprite_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_cond;
     sprite_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     sprite_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_return_output := sprite_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- BIN_OP_AND[uxn_device_h_l162_c5_7f92] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l162_c5_7f92_left <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_left;
     BIN_OP_AND_uxn_device_h_l162_c5_7f92_right <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_return_output := BIN_OP_AND_uxn_device_h_l162_c5_7f92_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l58_c3_121f] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l58_c3_121f_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_cond;
     is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iftrue;
     is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_return_output := is_fill_mode_MUX_uxn_device_h_l58_c3_121f_return_output;

     -- layer_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_layer_MUX_uxn_device_h_l57_c7_f587_cond;
     layer_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_layer_MUX_uxn_device_h_l57_c7_f587_iftrue;
     layer_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_layer_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l57_c7_f587_return_output := layer_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_return_output := auto_advance_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_left := VAR_BIN_OP_AND_uxn_device_h_l162_c5_7f92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iftrue := VAR_MUX_uxn_device_h_l147_c27_b777_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_color_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_121f_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_layer_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_pixel_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_sprite_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_x_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_y_MUX_uxn_device_h_l137_c7_85fc_return_output;
     -- sprite_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_sprite_MUX_uxn_device_h_l57_c7_f587_cond;
     sprite_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_sprite_MUX_uxn_device_h_l57_c7_f587_iftrue;
     sprite_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_sprite_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l57_c7_f587_return_output := sprite_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- layer_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_cond;
     layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output := layer_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- BIN_OP_OR[uxn_device_h_l163_c5_e1cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l163_c5_e1cf_left <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_left;
     BIN_OP_OR_uxn_device_h_l163_c5_e1cf_right <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_return_output := BIN_OP_OR_uxn_device_h_l163_c5_e1cf_return_output;

     -- color_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_color_MUX_uxn_device_h_l40_c2_8c29_cond;
     color_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_color_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     color_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_color_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l40_c2_8c29_return_output := color_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_cond;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_return_output := result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- x_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_x_MUX_uxn_device_h_l99_c7_62da_cond;
     x_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_62da_iftrue;
     x_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_62da_return_output := x_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_cond;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_return_output := result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l146_c3_b81d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_cond;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_return_output := result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_cond;
     is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iftrue;
     is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_return_output := is_fill_mode_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- pixel_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_cond;
     pixel_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     pixel_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_return_output := pixel_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_cond;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_return_output := result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- result_u8_value_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_cond;
     result_u8_value_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_iftrue;
     result_u8_value_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_return_output := result_u8_value_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- y_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_y_MUX_uxn_device_h_l130_c7_bce2_cond;
     y_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_y_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     y_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_y_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c7_bce2_return_output := y_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- auto_advance_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_cond;
     auto_advance_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     auto_advance_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_return_output := auto_advance_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_left := VAR_BIN_OP_OR_uxn_device_h_l163_c5_e1cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l137_c7_85fc_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_85fc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_b81d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_85fc_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_sprite_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_y_MUX_uxn_device_h_l130_c7_bce2_return_output;
     -- auto_advance_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_cond;
     auto_advance_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     auto_advance_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_return_output := auto_advance_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_cond;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_return_output := result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- layer_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_layer_MUX_uxn_device_h_l40_c2_8c29_cond;
     layer_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_layer_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     layer_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_layer_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l40_c2_8c29_return_output := layer_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_cond;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_return_output := result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_cond;
     result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_return_output := result_u8_value_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- x_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_x_MUX_uxn_device_h_l90_c7_f6bf_cond;
     x_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     x_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_f6bf_return_output := x_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_cond;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_return_output := result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- sprite_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_cond;
     sprite_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     sprite_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_return_output := sprite_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_cond;
     is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_return_output := is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- BIN_OP_OR[uxn_device_h_l164_c5_9d2f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l164_c5_9d2f_left <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_left;
     BIN_OP_OR_uxn_device_h_l164_c5_9d2f_right <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_return_output := BIN_OP_OR_uxn_device_h_l164_c5_9d2f_return_output;

     -- y_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_y_MUX_uxn_device_h_l121_c7_2b2b_cond;
     y_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_y_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     y_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_y_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l121_c7_2b2b_return_output := y_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_cond;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_return_output := result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_left := VAR_BIN_OP_OR_uxn_device_h_l164_c5_9d2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_85fc_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l137_c7_85fc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_sprite_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_y_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_cond;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_return_output := result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- y_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_y_MUX_uxn_device_h_l114_c7_ad05_cond;
     y_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     y_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_ad05_return_output := y_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- auto_advance_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_cond;
     auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_return_output := auto_advance_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_cond;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_return_output := result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_cond;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output := result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_cond;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_return_output := result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- x_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_x_MUX_uxn_device_h_l83_c7_8617_cond;
     x_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_x_MUX_uxn_device_h_l83_c7_8617_iftrue;
     x_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_x_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l83_c7_8617_return_output := x_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- result_u8_value_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_cond;
     result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_return_output := result_u8_value_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- sprite_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_cond;
     sprite_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     sprite_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_return_output := sprite_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- BIN_OP_OR[uxn_device_h_l165_c5_67de] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l165_c5_67de_left <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_left;
     BIN_OP_OR_uxn_device_h_l165_c5_67de_right <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output := BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_cond;
     is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_return_output := is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- Submodule level 7
     VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg4 := VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_67de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_auto_advance_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_85fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_x_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_ad05_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- result_u8_value_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_cond;
     result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_return_output := result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_cond;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_return_output := result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_return_output := auto_advance_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_cond;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_return_output := result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c4_0848] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c4_0848_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_cond;
     result_vram_address_MUX_uxn_device_h_l160_c4_0848_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c4_0848_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_return_output := result_vram_address_MUX_uxn_device_h_l160_c4_0848_return_output;

     -- x_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_x_MUX_uxn_device_h_l75_c7_5fa1_cond;
     x_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_x_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     x_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_x_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c7_5fa1_return_output := x_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- vram_addr_MUX[uxn_device_h_l160_c4_0848] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l160_c4_0848_cond <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_cond;
     vram_addr_MUX_uxn_device_h_l160_c4_0848_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_iftrue;
     vram_addr_MUX_uxn_device_h_l160_c4_0848_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_return_output := vram_addr_MUX_uxn_device_h_l160_c4_0848_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_cond;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_return_output := result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_cond;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_return_output := result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- y_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_y_MUX_uxn_device_h_l106_c7_59c4_cond;
     y_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_y_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     y_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_y_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l106_c7_59c4_return_output := y_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0848_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_iftrue := VAR_vram_addr_MUX_uxn_device_h_l160_c4_0848_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_x_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_y_MUX_uxn_device_h_l106_c7_59c4_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_cond;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_return_output := result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- y_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_y_MUX_uxn_device_h_l99_c7_62da_cond;
     y_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_62da_iftrue;
     y_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_62da_return_output := y_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- auto_advance_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_cond;
     auto_advance_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     auto_advance_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_return_output := auto_advance_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- x_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_x_MUX_uxn_device_h_l68_c7_f56a_cond;
     x_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_x_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     x_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_x_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l68_c7_f56a_return_output := x_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_cond;
     result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_return_output := result_u8_value_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_cond;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_return_output := result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_cond;
     result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_return_output := result_vram_address_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_cond;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_return_output := result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_cond;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_return_output := result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- vram_addr_MUX[uxn_device_h_l154_c3_38cb] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l154_c3_38cb_cond <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_cond;
     vram_addr_MUX_uxn_device_h_l154_c3_38cb_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_iftrue;
     vram_addr_MUX_uxn_device_h_l154_c3_38cb_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_return_output := vram_addr_MUX_uxn_device_h_l154_c3_38cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_auto_advance_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_iftrue := VAR_vram_addr_MUX_uxn_device_h_l154_c3_38cb_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_x_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_62da_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_cond;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_return_output := result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- result_u8_value_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_cond;
     result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_return_output := result_u8_value_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_return_output := auto_advance_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- y_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_y_MUX_uxn_device_h_l90_c7_f6bf_cond;
     y_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     y_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_f6bf_return_output := y_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- x_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_x_MUX_uxn_device_h_l57_c7_f587_cond;
     x_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_x_MUX_uxn_device_h_l57_c7_f587_iftrue;
     x_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_x_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l57_c7_f587_return_output := x_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- result_vram_address_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_cond;
     result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_return_output := result_vram_address_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_cond;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_return_output := result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_cond;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_return_output := result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- vram_addr_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_cond;
     vram_addr_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     vram_addr_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_return_output := vram_addr_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_vram_addr_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_x_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     -- result_u8_value_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_cond;
     result_u8_value_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_iftrue;
     result_u8_value_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_return_output := result_u8_value_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- y_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_y_MUX_uxn_device_h_l83_c7_8617_cond;
     y_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_y_MUX_uxn_device_h_l83_c7_8617_iftrue;
     y_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_y_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l83_c7_8617_return_output := y_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_cond;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_return_output := result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_cond;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_return_output := result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_return_output := vram_addr_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- x_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_x_MUX_uxn_device_h_l50_c7_6a5a_cond;
     x_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_x_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     x_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_x_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l50_c7_6a5a_return_output := x_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_cond;
     result_vram_address_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_iftrue;
     result_vram_address_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_return_output := result_vram_address_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- auto_advance_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_return_output := auto_advance_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_x_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_y_MUX_uxn_device_h_l83_c7_8617_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- y_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_y_MUX_uxn_device_h_l75_c7_5fa1_cond;
     y_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_y_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     y_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_y_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c7_5fa1_return_output := y_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_cond;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_return_output := result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_cond;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_return_output := result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- result_u8_value_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_cond;
     result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_return_output := result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- auto_advance_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_cond;
     auto_advance_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_iftrue;
     auto_advance_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_return_output := auto_advance_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- x_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_x_MUX_uxn_device_h_l40_c2_8c29_cond;
     x_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_x_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     x_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_x_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l40_c2_8c29_return_output := x_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- vram_addr_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_cond;
     vram_addr_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     vram_addr_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_return_output := vram_addr_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- result_vram_address_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_cond;
     result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_return_output := result_vram_address_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_auto_advance_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l137_c7_85fc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_iffalse := VAR_vram_addr_MUX_uxn_device_h_l137_c7_85fc_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_y_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_85fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_cond;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_return_output := result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- auto_advance_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_cond;
     auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_return_output := auto_advance_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- vram_addr_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_cond;
     vram_addr_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     vram_addr_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_return_output := vram_addr_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_cond;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output := result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- result_vram_address_MUX[uxn_device_h_l130_c7_bce2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l130_c7_bce2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_cond;
     result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iftrue;
     result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_return_output := result_vram_address_MUX_uxn_device_h_l130_c7_bce2_return_output;

     -- y_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_y_MUX_uxn_device_h_l68_c7_f56a_cond;
     y_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_y_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     y_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_y_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l68_c7_f56a_return_output := y_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_cond;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_return_output := result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- result_u8_value_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_cond;
     result_u8_value_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_iftrue;
     result_u8_value_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_return_output := result_u8_value_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_85fc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iffalse := VAR_vram_addr_MUX_uxn_device_h_l130_c7_bce2_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_y_MUX_uxn_device_h_l68_c7_f56a_return_output;
     -- vram_addr_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_cond;
     vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_return_output := vram_addr_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_cond;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_return_output := result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_001c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_return_output;

     -- y_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_y_MUX_uxn_device_h_l57_c7_f587_cond;
     y_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_y_MUX_uxn_device_h_l57_c7_f587_iftrue;
     y_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_y_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l57_c7_f587_return_output := y_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_return_output := result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_cond;
     result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_return_output := result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_cond;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_return_output := result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- auto_advance_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_cond;
     auto_advance_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     auto_advance_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_return_output := auto_advance_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l121_c7_2b2b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_cond;
     result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iftrue;
     result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output := result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_cond;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_return_output := result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_001c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_auto_advance_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_iffalse := VAR_vram_addr_MUX_uxn_device_h_l121_c7_2b2b_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_y_MUX_uxn_device_h_l57_c7_f587_return_output;
     -- y_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_y_MUX_uxn_device_h_l50_c7_6a5a_cond;
     y_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_y_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     y_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_y_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l50_c7_6a5a_return_output := y_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_cond;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_return_output := result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- auto_advance_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_cond;
     auto_advance_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_iftrue;
     auto_advance_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_return_output := auto_advance_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_return_output := vram_addr_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_c96e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l114_c7_ad05] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l114_c7_ad05_cond <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_cond;
     result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iftrue;
     result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_return_output := result_vram_address_MUX_uxn_device_h_l114_c7_ad05_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_cond;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_return_output := result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- result_u8_value_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_cond;
     result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_return_output := result_u8_value_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_cond;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_return_output := result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_cond;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_return_output := result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_c96e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_ad05_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_y_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_cond;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output := result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- auto_advance_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_cond;
     auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_return_output := auto_advance_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- vram_addr_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_cond;
     vram_addr_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     vram_addr_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_return_output := vram_addr_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_cond;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_return_output := result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_cond;
     result_u8_value_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_iftrue;
     result_u8_value_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_return_output := result_u8_value_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output := result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_b522] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_cond;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_return_output := result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- y_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_y_MUX_uxn_device_h_l40_c2_8c29_cond;
     y_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_y_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     y_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_y_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l40_c2_8c29_return_output := y_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- result_vram_address_MUX[uxn_device_h_l106_c7_59c4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l106_c7_59c4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_cond;
     result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iftrue;
     result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_return_output := result_vram_address_MUX_uxn_device_h_l106_c7_59c4_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_b522_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_auto_advance_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l106_c7_59c4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_iffalse := VAR_vram_addr_MUX_uxn_device_h_l106_c7_59c4_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l40_c2_8c29_return_output;
     -- auto_advance_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_cond;
     auto_advance_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     auto_advance_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_return_output := auto_advance_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- vram_addr_MUX[uxn_device_h_l99_c7_62da] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l99_c7_62da_cond <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_cond;
     vram_addr_MUX_uxn_device_h_l99_c7_62da_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_iftrue;
     vram_addr_MUX_uxn_device_h_l99_c7_62da_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_return_output := vram_addr_MUX_uxn_device_h_l99_c7_62da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_7eff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_return_output;

     -- result_u8_value_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_cond;
     result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_return_output := result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_cond;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_return_output := result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_cond;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_return_output := result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- Submodule level 17
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7eff_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_62da_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iffalse := VAR_vram_addr_MUX_uxn_device_h_l99_c7_62da_return_output;
     -- result_vram_address_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_e980] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_cond;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_return_output := result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- vram_addr_MUX[uxn_device_h_l90_c7_f6bf] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l90_c7_f6bf_cond <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_cond;
     vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iftrue;
     vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_return_output := vram_addr_MUX_uxn_device_h_l90_c7_f6bf_return_output;

     -- Submodule level 18
     VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_e980_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_iffalse := VAR_vram_addr_MUX_uxn_device_h_l90_c7_f6bf_return_output;
     -- result_vram_address_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_cond;
     result_vram_address_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_iftrue;
     result_vram_address_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_return_output := result_vram_address_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- printf_uxn_device_h_l168_c5_8ed9[uxn_device_h_l168_c5_8ed9] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg0 <= VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg0;
     printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg1 <= VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg1;
     printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg2 <= VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg2;
     printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg3 <= VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg3;
     printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg4 <= VAR_printf_uxn_device_h_l168_c5_8ed9_uxn_device_h_l168_c5_8ed9_arg4;
     -- Outputs

     -- vram_addr_MUX[uxn_device_h_l83_c7_8617] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l83_c7_8617_cond <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_cond;
     vram_addr_MUX_uxn_device_h_l83_c7_8617_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_iftrue;
     vram_addr_MUX_uxn_device_h_l83_c7_8617_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_return_output := vram_addr_MUX_uxn_device_h_l83_c7_8617_return_output;

     -- Submodule level 19
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l83_c7_8617_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iffalse := VAR_vram_addr_MUX_uxn_device_h_l83_c7_8617_return_output;
     -- result_vram_address_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_cond;
     result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output := result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- vram_addr_MUX[uxn_device_h_l75_c7_5fa1] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l75_c7_5fa1_cond <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_cond;
     vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iftrue;
     vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_return_output := vram_addr_MUX_uxn_device_h_l75_c7_5fa1_return_output;

     -- Submodule level 20
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_iffalse := VAR_vram_addr_MUX_uxn_device_h_l75_c7_5fa1_return_output;
     -- vram_addr_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_cond;
     vram_addr_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     vram_addr_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_return_output := vram_addr_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l68_c7_f56a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l68_c7_f56a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_cond;
     result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iftrue;
     result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_return_output := result_vram_address_MUX_uxn_device_h_l68_c7_f56a_return_output;

     -- Submodule level 21
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l68_c7_f56a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_iffalse := VAR_vram_addr_MUX_uxn_device_h_l68_c7_f56a_return_output;
     -- vram_addr_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_cond;
     vram_addr_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_iftrue;
     vram_addr_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_return_output := vram_addr_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- result_vram_address_MUX[uxn_device_h_l57_c7_f587] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l57_c7_f587_cond <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_cond;
     result_vram_address_MUX_uxn_device_h_l57_c7_f587_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_iftrue;
     result_vram_address_MUX_uxn_device_h_l57_c7_f587_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_return_output := result_vram_address_MUX_uxn_device_h_l57_c7_f587_return_output;

     -- Submodule level 22
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l57_c7_f587_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iffalse := VAR_vram_addr_MUX_uxn_device_h_l57_c7_f587_return_output;
     -- vram_addr_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_cond;
     vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_return_output := vram_addr_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l50_c7_6a5a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_cond;
     result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iftrue;
     result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output := result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output;

     -- Submodule level 23
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_vram_addr_MUX_uxn_device_h_l50_c7_6a5a_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fd50[uxn_device_h_l40_c2_8c29] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fd50_uxn_device_h_l40_c2_8c29_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_fd50(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_6a5a_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_6a5a_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_6a5a_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_6a5a_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_6a5a_return_output);

     -- vram_addr_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_cond;
     vram_addr_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     vram_addr_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_return_output := vram_addr_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l40_c2_8c29_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fd50_uxn_device_h_l40_c2_8c29_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l40_c2_8c29_return_output;
     -- result_MUX[uxn_device_h_l40_c2_8c29] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l40_c2_8c29_cond <= VAR_result_MUX_uxn_device_h_l40_c2_8c29_cond;
     result_MUX_uxn_device_h_l40_c2_8c29_iftrue <= VAR_result_MUX_uxn_device_h_l40_c2_8c29_iftrue;
     result_MUX_uxn_device_h_l40_c2_8c29_iffalse <= VAR_result_MUX_uxn_device_h_l40_c2_8c29_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l40_c2_8c29_return_output := result_MUX_uxn_device_h_l40_c2_8c29_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l40_c2_8c29_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l40_c2_8c29_return_output;
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
