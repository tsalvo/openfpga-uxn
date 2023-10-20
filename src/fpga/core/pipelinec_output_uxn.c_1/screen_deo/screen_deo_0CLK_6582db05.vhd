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
-- -- use ieee.float_pkg.all;
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
-- BIN_OP_EQ[uxn_device_h_l40_c6_a37e]
signal BIN_OP_EQ_uxn_device_h_l40_c6_a37e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_a37e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_0ed6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l40_c2_3aa0]
signal auto_advance_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l40_c2_3aa0]
signal color_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l40_c2_3aa0]
signal sprite_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l40_c2_3aa0]
signal result_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l40_c2_3aa0_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l40_c2_3aa0_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l40_c2_3aa0_return_output : device_out_result_t;

-- is_fill_mode_MUX[uxn_device_h_l40_c2_3aa0]
signal is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l40_c2_3aa0]
signal layer_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l40_c2_3aa0]
signal x_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l40_c2_3aa0]
signal vram_addr_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(31 downto 0);

-- pixel_MUX[uxn_device_h_l40_c2_3aa0]
signal pixel_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l40_c2_3aa0]
signal y_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c7_a887]
signal BIN_OP_EQ_uxn_device_h_l42_c7_a887_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_a887_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l42_c3_9abf]
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_9abf]
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l42_c3_9abf]
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l50_c11_7099]
signal BIN_OP_EQ_uxn_device_h_l50_c11_7099_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_7099_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_b0a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l50_c7_0ed6]
signal auto_advance_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l50_c7_0ed6]
signal color_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l50_c7_0ed6]
signal sprite_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l50_c7_0ed6]
signal result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l50_c7_0ed6]
signal result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l50_c7_0ed6]
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l50_c7_0ed6]
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l50_c7_0ed6]
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l50_c7_0ed6]
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l50_c7_0ed6]
signal is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l50_c7_0ed6]
signal layer_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l50_c7_0ed6]
signal x_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l50_c7_0ed6]
signal vram_addr_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(31 downto 0);

-- pixel_MUX[uxn_device_h_l50_c7_0ed6]
signal pixel_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l50_c7_0ed6]
signal y_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l51_c7_9ce4]
signal BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l51_c3_526c]
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l51_c3_526c]
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c11_9363]
signal BIN_OP_EQ_uxn_device_h_l57_c11_9363_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_9363_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_a0a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l57_c7_b0a5]
signal auto_advance_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l57_c7_b0a5]
signal color_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l57_c7_b0a5]
signal sprite_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l57_c7_b0a5]
signal result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l57_c7_b0a5]
signal result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l57_c7_b0a5]
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l57_c7_b0a5]
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l57_c7_b0a5]
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l57_c7_b0a5]
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l57_c7_b0a5]
signal is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l57_c7_b0a5]
signal layer_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l57_c7_b0a5]
signal x_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l57_c7_b0a5]
signal vram_addr_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(31 downto 0);

-- pixel_MUX[uxn_device_h_l57_c7_b0a5]
signal pixel_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l57_c7_b0a5]
signal y_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l58_c7_824a]
signal BIN_OP_EQ_uxn_device_h_l58_c7_824a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_824a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l58_c3_ccae]
signal color_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l58_c3_ccae]
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l58_c3_ccae]
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l58_c3_ccae]
signal is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l58_c3_ccae]
signal layer_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l58_c3_ccae]
signal pixel_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l61_c20_0e5c]
signal BIN_OP_AND_uxn_device_h_l61_c20_0e5c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_0e5c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_0e5c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l61_c20_f796]
signal BIN_OP_EQ_uxn_device_h_l61_c20_f796_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_f796_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_f796_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l61_c20_de47]
signal MUX_uxn_device_h_l61_c20_de47_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_de47_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_de47_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_de47_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l62_c13_f206]
signal BIN_OP_AND_uxn_device_h_l62_c13_f206_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_f206_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_f206_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l62_c13_40a1]
signal MUX_uxn_device_h_l62_c13_40a1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_40a1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_40a1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_40a1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l68_c11_114f]
signal BIN_OP_EQ_uxn_device_h_l68_c11_114f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_114f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_9b07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l68_c7_a0a7]
signal auto_advance_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l68_c7_a0a7]
signal sprite_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l68_c7_a0a7]
signal result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l68_c7_a0a7]
signal result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l68_c7_a0a7]
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l68_c7_a0a7]
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l68_c7_a0a7]
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l68_c7_a0a7]
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l68_c7_a0a7]
signal x_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l68_c7_a0a7]
signal vram_addr_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l68_c7_a0a7]
signal y_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c7_963b]
signal BIN_OP_EQ_uxn_device_h_l69_c7_963b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_963b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l69_c3_a6f2]
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l69_c3_a6f2]
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l75_c11_8b8b]
signal BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_b154]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l75_c7_9b07]
signal auto_advance_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l75_c7_9b07]
signal sprite_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l75_c7_9b07]
signal result_u8_value_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l75_c7_9b07]
signal result_vram_address_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l75_c7_9b07]
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l75_c7_9b07]
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l75_c7_9b07]
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l75_c7_9b07]
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l75_c7_9b07]
signal x_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l75_c7_9b07]
signal vram_addr_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l75_c7_9b07]
signal y_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l76_c7_43d5]
signal BIN_OP_EQ_uxn_device_h_l76_c7_43d5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_43d5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l76_c3_2ea7]
signal sprite_MUX_uxn_device_h_l76_c3_2ea7_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_2ea7_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_2ea7_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_2ea7_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l76_c3_2ea7]
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l76_c3_2ea7]
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l83_c11_256e]
signal BIN_OP_EQ_uxn_device_h_l83_c11_256e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_256e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_a6bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l83_c7_b154]
signal auto_advance_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l83_c7_b154]
signal result_u8_value_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l83_c7_b154]
signal result_vram_address_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l83_c7_b154]
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l83_c7_b154]
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l83_c7_b154]
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l83_c7_b154]
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l83_c7_b154]
signal x_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l83_c7_b154]
signal vram_addr_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l83_c7_b154]
signal y_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l84_c7_0fed]
signal BIN_OP_EQ_uxn_device_h_l84_c7_0fed_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_0fed_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l84_c3_73e6]
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l84_c3_73e6]
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_0967]
signal BIN_OP_EQ_uxn_device_h_l90_c11_0967_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_0967_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_d4d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_a6bb]
signal auto_advance_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l90_c7_a6bb]
signal result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_a6bb]
signal result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l90_c7_a6bb]
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_a6bb]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_a6bb]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_a6bb]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c7_a6bb]
signal x_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l90_c7_a6bb]
signal vram_addr_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l90_c7_a6bb]
signal y_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_5d38]
signal BIN_OP_EQ_uxn_device_h_l91_c7_5d38_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_5d38_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_f882]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_f882]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l91_c3_f882]
signal x_MUX_uxn_device_h_l91_c3_f882_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l91_c3_f882_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_f882_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_f882_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_935f]
signal BIN_OP_EQ_uxn_device_h_l99_c11_935f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_935f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_87e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_d4d6]
signal auto_advance_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l99_c7_d4d6]
signal result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_d4d6]
signal result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l99_c7_d4d6]
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_d4d6]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_d4d6]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_d4d6]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l99_c7_d4d6]
signal x_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l99_c7_d4d6]
signal vram_addr_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l99_c7_d4d6]
signal y_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_3021]
signal BIN_OP_EQ_uxn_device_h_l100_c7_3021_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_3021_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_7e24]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_7e24]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l106_c11_6d3a]
signal BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_a81f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l106_c7_87e4]
signal auto_advance_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l106_c7_87e4]
signal result_u8_value_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l106_c7_87e4]
signal result_vram_address_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l106_c7_87e4]
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l106_c7_87e4]
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l106_c7_87e4]
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l106_c7_87e4]
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l106_c7_87e4]
signal x_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l106_c7_87e4]
signal vram_addr_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l106_c7_87e4]
signal y_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c7_329b]
signal BIN_OP_EQ_uxn_device_h_l107_c7_329b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_329b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c3_b43e]
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c3_b43e]
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l107_c3_b43e]
signal x_MUX_uxn_device_h_l107_c3_b43e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c3_b43e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_b43e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_b43e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l108_c4_a4ef]
signal BIN_OP_OR_uxn_device_h_l108_c4_a4ef_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_a4ef_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_a4ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_f6d0]
signal BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_deeb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_a81f]
signal auto_advance_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l114_c7_a81f]
signal result_u8_value_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l114_c7_a81f]
signal result_vram_address_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l114_c7_a81f]
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l114_c7_a81f]
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l114_c7_a81f]
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l114_c7_a81f]
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_a81f]
signal vram_addr_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l114_c7_a81f]
signal y_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l115_c7_2d8f]
signal BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_0082]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l115_c3_0082]
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l121_c11_8bcb]
signal BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_4f25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l121_c7_deeb]
signal auto_advance_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l121_c7_deeb]
signal result_u8_value_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l121_c7_deeb]
signal result_vram_address_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l121_c7_deeb]
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l121_c7_deeb]
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l121_c7_deeb]
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l121_c7_deeb]
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l121_c7_deeb]
signal vram_addr_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l121_c7_deeb]
signal y_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l122_c7_e19f]
signal BIN_OP_EQ_uxn_device_h_l122_c7_e19f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_e19f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l122_c3_2986]
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l122_c3_2986]
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l122_c3_2986]
signal y_MUX_uxn_device_h_l122_c3_2986_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l122_c3_2986_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_2986_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_2986_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_bbe2]
signal BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_55dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l130_c7_4f25]
signal auto_advance_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l130_c7_4f25]
signal result_u8_value_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l130_c7_4f25]
signal result_vram_address_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l130_c7_4f25]
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l130_c7_4f25]
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l130_c7_4f25]
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l130_c7_4f25]
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l130_c7_4f25]
signal vram_addr_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l130_c7_4f25]
signal y_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c7_8616]
signal BIN_OP_EQ_uxn_device_h_l131_c7_8616_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_8616_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l131_c3_b543]
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l131_c3_b543]
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_8951]
signal BIN_OP_EQ_uxn_device_h_l137_c11_8951_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_8951_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_8499]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l137_c7_55dd]
signal auto_advance_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l137_c7_55dd]
signal result_u8_value_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l137_c7_55dd]
signal result_vram_address_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l137_c7_55dd]
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l137_c7_55dd]
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l137_c7_55dd]
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l137_c7_55dd]
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l137_c7_55dd]
signal vram_addr_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l137_c7_55dd]
signal y_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c7_b6ee]
signal BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l138_c3_528c]
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l138_c3_528c]
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l138_c3_528c]
signal y_MUX_uxn_device_h_l138_c3_528c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c3_528c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_528c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_528c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l139_c4_91e2]
signal BIN_OP_OR_uxn_device_h_l139_c4_91e2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_91e2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_91e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_6a4a]
signal BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_4d34]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_8499]
signal auto_advance_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l145_c7_8499]
signal result_u8_value_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l145_c7_8499]
signal result_vram_address_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l145_c7_8499]
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l145_c7_8499]
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l145_c7_8499]
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l145_c7_8499]
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_8499]
signal vram_addr_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l146_c7_8cac]
signal BIN_OP_EQ_uxn_device_h_l146_c7_8cac_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_8cac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l146_c3_e25e]
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l146_c3_e25e]
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_ccb0]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c27_cc97]
signal BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l147_c27_d640]
signal BIN_OP_GT_uxn_device_h_l147_c27_d640_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_d640_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_d640_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l147_c27_c394]
signal MUX_uxn_device_h_l147_c27_c394_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_c394_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_c394_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_c394_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l153_c11_938a]
signal BIN_OP_EQ_uxn_device_h_l153_c11_938a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_938a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_ab24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l153_c7_4d34]
signal auto_advance_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l153_c7_4d34]
signal result_u8_value_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l153_c7_4d34]
signal result_vram_address_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l153_c7_4d34]
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l153_c7_4d34]
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l153_c7_4d34]
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l153_c7_4d34]
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l153_c7_4d34]
signal vram_addr_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l154_c7_fe18]
signal BIN_OP_EQ_uxn_device_h_l154_c7_fe18_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_fe18_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_9d42]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l154_c3_5c5c]
signal auto_advance_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l154_c3_5c5c]
signal result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l154_c3_5c5c]
signal result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l154_c3_5c5c]
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l154_c3_5c5c]
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l154_c3_5c5c]
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l154_c3_5c5c]
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l154_c3_5c5c]
signal vram_addr_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(31 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_0023]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c4_bd80]
signal result_vram_address_MUX_uxn_device_h_l160_c4_bd80_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_bd80_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c4_bd80]
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l160_c4_bd80]
signal vram_addr_MUX_uxn_device_h_l160_c4_bd80_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_bd80_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_bd80_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_bd80_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_b012]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l161_c18_dbe6]
signal BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l162_c5_173e]
signal BIN_OP_AND_uxn_device_h_l162_c5_173e_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_173e_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_173e_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l163_c21_e09c]
signal BIN_OP_AND_uxn_device_h_l163_c21_e09c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_e09c_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_e09c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l163_c21_0f90]
signal BIN_OP_GT_uxn_device_h_l163_c21_0f90_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_0f90_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_0f90_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l163_c21_5686]
signal MUX_uxn_device_h_l163_c21_5686_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l163_c21_5686_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_5686_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_5686_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l163_c5_b38d]
signal BIN_OP_OR_uxn_device_h_l163_c5_b38d_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_b38d_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_b38d_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l164_c21_e1b3]
signal BIN_OP_AND_uxn_device_h_l164_c21_e1b3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_e1b3_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_e1b3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l164_c21_351e]
signal BIN_OP_GT_uxn_device_h_l164_c21_351e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_351e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_351e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l164_c21_1032]
signal MUX_uxn_device_h_l164_c21_1032_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l164_c21_1032_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_1032_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_1032_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l164_c5_55e2]
signal BIN_OP_OR_uxn_device_h_l164_c5_55e2_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_55e2_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_55e2_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l165_c5_448c]
signal BIN_OP_OR_uxn_device_h_l165_c5_448c_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_448c_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output : unsigned(31 downto 0);

-- printf_uxn_device_h_l168_c5_48c3[uxn_device_h_l168_c5_48c3]
signal printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg2 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg3 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg4 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_57a6]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l171_c28_25cd]
signal BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l178_c11_5c6d]
signal BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l178_c7_5c7c]
signal result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l178_c7_5c7c]
signal result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l178_c7_5c7c]
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l178_c7_5c7c]
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l179_c7_8b58]
signal BIN_OP_EQ_uxn_device_h_l179_c7_8b58_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_8b58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l179_c3_0e18]
signal result_u8_value_MUX_uxn_device_h_l179_c3_0e18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_0e18_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l179_c3_0e18]
signal result_vram_address_MUX_uxn_device_h_l179_c3_0e18_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_0e18_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l179_c3_0e18]
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_55f9( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_1;
      base.vram_address := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_vram_write := ref_toks_4;
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

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l40_c6_a37e
BIN_OP_EQ_uxn_device_h_l40_c6_a37e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l40_c6_a37e_left,
BIN_OP_EQ_uxn_device_h_l40_c6_a37e_right,
BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- auto_advance_MUX_uxn_device_h_l40_c2_3aa0
auto_advance_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l40_c2_3aa0_cond,
auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
auto_advance_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- color_MUX_uxn_device_h_l40_c2_3aa0
color_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l40_c2_3aa0_cond,
color_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
color_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
color_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- sprite_MUX_uxn_device_h_l40_c2_3aa0
sprite_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l40_c2_3aa0_cond,
sprite_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
sprite_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
sprite_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- result_MUX_uxn_device_h_l40_c2_3aa0
result_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l40_c2_3aa0_cond,
result_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
result_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
result_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0
is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_cond,
is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- layer_MUX_uxn_device_h_l40_c2_3aa0
layer_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l40_c2_3aa0_cond,
layer_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
layer_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
layer_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- x_MUX_uxn_device_h_l40_c2_3aa0
x_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l40_c2_3aa0_cond,
x_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
x_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
x_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- vram_addr_MUX_uxn_device_h_l40_c2_3aa0
vram_addr_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l40_c2_3aa0_cond,
vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
vram_addr_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- pixel_MUX_uxn_device_h_l40_c2_3aa0
pixel_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l40_c2_3aa0_cond,
pixel_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
pixel_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
pixel_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- y_MUX_uxn_device_h_l40_c2_3aa0
y_MUX_uxn_device_h_l40_c2_3aa0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l40_c2_3aa0_cond,
y_MUX_uxn_device_h_l40_c2_3aa0_iftrue,
y_MUX_uxn_device_h_l40_c2_3aa0_iffalse,
y_MUX_uxn_device_h_l40_c2_3aa0_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c7_a887
BIN_OP_EQ_uxn_device_h_l42_c7_a887 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c7_a887_left,
BIN_OP_EQ_uxn_device_h_l42_c7_a887_right,
BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf
result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_cond,
result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_cond,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf
result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_cond,
result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_return_output);

-- BIN_OP_EQ_uxn_device_h_l50_c11_7099
BIN_OP_EQ_uxn_device_h_l50_c11_7099 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l50_c11_7099_left,
BIN_OP_EQ_uxn_device_h_l50_c11_7099_right,
BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- auto_advance_MUX_uxn_device_h_l50_c7_0ed6
auto_advance_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l50_c7_0ed6_cond,
auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
auto_advance_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- color_MUX_uxn_device_h_l50_c7_0ed6
color_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l50_c7_0ed6_cond,
color_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
color_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
color_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- sprite_MUX_uxn_device_h_l50_c7_0ed6
sprite_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l50_c7_0ed6_cond,
sprite_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
sprite_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
sprite_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- result_u8_value_MUX_uxn_device_h_l50_c7_0ed6
result_u8_value_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_cond,
result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- result_vram_address_MUX_uxn_device_h_l50_c7_0ed6
result_vram_address_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_cond,
result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6
result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_cond,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6
result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_cond,
result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6
result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_cond,
result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6
result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_cond,
result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6
is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_cond,
is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- layer_MUX_uxn_device_h_l50_c7_0ed6
layer_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l50_c7_0ed6_cond,
layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
layer_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- x_MUX_uxn_device_h_l50_c7_0ed6
x_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l50_c7_0ed6_cond,
x_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
x_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
x_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- vram_addr_MUX_uxn_device_h_l50_c7_0ed6
vram_addr_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l50_c7_0ed6_cond,
vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
vram_addr_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- pixel_MUX_uxn_device_h_l50_c7_0ed6
pixel_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l50_c7_0ed6_cond,
pixel_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
pixel_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
pixel_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- y_MUX_uxn_device_h_l50_c7_0ed6
y_MUX_uxn_device_h_l50_c7_0ed6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l50_c7_0ed6_cond,
y_MUX_uxn_device_h_l50_c7_0ed6_iftrue,
y_MUX_uxn_device_h_l50_c7_0ed6_iffalse,
y_MUX_uxn_device_h_l50_c7_0ed6_return_output);

-- BIN_OP_EQ_uxn_device_h_l51_c7_9ce4
BIN_OP_EQ_uxn_device_h_l51_c7_9ce4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_left,
BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_right,
BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l51_c3_526c
result_device_ram_address_MUX_uxn_device_h_l51_c3_526c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_cond,
result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l51_c3_526c
result_is_deo_done_MUX_uxn_device_h_l51_c3_526c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_cond,
result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c11_9363
BIN_OP_EQ_uxn_device_h_l57_c11_9363 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c11_9363_left,
BIN_OP_EQ_uxn_device_h_l57_c11_9363_right,
BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- auto_advance_MUX_uxn_device_h_l57_c7_b0a5
auto_advance_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l57_c7_b0a5_cond,
auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
auto_advance_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- color_MUX_uxn_device_h_l57_c7_b0a5
color_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l57_c7_b0a5_cond,
color_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
color_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
color_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- sprite_MUX_uxn_device_h_l57_c7_b0a5
sprite_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l57_c7_b0a5_cond,
sprite_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
sprite_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
sprite_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- result_u8_value_MUX_uxn_device_h_l57_c7_b0a5
result_u8_value_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_cond,
result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- result_vram_address_MUX_uxn_device_h_l57_c7_b0a5
result_vram_address_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_cond,
result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5
result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_cond,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5
result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_cond,
result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5
result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_cond,
result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5
result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_cond,
result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5
is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_cond,
is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- layer_MUX_uxn_device_h_l57_c7_b0a5
layer_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l57_c7_b0a5_cond,
layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
layer_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- x_MUX_uxn_device_h_l57_c7_b0a5
x_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l57_c7_b0a5_cond,
x_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
x_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
x_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- vram_addr_MUX_uxn_device_h_l57_c7_b0a5
vram_addr_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l57_c7_b0a5_cond,
vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
vram_addr_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- pixel_MUX_uxn_device_h_l57_c7_b0a5
pixel_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l57_c7_b0a5_cond,
pixel_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
pixel_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
pixel_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- y_MUX_uxn_device_h_l57_c7_b0a5
y_MUX_uxn_device_h_l57_c7_b0a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l57_c7_b0a5_cond,
y_MUX_uxn_device_h_l57_c7_b0a5_iftrue,
y_MUX_uxn_device_h_l57_c7_b0a5_iffalse,
y_MUX_uxn_device_h_l57_c7_b0a5_return_output);

-- BIN_OP_EQ_uxn_device_h_l58_c7_824a
BIN_OP_EQ_uxn_device_h_l58_c7_824a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l58_c7_824a_left,
BIN_OP_EQ_uxn_device_h_l58_c7_824a_right,
BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output);

-- color_MUX_uxn_device_h_l58_c3_ccae
color_MUX_uxn_device_h_l58_c3_ccae : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l58_c3_ccae_cond,
color_MUX_uxn_device_h_l58_c3_ccae_iftrue,
color_MUX_uxn_device_h_l58_c3_ccae_iffalse,
color_MUX_uxn_device_h_l58_c3_ccae_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae
result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_cond,
result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iftrue,
result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iffalse,
result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae
result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_cond,
result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iftrue,
result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iffalse,
result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_return_output);

-- is_fill_mode_MUX_uxn_device_h_l58_c3_ccae
is_fill_mode_MUX_uxn_device_h_l58_c3_ccae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_cond,
is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iftrue,
is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iffalse,
is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_return_output);

-- layer_MUX_uxn_device_h_l58_c3_ccae
layer_MUX_uxn_device_h_l58_c3_ccae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l58_c3_ccae_cond,
layer_MUX_uxn_device_h_l58_c3_ccae_iftrue,
layer_MUX_uxn_device_h_l58_c3_ccae_iffalse,
layer_MUX_uxn_device_h_l58_c3_ccae_return_output);

-- pixel_MUX_uxn_device_h_l58_c3_ccae
pixel_MUX_uxn_device_h_l58_c3_ccae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l58_c3_ccae_cond,
pixel_MUX_uxn_device_h_l58_c3_ccae_iftrue,
pixel_MUX_uxn_device_h_l58_c3_ccae_iffalse,
pixel_MUX_uxn_device_h_l58_c3_ccae_return_output);

-- BIN_OP_AND_uxn_device_h_l61_c20_0e5c
BIN_OP_AND_uxn_device_h_l61_c20_0e5c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l61_c20_0e5c_left,
BIN_OP_AND_uxn_device_h_l61_c20_0e5c_right,
BIN_OP_AND_uxn_device_h_l61_c20_0e5c_return_output);

-- BIN_OP_EQ_uxn_device_h_l61_c20_f796
BIN_OP_EQ_uxn_device_h_l61_c20_f796 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l61_c20_f796_left,
BIN_OP_EQ_uxn_device_h_l61_c20_f796_right,
BIN_OP_EQ_uxn_device_h_l61_c20_f796_return_output);

-- MUX_uxn_device_h_l61_c20_de47
MUX_uxn_device_h_l61_c20_de47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l61_c20_de47_cond,
MUX_uxn_device_h_l61_c20_de47_iftrue,
MUX_uxn_device_h_l61_c20_de47_iffalse,
MUX_uxn_device_h_l61_c20_de47_return_output);

-- BIN_OP_AND_uxn_device_h_l62_c13_f206
BIN_OP_AND_uxn_device_h_l62_c13_f206 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l62_c13_f206_left,
BIN_OP_AND_uxn_device_h_l62_c13_f206_right,
BIN_OP_AND_uxn_device_h_l62_c13_f206_return_output);

-- MUX_uxn_device_h_l62_c13_40a1
MUX_uxn_device_h_l62_c13_40a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l62_c13_40a1_cond,
MUX_uxn_device_h_l62_c13_40a1_iftrue,
MUX_uxn_device_h_l62_c13_40a1_iffalse,
MUX_uxn_device_h_l62_c13_40a1_return_output);

-- BIN_OP_EQ_uxn_device_h_l68_c11_114f
BIN_OP_EQ_uxn_device_h_l68_c11_114f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l68_c11_114f_left,
BIN_OP_EQ_uxn_device_h_l68_c11_114f_right,
BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- auto_advance_MUX_uxn_device_h_l68_c7_a0a7
auto_advance_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l68_c7_a0a7_cond,
auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
auto_advance_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- sprite_MUX_uxn_device_h_l68_c7_a0a7
sprite_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l68_c7_a0a7_cond,
sprite_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
sprite_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
sprite_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- result_u8_value_MUX_uxn_device_h_l68_c7_a0a7
result_u8_value_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_cond,
result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- result_vram_address_MUX_uxn_device_h_l68_c7_a0a7
result_vram_address_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_cond,
result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7
result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_cond,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7
result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_cond,
result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7
result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_cond,
result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7
result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_cond,
result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- x_MUX_uxn_device_h_l68_c7_a0a7
x_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l68_c7_a0a7_cond,
x_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
x_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
x_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- vram_addr_MUX_uxn_device_h_l68_c7_a0a7
vram_addr_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l68_c7_a0a7_cond,
vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
vram_addr_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- y_MUX_uxn_device_h_l68_c7_a0a7
y_MUX_uxn_device_h_l68_c7_a0a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l68_c7_a0a7_cond,
y_MUX_uxn_device_h_l68_c7_a0a7_iftrue,
y_MUX_uxn_device_h_l68_c7_a0a7_iffalse,
y_MUX_uxn_device_h_l68_c7_a0a7_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c7_963b
BIN_OP_EQ_uxn_device_h_l69_c7_963b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c7_963b_left,
BIN_OP_EQ_uxn_device_h_l69_c7_963b_right,
BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2
result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_cond,
result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2
result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_cond,
result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c11_8b8b
BIN_OP_EQ_uxn_device_h_l75_c11_8b8b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_left,
BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_right,
BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_return_output);

-- auto_advance_MUX_uxn_device_h_l75_c7_9b07
auto_advance_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l75_c7_9b07_cond,
auto_advance_MUX_uxn_device_h_l75_c7_9b07_iftrue,
auto_advance_MUX_uxn_device_h_l75_c7_9b07_iffalse,
auto_advance_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- sprite_MUX_uxn_device_h_l75_c7_9b07
sprite_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l75_c7_9b07_cond,
sprite_MUX_uxn_device_h_l75_c7_9b07_iftrue,
sprite_MUX_uxn_device_h_l75_c7_9b07_iffalse,
sprite_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- result_u8_value_MUX_uxn_device_h_l75_c7_9b07
result_u8_value_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l75_c7_9b07_cond,
result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iftrue,
result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iffalse,
result_u8_value_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- result_vram_address_MUX_uxn_device_h_l75_c7_9b07
result_vram_address_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l75_c7_9b07_cond,
result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue,
result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse,
result_vram_address_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_cond,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07
result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_cond,
result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iftrue,
result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iffalse,
result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07
result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_cond,
result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue,
result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse,
result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07
result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_cond,
result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iftrue,
result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iffalse,
result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- x_MUX_uxn_device_h_l75_c7_9b07
x_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c7_9b07_cond,
x_MUX_uxn_device_h_l75_c7_9b07_iftrue,
x_MUX_uxn_device_h_l75_c7_9b07_iffalse,
x_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- vram_addr_MUX_uxn_device_h_l75_c7_9b07
vram_addr_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l75_c7_9b07_cond,
vram_addr_MUX_uxn_device_h_l75_c7_9b07_iftrue,
vram_addr_MUX_uxn_device_h_l75_c7_9b07_iffalse,
vram_addr_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- y_MUX_uxn_device_h_l75_c7_9b07
y_MUX_uxn_device_h_l75_c7_9b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c7_9b07_cond,
y_MUX_uxn_device_h_l75_c7_9b07_iftrue,
y_MUX_uxn_device_h_l75_c7_9b07_iffalse,
y_MUX_uxn_device_h_l75_c7_9b07_return_output);

-- BIN_OP_EQ_uxn_device_h_l76_c7_43d5
BIN_OP_EQ_uxn_device_h_l76_c7_43d5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l76_c7_43d5_left,
BIN_OP_EQ_uxn_device_h_l76_c7_43d5_right,
BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output);

-- sprite_MUX_uxn_device_h_l76_c3_2ea7
sprite_MUX_uxn_device_h_l76_c3_2ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l76_c3_2ea7_cond,
sprite_MUX_uxn_device_h_l76_c3_2ea7_iftrue,
sprite_MUX_uxn_device_h_l76_c3_2ea7_iffalse,
sprite_MUX_uxn_device_h_l76_c3_2ea7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7
result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_cond,
result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7
result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_cond,
result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_return_output);

-- BIN_OP_EQ_uxn_device_h_l83_c11_256e
BIN_OP_EQ_uxn_device_h_l83_c11_256e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l83_c11_256e_left,
BIN_OP_EQ_uxn_device_h_l83_c11_256e_right,
BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- auto_advance_MUX_uxn_device_h_l83_c7_b154
auto_advance_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l83_c7_b154_cond,
auto_advance_MUX_uxn_device_h_l83_c7_b154_iftrue,
auto_advance_MUX_uxn_device_h_l83_c7_b154_iffalse,
auto_advance_MUX_uxn_device_h_l83_c7_b154_return_output);

-- result_u8_value_MUX_uxn_device_h_l83_c7_b154
result_u8_value_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l83_c7_b154_cond,
result_u8_value_MUX_uxn_device_h_l83_c7_b154_iftrue,
result_u8_value_MUX_uxn_device_h_l83_c7_b154_iffalse,
result_u8_value_MUX_uxn_device_h_l83_c7_b154_return_output);

-- result_vram_address_MUX_uxn_device_h_l83_c7_b154
result_vram_address_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l83_c7_b154_cond,
result_vram_address_MUX_uxn_device_h_l83_c7_b154_iftrue,
result_vram_address_MUX_uxn_device_h_l83_c7_b154_iffalse,
result_vram_address_MUX_uxn_device_h_l83_c7_b154_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154
result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_cond,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l83_c7_b154
result_is_vram_write_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_cond,
result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iftrue,
result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iffalse,
result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l83_c7_b154
result_device_ram_address_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_cond,
result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iftrue,
result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iffalse,
result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l83_c7_b154
result_is_deo_done_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_cond,
result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iftrue,
result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iffalse,
result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_return_output);

-- x_MUX_uxn_device_h_l83_c7_b154
x_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l83_c7_b154_cond,
x_MUX_uxn_device_h_l83_c7_b154_iftrue,
x_MUX_uxn_device_h_l83_c7_b154_iffalse,
x_MUX_uxn_device_h_l83_c7_b154_return_output);

-- vram_addr_MUX_uxn_device_h_l83_c7_b154
vram_addr_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l83_c7_b154_cond,
vram_addr_MUX_uxn_device_h_l83_c7_b154_iftrue,
vram_addr_MUX_uxn_device_h_l83_c7_b154_iffalse,
vram_addr_MUX_uxn_device_h_l83_c7_b154_return_output);

-- y_MUX_uxn_device_h_l83_c7_b154
y_MUX_uxn_device_h_l83_c7_b154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l83_c7_b154_cond,
y_MUX_uxn_device_h_l83_c7_b154_iftrue,
y_MUX_uxn_device_h_l83_c7_b154_iffalse,
y_MUX_uxn_device_h_l83_c7_b154_return_output);

-- BIN_OP_EQ_uxn_device_h_l84_c7_0fed
BIN_OP_EQ_uxn_device_h_l84_c7_0fed : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l84_c7_0fed_left,
BIN_OP_EQ_uxn_device_h_l84_c7_0fed_right,
BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6
result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_cond,
result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6
result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_cond,
result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_0967
BIN_OP_EQ_uxn_device_h_l90_c11_0967 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_0967_left,
BIN_OP_EQ_uxn_device_h_l90_c11_0967_right,
BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_a6bb
auto_advance_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_a6bb_cond,
auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- result_u8_value_MUX_uxn_device_h_l90_c7_a6bb
result_u8_value_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_cond,
result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_a6bb
result_vram_address_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb
result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_cond,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb
result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb
result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb
result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- x_MUX_uxn_device_h_l90_c7_a6bb
x_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_a6bb_cond,
x_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
x_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
x_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- vram_addr_MUX_uxn_device_h_l90_c7_a6bb
vram_addr_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l90_c7_a6bb_cond,
vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
vram_addr_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- y_MUX_uxn_device_h_l90_c7_a6bb
y_MUX_uxn_device_h_l90_c7_a6bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_a6bb_cond,
y_MUX_uxn_device_h_l90_c7_a6bb_iftrue,
y_MUX_uxn_device_h_l90_c7_a6bb_iffalse,
y_MUX_uxn_device_h_l90_c7_a6bb_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_5d38
BIN_OP_EQ_uxn_device_h_l91_c7_5d38 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_5d38_left,
BIN_OP_EQ_uxn_device_h_l91_c7_5d38_right,
BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_f882
result_device_ram_address_MUX_uxn_device_h_l91_c3_f882 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_f882
result_is_deo_done_MUX_uxn_device_h_l91_c3_f882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_return_output);

-- x_MUX_uxn_device_h_l91_c3_f882
x_MUX_uxn_device_h_l91_c3_f882 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l91_c3_f882_cond,
x_MUX_uxn_device_h_l91_c3_f882_iftrue,
x_MUX_uxn_device_h_l91_c3_f882_iffalse,
x_MUX_uxn_device_h_l91_c3_f882_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_935f
BIN_OP_EQ_uxn_device_h_l99_c11_935f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_935f_left,
BIN_OP_EQ_uxn_device_h_l99_c11_935f_right,
BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_d4d6
auto_advance_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_d4d6_cond,
auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- result_u8_value_MUX_uxn_device_h_l99_c7_d4d6
result_u8_value_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_cond,
result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_d4d6
result_vram_address_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6
result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_cond,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6
result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6
result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6
result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- x_MUX_uxn_device_h_l99_c7_d4d6
x_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_d4d6_cond,
x_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
x_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
x_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- vram_addr_MUX_uxn_device_h_l99_c7_d4d6
vram_addr_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l99_c7_d4d6_cond,
vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
vram_addr_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- y_MUX_uxn_device_h_l99_c7_d4d6
y_MUX_uxn_device_h_l99_c7_d4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_d4d6_cond,
y_MUX_uxn_device_h_l99_c7_d4d6_iftrue,
y_MUX_uxn_device_h_l99_c7_d4d6_iffalse,
y_MUX_uxn_device_h_l99_c7_d4d6_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_3021
BIN_OP_EQ_uxn_device_h_l100_c7_3021 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_3021_left,
BIN_OP_EQ_uxn_device_h_l100_c7_3021_right,
BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24
result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24
result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_return_output);

-- BIN_OP_EQ_uxn_device_h_l106_c11_6d3a
BIN_OP_EQ_uxn_device_h_l106_c11_6d3a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_left,
BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_right,
BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- auto_advance_MUX_uxn_device_h_l106_c7_87e4
auto_advance_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l106_c7_87e4_cond,
auto_advance_MUX_uxn_device_h_l106_c7_87e4_iftrue,
auto_advance_MUX_uxn_device_h_l106_c7_87e4_iffalse,
auto_advance_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- result_u8_value_MUX_uxn_device_h_l106_c7_87e4
result_u8_value_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l106_c7_87e4_cond,
result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iftrue,
result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iffalse,
result_u8_value_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- result_vram_address_MUX_uxn_device_h_l106_c7_87e4
result_vram_address_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l106_c7_87e4_cond,
result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue,
result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse,
result_vram_address_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4
result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_cond,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4
result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_cond,
result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4
result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_cond,
result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4
result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_cond,
result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- x_MUX_uxn_device_h_l106_c7_87e4
x_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l106_c7_87e4_cond,
x_MUX_uxn_device_h_l106_c7_87e4_iftrue,
x_MUX_uxn_device_h_l106_c7_87e4_iffalse,
x_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- vram_addr_MUX_uxn_device_h_l106_c7_87e4
vram_addr_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l106_c7_87e4_cond,
vram_addr_MUX_uxn_device_h_l106_c7_87e4_iftrue,
vram_addr_MUX_uxn_device_h_l106_c7_87e4_iffalse,
vram_addr_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- y_MUX_uxn_device_h_l106_c7_87e4
y_MUX_uxn_device_h_l106_c7_87e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l106_c7_87e4_cond,
y_MUX_uxn_device_h_l106_c7_87e4_iftrue,
y_MUX_uxn_device_h_l106_c7_87e4_iffalse,
y_MUX_uxn_device_h_l106_c7_87e4_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c7_329b
BIN_OP_EQ_uxn_device_h_l107_c7_329b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c7_329b_left,
BIN_OP_EQ_uxn_device_h_l107_c7_329b_right,
BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e
result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e
result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_return_output);

-- x_MUX_uxn_device_h_l107_c3_b43e
x_MUX_uxn_device_h_l107_c3_b43e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c3_b43e_cond,
x_MUX_uxn_device_h_l107_c3_b43e_iftrue,
x_MUX_uxn_device_h_l107_c3_b43e_iffalse,
x_MUX_uxn_device_h_l107_c3_b43e_return_output);

-- BIN_OP_OR_uxn_device_h_l108_c4_a4ef
BIN_OP_OR_uxn_device_h_l108_c4_a4ef : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l108_c4_a4ef_left,
BIN_OP_OR_uxn_device_h_l108_c4_a4ef_right,
BIN_OP_OR_uxn_device_h_l108_c4_a4ef_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_f6d0
BIN_OP_EQ_uxn_device_h_l114_c11_f6d0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_left,
BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_right,
BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_a81f
auto_advance_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_a81f_cond,
auto_advance_MUX_uxn_device_h_l114_c7_a81f_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_a81f_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- result_u8_value_MUX_uxn_device_h_l114_c7_a81f
result_u8_value_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l114_c7_a81f_cond,
result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iftrue,
result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iffalse,
result_u8_value_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- result_vram_address_MUX_uxn_device_h_l114_c7_a81f
result_vram_address_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l114_c7_a81f_cond,
result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue,
result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse,
result_vram_address_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_cond,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f
result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_cond,
result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f
result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_cond,
result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f
result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_cond,
result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_a81f
vram_addr_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_a81f_cond,
vram_addr_MUX_uxn_device_h_l114_c7_a81f_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_a81f_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- y_MUX_uxn_device_h_l114_c7_a81f
y_MUX_uxn_device_h_l114_c7_a81f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_a81f_cond,
y_MUX_uxn_device_h_l114_c7_a81f_iftrue,
y_MUX_uxn_device_h_l114_c7_a81f_iffalse,
y_MUX_uxn_device_h_l114_c7_a81f_return_output);

-- BIN_OP_EQ_uxn_device_h_l115_c7_2d8f
BIN_OP_EQ_uxn_device_h_l115_c7_2d8f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_left,
BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_right,
BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_0082
result_device_ram_address_MUX_uxn_device_h_l115_c3_0082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l115_c3_0082
result_is_deo_done_MUX_uxn_device_h_l115_c3_0082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_cond,
result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iftrue,
result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iffalse,
result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_return_output);

-- BIN_OP_EQ_uxn_device_h_l121_c11_8bcb
BIN_OP_EQ_uxn_device_h_l121_c11_8bcb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_left,
BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_right,
BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- auto_advance_MUX_uxn_device_h_l121_c7_deeb
auto_advance_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l121_c7_deeb_cond,
auto_advance_MUX_uxn_device_h_l121_c7_deeb_iftrue,
auto_advance_MUX_uxn_device_h_l121_c7_deeb_iffalse,
auto_advance_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- result_u8_value_MUX_uxn_device_h_l121_c7_deeb
result_u8_value_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l121_c7_deeb_cond,
result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iftrue,
result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iffalse,
result_u8_value_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- result_vram_address_MUX_uxn_device_h_l121_c7_deeb
result_vram_address_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l121_c7_deeb_cond,
result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue,
result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse,
result_vram_address_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb
result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_cond,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb
result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_cond,
result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb
result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_cond,
result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb
result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_cond,
result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- vram_addr_MUX_uxn_device_h_l121_c7_deeb
vram_addr_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l121_c7_deeb_cond,
vram_addr_MUX_uxn_device_h_l121_c7_deeb_iftrue,
vram_addr_MUX_uxn_device_h_l121_c7_deeb_iffalse,
vram_addr_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- y_MUX_uxn_device_h_l121_c7_deeb
y_MUX_uxn_device_h_l121_c7_deeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l121_c7_deeb_cond,
y_MUX_uxn_device_h_l121_c7_deeb_iftrue,
y_MUX_uxn_device_h_l121_c7_deeb_iffalse,
y_MUX_uxn_device_h_l121_c7_deeb_return_output);

-- BIN_OP_EQ_uxn_device_h_l122_c7_e19f
BIN_OP_EQ_uxn_device_h_l122_c7_e19f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l122_c7_e19f_left,
BIN_OP_EQ_uxn_device_h_l122_c7_e19f_right,
BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l122_c3_2986
result_device_ram_address_MUX_uxn_device_h_l122_c3_2986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_cond,
result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iftrue,
result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iffalse,
result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l122_c3_2986
result_is_deo_done_MUX_uxn_device_h_l122_c3_2986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_cond,
result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iftrue,
result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iffalse,
result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_return_output);

-- y_MUX_uxn_device_h_l122_c3_2986
y_MUX_uxn_device_h_l122_c3_2986 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l122_c3_2986_cond,
y_MUX_uxn_device_h_l122_c3_2986_iftrue,
y_MUX_uxn_device_h_l122_c3_2986_iffalse,
y_MUX_uxn_device_h_l122_c3_2986_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c11_bbe2
BIN_OP_EQ_uxn_device_h_l130_c11_bbe2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_left,
BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_right,
BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- auto_advance_MUX_uxn_device_h_l130_c7_4f25
auto_advance_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l130_c7_4f25_cond,
auto_advance_MUX_uxn_device_h_l130_c7_4f25_iftrue,
auto_advance_MUX_uxn_device_h_l130_c7_4f25_iffalse,
auto_advance_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- result_u8_value_MUX_uxn_device_h_l130_c7_4f25
result_u8_value_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l130_c7_4f25_cond,
result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iftrue,
result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iffalse,
result_u8_value_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- result_vram_address_MUX_uxn_device_h_l130_c7_4f25
result_vram_address_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l130_c7_4f25_cond,
result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue,
result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse,
result_vram_address_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25
result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_cond,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25
result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_cond,
result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iftrue,
result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iffalse,
result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25
result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_cond,
result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue,
result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse,
result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25
result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_cond,
result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iftrue,
result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iffalse,
result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- vram_addr_MUX_uxn_device_h_l130_c7_4f25
vram_addr_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l130_c7_4f25_cond,
vram_addr_MUX_uxn_device_h_l130_c7_4f25_iftrue,
vram_addr_MUX_uxn_device_h_l130_c7_4f25_iffalse,
vram_addr_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- y_MUX_uxn_device_h_l130_c7_4f25
y_MUX_uxn_device_h_l130_c7_4f25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c7_4f25_cond,
y_MUX_uxn_device_h_l130_c7_4f25_iftrue,
y_MUX_uxn_device_h_l130_c7_4f25_iffalse,
y_MUX_uxn_device_h_l130_c7_4f25_return_output);

-- BIN_OP_EQ_uxn_device_h_l131_c7_8616
BIN_OP_EQ_uxn_device_h_l131_c7_8616 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c7_8616_left,
BIN_OP_EQ_uxn_device_h_l131_c7_8616_right,
BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l131_c3_b543
result_device_ram_address_MUX_uxn_device_h_l131_c3_b543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_cond,
result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iftrue,
result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iffalse,
result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l131_c3_b543
result_is_deo_done_MUX_uxn_device_h_l131_c3_b543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_cond,
result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iftrue,
result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iffalse,
result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_8951
BIN_OP_EQ_uxn_device_h_l137_c11_8951 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_8951_left,
BIN_OP_EQ_uxn_device_h_l137_c11_8951_right,
BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_return_output);

-- auto_advance_MUX_uxn_device_h_l137_c7_55dd
auto_advance_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l137_c7_55dd_cond,
auto_advance_MUX_uxn_device_h_l137_c7_55dd_iftrue,
auto_advance_MUX_uxn_device_h_l137_c7_55dd_iffalse,
auto_advance_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- result_u8_value_MUX_uxn_device_h_l137_c7_55dd
result_u8_value_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l137_c7_55dd_cond,
result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iftrue,
result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iffalse,
result_u8_value_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- result_vram_address_MUX_uxn_device_h_l137_c7_55dd
result_vram_address_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l137_c7_55dd_cond,
result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue,
result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse,
result_vram_address_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd
result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_cond,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd
result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_cond,
result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iftrue,
result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iffalse,
result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd
result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_cond,
result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd
result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_cond,
result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iftrue,
result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iffalse,
result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- vram_addr_MUX_uxn_device_h_l137_c7_55dd
vram_addr_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l137_c7_55dd_cond,
vram_addr_MUX_uxn_device_h_l137_c7_55dd_iftrue,
vram_addr_MUX_uxn_device_h_l137_c7_55dd_iffalse,
vram_addr_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- y_MUX_uxn_device_h_l137_c7_55dd
y_MUX_uxn_device_h_l137_c7_55dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c7_55dd_cond,
y_MUX_uxn_device_h_l137_c7_55dd_iftrue,
y_MUX_uxn_device_h_l137_c7_55dd_iffalse,
y_MUX_uxn_device_h_l137_c7_55dd_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c7_b6ee
BIN_OP_EQ_uxn_device_h_l138_c7_b6ee : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_left,
BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_right,
BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l138_c3_528c
result_device_ram_address_MUX_uxn_device_h_l138_c3_528c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_cond,
result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l138_c3_528c
result_is_deo_done_MUX_uxn_device_h_l138_c3_528c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_cond,
result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_return_output);

-- y_MUX_uxn_device_h_l138_c3_528c
y_MUX_uxn_device_h_l138_c3_528c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c3_528c_cond,
y_MUX_uxn_device_h_l138_c3_528c_iftrue,
y_MUX_uxn_device_h_l138_c3_528c_iffalse,
y_MUX_uxn_device_h_l138_c3_528c_return_output);

-- BIN_OP_OR_uxn_device_h_l139_c4_91e2
BIN_OP_OR_uxn_device_h_l139_c4_91e2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l139_c4_91e2_left,
BIN_OP_OR_uxn_device_h_l139_c4_91e2_right,
BIN_OP_OR_uxn_device_h_l139_c4_91e2_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_6a4a
BIN_OP_EQ_uxn_device_h_l145_c11_6a4a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_left,
BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_right,
BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_8499
auto_advance_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_8499_cond,
auto_advance_MUX_uxn_device_h_l145_c7_8499_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_8499_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_8499_return_output);

-- result_u8_value_MUX_uxn_device_h_l145_c7_8499
result_u8_value_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l145_c7_8499_cond,
result_u8_value_MUX_uxn_device_h_l145_c7_8499_iftrue,
result_u8_value_MUX_uxn_device_h_l145_c7_8499_iffalse,
result_u8_value_MUX_uxn_device_h_l145_c7_8499_return_output);

-- result_vram_address_MUX_uxn_device_h_l145_c7_8499
result_vram_address_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l145_c7_8499_cond,
result_vram_address_MUX_uxn_device_h_l145_c7_8499_iftrue,
result_vram_address_MUX_uxn_device_h_l145_c7_8499_iffalse,
result_vram_address_MUX_uxn_device_h_l145_c7_8499_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499
result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_cond,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l145_c7_8499
result_is_vram_write_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_cond,
result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iftrue,
result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iffalse,
result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l145_c7_8499
result_device_ram_address_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_cond,
result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iftrue,
result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iffalse,
result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l145_c7_8499
result_is_deo_done_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_cond,
result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iftrue,
result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iffalse,
result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_8499
vram_addr_MUX_uxn_device_h_l145_c7_8499 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_8499_cond,
vram_addr_MUX_uxn_device_h_l145_c7_8499_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_8499_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_8499_return_output);

-- BIN_OP_EQ_uxn_device_h_l146_c7_8cac
BIN_OP_EQ_uxn_device_h_l146_c7_8cac : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l146_c7_8cac_left,
BIN_OP_EQ_uxn_device_h_l146_c7_8cac_right,
BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e
result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_cond,
result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e
result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_cond,
result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c27_cc97
BIN_OP_PLUS_uxn_device_h_l147_c27_cc97 : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_left,
BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_right,
BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_return_output);

-- BIN_OP_GT_uxn_device_h_l147_c27_d640
BIN_OP_GT_uxn_device_h_l147_c27_d640 : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l147_c27_d640_left,
BIN_OP_GT_uxn_device_h_l147_c27_d640_right,
BIN_OP_GT_uxn_device_h_l147_c27_d640_return_output);

-- MUX_uxn_device_h_l147_c27_c394
MUX_uxn_device_h_l147_c27_c394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c27_c394_cond,
MUX_uxn_device_h_l147_c27_c394_iftrue,
MUX_uxn_device_h_l147_c27_c394_iffalse,
MUX_uxn_device_h_l147_c27_c394_return_output);

-- BIN_OP_EQ_uxn_device_h_l153_c11_938a
BIN_OP_EQ_uxn_device_h_l153_c11_938a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l153_c11_938a_left,
BIN_OP_EQ_uxn_device_h_l153_c11_938a_right,
BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_return_output);

-- auto_advance_MUX_uxn_device_h_l153_c7_4d34
auto_advance_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l153_c7_4d34_cond,
auto_advance_MUX_uxn_device_h_l153_c7_4d34_iftrue,
auto_advance_MUX_uxn_device_h_l153_c7_4d34_iffalse,
auto_advance_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- result_u8_value_MUX_uxn_device_h_l153_c7_4d34
result_u8_value_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l153_c7_4d34_cond,
result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iftrue,
result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iffalse,
result_u8_value_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- result_vram_address_MUX_uxn_device_h_l153_c7_4d34
result_vram_address_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l153_c7_4d34_cond,
result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue,
result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse,
result_vram_address_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34
result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_cond,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34
result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_cond,
result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iftrue,
result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iffalse,
result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34
result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_cond,
result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue,
result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse,
result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34
result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_cond,
result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iftrue,
result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iffalse,
result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- vram_addr_MUX_uxn_device_h_l153_c7_4d34
vram_addr_MUX_uxn_device_h_l153_c7_4d34 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l153_c7_4d34_cond,
vram_addr_MUX_uxn_device_h_l153_c7_4d34_iftrue,
vram_addr_MUX_uxn_device_h_l153_c7_4d34_iffalse,
vram_addr_MUX_uxn_device_h_l153_c7_4d34_return_output);

-- BIN_OP_EQ_uxn_device_h_l154_c7_fe18
BIN_OP_EQ_uxn_device_h_l154_c7_fe18 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l154_c7_fe18_left,
BIN_OP_EQ_uxn_device_h_l154_c7_fe18_right,
BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_return_output);

-- auto_advance_MUX_uxn_device_h_l154_c3_5c5c
auto_advance_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l154_c3_5c5c_cond,
auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
auto_advance_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- result_u8_value_MUX_uxn_device_h_l154_c3_5c5c
result_u8_value_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_cond,
result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- result_vram_address_MUX_uxn_device_h_l154_c3_5c5c
result_vram_address_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_cond,
result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c
result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_cond,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c
result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_cond,
result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c
result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_cond,
result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c
result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_cond,
result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- vram_addr_MUX_uxn_device_h_l154_c3_5c5c
vram_addr_MUX_uxn_device_h_l154_c3_5c5c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l154_c3_5c5c_cond,
vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iftrue,
vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iffalse,
vram_addr_MUX_uxn_device_h_l154_c3_5c5c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c4_bd80
result_vram_address_MUX_uxn_device_h_l160_c4_bd80 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c4_bd80_cond,
result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c4_bd80_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80
result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_return_output);

-- vram_addr_MUX_uxn_device_h_l160_c4_bd80
vram_addr_MUX_uxn_device_h_l160_c4_bd80 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l160_c4_bd80_cond,
vram_addr_MUX_uxn_device_h_l160_c4_bd80_iftrue,
vram_addr_MUX_uxn_device_h_l160_c4_bd80_iffalse,
vram_addr_MUX_uxn_device_h_l160_c4_bd80_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_return_output);

-- BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6
BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_left,
BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_right,
BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_return_output);

-- BIN_OP_AND_uxn_device_h_l162_c5_173e
BIN_OP_AND_uxn_device_h_l162_c5_173e : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l162_c5_173e_left,
BIN_OP_AND_uxn_device_h_l162_c5_173e_right,
BIN_OP_AND_uxn_device_h_l162_c5_173e_return_output);

-- BIN_OP_AND_uxn_device_h_l163_c21_e09c
BIN_OP_AND_uxn_device_h_l163_c21_e09c : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l163_c21_e09c_left,
BIN_OP_AND_uxn_device_h_l163_c21_e09c_right,
BIN_OP_AND_uxn_device_h_l163_c21_e09c_return_output);

-- BIN_OP_GT_uxn_device_h_l163_c21_0f90
BIN_OP_GT_uxn_device_h_l163_c21_0f90 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l163_c21_0f90_left,
BIN_OP_GT_uxn_device_h_l163_c21_0f90_right,
BIN_OP_GT_uxn_device_h_l163_c21_0f90_return_output);

-- MUX_uxn_device_h_l163_c21_5686
MUX_uxn_device_h_l163_c21_5686 : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l163_c21_5686_cond,
MUX_uxn_device_h_l163_c21_5686_iftrue,
MUX_uxn_device_h_l163_c21_5686_iffalse,
MUX_uxn_device_h_l163_c21_5686_return_output);

-- BIN_OP_OR_uxn_device_h_l163_c5_b38d
BIN_OP_OR_uxn_device_h_l163_c5_b38d : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l163_c5_b38d_left,
BIN_OP_OR_uxn_device_h_l163_c5_b38d_right,
BIN_OP_OR_uxn_device_h_l163_c5_b38d_return_output);

-- BIN_OP_AND_uxn_device_h_l164_c21_e1b3
BIN_OP_AND_uxn_device_h_l164_c21_e1b3 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l164_c21_e1b3_left,
BIN_OP_AND_uxn_device_h_l164_c21_e1b3_right,
BIN_OP_AND_uxn_device_h_l164_c21_e1b3_return_output);

-- BIN_OP_GT_uxn_device_h_l164_c21_351e
BIN_OP_GT_uxn_device_h_l164_c21_351e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l164_c21_351e_left,
BIN_OP_GT_uxn_device_h_l164_c21_351e_right,
BIN_OP_GT_uxn_device_h_l164_c21_351e_return_output);

-- MUX_uxn_device_h_l164_c21_1032
MUX_uxn_device_h_l164_c21_1032 : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l164_c21_1032_cond,
MUX_uxn_device_h_l164_c21_1032_iftrue,
MUX_uxn_device_h_l164_c21_1032_iffalse,
MUX_uxn_device_h_l164_c21_1032_return_output);

-- BIN_OP_OR_uxn_device_h_l164_c5_55e2
BIN_OP_OR_uxn_device_h_l164_c5_55e2 : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l164_c5_55e2_left,
BIN_OP_OR_uxn_device_h_l164_c5_55e2_right,
BIN_OP_OR_uxn_device_h_l164_c5_55e2_return_output);

-- BIN_OP_OR_uxn_device_h_l165_c5_448c
BIN_OP_OR_uxn_device_h_l165_c5_448c : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l165_c5_448c_left,
BIN_OP_OR_uxn_device_h_l165_c5_448c_right,
BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output);

-- printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3
printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3 : entity work.printf_uxn_device_h_l168_c5_48c3_0CLK_de264c78 port map (
printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_CLOCK_ENABLE,
printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg0,
printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg1,
printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg2,
printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg3,
printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg4);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l171_c28_25cd
BIN_OP_PLUS_uxn_device_h_l171_c28_25cd : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_left,
BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_right,
BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_return_output);

-- BIN_OP_EQ_uxn_device_h_l178_c11_5c6d
BIN_OP_EQ_uxn_device_h_l178_c11_5c6d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_left,
BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_right,
BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output);

-- result_u8_value_MUX_uxn_device_h_l178_c7_5c7c
result_u8_value_MUX_uxn_device_h_l178_c7_5c7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_cond,
result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iftrue,
result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iffalse,
result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_return_output);

-- result_vram_address_MUX_uxn_device_h_l178_c7_5c7c
result_vram_address_MUX_uxn_device_h_l178_c7_5c7c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_cond,
result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iftrue,
result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iffalse,
result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c
result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_cond,
result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iftrue,
result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iffalse,
result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c
result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_cond,
result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_return_output);

-- BIN_OP_EQ_uxn_device_h_l179_c7_8b58
BIN_OP_EQ_uxn_device_h_l179_c7_8b58 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l179_c7_8b58_left,
BIN_OP_EQ_uxn_device_h_l179_c7_8b58_right,
BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output);

-- result_u8_value_MUX_uxn_device_h_l179_c3_0e18
result_u8_value_MUX_uxn_device_h_l179_c3_0e18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l179_c3_0e18_cond,
result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iftrue,
result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iffalse,
result_u8_value_MUX_uxn_device_h_l179_c3_0e18_return_output);

-- result_vram_address_MUX_uxn_device_h_l179_c3_0e18
result_vram_address_MUX_uxn_device_h_l179_c3_0e18 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l179_c3_0e18_cond,
result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iftrue,
result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iffalse,
result_vram_address_MUX_uxn_device_h_l179_c3_0e18_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18
result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_cond,
result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iftrue,
result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iffalse,
result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_x,
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output);



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
 BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 auto_advance_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 color_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 sprite_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 result_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 layer_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 x_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 vram_addr_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 pixel_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 y_MUX_uxn_device_h_l40_c2_3aa0_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output,
 result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_return_output,
 BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 auto_advance_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 color_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 sprite_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 layer_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 x_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 vram_addr_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 pixel_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 y_MUX_uxn_device_h_l50_c7_0ed6_return_output,
 BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 auto_advance_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 color_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 sprite_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 layer_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 x_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 vram_addr_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 pixel_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 y_MUX_uxn_device_h_l57_c7_b0a5_return_output,
 BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output,
 color_MUX_uxn_device_h_l58_c3_ccae_return_output,
 result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_return_output,
 result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_return_output,
 is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_return_output,
 layer_MUX_uxn_device_h_l58_c3_ccae_return_output,
 pixel_MUX_uxn_device_h_l58_c3_ccae_return_output,
 BIN_OP_AND_uxn_device_h_l61_c20_0e5c_return_output,
 BIN_OP_EQ_uxn_device_h_l61_c20_f796_return_output,
 MUX_uxn_device_h_l61_c20_de47_return_output,
 BIN_OP_AND_uxn_device_h_l62_c13_f206_return_output,
 MUX_uxn_device_h_l62_c13_40a1_return_output,
 BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_return_output,
 auto_advance_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 sprite_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 x_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 vram_addr_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 y_MUX_uxn_device_h_l68_c7_a0a7_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_return_output,
 auto_advance_MUX_uxn_device_h_l75_c7_9b07_return_output,
 sprite_MUX_uxn_device_h_l75_c7_9b07_return_output,
 result_u8_value_MUX_uxn_device_h_l75_c7_9b07_return_output,
 result_vram_address_MUX_uxn_device_h_l75_c7_9b07_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_return_output,
 result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_return_output,
 result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_return_output,
 result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_return_output,
 x_MUX_uxn_device_h_l75_c7_9b07_return_output,
 vram_addr_MUX_uxn_device_h_l75_c7_9b07_return_output,
 y_MUX_uxn_device_h_l75_c7_9b07_return_output,
 BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output,
 sprite_MUX_uxn_device_h_l76_c3_2ea7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_return_output,
 BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 auto_advance_MUX_uxn_device_h_l83_c7_b154_return_output,
 result_u8_value_MUX_uxn_device_h_l83_c7_b154_return_output,
 result_vram_address_MUX_uxn_device_h_l83_c7_b154_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_return_output,
 result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_return_output,
 result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_return_output,
 result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_return_output,
 x_MUX_uxn_device_h_l83_c7_b154_return_output,
 vram_addr_MUX_uxn_device_h_l83_c7_b154_return_output,
 y_MUX_uxn_device_h_l83_c7_b154_return_output,
 BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output,
 result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 x_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 vram_addr_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 y_MUX_uxn_device_h_l90_c7_a6bb_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_return_output,
 x_MUX_uxn_device_h_l91_c3_f882_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 x_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 vram_addr_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 y_MUX_uxn_device_h_l99_c7_d4d6_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_return_output,
 BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_return_output,
 auto_advance_MUX_uxn_device_h_l106_c7_87e4_return_output,
 result_u8_value_MUX_uxn_device_h_l106_c7_87e4_return_output,
 result_vram_address_MUX_uxn_device_h_l106_c7_87e4_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_return_output,
 x_MUX_uxn_device_h_l106_c7_87e4_return_output,
 vram_addr_MUX_uxn_device_h_l106_c7_87e4_return_output,
 y_MUX_uxn_device_h_l106_c7_87e4_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_return_output,
 x_MUX_uxn_device_h_l107_c3_b43e_return_output,
 BIN_OP_OR_uxn_device_h_l108_c4_a4ef_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_a81f_return_output,
 result_u8_value_MUX_uxn_device_h_l114_c7_a81f_return_output,
 result_vram_address_MUX_uxn_device_h_l114_c7_a81f_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_a81f_return_output,
 y_MUX_uxn_device_h_l114_c7_a81f_return_output,
 BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_return_output,
 result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_return_output,
 BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_return_output,
 auto_advance_MUX_uxn_device_h_l121_c7_deeb_return_output,
 result_u8_value_MUX_uxn_device_h_l121_c7_deeb_return_output,
 result_vram_address_MUX_uxn_device_h_l121_c7_deeb_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_return_output,
 vram_addr_MUX_uxn_device_h_l121_c7_deeb_return_output,
 y_MUX_uxn_device_h_l121_c7_deeb_return_output,
 BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_return_output,
 result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_return_output,
 y_MUX_uxn_device_h_l122_c3_2986_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_return_output,
 auto_advance_MUX_uxn_device_h_l130_c7_4f25_return_output,
 result_u8_value_MUX_uxn_device_h_l130_c7_4f25_return_output,
 result_vram_address_MUX_uxn_device_h_l130_c7_4f25_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_return_output,
 result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_return_output,
 result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_return_output,
 result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_return_output,
 vram_addr_MUX_uxn_device_h_l130_c7_4f25_return_output,
 y_MUX_uxn_device_h_l130_c7_4f25_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output,
 result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_return_output,
 result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_return_output,
 auto_advance_MUX_uxn_device_h_l137_c7_55dd_return_output,
 result_u8_value_MUX_uxn_device_h_l137_c7_55dd_return_output,
 result_vram_address_MUX_uxn_device_h_l137_c7_55dd_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_return_output,
 result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_return_output,
 result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_return_output,
 vram_addr_MUX_uxn_device_h_l137_c7_55dd_return_output,
 y_MUX_uxn_device_h_l137_c7_55dd_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output,
 result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_return_output,
 y_MUX_uxn_device_h_l138_c3_528c_return_output,
 BIN_OP_OR_uxn_device_h_l139_c4_91e2_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_8499_return_output,
 result_u8_value_MUX_uxn_device_h_l145_c7_8499_return_output,
 result_vram_address_MUX_uxn_device_h_l145_c7_8499_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_return_output,
 result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_return_output,
 result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_return_output,
 result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_8499_return_output,
 BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output,
 result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_return_output,
 BIN_OP_GT_uxn_device_h_l147_c27_d640_return_output,
 MUX_uxn_device_h_l147_c27_c394_return_output,
 BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_return_output,
 auto_advance_MUX_uxn_device_h_l153_c7_4d34_return_output,
 result_u8_value_MUX_uxn_device_h_l153_c7_4d34_return_output,
 result_vram_address_MUX_uxn_device_h_l153_c7_4d34_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_return_output,
 result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_return_output,
 result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_return_output,
 result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_return_output,
 vram_addr_MUX_uxn_device_h_l153_c7_4d34_return_output,
 BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_return_output,
 auto_advance_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 vram_addr_MUX_uxn_device_h_l154_c3_5c5c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c4_bd80_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_return_output,
 vram_addr_MUX_uxn_device_h_l160_c4_bd80_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_return_output,
 BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_return_output,
 BIN_OP_AND_uxn_device_h_l162_c5_173e_return_output,
 BIN_OP_AND_uxn_device_h_l163_c21_e09c_return_output,
 BIN_OP_GT_uxn_device_h_l163_c21_0f90_return_output,
 MUX_uxn_device_h_l163_c21_5686_return_output,
 BIN_OP_OR_uxn_device_h_l163_c5_b38d_return_output,
 BIN_OP_AND_uxn_device_h_l164_c21_e1b3_return_output,
 BIN_OP_GT_uxn_device_h_l164_c21_351e_return_output,
 MUX_uxn_device_h_l164_c21_1032_return_output,
 BIN_OP_OR_uxn_device_h_l164_c5_55e2_return_output,
 BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_return_output,
 BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_return_output,
 BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output,
 result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_return_output,
 result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_return_output,
 result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_return_output,
 BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output,
 result_u8_value_MUX_uxn_device_h_l179_c3_0e18_return_output,
 result_vram_address_MUX_uxn_device_h_l179_c3_0e18_return_output,
 result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l40_c2_3aa0_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed_uxn_device_h_l40_c2_3aa0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_3aa0_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_55f9_uxn_device_h_l40_c2_3aa0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_3aa0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l41_c3_7033 : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_3aa0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_3aa0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_3aa0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_3aa0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l44_c4_9226 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_9abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_0ed6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_0ed6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_b0a5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_0ed6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l52_c4_9213 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_b0a5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_b0a5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_a0a7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_b0a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l63_c4_e051 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_eb98_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_de47_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_de47_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_de47_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_de47_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_40a1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_40a1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_40a1_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_40a1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_a0a7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_a0a7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9b07_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_a0a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l70_c4_4062 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9b07_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9b07_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_b154_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9b07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l78_c4_09c9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_b154_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_b154_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_a6bb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_b154_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_0a43 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_f882_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_a6bb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_a6bb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d4d6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_a6bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_e92b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_f882_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_f882_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_f882_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d4d6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d4d6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_87e4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l101_c4_fc37 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_b43e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_87e4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_87e4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a81f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_87e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l109_c4_4147 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_b43e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_b43e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_b43e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a81f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a81f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_deeb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a81f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l116_c4_a1b9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_deeb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_2986_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_deeb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_4f25_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_deeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l125_c4_37c2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_2986_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_2986_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_2986_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_4f25_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_4f25_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_55dd_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_4f25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l132_c4_4e3a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_55dd_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_528c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_55dd_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_55dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l140_c4_0e94 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_528c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_528c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_528c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l148_c4_bf96 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_c394_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_c394_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_c394_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_c394_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l156_c4_f1e7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_39a6_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l171_c5_da58 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l161_c5_212e : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_5686_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_5686_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_5686_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_5686_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_1032_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_1032_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_1032_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_1032_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_3e3c_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l183_c4_52b3 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l182_c4_78a9 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l123_l108_l139_DUPLICATE_363b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8075_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_1f90_return_output : unsigned(31 downto 0);
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
     VAR_result_device_ram_address_uxn_device_h_l109_c4_4147 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iftrue := VAR_result_device_ram_address_uxn_device_h_l109_c4_4147;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_right := to_unsigned(16, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_right := to_unsigned(9, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_right := to_unsigned(14, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_e92b := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_e92b;
     VAR_MUX_uxn_device_h_l163_c21_5686_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_right := to_unsigned(14, 4);
     VAR_result_u8_value_uxn_device_h_l183_c4_52b3 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iftrue := VAR_result_u8_value_uxn_device_h_l183_c4_52b3;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l125_c4_37c2 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iftrue := VAR_result_device_ram_address_uxn_device_h_l125_c4_37c2;
     VAR_result_device_ram_address_uxn_device_h_l52_c4_9213 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iftrue := VAR_result_device_ram_address_uxn_device_h_l52_c4_9213;
     VAR_MUX_uxn_device_h_l163_c21_5686_iftrue := to_unsigned(1048576, 21);
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_right := to_unsigned(3, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l70_c4_4062 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iftrue := VAR_result_device_ram_address_uxn_device_h_l70_c4_4062;
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l62_c13_40a1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l164_c21_1032_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l156_c4_f1e7 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue := VAR_result_device_ram_address_uxn_device_h_l156_c4_f1e7;
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_right := to_unsigned(262143, 18);
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_right := to_unsigned(8, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_right := to_unsigned(400, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_right := to_unsigned(13, 4);
     VAR_result_device_ram_address_uxn_device_h_l140_c4_0e94 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iftrue := VAR_result_device_ram_address_uxn_device_h_l140_c4_0e94;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_right := to_unsigned(14, 4);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_right := to_unsigned(400, 32);
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l44_c4_9226 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iftrue := VAR_result_device_ram_address_uxn_device_h_l44_c4_9226;
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l101_c4_fc37 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iftrue := VAR_result_device_ram_address_uxn_device_h_l101_c4_fc37;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l61_c20_de47_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l132_c4_4e3a := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iftrue := VAR_result_device_ram_address_uxn_device_h_l132_c4_4e3a;
     VAR_MUX_uxn_device_h_l61_c20_de47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_right := to_unsigned(11, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l85_c4_0a43 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_0a43;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_right := to_unsigned(400, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l62_c13_40a1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_right := to_unsigned(32, 6);
     VAR_MUX_uxn_device_h_l147_c27_c394_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l63_c4_e051 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iftrue := VAR_result_device_ram_address_uxn_device_h_l63_c4_e051;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_right := to_unsigned(14, 4);
     VAR_vram_addr_uxn_device_h_l41_c3_7033 := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iftrue := VAR_vram_addr_uxn_device_h_l41_c3_7033;
     VAR_result_vram_address_uxn_device_h_l182_c4_78a9 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iftrue := VAR_result_vram_address_uxn_device_h_l182_c4_78a9;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l116_c4_a1b9 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iftrue := VAR_result_device_ram_address_uxn_device_h_l116_c4_a1b9;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_right := to_unsigned(4, 3);
     VAR_result_device_ram_address_uxn_device_h_l78_c4_09c9 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iftrue := VAR_result_device_ram_address_uxn_device_h_l78_c4_09c9;
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_right := unsigned'(X"f0000000");
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l148_c4_bf96 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iftrue := VAR_result_device_ram_address_uxn_device_h_l148_c4_bf96;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l164_c21_1032_iftrue := to_unsigned(2097152, 22);
     VAR_MUX_uxn_device_h_l147_c27_c394_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iffalse := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l40_c2_3aa0_iftrue := color;
     VAR_color_MUX_uxn_device_h_l50_c7_0ed6_iftrue := color;
     VAR_color_MUX_uxn_device_h_l57_c7_b0a5_iffalse := color;
     VAR_color_MUX_uxn_device_h_l58_c3_ccae_iffalse := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_left := VAR_device_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_cond := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iffalse := is_fill_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_cond := is_fill_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_cond := is_fill_mode;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_cond := is_fill_mode;
     VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l58_c3_ccae_iffalse := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_left := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_left := pixel;
     VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_iffalse := pixel;
     VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg3 := resize(pixel, 32);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_iffalse := sprite;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iftrue := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_right := x;
     VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l106_c7_87e4_iffalse := x;
     VAR_x_MUX_uxn_device_h_l107_c3_b43e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l40_c2_3aa0_iftrue := x;
     VAR_x_MUX_uxn_device_h_l50_c7_0ed6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l57_c7_b0a5_iftrue := x;
     VAR_x_MUX_uxn_device_h_l68_c7_a0a7_iftrue := x;
     VAR_x_MUX_uxn_device_h_l75_c7_9b07_iftrue := x;
     VAR_x_MUX_uxn_device_h_l83_c7_b154_iftrue := x;
     VAR_x_MUX_uxn_device_h_l91_c3_f882_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_d4d6_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_left := y;
     VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l106_c7_87e4_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_a81f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l122_c3_2986_iffalse := y;
     VAR_y_MUX_uxn_device_h_l130_c7_4f25_iftrue := y;
     VAR_y_MUX_uxn_device_h_l137_c7_55dd_iffalse := y;
     VAR_y_MUX_uxn_device_h_l138_c3_528c_iffalse := y;
     VAR_y_MUX_uxn_device_h_l40_c2_3aa0_iftrue := y;
     VAR_y_MUX_uxn_device_h_l50_c7_0ed6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l57_c7_b0a5_iftrue := y;
     VAR_y_MUX_uxn_device_h_l68_c7_a0a7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l75_c7_9b07_iftrue := y;
     VAR_y_MUX_uxn_device_h_l83_c7_b154_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_a6bb_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_d4d6_iftrue := y;
     -- BIN_OP_AND[uxn_device_h_l62_c13_f206] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l62_c13_f206_left <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_left;
     BIN_OP_AND_uxn_device_h_l62_c13_f206_right <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_return_output := BIN_OP_AND_uxn_device_h_l62_c13_f206_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l157_c22_39a6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_39a6_return_output := CAST_TO_uint8_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l114_c11_f6d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8075 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8075_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l68_c11_114f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l68_c11_114f_left <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_left;
     BIN_OP_EQ_uxn_device_h_l68_c11_114f_right <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output := BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_5d38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_5d38_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_5d38_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output := result.vram_address;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_1f90 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_1f90_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_AND[uxn_device_h_l164_c21_e1b3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l164_c21_e1b3_left <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_left;
     BIN_OP_AND_uxn_device_h_l164_c21_e1b3_right <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_return_output := BIN_OP_AND_uxn_device_h_l164_c21_e1b3_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l69_c7_963b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c7_963b_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_left;
     BIN_OP_EQ_uxn_device_h_l69_c7_963b_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output := BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l50_c11_7099] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l50_c11_7099_left <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_left;
     BIN_OP_EQ_uxn_device_h_l50_c11_7099_right <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output := BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c7_329b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c7_329b_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_left;
     BIN_OP_EQ_uxn_device_h_l107_c7_329b_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output := BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l153_c11_938a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l153_c11_938a_left <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_left;
     BIN_OP_EQ_uxn_device_h_l153_c11_938a_right <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output := BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;

     -- BIN_OP_AND[uxn_device_h_l61_c20_0e5c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l61_c20_0e5c_left <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_left;
     BIN_OP_AND_uxn_device_h_l61_c20_0e5c_right <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_return_output := BIN_OP_AND_uxn_device_h_l61_c20_0e5c_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l42_c3_9abf] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_9abf_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_3021] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_3021_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_3021_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output;

     -- BIN_OP_EQ[uxn_device_h_l146_c7_8cac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l146_c7_8cac_left <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_left;
     BIN_OP_EQ_uxn_device_h_l146_c7_8cac_right <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output := BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c11_9363] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c11_9363_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_left;
     BIN_OP_EQ_uxn_device_h_l57_c11_9363_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output := BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;

     -- BIN_OP_EQ[uxn_device_h_l154_c7_fe18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l154_c7_fe18_left <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_left;
     BIN_OP_EQ_uxn_device_h_l154_c7_fe18_right <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output := BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;

     -- BIN_OP_EQ[uxn_device_h_l84_c7_0fed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l84_c7_0fed_left <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_left;
     BIN_OP_EQ_uxn_device_h_l84_c7_0fed_right <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output := BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output := result.is_vram_write;

     -- BIN_OP_AND[uxn_device_h_l163_c21_e09c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l163_c21_e09c_left <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_left;
     BIN_OP_AND_uxn_device_h_l163_c21_e09c_right <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_return_output := BIN_OP_AND_uxn_device_h_l163_c21_e09c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l58_c7_824a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l58_c7_824a_left <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_left;
     BIN_OP_EQ_uxn_device_h_l58_c7_824a_right <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output := BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_ccb0] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l115_c7_2d8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_left <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_left;
     BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_right <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output := BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_6a4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l106_c11_6d3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_left <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_left;
     BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_right <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output := BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l122_c7_e19f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l122_c7_e19f_left <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_left;
     BIN_OP_EQ_uxn_device_h_l122_c7_e19f_right <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output := BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l83_c11_256e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l83_c11_256e_left <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_left;
     BIN_OP_EQ_uxn_device_h_l83_c11_256e_right <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output := BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l75_c11_8b8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_left;
     BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output := BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l51_c7_9ce4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_left <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_left;
     BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_right <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output := BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output := result.vram_write_layer;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l123_l108_l139_DUPLICATE_363b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l123_l108_l139_DUPLICATE_363b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l99_c11_935f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_935f_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_935f_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l178_c11_5c6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_left <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_left;
     BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_right <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output := BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l131_c7_8616] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c7_8616_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_left;
     BIN_OP_EQ_uxn_device_h_l131_c7_8616_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output := BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_bbe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c4_bd80] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c7_a887] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c7_a887_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_left;
     BIN_OP_EQ_uxn_device_h_l42_c7_a887_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output := BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output;

     -- BIN_OP_EQ[uxn_device_h_l121_c11_8bcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_left <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_left;
     BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_right <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output := BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output := result.is_deo_done;

     -- CAST_TO_uint4_t[uxn_device_h_l168_c127_3e3c] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_3e3c_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l137_c11_8951] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_8951_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_8951_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c7_b6ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_left;
     BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output := BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output;

     -- BIN_OP_EQ[uxn_device_h_l76_c7_43d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l76_c7_43d5_left <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_left;
     BIN_OP_EQ_uxn_device_h_l76_c7_43d5_right <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output := BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l40_c6_a37e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l40_c6_a37e_left <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_left;
     BIN_OP_EQ_uxn_device_h_l40_c6_a37e_right <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output := BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c11_0967] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_0967_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_0967_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;

     -- BIN_OP_EQ[uxn_device_h_l179_c7_8b58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l179_c7_8b58_left <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_left;
     BIN_OP_EQ_uxn_device_h_l179_c7_8b58_right <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output := BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l60_c12_eb98] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_eb98_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_left := VAR_BIN_OP_AND_uxn_device_h_l163_c21_e09c_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_left := VAR_BIN_OP_AND_uxn_device_h_l164_c21_e1b3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_left := VAR_BIN_OP_AND_uxn_device_h_l61_c20_0e5c_return_output;
     VAR_MUX_uxn_device_h_l62_c13_40a1_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l62_c13_f206_return_output, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_3021_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_6d3a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_b43e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_329b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_a81f_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_f6d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_2d8f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_deeb_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_8bcb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_2986_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e19f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_4f25_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_bbe2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_8616_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_55dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_8951_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_528c_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_b6ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6a4a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_8cac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_938a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_fe18_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5c6d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_8b58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_3aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_a37e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_a887_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_0ed6_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_7099_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_9ce4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_b0a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_9363_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_ccae_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_ccae_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output;
     VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_824a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_a0a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_114f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_963b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_9b07_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_8b8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output;
     VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_43d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_b154_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_256e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_0fed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_a6bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_0967_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_f882_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5d38_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_935f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_ccb0_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l123_l108_l139_DUPLICATE_363b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l123_l108_l139_DUPLICATE_363b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l123_l108_l139_DUPLICATE_363b_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_ccae_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_eb98_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8075_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8075_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_1f90_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_1f90_return_output;
     VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_3e3c_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_39a6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l131_l138_l76_l51_l58_l84_l91_DUPLICATE_595d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_1cf9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l50_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l57_l106_l153_DUPLICATE_77c3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_a796_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l107_l69_l100_l115_l122_l154_l42_l131_l138_l76_l51_l146_l58_l84_l91_l153_DUPLICATE_2b7d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l50_l179_l99_l145_l90_l137_l154_l83_l130_l75_l121_l68_l114_l178_l57_l106_DUPLICATE_7524_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_9abf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_bd80_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l76_c3_2ea7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_cond;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_return_output := result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_cond;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_return_output := result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- sprite_MUX[uxn_device_h_l76_c3_2ea7] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l76_c3_2ea7_cond <= VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_cond;
     sprite_MUX_uxn_device_h_l76_c3_2ea7_iftrue <= VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_iftrue;
     sprite_MUX_uxn_device_h_l76_c3_2ea7_iffalse <= VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_return_output := sprite_MUX_uxn_device_h_l76_c3_2ea7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_f882] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_return_output;

     -- MUX[uxn_device_h_l62_c13_40a1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l62_c13_40a1_cond <= VAR_MUX_uxn_device_h_l62_c13_40a1_cond;
     MUX_uxn_device_h_l62_c13_40a1_iftrue <= VAR_MUX_uxn_device_h_l62_c13_40a1_iftrue;
     MUX_uxn_device_h_l62_c13_40a1_iffalse <= VAR_MUX_uxn_device_h_l62_c13_40a1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l62_c13_40a1_return_output := MUX_uxn_device_h_l62_c13_40a1_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_b012] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l138_c3_528c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_cond;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_return_output := result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l42_c3_9abf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_cond;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_return_output := result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l51_c3_526c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_cond;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_return_output := result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l84_c3_73e6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_cond;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_return_output := result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l51_c3_526c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_cond;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_return_output := result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c27_cc97] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_left;
     BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_return_output := BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_return_output;

     -- result_u8_value_MUX[uxn_device_h_l179_c3_0e18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l179_c3_0e18_cond <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_cond;
     result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iftrue;
     result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_return_output := result_u8_value_MUX_uxn_device_h_l179_c3_0e18_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l69_c3_a6f2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_cond;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_return_output := result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_return_output;

     -- color_MUX[uxn_device_h_l58_c3_ccae] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l58_c3_ccae_cond <= VAR_color_MUX_uxn_device_h_l58_c3_ccae_cond;
     color_MUX_uxn_device_h_l58_c3_ccae_iftrue <= VAR_color_MUX_uxn_device_h_l58_c3_ccae_iftrue;
     color_MUX_uxn_device_h_l58_c3_ccae_iffalse <= VAR_color_MUX_uxn_device_h_l58_c3_ccae_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l58_c3_ccae_return_output := color_MUX_uxn_device_h_l58_c3_ccae_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c3_b43e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l131_c3_b543] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_cond;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_return_output := result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l84_c3_73e6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_cond;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_return_output := result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l115_c3_0082] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_cond;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_return_output := result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_return_output;

     -- BIN_OP_OR[uxn_device_h_l108_c4_a4ef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l108_c4_a4ef_left <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_left;
     BIN_OP_OR_uxn_device_h_l108_c4_a4ef_right <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_return_output := BIN_OP_OR_uxn_device_h_l108_c4_a4ef_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l122_c3_2986] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_cond;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_return_output := result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_cond;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_return_output := result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_7e24] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_return_output;

     -- result_u8_value_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_cond;
     result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_return_output := result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- BIN_OP_GT[uxn_device_h_l163_c21_0f90] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l163_c21_0f90_left <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_left;
     BIN_OP_GT_uxn_device_h_l163_c21_0f90_right <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_return_output := BIN_OP_GT_uxn_device_h_l163_c21_0f90_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l179_c3_0e18] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_cond;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_return_output := result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_9abf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_return_output := result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_f882] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l122_c3_2986] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_cond;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_return_output := result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_return_output;

     -- auto_advance_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_cond;
     auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_return_output := auto_advance_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_cond;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_return_output := result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l76_c3_2ea7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_cond;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_return_output := result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l58_c3_ccae] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_cond;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_return_output := result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l42_c3_9abf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_cond;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_return_output := result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l178_c7_5c7c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_cond;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_return_output := result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_return_output;

     -- pixel_MUX[uxn_device_h_l58_c3_ccae] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l58_c3_ccae_cond <= VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_cond;
     pixel_MUX_uxn_device_h_l58_c3_ccae_iftrue <= VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_iftrue;
     pixel_MUX_uxn_device_h_l58_c3_ccae_iffalse <= VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_return_output := pixel_MUX_uxn_device_h_l58_c3_ccae_return_output;

     -- BIN_OP_EQ[uxn_device_h_l61_c20_f796] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l61_c20_f796_left <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_left;
     BIN_OP_EQ_uxn_device_h_l61_c20_f796_right <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_return_output := BIN_OP_EQ_uxn_device_h_l61_c20_f796_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l69_c3_a6f2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_cond;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_return_output := result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l131_c3_b543] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_cond;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_return_output := result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_return_output;

     -- BIN_OP_OR[uxn_device_h_l139_c4_91e2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l139_c4_91e2_left <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_left;
     BIN_OP_OR_uxn_device_h_l139_c4_91e2_right <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_return_output := BIN_OP_OR_uxn_device_h_l139_c4_91e2_return_output;

     -- result_vram_address_MUX[uxn_device_h_l179_c3_0e18] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l179_c3_0e18_cond <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_cond;
     result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iftrue;
     result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_return_output := result_vram_address_MUX_uxn_device_h_l179_c3_0e18_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c3_b43e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_return_output;

     -- BIN_OP_GT[uxn_device_h_l164_c21_351e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l164_c21_351e_left <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_left;
     BIN_OP_GT_uxn_device_h_l164_c21_351e_right <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_return_output := BIN_OP_GT_uxn_device_h_l164_c21_351e_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_57a6] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_cond;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output := result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l58_c3_ccae] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_cond;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_return_output := result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output := CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_7e24] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l146_c3_e25e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_cond;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_return_output := result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_0082] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l138_c3_528c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_cond;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_return_output := result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l61_c20_de47_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c20_f796_return_output;
     VAR_MUX_uxn_device_h_l163_c21_5686_cond := VAR_BIN_OP_GT_uxn_device_h_l163_c21_0f90_return_output;
     VAR_MUX_uxn_device_h_l164_c21_1032_cond := VAR_BIN_OP_GT_uxn_device_h_l164_c21_351e_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_b012_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_57a6_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_b43e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l108_c4_a4ef_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_528c_iftrue := VAR_BIN_OP_OR_uxn_device_h_l139_c4_91e2_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_left := VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_cc97_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_f882_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_2986_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_035a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_ccae_iftrue := VAR_MUX_uxn_device_h_l62_c13_40a1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_auto_advance_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_color_MUX_uxn_device_h_l58_c3_ccae_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_pixel_MUX_uxn_device_h_l58_c3_ccae_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_7e24_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_b43e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0082_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_2986_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_b543_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_528c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_e25e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_526c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_ccae_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_a6f2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_2ea7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_73e6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f882_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_7e24_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_b43e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_0082_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_2986_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_b543_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_528c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_5c7c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_526c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_ccae_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_a6f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_2ea7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_73e6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f882_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_0e18_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l179_c3_0e18_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l179_c3_0e18_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_iftrue := VAR_sprite_MUX_uxn_device_h_l76_c3_2ea7_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_cond;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_return_output := result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- result_vram_address_MUX[uxn_device_h_l178_c7_5c7c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_cond <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_cond;
     result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iftrue;
     result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_return_output := result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_return_output;

     -- pixel_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_cond;
     pixel_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     pixel_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_return_output := pixel_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l161_c18_dbe6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_left <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_left;
     BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_right <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_return_output := BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_return_output;

     -- y_MUX[uxn_device_h_l138_c3_528c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c3_528c_cond <= VAR_y_MUX_uxn_device_h_l138_c3_528c_cond;
     y_MUX_uxn_device_h_l138_c3_528c_iftrue <= VAR_y_MUX_uxn_device_h_l138_c3_528c_iftrue;
     y_MUX_uxn_device_h_l138_c3_528c_iffalse <= VAR_y_MUX_uxn_device_h_l138_c3_528c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c3_528c_return_output := y_MUX_uxn_device_h_l138_c3_528c_return_output;

     -- BIN_OP_GT[uxn_device_h_l147_c27_d640] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l147_c27_d640_left <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_left;
     BIN_OP_GT_uxn_device_h_l147_c27_d640_right <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_return_output := BIN_OP_GT_uxn_device_h_l147_c27_d640_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- auto_advance_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_cond;
     auto_advance_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     auto_advance_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_return_output := auto_advance_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- sprite_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_cond;
     sprite_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     sprite_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_return_output := sprite_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l171_c28_25cd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_left;
     BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_return_output := BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_cond;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_return_output := result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- MUX[uxn_device_h_l164_c21_1032] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l164_c21_1032_cond <= VAR_MUX_uxn_device_h_l164_c21_1032_cond;
     MUX_uxn_device_h_l164_c21_1032_iftrue <= VAR_MUX_uxn_device_h_l164_c21_1032_iftrue;
     MUX_uxn_device_h_l164_c21_1032_iffalse <= VAR_MUX_uxn_device_h_l164_c21_1032_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l164_c21_1032_return_output := MUX_uxn_device_h_l164_c21_1032_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed[uxn_device_h_l40_c2_3aa0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed_uxn_device_h_l40_c2_3aa0_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_52ed(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_9abf_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_9abf_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_9abf_return_output);

     -- result_u8_value_MUX[uxn_device_h_l178_c7_5c7c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_cond;
     result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iftrue;
     result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_return_output := result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l178_c7_5c7c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_cond;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_return_output := result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_return_output;

     -- y_MUX[uxn_device_h_l122_c3_2986] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l122_c3_2986_cond <= VAR_y_MUX_uxn_device_h_l122_c3_2986_cond;
     y_MUX_uxn_device_h_l122_c3_2986_iftrue <= VAR_y_MUX_uxn_device_h_l122_c3_2986_iftrue;
     y_MUX_uxn_device_h_l122_c3_2986_iffalse <= VAR_y_MUX_uxn_device_h_l122_c3_2986_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l122_c3_2986_return_output := y_MUX_uxn_device_h_l122_c3_2986_return_output;

     -- color_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_color_MUX_uxn_device_h_l57_c7_b0a5_cond;
     color_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_color_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     color_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_color_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l57_c7_b0a5_return_output := color_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- layer_MUX[uxn_device_h_l58_c3_ccae] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l58_c3_ccae_cond <= VAR_layer_MUX_uxn_device_h_l58_c3_ccae_cond;
     layer_MUX_uxn_device_h_l58_c3_ccae_iftrue <= VAR_layer_MUX_uxn_device_h_l58_c3_ccae_iftrue;
     layer_MUX_uxn_device_h_l58_c3_ccae_iffalse <= VAR_layer_MUX_uxn_device_h_l58_c3_ccae_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l58_c3_ccae_return_output := layer_MUX_uxn_device_h_l58_c3_ccae_return_output;

     -- x_MUX[uxn_device_h_l107_c3_b43e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c3_b43e_cond <= VAR_x_MUX_uxn_device_h_l107_c3_b43e_cond;
     x_MUX_uxn_device_h_l107_c3_b43e_iftrue <= VAR_x_MUX_uxn_device_h_l107_c3_b43e_iftrue;
     x_MUX_uxn_device_h_l107_c3_b43e_iffalse <= VAR_x_MUX_uxn_device_h_l107_c3_b43e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c3_b43e_return_output := x_MUX_uxn_device_h_l107_c3_b43e_return_output;

     -- MUX[uxn_device_h_l61_c20_de47] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l61_c20_de47_cond <= VAR_MUX_uxn_device_h_l61_c20_de47_cond;
     MUX_uxn_device_h_l61_c20_de47_iftrue <= VAR_MUX_uxn_device_h_l61_c20_de47_iftrue;
     MUX_uxn_device_h_l61_c20_de47_iffalse <= VAR_MUX_uxn_device_h_l61_c20_de47_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l61_c20_de47_return_output := MUX_uxn_device_h_l61_c20_de47_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_cond;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_return_output := result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- x_MUX[uxn_device_h_l91_c3_f882] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l91_c3_f882_cond <= VAR_x_MUX_uxn_device_h_l91_c3_f882_cond;
     x_MUX_uxn_device_h_l91_c3_f882_iftrue <= VAR_x_MUX_uxn_device_h_l91_c3_f882_iftrue;
     x_MUX_uxn_device_h_l91_c3_f882_iffalse <= VAR_x_MUX_uxn_device_h_l91_c3_f882_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l91_c3_f882_return_output := x_MUX_uxn_device_h_l91_c3_f882_return_output;

     -- MUX[uxn_device_h_l163_c21_5686] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l163_c21_5686_cond <= VAR_MUX_uxn_device_h_l163_c21_5686_cond;
     MUX_uxn_device_h_l163_c21_5686_iftrue <= VAR_MUX_uxn_device_h_l163_c21_5686_iftrue;
     MUX_uxn_device_h_l163_c21_5686_iffalse <= VAR_MUX_uxn_device_h_l163_c21_5686_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l163_c21_5686_return_output := MUX_uxn_device_h_l163_c21_5686_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l147_c27_c394_cond := VAR_BIN_OP_GT_uxn_device_h_l147_c27_d640_return_output;
     VAR_vram_addr_uxn_device_h_l161_c5_212e := resize(VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_dbe6_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l171_c5_da58 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_25cd_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_right := VAR_MUX_uxn_device_h_l163_c21_5686_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_right := VAR_MUX_uxn_device_h_l164_c21_1032_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iftrue := VAR_MUX_uxn_device_h_l61_c20_de47_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_auto_advance_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_color_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_layer_MUX_uxn_device_h_l58_c3_ccae_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_pixel_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_3aa0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_52ed_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_5c7c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l178_c7_5c7c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l178_c7_5c7c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_sprite_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_87e4_iftrue := VAR_x_MUX_uxn_device_h_l107_c3_b43e_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_a6bb_iftrue := VAR_x_MUX_uxn_device_h_l91_c3_f882_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_deeb_iftrue := VAR_y_MUX_uxn_device_h_l122_c3_2986_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_55dd_iftrue := VAR_y_MUX_uxn_device_h_l138_c3_528c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iffalse := VAR_result_vram_address_uxn_device_h_l171_c5_da58;
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_left := VAR_vram_addr_uxn_device_h_l161_c5_212e;
     -- color_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_color_MUX_uxn_device_h_l50_c7_0ed6_cond;
     color_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_color_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     color_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_color_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l50_c7_0ed6_return_output := color_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l58_c3_ccae] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_cond;
     is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iftrue;
     is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_return_output := is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_return_output;

     -- sprite_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_cond;
     sprite_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     sprite_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_return_output := sprite_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_cond;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_return_output := result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- BIN_OP_AND[uxn_device_h_l162_c5_173e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l162_c5_173e_left <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_left;
     BIN_OP_AND_uxn_device_h_l162_c5_173e_right <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_return_output := BIN_OP_AND_uxn_device_h_l162_c5_173e_return_output;

     -- layer_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_cond;
     layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output := layer_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_cond;
     result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_return_output := result_u8_value_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- y_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_y_MUX_uxn_device_h_l137_c7_55dd_cond;
     y_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_y_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     y_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_y_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c7_55dd_return_output := y_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- MUX[uxn_device_h_l147_c27_c394] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c27_c394_cond <= VAR_MUX_uxn_device_h_l147_c27_c394_cond;
     MUX_uxn_device_h_l147_c27_c394_iftrue <= VAR_MUX_uxn_device_h_l147_c27_c394_iftrue;
     MUX_uxn_device_h_l147_c27_c394_iffalse <= VAR_MUX_uxn_device_h_l147_c27_c394_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c27_c394_return_output := MUX_uxn_device_h_l147_c27_c394_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_cond;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_return_output := result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_cond;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_return_output := result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- pixel_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_cond;
     pixel_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     pixel_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_return_output := pixel_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_return_output := auto_advance_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- x_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_x_MUX_uxn_device_h_l106_c7_87e4_cond;
     x_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_x_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     x_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_x_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l106_c7_87e4_return_output := x_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_left := VAR_BIN_OP_AND_uxn_device_h_l162_c5_173e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iftrue := VAR_MUX_uxn_device_h_l147_c27_c394_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_color_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_ccae_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_pixel_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_sprite_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_x_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_y_MUX_uxn_device_h_l137_c7_55dd_return_output;
     -- auto_advance_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_cond;
     auto_advance_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     auto_advance_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_return_output := auto_advance_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- BIN_OP_OR[uxn_device_h_l163_c5_b38d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l163_c5_b38d_left <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_left;
     BIN_OP_OR_uxn_device_h_l163_c5_b38d_right <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_return_output := BIN_OP_OR_uxn_device_h_l163_c5_b38d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l146_c3_e25e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_cond;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_return_output := result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_cond;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_return_output := result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- color_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_color_MUX_uxn_device_h_l40_c2_3aa0_cond;
     color_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_color_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     color_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_color_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l40_c2_3aa0_return_output := color_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- y_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_y_MUX_uxn_device_h_l130_c7_4f25_cond;
     y_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_y_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     y_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_y_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c7_4f25_return_output := y_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_cond;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_return_output := result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- result_u8_value_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_cond;
     result_u8_value_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_iftrue;
     result_u8_value_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_return_output := result_u8_value_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- layer_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_cond;
     layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output := layer_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_cond;
     is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_return_output := is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_cond;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_return_output := result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- pixel_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_cond;
     pixel_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     pixel_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_return_output := pixel_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- x_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_x_MUX_uxn_device_h_l99_c7_d4d6_cond;
     x_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     x_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_d4d6_return_output := x_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- sprite_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_cond;
     sprite_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     sprite_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_return_output := sprite_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_left := VAR_BIN_OP_OR_uxn_device_h_l163_c5_b38d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_auto_advance_MUX_uxn_device_h_l137_c7_55dd_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_55dd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_e25e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_55dd_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_sprite_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_y_MUX_uxn_device_h_l130_c7_4f25_return_output;
     -- BIN_OP_OR[uxn_device_h_l164_c5_55e2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l164_c5_55e2_left <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_left;
     BIN_OP_OR_uxn_device_h_l164_c5_55e2_right <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_return_output := BIN_OP_OR_uxn_device_h_l164_c5_55e2_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_cond;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_return_output := result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- layer_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_cond;
     layer_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     layer_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_return_output := layer_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_cond;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_return_output := result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- result_u8_value_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_cond;
     result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_return_output := result_u8_value_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_cond;
     is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_return_output := is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- y_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_y_MUX_uxn_device_h_l121_c7_deeb_cond;
     y_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_y_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     y_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_y_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l121_c7_deeb_return_output := y_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_cond;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_return_output := result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- x_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_x_MUX_uxn_device_h_l90_c7_a6bb_cond;
     x_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     x_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_a6bb_return_output := x_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_cond;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_return_output := result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- auto_advance_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_cond;
     auto_advance_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     auto_advance_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_return_output := auto_advance_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- sprite_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_cond;
     sprite_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     sprite_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_return_output := sprite_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_left := VAR_BIN_OP_OR_uxn_device_h_l164_c5_55e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_auto_advance_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_55dd_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l137_c7_55dd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_sprite_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_y_MUX_uxn_device_h_l121_c7_deeb_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_cond;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_return_output := result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_cond;
     is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_return_output := is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- BIN_OP_OR[uxn_device_h_l165_c5_448c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l165_c5_448c_left <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_left;
     BIN_OP_OR_uxn_device_h_l165_c5_448c_right <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output := BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output;

     -- result_u8_value_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_cond;
     result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_return_output := result_u8_value_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- sprite_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_cond;
     sprite_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     sprite_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_return_output := sprite_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_cond;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_return_output := result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- x_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_x_MUX_uxn_device_h_l83_c7_b154_cond;
     x_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_x_MUX_uxn_device_h_l83_c7_b154_iftrue;
     x_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_x_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l83_c7_b154_return_output := x_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_cond;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_return_output := result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_cond;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_return_output := result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- y_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_y_MUX_uxn_device_h_l114_c7_a81f_cond;
     y_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     y_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_a81f_return_output := y_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- auto_advance_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_cond;
     auto_advance_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     auto_advance_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_return_output := auto_advance_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- Submodule level 7
     VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg4 := VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_448c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l121_c7_deeb_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_deeb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_55dd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_deeb_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_x_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_a81f_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_cond;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_return_output := result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_cond;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_return_output := result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- x_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_x_MUX_uxn_device_h_l75_c7_9b07_cond;
     x_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_x_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     x_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_x_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c7_9b07_return_output := x_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- result_u8_value_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_cond;
     result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_return_output := result_u8_value_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c4_bd80] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c4_bd80_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_cond;
     result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_return_output := result_vram_address_MUX_uxn_device_h_l160_c4_bd80_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_cond;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_return_output := result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_cond;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_return_output := result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- y_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_y_MUX_uxn_device_h_l106_c7_87e4_cond;
     y_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_y_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     y_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_y_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l106_c7_87e4_return_output := y_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_return_output := auto_advance_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- vram_addr_MUX[uxn_device_h_l160_c4_bd80] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l160_c4_bd80_cond <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_cond;
     vram_addr_MUX_uxn_device_h_l160_c4_bd80_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_iftrue;
     vram_addr_MUX_uxn_device_h_l160_c4_bd80_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_return_output := vram_addr_MUX_uxn_device_h_l160_c4_bd80_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_deeb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l121_c7_deeb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l160_c4_bd80_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iftrue := VAR_vram_addr_MUX_uxn_device_h_l160_c4_bd80_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_x_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_y_MUX_uxn_device_h_l106_c7_87e4_return_output;
     -- vram_addr_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_cond;
     vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_return_output := vram_addr_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- auto_advance_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_cond;
     auto_advance_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     auto_advance_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_return_output := auto_advance_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_cond;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_return_output := result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l154_c3_5c5c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_cond <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_cond;
     result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iftrue;
     result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output := result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output;

     -- x_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_x_MUX_uxn_device_h_l68_c7_a0a7_cond;
     x_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_x_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     x_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_x_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l68_c7_a0a7_return_output := x_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_cond;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_return_output := result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- y_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_y_MUX_uxn_device_h_l99_c7_d4d6_cond;
     y_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     y_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_d4d6_return_output := y_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_cond;
     result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_return_output := result_u8_value_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_cond;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_return_output := result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_cond;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_return_output := result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_deeb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_iftrue := VAR_vram_addr_MUX_uxn_device_h_l154_c3_5c5c_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_x_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     -- result_u8_value_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_cond;
     result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_return_output := result_u8_value_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- x_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_x_MUX_uxn_device_h_l57_c7_b0a5_cond;
     x_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_x_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     x_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_x_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l57_c7_b0a5_return_output := x_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_return_output := auto_advance_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_cond;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_return_output := result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_cond;
     result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_return_output := result_vram_address_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- vram_addr_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_cond;
     vram_addr_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     vram_addr_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_return_output := vram_addr_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_cond;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_return_output := result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- y_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_y_MUX_uxn_device_h_l90_c7_a6bb_cond;
     y_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     y_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_a6bb_return_output := y_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_cond;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_return_output := result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_vram_addr_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_x_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_cond;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_return_output := result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_cond;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_return_output := result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_cond;
     result_vram_address_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_iftrue;
     result_vram_address_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_return_output := result_vram_address_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- y_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_y_MUX_uxn_device_h_l83_c7_b154_cond;
     y_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_y_MUX_uxn_device_h_l83_c7_b154_iftrue;
     y_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_y_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l83_c7_b154_return_output := y_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_return_output := vram_addr_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- x_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_x_MUX_uxn_device_h_l50_c7_0ed6_cond;
     x_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_x_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     x_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_x_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l50_c7_0ed6_return_output := x_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_cond;
     result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_return_output := result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- auto_advance_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_return_output := auto_advance_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_deeb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_x_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_y_MUX_uxn_device_h_l83_c7_b154_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_cond;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_return_output := result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- result_vram_address_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_cond;
     result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_return_output := result_vram_address_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- x_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_x_MUX_uxn_device_h_l40_c2_3aa0_cond;
     x_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_x_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     x_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_x_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l40_c2_3aa0_return_output := x_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- vram_addr_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_cond;
     vram_addr_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     vram_addr_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_return_output := vram_addr_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- auto_advance_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_cond;
     auto_advance_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_iftrue;
     auto_advance_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_return_output := auto_advance_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- y_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_y_MUX_uxn_device_h_l75_c7_9b07_cond;
     y_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_y_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     y_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_y_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c7_9b07_return_output := y_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_cond;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_return_output := result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- result_u8_value_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_cond;
     result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_return_output := result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_auto_advance_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l137_c7_55dd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_iffalse := VAR_vram_addr_MUX_uxn_device_h_l137_c7_55dd_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_y_MUX_uxn_device_h_l75_c7_9b07_return_output;
     -- vram_addr_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_cond;
     vram_addr_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     vram_addr_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_return_output := vram_addr_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- y_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_y_MUX_uxn_device_h_l68_c7_a0a7_cond;
     y_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_y_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     y_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_y_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l68_c7_a0a7_return_output := y_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_cond;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_return_output := result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_cond;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_return_output := result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_55dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_return_output;

     -- auto_advance_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_cond;
     auto_advance_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     auto_advance_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_return_output := auto_advance_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_cond;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_return_output := result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- result_u8_value_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_cond;
     result_u8_value_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_iftrue;
     result_u8_value_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_return_output := result_u8_value_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- result_vram_address_MUX[uxn_device_h_l130_c7_4f25] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l130_c7_4f25_cond <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_cond;
     result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iftrue;
     result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_return_output := result_vram_address_MUX_uxn_device_h_l130_c7_4f25_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_55dd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_iffalse := VAR_vram_addr_MUX_uxn_device_h_l130_c7_4f25_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_y_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_cond;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output := result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_cond;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_return_output := result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- result_vram_address_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_cond;
     result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_return_output := result_vram_address_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- result_u8_value_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_cond;
     result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_return_output := result_u8_value_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- y_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_y_MUX_uxn_device_h_l57_c7_b0a5_cond;
     y_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_y_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     y_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_y_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l57_c7_b0a5_return_output := y_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- auto_advance_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_cond;
     auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_return_output := auto_advance_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- vram_addr_MUX[uxn_device_h_l121_c7_deeb] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l121_c7_deeb_cond <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_cond;
     vram_addr_MUX_uxn_device_h_l121_c7_deeb_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_iftrue;
     vram_addr_MUX_uxn_device_h_l121_c7_deeb_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_return_output := vram_addr_MUX_uxn_device_h_l121_c7_deeb_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_cond;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_return_output := result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_cond;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_return_output := result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_8499] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_8499_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_auto_advance_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l121_c7_deeb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_iffalse := VAR_vram_addr_MUX_uxn_device_h_l121_c7_deeb_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_y_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_cond;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output := result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_cond;
     result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_return_output := result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- result_vram_address_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_cond;
     result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_return_output := result_vram_address_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_cond;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_return_output := result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_cond;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output := result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- y_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_y_MUX_uxn_device_h_l50_c7_0ed6_cond;
     y_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_y_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     y_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_y_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l50_c7_0ed6_return_output := y_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_a81f] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_a81f_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_a81f_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_a81f_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_return_output := vram_addr_MUX_uxn_device_h_l114_c7_a81f_return_output;

     -- auto_advance_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_cond;
     auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_return_output := auto_advance_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_4d34] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_cond;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_return_output := result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_4d34_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_a81f_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_y_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_cond;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_return_output := result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- auto_advance_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_cond;
     auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_return_output := auto_advance_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_cond;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output := result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- vram_addr_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_cond;
     vram_addr_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     vram_addr_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_return_output := vram_addr_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_ab24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_cond;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output := result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_cond;
     result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_return_output := result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- result_vram_address_MUX[uxn_device_h_l106_c7_87e4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l106_c7_87e4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_cond;
     result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iftrue;
     result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_return_output := result_vram_address_MUX_uxn_device_h_l106_c7_87e4_return_output;

     -- y_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_y_MUX_uxn_device_h_l40_c2_3aa0_cond;
     y_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_y_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     y_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_y_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l40_c2_3aa0_return_output := y_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_cond;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_return_output := result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_ab24_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l106_c7_87e4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iffalse := VAR_vram_addr_MUX_uxn_device_h_l106_c7_87e4_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     -- result_vram_address_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_cond;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_return_output := result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- vram_addr_MUX[uxn_device_h_l99_c7_d4d6] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l99_c7_d4d6_cond <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_cond;
     vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iftrue;
     vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_return_output := vram_addr_MUX_uxn_device_h_l99_c7_d4d6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_cond;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_return_output := result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- auto_advance_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_cond;
     auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_return_output := auto_advance_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_9d42] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_return_output;

     -- result_u8_value_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_cond;
     result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_return_output := result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- Submodule level 17
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_9d42_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iffalse := VAR_vram_addr_MUX_uxn_device_h_l99_c7_d4d6_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_cond;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_return_output := result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- vram_addr_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_cond;
     vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_return_output := vram_addr_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- result_vram_address_MUX[uxn_device_h_l90_c7_a6bb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_0023] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_return_output;

     -- Submodule level 18
     VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_0023_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_iffalse := VAR_vram_addr_MUX_uxn_device_h_l90_c7_a6bb_return_output;
     -- result_vram_address_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_cond;
     result_vram_address_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_iftrue;
     result_vram_address_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_return_output := result_vram_address_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- printf_uxn_device_h_l168_c5_48c3[uxn_device_h_l168_c5_48c3] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg0 <= VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg0;
     printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg1 <= VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg1;
     printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg2 <= VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg2;
     printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg3 <= VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg3;
     printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg4 <= VAR_printf_uxn_device_h_l168_c5_48c3_uxn_device_h_l168_c5_48c3_arg4;
     -- Outputs

     -- vram_addr_MUX[uxn_device_h_l83_c7_b154] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l83_c7_b154_cond <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_cond;
     vram_addr_MUX_uxn_device_h_l83_c7_b154_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_iftrue;
     vram_addr_MUX_uxn_device_h_l83_c7_b154_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_return_output := vram_addr_MUX_uxn_device_h_l83_c7_b154_return_output;

     -- Submodule level 19
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l83_c7_b154_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_iffalse := VAR_vram_addr_MUX_uxn_device_h_l83_c7_b154_return_output;
     -- vram_addr_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_cond;
     vram_addr_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     vram_addr_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_return_output := vram_addr_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- result_vram_address_MUX[uxn_device_h_l75_c7_9b07] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l75_c7_9b07_cond <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_cond;
     result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iftrue;
     result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_return_output := result_vram_address_MUX_uxn_device_h_l75_c7_9b07_return_output;

     -- Submodule level 20
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9b07_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iffalse := VAR_vram_addr_MUX_uxn_device_h_l75_c7_9b07_return_output;
     -- result_vram_address_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_cond;
     result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output := result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- vram_addr_MUX[uxn_device_h_l68_c7_a0a7] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l68_c7_a0a7_cond <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_cond;
     vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iftrue;
     vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_return_output := vram_addr_MUX_uxn_device_h_l68_c7_a0a7_return_output;

     -- Submodule level 21
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iffalse := VAR_vram_addr_MUX_uxn_device_h_l68_c7_a0a7_return_output;
     -- result_vram_address_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_cond;
     result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output := result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- vram_addr_MUX[uxn_device_h_l57_c7_b0a5] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l57_c7_b0a5_cond <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_cond;
     vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iftrue;
     vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_return_output := vram_addr_MUX_uxn_device_h_l57_c7_b0a5_return_output;

     -- Submodule level 22
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iffalse := VAR_vram_addr_MUX_uxn_device_h_l57_c7_b0a5_return_output;
     -- result_vram_address_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_cond;
     result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output := result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- vram_addr_MUX[uxn_device_h_l50_c7_0ed6] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l50_c7_0ed6_cond <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_cond;
     vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iftrue;
     vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_return_output := vram_addr_MUX_uxn_device_h_l50_c7_0ed6_return_output;

     -- Submodule level 23
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_vram_addr_MUX_uxn_device_h_l50_c7_0ed6_return_output;
     -- vram_addr_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_cond;
     vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_return_output := vram_addr_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_55f9[uxn_device_h_l40_c2_3aa0] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_55f9_uxn_device_h_l40_c2_3aa0_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_55f9(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_0ed6_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_0ed6_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_0ed6_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_0ed6_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_0ed6_return_output);

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l40_c2_3aa0_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_55f9_uxn_device_h_l40_c2_3aa0_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     -- result_MUX[uxn_device_h_l40_c2_3aa0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l40_c2_3aa0_cond <= VAR_result_MUX_uxn_device_h_l40_c2_3aa0_cond;
     result_MUX_uxn_device_h_l40_c2_3aa0_iftrue <= VAR_result_MUX_uxn_device_h_l40_c2_3aa0_iftrue;
     result_MUX_uxn_device_h_l40_c2_3aa0_iffalse <= VAR_result_MUX_uxn_device_h_l40_c2_3aa0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l40_c2_3aa0_return_output := result_MUX_uxn_device_h_l40_c2_3aa0_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l40_c2_3aa0_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l40_c2_3aa0_return_output;
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
