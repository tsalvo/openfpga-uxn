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
-- Submodules: 298
entity screen_deo_0CLK_ace02e91 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_ace02e91;
architecture arch of screen_deo_0CLK_ace02e91 is
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
device_ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2),
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
-- BIN_OP_EQ[uxn_device_h_l40_c6_b5e1]
signal BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_b21d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l40_c2_6ba0]
signal color_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(1 downto 0);

-- auto_advance_MUX[uxn_device_h_l40_c2_6ba0]
signal auto_advance_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l40_c2_6ba0]
signal y_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l40_c2_6ba0]
signal is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l40_c2_6ba0]
signal x_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l40_c2_6ba0]
signal sprite_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l40_c2_6ba0]
signal pixel_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l40_c2_6ba0]
signal vram_addr_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(31 downto 0);

-- layer_MUX[uxn_device_h_l40_c2_6ba0]
signal layer_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l40_c2_6ba0]
signal result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l40_c2_6ba0]
signal result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(1 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l40_c2_6ba0]
signal result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l40_c2_6ba0]
signal result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l40_c2_6ba0]
signal result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l40_c2_6ba0]
signal result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l40_c2_6ba0]
signal result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c7_3a1a]
signal BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l42_c3_681b]
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_681b]
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l42_c3_681b]
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l50_c11_6f52]
signal BIN_OP_EQ_uxn_device_h_l50_c11_6f52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_6f52_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_c7bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l50_c7_b21d]
signal color_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(1 downto 0);

-- auto_advance_MUX[uxn_device_h_l50_c7_b21d]
signal auto_advance_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l50_c7_b21d]
signal y_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l50_c7_b21d]
signal is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l50_c7_b21d]
signal x_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l50_c7_b21d]
signal sprite_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l50_c7_b21d]
signal pixel_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l50_c7_b21d]
signal vram_addr_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(31 downto 0);

-- layer_MUX[uxn_device_h_l50_c7_b21d]
signal layer_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l50_c7_b21d]
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l50_c7_b21d]
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l50_c7_b21d]
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l50_c7_b21d]
signal result_vram_address_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l50_c7_b21d]
signal result_vram_value_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l50_c7_b21d]
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l51_c7_3cd9]
signal BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l51_c3_3f7d]
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l51_c3_3f7d]
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c11_5915]
signal BIN_OP_EQ_uxn_device_h_l57_c11_5915_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_5915_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_9347]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l57_c7_c7bf]
signal color_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(1 downto 0);

-- auto_advance_MUX[uxn_device_h_l57_c7_c7bf]
signal auto_advance_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l57_c7_c7bf]
signal y_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l57_c7_c7bf]
signal is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l57_c7_c7bf]
signal x_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l57_c7_c7bf]
signal sprite_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l57_c7_c7bf]
signal pixel_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l57_c7_c7bf]
signal vram_addr_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(31 downto 0);

-- layer_MUX[uxn_device_h_l57_c7_c7bf]
signal layer_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l57_c7_c7bf]
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l57_c7_c7bf]
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l57_c7_c7bf]
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l57_c7_c7bf]
signal result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l57_c7_c7bf]
signal result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l57_c7_c7bf]
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l58_c7_3367]
signal BIN_OP_EQ_uxn_device_h_l58_c7_3367_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_3367_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l58_c3_5d86]
signal color_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l58_c3_5d86]
signal is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l58_c3_5d86]
signal pixel_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l58_c3_5d86]
signal layer_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l58_c3_5d86]
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l58_c3_5d86]
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l61_c20_be06]
signal BIN_OP_AND_uxn_device_h_l61_c20_be06_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_be06_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_be06_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l61_c20_a157]
signal BIN_OP_EQ_uxn_device_h_l61_c20_a157_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_a157_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_a157_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l61_c20_563d]
signal MUX_uxn_device_h_l61_c20_563d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_563d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_563d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_563d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l62_c13_5cd3]
signal BIN_OP_AND_uxn_device_h_l62_c13_5cd3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_5cd3_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_5cd3_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l62_c13_ce2b]
signal MUX_uxn_device_h_l62_c13_ce2b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_ce2b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_ce2b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_ce2b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l68_c11_7f86]
signal BIN_OP_EQ_uxn_device_h_l68_c11_7f86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_7f86_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_221a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l68_c7_9347]
signal auto_advance_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l68_c7_9347]
signal y_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l68_c7_9347]
signal x_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l68_c7_9347]
signal sprite_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l68_c7_9347]
signal vram_addr_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l68_c7_9347]
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l68_c7_9347]
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l68_c7_9347]
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l68_c7_9347]
signal result_vram_address_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l68_c7_9347]
signal result_vram_value_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l68_c7_9347]
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c7_511e]
signal BIN_OP_EQ_uxn_device_h_l69_c7_511e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_511e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l69_c3_d92a]
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l69_c3_d92a]
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l75_c11_fe0b]
signal BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_e9a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l75_c7_221a]
signal auto_advance_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l75_c7_221a]
signal y_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l75_c7_221a]
signal x_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l75_c7_221a]
signal sprite_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l75_c7_221a]
signal vram_addr_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l75_c7_221a]
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l75_c7_221a]
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l75_c7_221a]
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l75_c7_221a]
signal result_vram_address_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l75_c7_221a]
signal result_vram_value_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l75_c7_221a]
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l76_c7_aba3]
signal BIN_OP_EQ_uxn_device_h_l76_c7_aba3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_aba3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l76_c3_ee01]
signal sprite_MUX_uxn_device_h_l76_c3_ee01_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_ee01_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_ee01_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_ee01_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l76_c3_ee01]
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l76_c3_ee01]
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l83_c11_1759]
signal BIN_OP_EQ_uxn_device_h_l83_c11_1759_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_1759_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_7b1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l83_c7_e9a6]
signal auto_advance_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l83_c7_e9a6]
signal y_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l83_c7_e9a6]
signal x_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l83_c7_e9a6]
signal vram_addr_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l83_c7_e9a6]
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l83_c7_e9a6]
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l83_c7_e9a6]
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l83_c7_e9a6]
signal result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l83_c7_e9a6]
signal result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l83_c7_e9a6]
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l84_c7_46a2]
signal BIN_OP_EQ_uxn_device_h_l84_c7_46a2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_46a2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l84_c3_53e9]
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l84_c3_53e9]
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_17f3]
signal BIN_OP_EQ_uxn_device_h_l90_c11_17f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_17f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_3c42]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_7b1a]
signal auto_advance_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l90_c7_7b1a]
signal y_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l90_c7_7b1a]
signal x_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l90_c7_7b1a]
signal vram_addr_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_7b1a]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l90_c7_7b1a]
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_7b1a]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_7b1a]
signal result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l90_c7_7b1a]
signal result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_7b1a]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_e20d]
signal BIN_OP_EQ_uxn_device_h_l91_c7_e20d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_e20d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l91_c3_684b]
signal x_MUX_uxn_device_h_l91_c3_684b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l91_c3_684b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_684b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_684b_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_684b]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_684b]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_6f47]
signal BIN_OP_EQ_uxn_device_h_l99_c11_6f47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_6f47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_1fa7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_3c42]
signal auto_advance_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l99_c7_3c42]
signal y_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l99_c7_3c42]
signal x_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l99_c7_3c42]
signal vram_addr_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_3c42]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l99_c7_3c42]
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_3c42]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_3c42]
signal result_vram_address_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_3c42]
signal result_vram_value_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_3c42]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_b1f8]
signal BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_da4c]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_da4c]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l106_c11_75de]
signal BIN_OP_EQ_uxn_device_h_l106_c11_75de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_75de_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_a624]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l106_c7_1fa7]
signal auto_advance_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l106_c7_1fa7]
signal y_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l106_c7_1fa7]
signal x_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l106_c7_1fa7]
signal vram_addr_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l106_c7_1fa7]
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l106_c7_1fa7]
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l106_c7_1fa7]
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l106_c7_1fa7]
signal result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l106_c7_1fa7]
signal result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l106_c7_1fa7]
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c7_0faa]
signal BIN_OP_EQ_uxn_device_h_l107_c7_0faa_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_0faa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l107_c3_a442]
signal x_MUX_uxn_device_h_l107_c3_a442_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c3_a442_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_a442_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_a442_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c3_a442]
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c3_a442]
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l108_c4_1c0c]
signal BIN_OP_OR_uxn_device_h_l108_c4_1c0c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_1c0c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_1c0c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_970f]
signal BIN_OP_EQ_uxn_device_h_l114_c11_970f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_970f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_cb41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_a624]
signal auto_advance_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l114_c7_a624]
signal y_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_a624]
signal vram_addr_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l114_c7_a624]
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l114_c7_a624]
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l114_c7_a624]
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l114_c7_a624]
signal result_vram_address_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l114_c7_a624]
signal result_vram_value_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l114_c7_a624]
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l115_c7_d1d0]
signal BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_f140]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l115_c3_f140]
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l121_c11_3aec]
signal BIN_OP_EQ_uxn_device_h_l121_c11_3aec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_3aec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_8f1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l121_c7_cb41]
signal auto_advance_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l121_c7_cb41]
signal y_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l121_c7_cb41]
signal vram_addr_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l121_c7_cb41]
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l121_c7_cb41]
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l121_c7_cb41]
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l121_c7_cb41]
signal result_vram_address_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l121_c7_cb41]
signal result_vram_value_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l121_c7_cb41]
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l122_c7_e8ec]
signal BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l122_c3_e3ae]
signal y_MUX_uxn_device_h_l122_c3_e3ae_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l122_c3_e3ae_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_e3ae_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_e3ae_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l122_c3_e3ae]
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l122_c3_e3ae]
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_9732]
signal BIN_OP_EQ_uxn_device_h_l130_c11_9732_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_9732_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_2eec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l130_c7_8f1b]
signal auto_advance_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l130_c7_8f1b]
signal y_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l130_c7_8f1b]
signal vram_addr_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l130_c7_8f1b]
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l130_c7_8f1b]
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l130_c7_8f1b]
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l130_c7_8f1b]
signal result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l130_c7_8f1b]
signal result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l130_c7_8f1b]
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c7_e8cf]
signal BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l131_c3_4a87]
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l131_c3_4a87]
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_fcb7]
signal BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_23e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l137_c7_2eec]
signal auto_advance_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l137_c7_2eec]
signal y_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l137_c7_2eec]
signal vram_addr_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l137_c7_2eec]
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l137_c7_2eec]
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l137_c7_2eec]
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l137_c7_2eec]
signal result_vram_address_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l137_c7_2eec]
signal result_vram_value_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l137_c7_2eec]
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c7_1ba0]
signal BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l138_c3_3609]
signal y_MUX_uxn_device_h_l138_c3_3609_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c3_3609_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_3609_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_3609_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l138_c3_3609]
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l138_c3_3609]
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l139_c4_078c]
signal BIN_OP_OR_uxn_device_h_l139_c4_078c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_078c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_078c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_93e8]
signal BIN_OP_EQ_uxn_device_h_l145_c11_93e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_93e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_2455]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_23e2]
signal auto_advance_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_23e2]
signal vram_addr_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l145_c7_23e2]
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l145_c7_23e2]
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l145_c7_23e2]
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l145_c7_23e2]
signal result_vram_address_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l145_c7_23e2]
signal result_vram_value_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l145_c7_23e2]
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l146_c7_ebc7]
signal BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l146_c3_ff7b]
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l146_c3_ff7b]
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_3e77]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c27_ae00]
signal BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l147_c27_3e5e]
signal BIN_OP_GT_uxn_device_h_l147_c27_3e5e_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_3e5e_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_3e5e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l147_c27_1768]
signal MUX_uxn_device_h_l147_c27_1768_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_1768_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_1768_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_1768_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l153_c11_0f80]
signal BIN_OP_EQ_uxn_device_h_l153_c11_0f80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_0f80_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_d3fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l153_c7_2455]
signal auto_advance_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l153_c7_2455]
signal vram_addr_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l153_c7_2455]
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l153_c7_2455]
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l153_c7_2455]
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l153_c7_2455]
signal result_vram_address_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l153_c7_2455]
signal result_vram_value_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l153_c7_2455]
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l154_c7_604c]
signal BIN_OP_EQ_uxn_device_h_l154_c7_604c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_604c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_7bc6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l154_c3_827a]
signal auto_advance_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l154_c3_827a]
signal vram_addr_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l154_c3_827a]
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l154_c3_827a]
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l154_c3_827a]
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l154_c3_827a]
signal result_vram_address_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l154_c3_827a]
signal result_vram_value_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l154_c3_827a]
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_db5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l160_c4_836a]
signal vram_addr_MUX_uxn_device_h_l160_c4_836a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_836a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_836a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_836a_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c4_836a]
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c4_836a]
signal result_vram_address_MUX_uxn_device_h_l160_c4_836a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_836a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_836a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_836a_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_200b]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l161_c18_3466]
signal BIN_OP_PLUS_uxn_device_h_l161_c18_3466_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_3466_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_3466_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l162_c5_da58]
signal BIN_OP_AND_uxn_device_h_l162_c5_da58_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_da58_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_da58_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l163_c21_e2a3]
signal BIN_OP_AND_uxn_device_h_l163_c21_e2a3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_e2a3_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_e2a3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l163_c21_80d8]
signal BIN_OP_GT_uxn_device_h_l163_c21_80d8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_80d8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_80d8_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l163_c21_620d]
signal MUX_uxn_device_h_l163_c21_620d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l163_c21_620d_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_620d_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_620d_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l163_c5_0572]
signal BIN_OP_OR_uxn_device_h_l163_c5_0572_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_0572_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_0572_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l164_c21_548a]
signal BIN_OP_AND_uxn_device_h_l164_c21_548a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_548a_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_548a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l164_c21_ed85]
signal BIN_OP_GT_uxn_device_h_l164_c21_ed85_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_ed85_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_ed85_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l164_c21_add7]
signal MUX_uxn_device_h_l164_c21_add7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l164_c21_add7_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_add7_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_add7_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l164_c5_5399]
signal BIN_OP_OR_uxn_device_h_l164_c5_5399_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_5399_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_5399_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l165_c5_1d3a]
signal BIN_OP_OR_uxn_device_h_l165_c5_1d3a_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_1d3a_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output : unsigned(31 downto 0);

-- printf_uxn_device_h_l168_c5_e8e3[uxn_device_h_l168_c5_e8e3]
signal printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg2 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg3 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg4 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_a5f7]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l171_c28_f7e9]
signal BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l178_c11_9a8b]
signal BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l178_c7_f2e3]
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l178_c7_f2e3]
signal result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l178_c7_f2e3]
signal result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l178_c7_f2e3]
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l179_c7_21f7]
signal BIN_OP_EQ_uxn_device_h_l179_c7_21f7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_21f7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l179_c3_94b6]
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l179_c3_94b6]
signal result_vram_address_MUX_uxn_device_h_l179_c3_94b6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_94b6_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l179_c3_94b6]
signal result_vram_value_MUX_uxn_device_h_l179_c3_94b6_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l179_c3_94b6_return_output : unsigned(1 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_1935( ref_toks_0 : device_out_result_t;
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
      base.vram_value := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_deo_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l40_c6_b5e1
BIN_OP_EQ_uxn_device_h_l40_c6_b5e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_left,
BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_right,
BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- color_MUX_uxn_device_h_l40_c2_6ba0
color_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l40_c2_6ba0_cond,
color_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
color_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
color_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- auto_advance_MUX_uxn_device_h_l40_c2_6ba0
auto_advance_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l40_c2_6ba0_cond,
auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
auto_advance_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- y_MUX_uxn_device_h_l40_c2_6ba0
y_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l40_c2_6ba0_cond,
y_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
y_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
y_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0
is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_cond,
is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- x_MUX_uxn_device_h_l40_c2_6ba0
x_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l40_c2_6ba0_cond,
x_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
x_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
x_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- sprite_MUX_uxn_device_h_l40_c2_6ba0
sprite_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l40_c2_6ba0_cond,
sprite_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
sprite_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
sprite_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- pixel_MUX_uxn_device_h_l40_c2_6ba0
pixel_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l40_c2_6ba0_cond,
pixel_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
pixel_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
pixel_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- vram_addr_MUX_uxn_device_h_l40_c2_6ba0
vram_addr_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l40_c2_6ba0_cond,
vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
vram_addr_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- layer_MUX_uxn_device_h_l40_c2_6ba0
layer_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l40_c2_6ba0_cond,
layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
layer_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0
result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_cond,
result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- result_vram_value_MUX_uxn_device_h_l40_c2_6ba0
result_vram_value_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_cond,
result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0
result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_cond,
result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0
result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_cond,
result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- result_vram_address_MUX_uxn_device_h_l40_c2_6ba0
result_vram_address_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_cond,
result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0
result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_cond,
result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0
result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_cond,
result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c7_3a1a
BIN_OP_EQ_uxn_device_h_l42_c7_3a1a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_left,
BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_right,
BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l42_c3_681b
result_is_deo_done_MUX_uxn_device_h_l42_c3_681b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_cond,
result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l42_c3_681b
result_device_ram_address_MUX_uxn_device_h_l42_c3_681b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_cond,
result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_return_output);

-- BIN_OP_EQ_uxn_device_h_l50_c11_6f52
BIN_OP_EQ_uxn_device_h_l50_c11_6f52 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l50_c11_6f52_left,
BIN_OP_EQ_uxn_device_h_l50_c11_6f52_right,
BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- color_MUX_uxn_device_h_l50_c7_b21d
color_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l50_c7_b21d_cond,
color_MUX_uxn_device_h_l50_c7_b21d_iftrue,
color_MUX_uxn_device_h_l50_c7_b21d_iffalse,
color_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- auto_advance_MUX_uxn_device_h_l50_c7_b21d
auto_advance_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l50_c7_b21d_cond,
auto_advance_MUX_uxn_device_h_l50_c7_b21d_iftrue,
auto_advance_MUX_uxn_device_h_l50_c7_b21d_iffalse,
auto_advance_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- y_MUX_uxn_device_h_l50_c7_b21d
y_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l50_c7_b21d_cond,
y_MUX_uxn_device_h_l50_c7_b21d_iftrue,
y_MUX_uxn_device_h_l50_c7_b21d_iffalse,
y_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- is_fill_mode_MUX_uxn_device_h_l50_c7_b21d
is_fill_mode_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_cond,
is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iftrue,
is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iffalse,
is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- x_MUX_uxn_device_h_l50_c7_b21d
x_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l50_c7_b21d_cond,
x_MUX_uxn_device_h_l50_c7_b21d_iftrue,
x_MUX_uxn_device_h_l50_c7_b21d_iffalse,
x_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- sprite_MUX_uxn_device_h_l50_c7_b21d
sprite_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l50_c7_b21d_cond,
sprite_MUX_uxn_device_h_l50_c7_b21d_iftrue,
sprite_MUX_uxn_device_h_l50_c7_b21d_iffalse,
sprite_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- pixel_MUX_uxn_device_h_l50_c7_b21d
pixel_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l50_c7_b21d_cond,
pixel_MUX_uxn_device_h_l50_c7_b21d_iftrue,
pixel_MUX_uxn_device_h_l50_c7_b21d_iffalse,
pixel_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- vram_addr_MUX_uxn_device_h_l50_c7_b21d
vram_addr_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l50_c7_b21d_cond,
vram_addr_MUX_uxn_device_h_l50_c7_b21d_iftrue,
vram_addr_MUX_uxn_device_h_l50_c7_b21d_iffalse,
vram_addr_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- layer_MUX_uxn_device_h_l50_c7_b21d
layer_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l50_c7_b21d_cond,
layer_MUX_uxn_device_h_l50_c7_b21d_iftrue,
layer_MUX_uxn_device_h_l50_c7_b21d_iffalse,
layer_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d
result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_cond,
result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d
result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_cond,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d
result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_cond,
result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- result_vram_address_MUX_uxn_device_h_l50_c7_b21d
result_vram_address_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l50_c7_b21d_cond,
result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue,
result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse,
result_vram_address_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- result_vram_value_MUX_uxn_device_h_l50_c7_b21d
result_vram_value_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l50_c7_b21d_cond,
result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iftrue,
result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iffalse,
result_vram_value_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d
result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_cond,
result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_return_output);

-- BIN_OP_EQ_uxn_device_h_l51_c7_3cd9
BIN_OP_EQ_uxn_device_h_l51_c7_3cd9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_left,
BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_right,
BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d
result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_cond,
result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d
result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_cond,
result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c11_5915
BIN_OP_EQ_uxn_device_h_l57_c11_5915 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c11_5915_left,
BIN_OP_EQ_uxn_device_h_l57_c11_5915_right,
BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_return_output);

-- color_MUX_uxn_device_h_l57_c7_c7bf
color_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l57_c7_c7bf_cond,
color_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
color_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
color_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- auto_advance_MUX_uxn_device_h_l57_c7_c7bf
auto_advance_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l57_c7_c7bf_cond,
auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
auto_advance_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- y_MUX_uxn_device_h_l57_c7_c7bf
y_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l57_c7_c7bf_cond,
y_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
y_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
y_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf
is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_cond,
is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- x_MUX_uxn_device_h_l57_c7_c7bf
x_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l57_c7_c7bf_cond,
x_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
x_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
x_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- sprite_MUX_uxn_device_h_l57_c7_c7bf
sprite_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l57_c7_c7bf_cond,
sprite_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
sprite_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
sprite_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- pixel_MUX_uxn_device_h_l57_c7_c7bf
pixel_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l57_c7_c7bf_cond,
pixel_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
pixel_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
pixel_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- vram_addr_MUX_uxn_device_h_l57_c7_c7bf
vram_addr_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l57_c7_c7bf_cond,
vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
vram_addr_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- layer_MUX_uxn_device_h_l57_c7_c7bf
layer_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l57_c7_c7bf_cond,
layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
layer_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf
result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_cond,
result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf
result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_cond,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf
result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_cond,
result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- result_vram_address_MUX_uxn_device_h_l57_c7_c7bf
result_vram_address_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_cond,
result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- result_vram_value_MUX_uxn_device_h_l57_c7_c7bf
result_vram_value_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_cond,
result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf
result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_cond,
result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_return_output);

-- BIN_OP_EQ_uxn_device_h_l58_c7_3367
BIN_OP_EQ_uxn_device_h_l58_c7_3367 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l58_c7_3367_left,
BIN_OP_EQ_uxn_device_h_l58_c7_3367_right,
BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output);

-- color_MUX_uxn_device_h_l58_c3_5d86
color_MUX_uxn_device_h_l58_c3_5d86 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l58_c3_5d86_cond,
color_MUX_uxn_device_h_l58_c3_5d86_iftrue,
color_MUX_uxn_device_h_l58_c3_5d86_iffalse,
color_MUX_uxn_device_h_l58_c3_5d86_return_output);

-- is_fill_mode_MUX_uxn_device_h_l58_c3_5d86
is_fill_mode_MUX_uxn_device_h_l58_c3_5d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_cond,
is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iftrue,
is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iffalse,
is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_return_output);

-- pixel_MUX_uxn_device_h_l58_c3_5d86
pixel_MUX_uxn_device_h_l58_c3_5d86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l58_c3_5d86_cond,
pixel_MUX_uxn_device_h_l58_c3_5d86_iftrue,
pixel_MUX_uxn_device_h_l58_c3_5d86_iffalse,
pixel_MUX_uxn_device_h_l58_c3_5d86_return_output);

-- layer_MUX_uxn_device_h_l58_c3_5d86
layer_MUX_uxn_device_h_l58_c3_5d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l58_c3_5d86_cond,
layer_MUX_uxn_device_h_l58_c3_5d86_iftrue,
layer_MUX_uxn_device_h_l58_c3_5d86_iffalse,
layer_MUX_uxn_device_h_l58_c3_5d86_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86
result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_cond,
result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iftrue,
result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iffalse,
result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86
result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_cond,
result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iftrue,
result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iffalse,
result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_return_output);

-- BIN_OP_AND_uxn_device_h_l61_c20_be06
BIN_OP_AND_uxn_device_h_l61_c20_be06 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l61_c20_be06_left,
BIN_OP_AND_uxn_device_h_l61_c20_be06_right,
BIN_OP_AND_uxn_device_h_l61_c20_be06_return_output);

-- BIN_OP_EQ_uxn_device_h_l61_c20_a157
BIN_OP_EQ_uxn_device_h_l61_c20_a157 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l61_c20_a157_left,
BIN_OP_EQ_uxn_device_h_l61_c20_a157_right,
BIN_OP_EQ_uxn_device_h_l61_c20_a157_return_output);

-- MUX_uxn_device_h_l61_c20_563d
MUX_uxn_device_h_l61_c20_563d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l61_c20_563d_cond,
MUX_uxn_device_h_l61_c20_563d_iftrue,
MUX_uxn_device_h_l61_c20_563d_iffalse,
MUX_uxn_device_h_l61_c20_563d_return_output);

-- BIN_OP_AND_uxn_device_h_l62_c13_5cd3
BIN_OP_AND_uxn_device_h_l62_c13_5cd3 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l62_c13_5cd3_left,
BIN_OP_AND_uxn_device_h_l62_c13_5cd3_right,
BIN_OP_AND_uxn_device_h_l62_c13_5cd3_return_output);

-- MUX_uxn_device_h_l62_c13_ce2b
MUX_uxn_device_h_l62_c13_ce2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l62_c13_ce2b_cond,
MUX_uxn_device_h_l62_c13_ce2b_iftrue,
MUX_uxn_device_h_l62_c13_ce2b_iffalse,
MUX_uxn_device_h_l62_c13_ce2b_return_output);

-- BIN_OP_EQ_uxn_device_h_l68_c11_7f86
BIN_OP_EQ_uxn_device_h_l68_c11_7f86 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l68_c11_7f86_left,
BIN_OP_EQ_uxn_device_h_l68_c11_7f86_right,
BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_return_output);

-- auto_advance_MUX_uxn_device_h_l68_c7_9347
auto_advance_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l68_c7_9347_cond,
auto_advance_MUX_uxn_device_h_l68_c7_9347_iftrue,
auto_advance_MUX_uxn_device_h_l68_c7_9347_iffalse,
auto_advance_MUX_uxn_device_h_l68_c7_9347_return_output);

-- y_MUX_uxn_device_h_l68_c7_9347
y_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l68_c7_9347_cond,
y_MUX_uxn_device_h_l68_c7_9347_iftrue,
y_MUX_uxn_device_h_l68_c7_9347_iffalse,
y_MUX_uxn_device_h_l68_c7_9347_return_output);

-- x_MUX_uxn_device_h_l68_c7_9347
x_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l68_c7_9347_cond,
x_MUX_uxn_device_h_l68_c7_9347_iftrue,
x_MUX_uxn_device_h_l68_c7_9347_iffalse,
x_MUX_uxn_device_h_l68_c7_9347_return_output);

-- sprite_MUX_uxn_device_h_l68_c7_9347
sprite_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l68_c7_9347_cond,
sprite_MUX_uxn_device_h_l68_c7_9347_iftrue,
sprite_MUX_uxn_device_h_l68_c7_9347_iffalse,
sprite_MUX_uxn_device_h_l68_c7_9347_return_output);

-- vram_addr_MUX_uxn_device_h_l68_c7_9347
vram_addr_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l68_c7_9347_cond,
vram_addr_MUX_uxn_device_h_l68_c7_9347_iftrue,
vram_addr_MUX_uxn_device_h_l68_c7_9347_iffalse,
vram_addr_MUX_uxn_device_h_l68_c7_9347_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l68_c7_9347
result_device_ram_address_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_cond,
result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iftrue,
result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iffalse,
result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347
result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_cond,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l68_c7_9347
result_is_vram_write_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_cond,
result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iftrue,
result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iffalse,
result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_return_output);

-- result_vram_address_MUX_uxn_device_h_l68_c7_9347
result_vram_address_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l68_c7_9347_cond,
result_vram_address_MUX_uxn_device_h_l68_c7_9347_iftrue,
result_vram_address_MUX_uxn_device_h_l68_c7_9347_iffalse,
result_vram_address_MUX_uxn_device_h_l68_c7_9347_return_output);

-- result_vram_value_MUX_uxn_device_h_l68_c7_9347
result_vram_value_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l68_c7_9347_cond,
result_vram_value_MUX_uxn_device_h_l68_c7_9347_iftrue,
result_vram_value_MUX_uxn_device_h_l68_c7_9347_iffalse,
result_vram_value_MUX_uxn_device_h_l68_c7_9347_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l68_c7_9347
result_is_deo_done_MUX_uxn_device_h_l68_c7_9347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_cond,
result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iftrue,
result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iffalse,
result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c7_511e
BIN_OP_EQ_uxn_device_h_l69_c7_511e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c7_511e_left,
BIN_OP_EQ_uxn_device_h_l69_c7_511e_right,
BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a
result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_cond,
result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a
result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_cond,
result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c11_fe0b
BIN_OP_EQ_uxn_device_h_l75_c11_fe0b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_left,
BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_right,
BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- auto_advance_MUX_uxn_device_h_l75_c7_221a
auto_advance_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l75_c7_221a_cond,
auto_advance_MUX_uxn_device_h_l75_c7_221a_iftrue,
auto_advance_MUX_uxn_device_h_l75_c7_221a_iffalse,
auto_advance_MUX_uxn_device_h_l75_c7_221a_return_output);

-- y_MUX_uxn_device_h_l75_c7_221a
y_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c7_221a_cond,
y_MUX_uxn_device_h_l75_c7_221a_iftrue,
y_MUX_uxn_device_h_l75_c7_221a_iffalse,
y_MUX_uxn_device_h_l75_c7_221a_return_output);

-- x_MUX_uxn_device_h_l75_c7_221a
x_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c7_221a_cond,
x_MUX_uxn_device_h_l75_c7_221a_iftrue,
x_MUX_uxn_device_h_l75_c7_221a_iffalse,
x_MUX_uxn_device_h_l75_c7_221a_return_output);

-- sprite_MUX_uxn_device_h_l75_c7_221a
sprite_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l75_c7_221a_cond,
sprite_MUX_uxn_device_h_l75_c7_221a_iftrue,
sprite_MUX_uxn_device_h_l75_c7_221a_iffalse,
sprite_MUX_uxn_device_h_l75_c7_221a_return_output);

-- vram_addr_MUX_uxn_device_h_l75_c7_221a
vram_addr_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l75_c7_221a_cond,
vram_addr_MUX_uxn_device_h_l75_c7_221a_iftrue,
vram_addr_MUX_uxn_device_h_l75_c7_221a_iffalse,
vram_addr_MUX_uxn_device_h_l75_c7_221a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l75_c7_221a
result_device_ram_address_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_cond,
result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a
result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_cond,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l75_c7_221a
result_is_vram_write_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_cond,
result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_return_output);

-- result_vram_address_MUX_uxn_device_h_l75_c7_221a
result_vram_address_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l75_c7_221a_cond,
result_vram_address_MUX_uxn_device_h_l75_c7_221a_iftrue,
result_vram_address_MUX_uxn_device_h_l75_c7_221a_iffalse,
result_vram_address_MUX_uxn_device_h_l75_c7_221a_return_output);

-- result_vram_value_MUX_uxn_device_h_l75_c7_221a
result_vram_value_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l75_c7_221a_cond,
result_vram_value_MUX_uxn_device_h_l75_c7_221a_iftrue,
result_vram_value_MUX_uxn_device_h_l75_c7_221a_iffalse,
result_vram_value_MUX_uxn_device_h_l75_c7_221a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l75_c7_221a
result_is_deo_done_MUX_uxn_device_h_l75_c7_221a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_cond,
result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_return_output);

-- BIN_OP_EQ_uxn_device_h_l76_c7_aba3
BIN_OP_EQ_uxn_device_h_l76_c7_aba3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l76_c7_aba3_left,
BIN_OP_EQ_uxn_device_h_l76_c7_aba3_right,
BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output);

-- sprite_MUX_uxn_device_h_l76_c3_ee01
sprite_MUX_uxn_device_h_l76_c3_ee01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l76_c3_ee01_cond,
sprite_MUX_uxn_device_h_l76_c3_ee01_iftrue,
sprite_MUX_uxn_device_h_l76_c3_ee01_iffalse,
sprite_MUX_uxn_device_h_l76_c3_ee01_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01
result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_cond,
result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iftrue,
result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iffalse,
result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01
result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_cond,
result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iftrue,
result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iffalse,
result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_return_output);

-- BIN_OP_EQ_uxn_device_h_l83_c11_1759
BIN_OP_EQ_uxn_device_h_l83_c11_1759 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l83_c11_1759_left,
BIN_OP_EQ_uxn_device_h_l83_c11_1759_right,
BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- auto_advance_MUX_uxn_device_h_l83_c7_e9a6
auto_advance_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l83_c7_e9a6_cond,
auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
auto_advance_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- y_MUX_uxn_device_h_l83_c7_e9a6
y_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l83_c7_e9a6_cond,
y_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
y_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
y_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- x_MUX_uxn_device_h_l83_c7_e9a6
x_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l83_c7_e9a6_cond,
x_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
x_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
x_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- vram_addr_MUX_uxn_device_h_l83_c7_e9a6
vram_addr_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l83_c7_e9a6_cond,
vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
vram_addr_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6
result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_cond,
result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6
result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_cond,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6
result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_cond,
result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- result_vram_address_MUX_uxn_device_h_l83_c7_e9a6
result_vram_address_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_cond,
result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- result_vram_value_MUX_uxn_device_h_l83_c7_e9a6
result_vram_value_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_cond,
result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6
result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_cond,
result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_return_output);

-- BIN_OP_EQ_uxn_device_h_l84_c7_46a2
BIN_OP_EQ_uxn_device_h_l84_c7_46a2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l84_c7_46a2_left,
BIN_OP_EQ_uxn_device_h_l84_c7_46a2_right,
BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9
result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_cond,
result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9
result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_cond,
result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_17f3
BIN_OP_EQ_uxn_device_h_l90_c11_17f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_17f3_left,
BIN_OP_EQ_uxn_device_h_l90_c11_17f3_right,
BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_7b1a
auto_advance_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_7b1a_cond,
auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- y_MUX_uxn_device_h_l90_c7_7b1a
y_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_7b1a_cond,
y_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
y_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
y_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- x_MUX_uxn_device_h_l90_c7_7b1a
x_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_7b1a_cond,
x_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
x_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
x_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- vram_addr_MUX_uxn_device_h_l90_c7_7b1a
vram_addr_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l90_c7_7b1a_cond,
vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
vram_addr_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a
result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_cond,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a
result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_7b1a
result_vram_address_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- result_vram_value_MUX_uxn_device_h_l90_c7_7b1a
result_vram_value_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_cond,
result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a
result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_e20d
BIN_OP_EQ_uxn_device_h_l91_c7_e20d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_e20d_left,
BIN_OP_EQ_uxn_device_h_l91_c7_e20d_right,
BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output);

-- x_MUX_uxn_device_h_l91_c3_684b
x_MUX_uxn_device_h_l91_c3_684b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l91_c3_684b_cond,
x_MUX_uxn_device_h_l91_c3_684b_iftrue,
x_MUX_uxn_device_h_l91_c3_684b_iffalse,
x_MUX_uxn_device_h_l91_c3_684b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_684b
result_device_ram_address_MUX_uxn_device_h_l91_c3_684b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_684b
result_is_deo_done_MUX_uxn_device_h_l91_c3_684b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_6f47
BIN_OP_EQ_uxn_device_h_l99_c11_6f47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_6f47_left,
BIN_OP_EQ_uxn_device_h_l99_c11_6f47_right,
BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_3c42
auto_advance_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_3c42_cond,
auto_advance_MUX_uxn_device_h_l99_c7_3c42_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_3c42_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- y_MUX_uxn_device_h_l99_c7_3c42
y_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_3c42_cond,
y_MUX_uxn_device_h_l99_c7_3c42_iftrue,
y_MUX_uxn_device_h_l99_c7_3c42_iffalse,
y_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- x_MUX_uxn_device_h_l99_c7_3c42
x_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_3c42_cond,
x_MUX_uxn_device_h_l99_c7_3c42_iftrue,
x_MUX_uxn_device_h_l99_c7_3c42_iffalse,
x_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- vram_addr_MUX_uxn_device_h_l99_c7_3c42
vram_addr_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l99_c7_3c42_cond,
vram_addr_MUX_uxn_device_h_l99_c7_3c42_iftrue,
vram_addr_MUX_uxn_device_h_l99_c7_3c42_iffalse,
vram_addr_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42
result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42
result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_cond,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42
result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_3c42
result_vram_address_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_3c42_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_3c42
result_vram_value_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_3c42_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42
result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_b1f8
BIN_OP_EQ_uxn_device_h_l100_c7_b1f8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_left,
BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_right,
BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c
result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c
result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_return_output);

-- BIN_OP_EQ_uxn_device_h_l106_c11_75de
BIN_OP_EQ_uxn_device_h_l106_c11_75de : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l106_c11_75de_left,
BIN_OP_EQ_uxn_device_h_l106_c11_75de_right,
BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_return_output);

-- auto_advance_MUX_uxn_device_h_l106_c7_1fa7
auto_advance_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l106_c7_1fa7_cond,
auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
auto_advance_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- y_MUX_uxn_device_h_l106_c7_1fa7
y_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l106_c7_1fa7_cond,
y_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
y_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
y_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- x_MUX_uxn_device_h_l106_c7_1fa7
x_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l106_c7_1fa7_cond,
x_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
x_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
x_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- vram_addr_MUX_uxn_device_h_l106_c7_1fa7
vram_addr_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l106_c7_1fa7_cond,
vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
vram_addr_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7
result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_cond,
result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_cond,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7
result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_cond,
result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- result_vram_address_MUX_uxn_device_h_l106_c7_1fa7
result_vram_address_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_cond,
result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- result_vram_value_MUX_uxn_device_h_l106_c7_1fa7
result_vram_value_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_cond,
result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7
result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_cond,
result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c7_0faa
BIN_OP_EQ_uxn_device_h_l107_c7_0faa : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c7_0faa_left,
BIN_OP_EQ_uxn_device_h_l107_c7_0faa_right,
BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output);

-- x_MUX_uxn_device_h_l107_c3_a442
x_MUX_uxn_device_h_l107_c3_a442 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c3_a442_cond,
x_MUX_uxn_device_h_l107_c3_a442_iftrue,
x_MUX_uxn_device_h_l107_c3_a442_iffalse,
x_MUX_uxn_device_h_l107_c3_a442_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c3_a442
result_device_ram_address_MUX_uxn_device_h_l107_c3_a442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c3_a442
result_is_deo_done_MUX_uxn_device_h_l107_c3_a442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_return_output);

-- BIN_OP_OR_uxn_device_h_l108_c4_1c0c
BIN_OP_OR_uxn_device_h_l108_c4_1c0c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l108_c4_1c0c_left,
BIN_OP_OR_uxn_device_h_l108_c4_1c0c_right,
BIN_OP_OR_uxn_device_h_l108_c4_1c0c_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_970f
BIN_OP_EQ_uxn_device_h_l114_c11_970f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_970f_left,
BIN_OP_EQ_uxn_device_h_l114_c11_970f_right,
BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_a624
auto_advance_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_a624_cond,
auto_advance_MUX_uxn_device_h_l114_c7_a624_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_a624_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_a624_return_output);

-- y_MUX_uxn_device_h_l114_c7_a624
y_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_a624_cond,
y_MUX_uxn_device_h_l114_c7_a624_iftrue,
y_MUX_uxn_device_h_l114_c7_a624_iffalse,
y_MUX_uxn_device_h_l114_c7_a624_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_a624
vram_addr_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_a624_cond,
vram_addr_MUX_uxn_device_h_l114_c7_a624_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_a624_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_a624_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l114_c7_a624
result_device_ram_address_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_cond,
result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iftrue,
result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iffalse,
result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_cond,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l114_c7_a624
result_is_vram_write_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_cond,
result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iftrue,
result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iffalse,
result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_return_output);

-- result_vram_address_MUX_uxn_device_h_l114_c7_a624
result_vram_address_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l114_c7_a624_cond,
result_vram_address_MUX_uxn_device_h_l114_c7_a624_iftrue,
result_vram_address_MUX_uxn_device_h_l114_c7_a624_iffalse,
result_vram_address_MUX_uxn_device_h_l114_c7_a624_return_output);

-- result_vram_value_MUX_uxn_device_h_l114_c7_a624
result_vram_value_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l114_c7_a624_cond,
result_vram_value_MUX_uxn_device_h_l114_c7_a624_iftrue,
result_vram_value_MUX_uxn_device_h_l114_c7_a624_iffalse,
result_vram_value_MUX_uxn_device_h_l114_c7_a624_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l114_c7_a624
result_is_deo_done_MUX_uxn_device_h_l114_c7_a624 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_cond,
result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iftrue,
result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iffalse,
result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_return_output);

-- BIN_OP_EQ_uxn_device_h_l115_c7_d1d0
BIN_OP_EQ_uxn_device_h_l115_c7_d1d0 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_left,
BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_right,
BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_f140
result_device_ram_address_MUX_uxn_device_h_l115_c3_f140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l115_c3_f140
result_is_deo_done_MUX_uxn_device_h_l115_c3_f140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_cond,
result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iftrue,
result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iffalse,
result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_return_output);

-- BIN_OP_EQ_uxn_device_h_l121_c11_3aec
BIN_OP_EQ_uxn_device_h_l121_c11_3aec : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l121_c11_3aec_left,
BIN_OP_EQ_uxn_device_h_l121_c11_3aec_right,
BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- auto_advance_MUX_uxn_device_h_l121_c7_cb41
auto_advance_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l121_c7_cb41_cond,
auto_advance_MUX_uxn_device_h_l121_c7_cb41_iftrue,
auto_advance_MUX_uxn_device_h_l121_c7_cb41_iffalse,
auto_advance_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- y_MUX_uxn_device_h_l121_c7_cb41
y_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l121_c7_cb41_cond,
y_MUX_uxn_device_h_l121_c7_cb41_iftrue,
y_MUX_uxn_device_h_l121_c7_cb41_iffalse,
y_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- vram_addr_MUX_uxn_device_h_l121_c7_cb41
vram_addr_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l121_c7_cb41_cond,
vram_addr_MUX_uxn_device_h_l121_c7_cb41_iftrue,
vram_addr_MUX_uxn_device_h_l121_c7_cb41_iffalse,
vram_addr_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41
result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_cond,
result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue,
result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse,
result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41
result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_cond,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41
result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_cond,
result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iftrue,
result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iffalse,
result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- result_vram_address_MUX_uxn_device_h_l121_c7_cb41
result_vram_address_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l121_c7_cb41_cond,
result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue,
result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse,
result_vram_address_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- result_vram_value_MUX_uxn_device_h_l121_c7_cb41
result_vram_value_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l121_c7_cb41_cond,
result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iftrue,
result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iffalse,
result_vram_value_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41
result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_cond,
result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iftrue,
result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iffalse,
result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_return_output);

-- BIN_OP_EQ_uxn_device_h_l122_c7_e8ec
BIN_OP_EQ_uxn_device_h_l122_c7_e8ec : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_left,
BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_right,
BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output);

-- y_MUX_uxn_device_h_l122_c3_e3ae
y_MUX_uxn_device_h_l122_c3_e3ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l122_c3_e3ae_cond,
y_MUX_uxn_device_h_l122_c3_e3ae_iftrue,
y_MUX_uxn_device_h_l122_c3_e3ae_iffalse,
y_MUX_uxn_device_h_l122_c3_e3ae_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae
result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_cond,
result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iftrue,
result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iffalse,
result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae
result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_cond,
result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iftrue,
result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iffalse,
result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c11_9732
BIN_OP_EQ_uxn_device_h_l130_c11_9732 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_9732_left,
BIN_OP_EQ_uxn_device_h_l130_c11_9732_right,
BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- auto_advance_MUX_uxn_device_h_l130_c7_8f1b
auto_advance_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l130_c7_8f1b_cond,
auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
auto_advance_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- y_MUX_uxn_device_h_l130_c7_8f1b
y_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c7_8f1b_cond,
y_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
y_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
y_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- vram_addr_MUX_uxn_device_h_l130_c7_8f1b
vram_addr_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l130_c7_8f1b_cond,
vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
vram_addr_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b
result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_cond,
result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_cond,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b
result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_cond,
result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- result_vram_address_MUX_uxn_device_h_l130_c7_8f1b
result_vram_address_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_cond,
result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- result_vram_value_MUX_uxn_device_h_l130_c7_8f1b
result_vram_value_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_cond,
result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b
result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_cond,
result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_return_output);

-- BIN_OP_EQ_uxn_device_h_l131_c7_e8cf
BIN_OP_EQ_uxn_device_h_l131_c7_e8cf : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_left,
BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_right,
BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87
result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_cond,
result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iftrue,
result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iffalse,
result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87
result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_cond,
result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iftrue,
result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iffalse,
result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_fcb7
BIN_OP_EQ_uxn_device_h_l137_c11_fcb7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_left,
BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_right,
BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- auto_advance_MUX_uxn_device_h_l137_c7_2eec
auto_advance_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l137_c7_2eec_cond,
auto_advance_MUX_uxn_device_h_l137_c7_2eec_iftrue,
auto_advance_MUX_uxn_device_h_l137_c7_2eec_iffalse,
auto_advance_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- y_MUX_uxn_device_h_l137_c7_2eec
y_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c7_2eec_cond,
y_MUX_uxn_device_h_l137_c7_2eec_iftrue,
y_MUX_uxn_device_h_l137_c7_2eec_iffalse,
y_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- vram_addr_MUX_uxn_device_h_l137_c7_2eec
vram_addr_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l137_c7_2eec_cond,
vram_addr_MUX_uxn_device_h_l137_c7_2eec_iftrue,
vram_addr_MUX_uxn_device_h_l137_c7_2eec_iffalse,
vram_addr_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec
result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_cond,
result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue,
result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse,
result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec
result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_cond,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec
result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_cond,
result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iftrue,
result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iffalse,
result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- result_vram_address_MUX_uxn_device_h_l137_c7_2eec
result_vram_address_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l137_c7_2eec_cond,
result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue,
result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse,
result_vram_address_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- result_vram_value_MUX_uxn_device_h_l137_c7_2eec
result_vram_value_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l137_c7_2eec_cond,
result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iftrue,
result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iffalse,
result_vram_value_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec
result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_cond,
result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iftrue,
result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iffalse,
result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c7_1ba0
BIN_OP_EQ_uxn_device_h_l138_c7_1ba0 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_left,
BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_right,
BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output);

-- y_MUX_uxn_device_h_l138_c3_3609
y_MUX_uxn_device_h_l138_c3_3609 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c3_3609_cond,
y_MUX_uxn_device_h_l138_c3_3609_iftrue,
y_MUX_uxn_device_h_l138_c3_3609_iffalse,
y_MUX_uxn_device_h_l138_c3_3609_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l138_c3_3609
result_device_ram_address_MUX_uxn_device_h_l138_c3_3609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_cond,
result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iftrue,
result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iffalse,
result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l138_c3_3609
result_is_deo_done_MUX_uxn_device_h_l138_c3_3609 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_cond,
result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iftrue,
result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iffalse,
result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_return_output);

-- BIN_OP_OR_uxn_device_h_l139_c4_078c
BIN_OP_OR_uxn_device_h_l139_c4_078c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l139_c4_078c_left,
BIN_OP_OR_uxn_device_h_l139_c4_078c_right,
BIN_OP_OR_uxn_device_h_l139_c4_078c_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_93e8
BIN_OP_EQ_uxn_device_h_l145_c11_93e8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_93e8_left,
BIN_OP_EQ_uxn_device_h_l145_c11_93e8_right,
BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_23e2
auto_advance_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_23e2_cond,
auto_advance_MUX_uxn_device_h_l145_c7_23e2_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_23e2_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_23e2
vram_addr_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_23e2_cond,
vram_addr_MUX_uxn_device_h_l145_c7_23e2_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_23e2_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2
result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_cond,
result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2
result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_cond,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2
result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_cond,
result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- result_vram_address_MUX_uxn_device_h_l145_c7_23e2
result_vram_address_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l145_c7_23e2_cond,
result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue,
result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse,
result_vram_address_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- result_vram_value_MUX_uxn_device_h_l145_c7_23e2
result_vram_value_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l145_c7_23e2_cond,
result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iftrue,
result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iffalse,
result_vram_value_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2
result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_cond,
result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_return_output);

-- BIN_OP_EQ_uxn_device_h_l146_c7_ebc7
BIN_OP_EQ_uxn_device_h_l146_c7_ebc7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_left,
BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_right,
BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b
result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_cond,
result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b
result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_cond,
result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c27_ae00
BIN_OP_PLUS_uxn_device_h_l147_c27_ae00 : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_left,
BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_right,
BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_return_output);

-- BIN_OP_GT_uxn_device_h_l147_c27_3e5e
BIN_OP_GT_uxn_device_h_l147_c27_3e5e : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l147_c27_3e5e_left,
BIN_OP_GT_uxn_device_h_l147_c27_3e5e_right,
BIN_OP_GT_uxn_device_h_l147_c27_3e5e_return_output);

-- MUX_uxn_device_h_l147_c27_1768
MUX_uxn_device_h_l147_c27_1768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c27_1768_cond,
MUX_uxn_device_h_l147_c27_1768_iftrue,
MUX_uxn_device_h_l147_c27_1768_iffalse,
MUX_uxn_device_h_l147_c27_1768_return_output);

-- BIN_OP_EQ_uxn_device_h_l153_c11_0f80
BIN_OP_EQ_uxn_device_h_l153_c11_0f80 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l153_c11_0f80_left,
BIN_OP_EQ_uxn_device_h_l153_c11_0f80_right,
BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_return_output);

-- auto_advance_MUX_uxn_device_h_l153_c7_2455
auto_advance_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l153_c7_2455_cond,
auto_advance_MUX_uxn_device_h_l153_c7_2455_iftrue,
auto_advance_MUX_uxn_device_h_l153_c7_2455_iffalse,
auto_advance_MUX_uxn_device_h_l153_c7_2455_return_output);

-- vram_addr_MUX_uxn_device_h_l153_c7_2455
vram_addr_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l153_c7_2455_cond,
vram_addr_MUX_uxn_device_h_l153_c7_2455_iftrue,
vram_addr_MUX_uxn_device_h_l153_c7_2455_iffalse,
vram_addr_MUX_uxn_device_h_l153_c7_2455_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l153_c7_2455
result_device_ram_address_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_cond,
result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iftrue,
result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iffalse,
result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455
result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_cond,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l153_c7_2455
result_is_vram_write_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_cond,
result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iftrue,
result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iffalse,
result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_return_output);

-- result_vram_address_MUX_uxn_device_h_l153_c7_2455
result_vram_address_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l153_c7_2455_cond,
result_vram_address_MUX_uxn_device_h_l153_c7_2455_iftrue,
result_vram_address_MUX_uxn_device_h_l153_c7_2455_iffalse,
result_vram_address_MUX_uxn_device_h_l153_c7_2455_return_output);

-- result_vram_value_MUX_uxn_device_h_l153_c7_2455
result_vram_value_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l153_c7_2455_cond,
result_vram_value_MUX_uxn_device_h_l153_c7_2455_iftrue,
result_vram_value_MUX_uxn_device_h_l153_c7_2455_iffalse,
result_vram_value_MUX_uxn_device_h_l153_c7_2455_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l153_c7_2455
result_is_deo_done_MUX_uxn_device_h_l153_c7_2455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_cond,
result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iftrue,
result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iffalse,
result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_return_output);

-- BIN_OP_EQ_uxn_device_h_l154_c7_604c
BIN_OP_EQ_uxn_device_h_l154_c7_604c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l154_c7_604c_left,
BIN_OP_EQ_uxn_device_h_l154_c7_604c_right,
BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_return_output);

-- auto_advance_MUX_uxn_device_h_l154_c3_827a
auto_advance_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l154_c3_827a_cond,
auto_advance_MUX_uxn_device_h_l154_c3_827a_iftrue,
auto_advance_MUX_uxn_device_h_l154_c3_827a_iffalse,
auto_advance_MUX_uxn_device_h_l154_c3_827a_return_output);

-- vram_addr_MUX_uxn_device_h_l154_c3_827a
vram_addr_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l154_c3_827a_cond,
vram_addr_MUX_uxn_device_h_l154_c3_827a_iftrue,
vram_addr_MUX_uxn_device_h_l154_c3_827a_iffalse,
vram_addr_MUX_uxn_device_h_l154_c3_827a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l154_c3_827a
result_device_ram_address_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_cond,
result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a
result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_cond,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l154_c3_827a
result_is_vram_write_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_cond,
result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_return_output);

-- result_vram_address_MUX_uxn_device_h_l154_c3_827a
result_vram_address_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l154_c3_827a_cond,
result_vram_address_MUX_uxn_device_h_l154_c3_827a_iftrue,
result_vram_address_MUX_uxn_device_h_l154_c3_827a_iffalse,
result_vram_address_MUX_uxn_device_h_l154_c3_827a_return_output);

-- result_vram_value_MUX_uxn_device_h_l154_c3_827a
result_vram_value_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l154_c3_827a_cond,
result_vram_value_MUX_uxn_device_h_l154_c3_827a_iftrue,
result_vram_value_MUX_uxn_device_h_l154_c3_827a_iffalse,
result_vram_value_MUX_uxn_device_h_l154_c3_827a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l154_c3_827a
result_is_deo_done_MUX_uxn_device_h_l154_c3_827a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_cond,
result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_return_output);

-- vram_addr_MUX_uxn_device_h_l160_c4_836a
vram_addr_MUX_uxn_device_h_l160_c4_836a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l160_c4_836a_cond,
vram_addr_MUX_uxn_device_h_l160_c4_836a_iftrue,
vram_addr_MUX_uxn_device_h_l160_c4_836a_iffalse,
vram_addr_MUX_uxn_device_h_l160_c4_836a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c4_836a
result_is_vram_write_MUX_uxn_device_h_l160_c4_836a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c4_836a
result_vram_address_MUX_uxn_device_h_l160_c4_836a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c4_836a_cond,
result_vram_address_MUX_uxn_device_h_l160_c4_836a_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c4_836a_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c4_836a_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l161_c18_3466
BIN_OP_PLUS_uxn_device_h_l161_c18_3466 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l161_c18_3466_left,
BIN_OP_PLUS_uxn_device_h_l161_c18_3466_right,
BIN_OP_PLUS_uxn_device_h_l161_c18_3466_return_output);

-- BIN_OP_AND_uxn_device_h_l162_c5_da58
BIN_OP_AND_uxn_device_h_l162_c5_da58 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l162_c5_da58_left,
BIN_OP_AND_uxn_device_h_l162_c5_da58_right,
BIN_OP_AND_uxn_device_h_l162_c5_da58_return_output);

-- BIN_OP_AND_uxn_device_h_l163_c21_e2a3
BIN_OP_AND_uxn_device_h_l163_c21_e2a3 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l163_c21_e2a3_left,
BIN_OP_AND_uxn_device_h_l163_c21_e2a3_right,
BIN_OP_AND_uxn_device_h_l163_c21_e2a3_return_output);

-- BIN_OP_GT_uxn_device_h_l163_c21_80d8
BIN_OP_GT_uxn_device_h_l163_c21_80d8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l163_c21_80d8_left,
BIN_OP_GT_uxn_device_h_l163_c21_80d8_right,
BIN_OP_GT_uxn_device_h_l163_c21_80d8_return_output);

-- MUX_uxn_device_h_l163_c21_620d
MUX_uxn_device_h_l163_c21_620d : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l163_c21_620d_cond,
MUX_uxn_device_h_l163_c21_620d_iftrue,
MUX_uxn_device_h_l163_c21_620d_iffalse,
MUX_uxn_device_h_l163_c21_620d_return_output);

-- BIN_OP_OR_uxn_device_h_l163_c5_0572
BIN_OP_OR_uxn_device_h_l163_c5_0572 : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l163_c5_0572_left,
BIN_OP_OR_uxn_device_h_l163_c5_0572_right,
BIN_OP_OR_uxn_device_h_l163_c5_0572_return_output);

-- BIN_OP_AND_uxn_device_h_l164_c21_548a
BIN_OP_AND_uxn_device_h_l164_c21_548a : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l164_c21_548a_left,
BIN_OP_AND_uxn_device_h_l164_c21_548a_right,
BIN_OP_AND_uxn_device_h_l164_c21_548a_return_output);

-- BIN_OP_GT_uxn_device_h_l164_c21_ed85
BIN_OP_GT_uxn_device_h_l164_c21_ed85 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l164_c21_ed85_left,
BIN_OP_GT_uxn_device_h_l164_c21_ed85_right,
BIN_OP_GT_uxn_device_h_l164_c21_ed85_return_output);

-- MUX_uxn_device_h_l164_c21_add7
MUX_uxn_device_h_l164_c21_add7 : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l164_c21_add7_cond,
MUX_uxn_device_h_l164_c21_add7_iftrue,
MUX_uxn_device_h_l164_c21_add7_iffalse,
MUX_uxn_device_h_l164_c21_add7_return_output);

-- BIN_OP_OR_uxn_device_h_l164_c5_5399
BIN_OP_OR_uxn_device_h_l164_c5_5399 : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l164_c5_5399_left,
BIN_OP_OR_uxn_device_h_l164_c5_5399_right,
BIN_OP_OR_uxn_device_h_l164_c5_5399_return_output);

-- BIN_OP_OR_uxn_device_h_l165_c5_1d3a
BIN_OP_OR_uxn_device_h_l165_c5_1d3a : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l165_c5_1d3a_left,
BIN_OP_OR_uxn_device_h_l165_c5_1d3a_right,
BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output);

-- printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3
printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3 : entity work.printf_uxn_device_h_l168_c5_e8e3_0CLK_de264c78 port map (
printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_CLOCK_ENABLE,
printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg0,
printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg1,
printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg2,
printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg3,
printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg4);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_return_output);

-- BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9
BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_left,
BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_right,
BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_return_output);

-- BIN_OP_EQ_uxn_device_h_l178_c11_9a8b
BIN_OP_EQ_uxn_device_h_l178_c11_9a8b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_left,
BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_right,
BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3
result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_cond,
result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iftrue,
result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iffalse,
result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_return_output);

-- result_vram_address_MUX_uxn_device_h_l178_c7_f2e3
result_vram_address_MUX_uxn_device_h_l178_c7_f2e3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_cond,
result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iftrue,
result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iffalse,
result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_return_output);

-- result_vram_value_MUX_uxn_device_h_l178_c7_f2e3
result_vram_value_MUX_uxn_device_h_l178_c7_f2e3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_cond,
result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iftrue,
result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iffalse,
result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3
result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_cond,
result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_return_output);

-- BIN_OP_EQ_uxn_device_h_l179_c7_21f7
BIN_OP_EQ_uxn_device_h_l179_c7_21f7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l179_c7_21f7_left,
BIN_OP_EQ_uxn_device_h_l179_c7_21f7_right,
BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6
result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_cond,
result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_return_output);

-- result_vram_address_MUX_uxn_device_h_l179_c3_94b6
result_vram_address_MUX_uxn_device_h_l179_c3_94b6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l179_c3_94b6_cond,
result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iftrue,
result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iffalse,
result_vram_address_MUX_uxn_device_h_l179_c3_94b6_return_output);

-- result_vram_value_MUX_uxn_device_h_l179_c3_94b6
result_vram_value_MUX_uxn_device_h_l179_c3_94b6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l179_c3_94b6_cond,
result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iftrue,
result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iffalse,
result_vram_value_MUX_uxn_device_h_l179_c3_94b6_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_x,
CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output);



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
 BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_return_output,
 color_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 auto_advance_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 y_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 x_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 sprite_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 pixel_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 vram_addr_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 layer_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_return_output,
 BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 color_MUX_uxn_device_h_l50_c7_b21d_return_output,
 auto_advance_MUX_uxn_device_h_l50_c7_b21d_return_output,
 y_MUX_uxn_device_h_l50_c7_b21d_return_output,
 is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_return_output,
 x_MUX_uxn_device_h_l50_c7_b21d_return_output,
 sprite_MUX_uxn_device_h_l50_c7_b21d_return_output,
 pixel_MUX_uxn_device_h_l50_c7_b21d_return_output,
 vram_addr_MUX_uxn_device_h_l50_c7_b21d_return_output,
 layer_MUX_uxn_device_h_l50_c7_b21d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_return_output,
 result_vram_address_MUX_uxn_device_h_l50_c7_b21d_return_output,
 result_vram_value_MUX_uxn_device_h_l50_c7_b21d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_return_output,
 BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_return_output,
 color_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 auto_advance_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 y_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 x_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 sprite_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 pixel_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 vram_addr_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 layer_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_return_output,
 BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output,
 color_MUX_uxn_device_h_l58_c3_5d86_return_output,
 is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_return_output,
 pixel_MUX_uxn_device_h_l58_c3_5d86_return_output,
 layer_MUX_uxn_device_h_l58_c3_5d86_return_output,
 result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_return_output,
 result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_return_output,
 BIN_OP_AND_uxn_device_h_l61_c20_be06_return_output,
 BIN_OP_EQ_uxn_device_h_l61_c20_a157_return_output,
 MUX_uxn_device_h_l61_c20_563d_return_output,
 BIN_OP_AND_uxn_device_h_l62_c13_5cd3_return_output,
 MUX_uxn_device_h_l62_c13_ce2b_return_output,
 BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_return_output,
 auto_advance_MUX_uxn_device_h_l68_c7_9347_return_output,
 y_MUX_uxn_device_h_l68_c7_9347_return_output,
 x_MUX_uxn_device_h_l68_c7_9347_return_output,
 sprite_MUX_uxn_device_h_l68_c7_9347_return_output,
 vram_addr_MUX_uxn_device_h_l68_c7_9347_return_output,
 result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_return_output,
 result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_return_output,
 result_vram_address_MUX_uxn_device_h_l68_c7_9347_return_output,
 result_vram_value_MUX_uxn_device_h_l68_c7_9347_return_output,
 result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 auto_advance_MUX_uxn_device_h_l75_c7_221a_return_output,
 y_MUX_uxn_device_h_l75_c7_221a_return_output,
 x_MUX_uxn_device_h_l75_c7_221a_return_output,
 sprite_MUX_uxn_device_h_l75_c7_221a_return_output,
 vram_addr_MUX_uxn_device_h_l75_c7_221a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_return_output,
 result_vram_address_MUX_uxn_device_h_l75_c7_221a_return_output,
 result_vram_value_MUX_uxn_device_h_l75_c7_221a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_return_output,
 BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output,
 sprite_MUX_uxn_device_h_l76_c3_ee01_return_output,
 result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_return_output,
 result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_return_output,
 BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 auto_advance_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 y_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 x_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 vram_addr_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_return_output,
 BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 y_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 x_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 vram_addr_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output,
 x_MUX_uxn_device_h_l91_c3_684b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_3c42_return_output,
 y_MUX_uxn_device_h_l99_c7_3c42_return_output,
 x_MUX_uxn_device_h_l99_c7_3c42_return_output,
 vram_addr_MUX_uxn_device_h_l99_c7_3c42_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_3c42_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_3c42_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_return_output,
 BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_return_output,
 auto_advance_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 y_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 x_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 vram_addr_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output,
 x_MUX_uxn_device_h_l107_c3_a442_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_return_output,
 BIN_OP_OR_uxn_device_h_l108_c4_1c0c_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_a624_return_output,
 y_MUX_uxn_device_h_l114_c7_a624_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_a624_return_output,
 result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_return_output,
 result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_return_output,
 result_vram_address_MUX_uxn_device_h_l114_c7_a624_return_output,
 result_vram_value_MUX_uxn_device_h_l114_c7_a624_return_output,
 result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_return_output,
 BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_return_output,
 result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_return_output,
 BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 auto_advance_MUX_uxn_device_h_l121_c7_cb41_return_output,
 y_MUX_uxn_device_h_l121_c7_cb41_return_output,
 vram_addr_MUX_uxn_device_h_l121_c7_cb41_return_output,
 result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_return_output,
 result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_return_output,
 result_vram_address_MUX_uxn_device_h_l121_c7_cb41_return_output,
 result_vram_value_MUX_uxn_device_h_l121_c7_cb41_return_output,
 result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_return_output,
 BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output,
 y_MUX_uxn_device_h_l122_c3_e3ae_return_output,
 result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_return_output,
 result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_return_output,
 auto_advance_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 y_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 vram_addr_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_return_output,
 result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_return_output,
 auto_advance_MUX_uxn_device_h_l137_c7_2eec_return_output,
 y_MUX_uxn_device_h_l137_c7_2eec_return_output,
 vram_addr_MUX_uxn_device_h_l137_c7_2eec_return_output,
 result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_return_output,
 result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_return_output,
 result_vram_address_MUX_uxn_device_h_l137_c7_2eec_return_output,
 result_vram_value_MUX_uxn_device_h_l137_c7_2eec_return_output,
 result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output,
 y_MUX_uxn_device_h_l138_c3_3609_return_output,
 result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_return_output,
 result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_return_output,
 BIN_OP_OR_uxn_device_h_l139_c4_078c_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_23e2_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_23e2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_return_output,
 result_vram_address_MUX_uxn_device_h_l145_c7_23e2_return_output,
 result_vram_value_MUX_uxn_device_h_l145_c7_23e2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_return_output,
 BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_return_output,
 BIN_OP_GT_uxn_device_h_l147_c27_3e5e_return_output,
 MUX_uxn_device_h_l147_c27_1768_return_output,
 BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_return_output,
 auto_advance_MUX_uxn_device_h_l153_c7_2455_return_output,
 vram_addr_MUX_uxn_device_h_l153_c7_2455_return_output,
 result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_return_output,
 result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_return_output,
 result_vram_address_MUX_uxn_device_h_l153_c7_2455_return_output,
 result_vram_value_MUX_uxn_device_h_l153_c7_2455_return_output,
 result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_return_output,
 BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_return_output,
 auto_advance_MUX_uxn_device_h_l154_c3_827a_return_output,
 vram_addr_MUX_uxn_device_h_l154_c3_827a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_return_output,
 result_vram_address_MUX_uxn_device_h_l154_c3_827a_return_output,
 result_vram_value_MUX_uxn_device_h_l154_c3_827a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_return_output,
 vram_addr_MUX_uxn_device_h_l160_c4_836a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c4_836a_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_return_output,
 BIN_OP_PLUS_uxn_device_h_l161_c18_3466_return_output,
 BIN_OP_AND_uxn_device_h_l162_c5_da58_return_output,
 BIN_OP_AND_uxn_device_h_l163_c21_e2a3_return_output,
 BIN_OP_GT_uxn_device_h_l163_c21_80d8_return_output,
 MUX_uxn_device_h_l163_c21_620d_return_output,
 BIN_OP_OR_uxn_device_h_l163_c5_0572_return_output,
 BIN_OP_AND_uxn_device_h_l164_c21_548a_return_output,
 BIN_OP_GT_uxn_device_h_l164_c21_ed85_return_output,
 MUX_uxn_device_h_l164_c21_add7_return_output,
 BIN_OP_OR_uxn_device_h_l164_c5_5399_return_output,
 BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_return_output,
 BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_return_output,
 BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_return_output,
 result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_return_output,
 result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_return_output,
 BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_return_output,
 result_vram_address_MUX_uxn_device_h_l179_c3_94b6_return_output,
 result_vram_value_MUX_uxn_device_h_l179_c3_94b6_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l41_c3_62d8 : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l44_c4_2817 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l52_c4_49d6 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l63_c4_64a7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_a00d_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_563d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_563d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_563d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_563d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_ce2b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_ce2b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_ce2b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_ce2b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l70_c4_2b8e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l78_c4_efc8 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_25f6 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_684b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_684b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_684b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_684b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_85d7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l101_c4_fef5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_a442_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_a442_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_a442_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_a442_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l109_c4_9d75 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l116_c4_7f9f : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_e3ae_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_e3ae_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_e3ae_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_e3ae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l125_c4_9cd5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l132_c4_2196 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3609_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3609_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3609_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_3609_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l140_c4_89fc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l148_c4_6b18 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_1768_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_1768_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_1768_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_1768_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l156_c4_9c57 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iffalse : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l171_c5_878b : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l161_c5_5f76 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_620d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_620d_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_620d_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_620d_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_add7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_add7_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_add7_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_add7_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_8b37_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l182_c4_f2ab : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l183_c4_8c4b : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l40_l42_DUPLICATE_aace_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l123_l139_DUPLICATE_f73f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_ab97_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8689_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1935_uxn_device_h_l32_l192_DUPLICATE_52a9_return_output : device_out_result_t;
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
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l147_c27_1768_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l116_c4_7f9f := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iftrue := VAR_result_device_ram_address_uxn_device_h_l116_c4_7f9f;
     VAR_MUX_uxn_device_h_l61_c20_563d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_85d7 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_85d7;
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_right := to_unsigned(64, 7);
     VAR_MUX_uxn_device_h_l163_c21_620d_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_right := to_unsigned(9, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_right := to_unsigned(400, 32);
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l70_c4_2b8e := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iftrue := VAR_result_device_ram_address_uxn_device_h_l70_c4_2b8e;
     VAR_result_device_ram_address_uxn_device_h_l44_c4_2817 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iftrue := VAR_result_device_ram_address_uxn_device_h_l44_c4_2817;
     VAR_result_device_ram_address_uxn_device_h_l78_c4_efc8 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iftrue := VAR_result_device_ram_address_uxn_device_h_l78_c4_efc8;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l147_c27_1768_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_right := to_unsigned(16, 5);
     VAR_MUX_uxn_device_h_l61_c20_563d_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l125_c4_9cd5 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iftrue := VAR_result_device_ram_address_uxn_device_h_l125_c4_9cd5;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_right := unsigned'(X"f0000000");
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l63_c4_64a7 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iftrue := VAR_result_device_ram_address_uxn_device_h_l63_c4_64a7;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l101_c4_fef5 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iftrue := VAR_result_device_ram_address_uxn_device_h_l101_c4_fef5;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_right := to_unsigned(400, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_right := to_unsigned(128, 8);
     VAR_result_device_ram_address_uxn_device_h_l85_c4_25f6 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_25f6;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_right := to_unsigned(14, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_right := to_unsigned(143999, 18);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l62_c13_ce2b_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l109_c4_9d75 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iftrue := VAR_result_device_ram_address_uxn_device_h_l109_c4_9d75;
     VAR_result_vram_address_uxn_device_h_l182_c4_f2ab := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iftrue := VAR_result_vram_address_uxn_device_h_l182_c4_f2ab;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_right := to_unsigned(14, 4);
     VAR_vram_addr_uxn_device_h_l41_c3_62d8 := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_vram_addr_uxn_device_h_l41_c3_62d8;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l156_c4_9c57 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iftrue := VAR_result_device_ram_address_uxn_device_h_l156_c4_9c57;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_right := to_unsigned(400, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_right := to_unsigned(11, 4);
     VAR_result_device_ram_address_uxn_device_h_l140_c4_89fc := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iftrue := VAR_result_device_ram_address_uxn_device_h_l140_c4_89fc;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_right := to_unsigned(32, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_right := to_unsigned(14, 4);
     VAR_result_vram_value_uxn_device_h_l183_c4_8c4b := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iftrue := VAR_result_vram_value_uxn_device_h_l183_c4_8c4b;
     VAR_result_device_ram_address_uxn_device_h_l148_c4_6b18 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iftrue := VAR_result_device_ram_address_uxn_device_h_l148_c4_6b18;
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l163_c21_620d_iftrue := to_unsigned(1048576, 21);
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_device_h_l164_c21_add7_iftrue := to_unsigned(2097152, 22);
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_right := to_unsigned(8, 4);
     VAR_result_device_ram_address_uxn_device_h_l132_c4_2196 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iftrue := VAR_result_device_ram_address_uxn_device_h_l132_c4_2196;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_right := to_unsigned(5, 3);
     VAR_MUX_uxn_device_h_l62_c13_ce2b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l164_c21_add7_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_right := to_unsigned(4, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l52_c4_49d6 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iftrue := VAR_result_device_ram_address_uxn_device_h_l52_c4_49d6;
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_right := to_unsigned(3, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iffalse := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l40_c2_6ba0_iftrue := color;
     VAR_color_MUX_uxn_device_h_l50_c7_b21d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l57_c7_c7bf_iffalse := color;
     VAR_color_MUX_uxn_device_h_l58_c3_5d86_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_left := VAR_device_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_cond := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iffalse := is_fill_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_cond := is_fill_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_cond := is_fill_mode;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_cond := is_fill_mode;
     VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l58_c3_5d86_iffalse := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_left := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_left := pixel;
     VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_iffalse := pixel;
     VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg3 := resize(pixel, 32);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l68_c7_9347_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l75_c7_221a_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_iffalse := sprite;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_iftrue := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_right := x;
     VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l106_c7_1fa7_iffalse := x;
     VAR_x_MUX_uxn_device_h_l107_c3_a442_iffalse := x;
     VAR_x_MUX_uxn_device_h_l40_c2_6ba0_iftrue := x;
     VAR_x_MUX_uxn_device_h_l50_c7_b21d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l57_c7_c7bf_iftrue := x;
     VAR_x_MUX_uxn_device_h_l68_c7_9347_iftrue := x;
     VAR_x_MUX_uxn_device_h_l75_c7_221a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l83_c7_e9a6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l91_c3_684b_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_3c42_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_left := y;
     VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l106_c7_1fa7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_a624_iftrue := y;
     VAR_y_MUX_uxn_device_h_l122_c3_e3ae_iffalse := y;
     VAR_y_MUX_uxn_device_h_l130_c7_8f1b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l137_c7_2eec_iffalse := y;
     VAR_y_MUX_uxn_device_h_l138_c3_3609_iffalse := y;
     VAR_y_MUX_uxn_device_h_l40_c2_6ba0_iftrue := y;
     VAR_y_MUX_uxn_device_h_l50_c7_b21d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l57_c7_c7bf_iftrue := y;
     VAR_y_MUX_uxn_device_h_l68_c7_9347_iftrue := y;
     VAR_y_MUX_uxn_device_h_l75_c7_221a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l83_c7_e9a6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_7b1a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_3c42_iftrue := y;
     -- BIN_OP_AND[uxn_device_h_l163_c21_e2a3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l163_c21_e2a3_left <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_left;
     BIN_OP_AND_uxn_device_h_l163_c21_e2a3_right <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_return_output := BIN_OP_AND_uxn_device_h_l163_c21_e2a3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l130_c11_9732] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_9732_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_9732_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_fcb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l68_c11_7f86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l68_c11_7f86_left <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_left;
     BIN_OP_EQ_uxn_device_h_l68_c11_7f86_right <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output := BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;

     -- BIN_OP_EQ[uxn_device_h_l122_c7_e8ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_left <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_left;
     BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_right <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output := BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output;

     -- BIN_OP_EQ[uxn_device_h_l58_c7_3367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l58_c7_3367_left <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_left;
     BIN_OP_EQ_uxn_device_h_l58_c7_3367_right <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output := BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l131_c7_e8cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_left;
     BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output := BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l179_c7_21f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l179_c7_21f7_left <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_left;
     BIN_OP_EQ_uxn_device_h_l179_c7_21f7_right <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output := BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_6f47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_6f47_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_6f47_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c11_17f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_17f3_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_17f3_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l40_c6_b5e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_left <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_left;
     BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_right <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output := BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l60_c12_a00d] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_a00d_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l83_c11_1759] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l83_c11_1759_left <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_left;
     BIN_OP_EQ_uxn_device_h_l83_c11_1759_right <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output := BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;

     -- BIN_OP_EQ[uxn_device_h_l76_c7_aba3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l76_c7_aba3_left <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_left;
     BIN_OP_EQ_uxn_device_h_l76_c7_aba3_right <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output := BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l50_c11_6f52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l50_c11_6f52_left <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_left;
     BIN_OP_EQ_uxn_device_h_l50_c11_6f52_right <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output := BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;

     -- BIN_OP_EQ[uxn_device_h_l106_c11_75de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l106_c11_75de_left <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_left;
     BIN_OP_EQ_uxn_device_h_l106_c11_75de_right <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output := BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;

     -- BIN_OP_EQ[uxn_device_h_l115_c7_d1d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_left <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_left;
     BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_right <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output := BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_3e77] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l123_l139_DUPLICATE_f73f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l123_l139_DUPLICATE_f73f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_ab97 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_ab97_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l107_c7_0faa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c7_0faa_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_left;
     BIN_OP_EQ_uxn_device_h_l107_c7_0faa_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output := BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output;

     -- BIN_OP_EQ[uxn_device_h_l84_c7_46a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l84_c7_46a2_left <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_left;
     BIN_OP_EQ_uxn_device_h_l84_c7_46a2_right <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output := BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l178_c11_9a8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_left <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_left;
     BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_right <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output := BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l69_c7_511e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c7_511e_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_left;
     BIN_OP_EQ_uxn_device_h_l69_c7_511e_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output := BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l75_c11_fe0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_left;
     BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output := BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c4_836a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l40_l42_DUPLICATE_aace LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l40_l42_DUPLICATE_aace_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l51_c7_3cd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_left <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_left;
     BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_right <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output := BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l168_c127_8b37] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_8b37_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l57_c11_5915] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c11_5915_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_left;
     BIN_OP_EQ_uxn_device_h_l57_c11_5915_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output := BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;

     -- BIN_OP_AND[uxn_device_h_l62_c13_5cd3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l62_c13_5cd3_left <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_left;
     BIN_OP_AND_uxn_device_h_l62_c13_5cd3_right <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_return_output := BIN_OP_AND_uxn_device_h_l62_c13_5cd3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_e20d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_e20d_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_e20d_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l146_c7_ebc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_left <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_left;
     BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_right <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output := BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c7_3a1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_left;
     BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output := BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l121_c11_3aec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l121_c11_3aec_left <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_left;
     BIN_OP_EQ_uxn_device_h_l121_c11_3aec_right <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output := BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;

     -- BIN_OP_EQ[uxn_device_h_l153_c11_0f80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l153_c11_0f80_left <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_left;
     BIN_OP_EQ_uxn_device_h_l153_c11_0f80_right <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output := BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c7_1ba0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_left;
     BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output := BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_93e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_93e8_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_93e8_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l154_c7_604c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l154_c7_604c_left <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_left;
     BIN_OP_EQ_uxn_device_h_l154_c7_604c_right <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output := BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_b1f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_970f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_970f_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_970f_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;

     -- BIN_OP_AND[uxn_device_h_l61_c20_be06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l61_c20_be06_left <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_left;
     BIN_OP_AND_uxn_device_h_l61_c20_be06_right <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_return_output := BIN_OP_AND_uxn_device_h_l61_c20_be06_return_output;

     -- BIN_OP_AND[uxn_device_h_l164_c21_548a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l164_c21_548a_left <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_left;
     BIN_OP_AND_uxn_device_h_l164_c21_548a_right <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_return_output := BIN_OP_AND_uxn_device_h_l164_c21_548a_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output := result.vram_address;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8689 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8689_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_left := VAR_BIN_OP_AND_uxn_device_h_l163_c21_e2a3_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_left := VAR_BIN_OP_AND_uxn_device_h_l164_c21_548a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_left := VAR_BIN_OP_AND_uxn_device_h_l61_c20_be06_return_output;
     VAR_MUX_uxn_device_h_l62_c13_ce2b_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l62_c13_5cd3_return_output, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_b1f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_75de_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_a442_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_0faa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_a624_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_970f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_d1d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_cb41_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_3aec_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_e3ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_e8ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_8f1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_9732_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_e8cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_2eec_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_fcb7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_3609_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_1ba0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_93e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_ebc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_0f80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_604c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_9a8b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_21f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_6ba0_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_b5e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_3a1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_b21d_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_6f52_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_3cd9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_c7bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_5915_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_5d86_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_5d86_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output;
     VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_3367_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_9347_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_7f86_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_511e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_221a_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_fe0b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output;
     VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_aba3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_e9a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_1759_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_46a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_7b1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_17f3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_684b_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_e20d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_3c42_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_6f47_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_3e77_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l123_l139_DUPLICATE_f73f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l123_l139_DUPLICATE_f73f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l92_l108_l123_l139_DUPLICATE_f73f_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_5d86_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_a00d_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8689_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_8689_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_ab97_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_ab97_return_output;
     VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_8b37_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l58_l131_l84_l91_l69_l107_l100_l154_l115_l122_l138_l76_l51_DUPLICATE_6461_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l40_l42_DUPLICATE_aace_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l40_l42_DUPLICATE_aace_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_29aa_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l68_l114_l57_l106_l153_l50_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_9d21_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_7212_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l68_l114_l178_l57_l106_l50_l179_l99_l145_l40_l90_l137_l154_l83_l130_l75_l121_DUPLICATE_5c61_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l146_l58_l131_l84_l91_l69_l153_l107_l100_l154_l115_l42_l138_l122_l76_l51_DUPLICATE_d5a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_836a_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l84_c3_53e9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_cond;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_return_output := result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_da4c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l138_c3_3609] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_cond;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_return_output := result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_684b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l179_c3_94b6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l179_c3_94b6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_cond;
     result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iftrue;
     result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_return_output := result_vram_address_MUX_uxn_device_h_l179_c3_94b6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l131_c3_4a87] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_cond;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_return_output := result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l58_c3_5d86] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_cond;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_return_output := result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c3_a442] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l51_c3_3f7d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_cond;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_return_output := result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l76_c3_ee01] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_cond;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_return_output := result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_return_output;

     -- BIN_OP_EQ[uxn_device_h_l61_c20_a157] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l61_c20_a157_left <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_left;
     BIN_OP_EQ_uxn_device_h_l61_c20_a157_right <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_return_output := BIN_OP_EQ_uxn_device_h_l61_c20_a157_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_f140] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_681b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l69_c3_d92a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_cond;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_return_output := result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_return_output;

     -- BIN_OP_OR[uxn_device_h_l139_c4_078c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l139_c4_078c_left <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_left;
     BIN_OP_OR_uxn_device_h_l139_c4_078c_right <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_return_output := BIN_OP_OR_uxn_device_h_l139_c4_078c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_cond;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_return_output := result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_cond;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_return_output := result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c27_ae00] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_left;
     BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_return_output := BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_da4c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l178_c7_f2e3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_cond;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_return_output := result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_return_output;

     -- sprite_MUX[uxn_device_h_l76_c3_ee01] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l76_c3_ee01_cond <= VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_cond;
     sprite_MUX_uxn_device_h_l76_c3_ee01_iftrue <= VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_iftrue;
     sprite_MUX_uxn_device_h_l76_c3_ee01_iffalse <= VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_return_output := sprite_MUX_uxn_device_h_l76_c3_ee01_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_200b] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_return_output;

     -- color_MUX[uxn_device_h_l58_c3_5d86] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l58_c3_5d86_cond <= VAR_color_MUX_uxn_device_h_l58_c3_5d86_cond;
     color_MUX_uxn_device_h_l58_c3_5d86_iftrue <= VAR_color_MUX_uxn_device_h_l58_c3_5d86_iftrue;
     color_MUX_uxn_device_h_l58_c3_5d86_iffalse <= VAR_color_MUX_uxn_device_h_l58_c3_5d86_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l58_c3_5d86_return_output := color_MUX_uxn_device_h_l58_c3_5d86_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l138_c3_3609] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_cond;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_return_output := result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_return_output;

     -- auto_advance_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_cond;
     auto_advance_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_iftrue;
     auto_advance_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_return_output := auto_advance_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- pixel_MUX[uxn_device_h_l58_c3_5d86] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l58_c3_5d86_cond <= VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_cond;
     pixel_MUX_uxn_device_h_l58_c3_5d86_iftrue <= VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_iftrue;
     pixel_MUX_uxn_device_h_l58_c3_5d86_iffalse <= VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_return_output := pixel_MUX_uxn_device_h_l58_c3_5d86_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c3_a442] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l179_c3_94b6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_cond;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_return_output := result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l51_c3_3f7d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_cond;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_return_output := result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_return_output;

     -- BIN_OP_GT[uxn_device_h_l163_c21_80d8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l163_c21_80d8_left <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_left;
     BIN_OP_GT_uxn_device_h_l163_c21_80d8_right <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_return_output := BIN_OP_GT_uxn_device_h_l163_c21_80d8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l131_c3_4a87] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_cond;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_return_output := result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_return_output;

     -- BIN_OP_OR[uxn_device_h_l108_c4_1c0c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l108_c4_1c0c_left <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_left;
     BIN_OP_OR_uxn_device_h_l108_c4_1c0c_right <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_return_output := BIN_OP_OR_uxn_device_h_l108_c4_1c0c_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_return_output := result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l84_c3_53e9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_cond;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_return_output := result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- MUX[uxn_device_h_l62_c13_ce2b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l62_c13_ce2b_cond <= VAR_MUX_uxn_device_h_l62_c13_ce2b_cond;
     MUX_uxn_device_h_l62_c13_ce2b_iftrue <= VAR_MUX_uxn_device_h_l62_c13_ce2b_iftrue;
     MUX_uxn_device_h_l62_c13_ce2b_iffalse <= VAR_MUX_uxn_device_h_l62_c13_ce2b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l62_c13_ce2b_return_output := MUX_uxn_device_h_l62_c13_ce2b_return_output;

     -- BIN_OP_GT[uxn_device_h_l164_c21_ed85] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l164_c21_ed85_left <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_left;
     BIN_OP_GT_uxn_device_h_l164_c21_ed85_right <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_return_output := BIN_OP_GT_uxn_device_h_l164_c21_ed85_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l122_c3_e3ae] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_cond;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_return_output := result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l76_c3_ee01] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_cond;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_return_output := result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l69_c3_d92a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_cond;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_return_output := result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_cond;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_return_output := result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_cond;
     result_vram_value_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_iftrue;
     result_vram_value_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_return_output := result_vram_value_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l122_c3_e3ae] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_cond;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_return_output := result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output := CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_a5f7] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l42_c3_681b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_cond;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_return_output := result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l146_c3_ff7b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_cond;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_return_output := result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l115_c3_f140] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_cond;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_return_output := result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_return_output;

     -- result_vram_value_MUX[uxn_device_h_l179_c3_94b6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l179_c3_94b6_cond <= VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_cond;
     result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iftrue;
     result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_return_output := result_vram_value_MUX_uxn_device_h_l179_c3_94b6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l42_c3_681b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_cond;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_return_output := result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l58_c3_5d86] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_cond;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_return_output := result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_684b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l61_c20_563d_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c20_a157_return_output;
     VAR_MUX_uxn_device_h_l163_c21_620d_cond := VAR_BIN_OP_GT_uxn_device_h_l163_c21_80d8_return_output;
     VAR_MUX_uxn_device_h_l164_c21_add7_cond := VAR_BIN_OP_GT_uxn_device_h_l164_c21_ed85_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_200b_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_a5f7_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_a442_iftrue := VAR_BIN_OP_OR_uxn_device_h_l108_c4_1c0c_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_3609_iftrue := VAR_BIN_OP_OR_uxn_device_h_l139_c4_078c_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_left := VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_ae00_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_684b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_e3ae_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l124_l93_DUPLICATE_3d81_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_5d86_iftrue := VAR_MUX_uxn_device_h_l62_c13_ce2b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_auto_advance_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_color_MUX_uxn_device_h_l58_c3_5d86_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_pixel_MUX_uxn_device_h_l58_c3_5d86_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_da4c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_a442_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f140_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_e3ae_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_4a87_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_3609_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ff7b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_681b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_3f7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_5d86_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_d92a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_ee01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_53e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_684b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_da4c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_a442_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f140_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_e3ae_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_4a87_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_3609_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_f2e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_681b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_3f7d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_5d86_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_d92a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_ee01_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_53e9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_684b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_681b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_94b6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l179_c3_94b6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l179_c3_94b6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_221a_iftrue := VAR_sprite_MUX_uxn_device_h_l76_c3_ee01_return_output;
     -- sprite_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_sprite_MUX_uxn_device_h_l75_c7_221a_cond;
     sprite_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_sprite_MUX_uxn_device_h_l75_c7_221a_iftrue;
     sprite_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_sprite_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l75_c7_221a_return_output := sprite_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_cond;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_return_output := result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l161_c18_3466] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l161_c18_3466_left <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_left;
     BIN_OP_PLUS_uxn_device_h_l161_c18_3466_right <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_return_output := BIN_OP_PLUS_uxn_device_h_l161_c18_3466_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output := result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- pixel_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_cond;
     pixel_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     pixel_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_return_output := pixel_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- MUX[uxn_device_h_l163_c21_620d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l163_c21_620d_cond <= VAR_MUX_uxn_device_h_l163_c21_620d_cond;
     MUX_uxn_device_h_l163_c21_620d_iftrue <= VAR_MUX_uxn_device_h_l163_c21_620d_iftrue;
     MUX_uxn_device_h_l163_c21_620d_iffalse <= VAR_MUX_uxn_device_h_l163_c21_620d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l163_c21_620d_return_output := MUX_uxn_device_h_l163_c21_620d_return_output;

     -- layer_MUX[uxn_device_h_l58_c3_5d86] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l58_c3_5d86_cond <= VAR_layer_MUX_uxn_device_h_l58_c3_5d86_cond;
     layer_MUX_uxn_device_h_l58_c3_5d86_iftrue <= VAR_layer_MUX_uxn_device_h_l58_c3_5d86_iftrue;
     layer_MUX_uxn_device_h_l58_c3_5d86_iffalse <= VAR_layer_MUX_uxn_device_h_l58_c3_5d86_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l58_c3_5d86_return_output := layer_MUX_uxn_device_h_l58_c3_5d86_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l178_c7_f2e3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_cond;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_return_output := result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_cond;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_return_output := result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- BIN_OP_GT[uxn_device_h_l147_c27_3e5e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l147_c27_3e5e_left <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_left;
     BIN_OP_GT_uxn_device_h_l147_c27_3e5e_right <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_return_output := BIN_OP_GT_uxn_device_h_l147_c27_3e5e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l178_c7_f2e3] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_cond <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_cond;
     result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iftrue;
     result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_return_output := result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_return_output;

     -- result_vram_value_MUX[uxn_device_h_l178_c7_f2e3] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_cond <= VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_cond;
     result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iftrue;
     result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_return_output := result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_return_output;

     -- y_MUX[uxn_device_h_l122_c3_e3ae] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l122_c3_e3ae_cond <= VAR_y_MUX_uxn_device_h_l122_c3_e3ae_cond;
     y_MUX_uxn_device_h_l122_c3_e3ae_iftrue <= VAR_y_MUX_uxn_device_h_l122_c3_e3ae_iftrue;
     y_MUX_uxn_device_h_l122_c3_e3ae_iffalse <= VAR_y_MUX_uxn_device_h_l122_c3_e3ae_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l122_c3_e3ae_return_output := y_MUX_uxn_device_h_l122_c3_e3ae_return_output;

     -- MUX[uxn_device_h_l164_c21_add7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l164_c21_add7_cond <= VAR_MUX_uxn_device_h_l164_c21_add7_cond;
     MUX_uxn_device_h_l164_c21_add7_iftrue <= VAR_MUX_uxn_device_h_l164_c21_add7_iftrue;
     MUX_uxn_device_h_l164_c21_add7_iffalse <= VAR_MUX_uxn_device_h_l164_c21_add7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l164_c21_add7_return_output := MUX_uxn_device_h_l164_c21_add7_return_output;

     -- x_MUX[uxn_device_h_l107_c3_a442] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c3_a442_cond <= VAR_x_MUX_uxn_device_h_l107_c3_a442_cond;
     x_MUX_uxn_device_h_l107_c3_a442_iftrue <= VAR_x_MUX_uxn_device_h_l107_c3_a442_iftrue;
     x_MUX_uxn_device_h_l107_c3_a442_iffalse <= VAR_x_MUX_uxn_device_h_l107_c3_a442_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c3_a442_return_output := x_MUX_uxn_device_h_l107_c3_a442_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_cond;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_return_output := result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l171_c28_f7e9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_left;
     BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_return_output := BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_return_output;

     -- y_MUX[uxn_device_h_l138_c3_3609] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c3_3609_cond <= VAR_y_MUX_uxn_device_h_l138_c3_3609_cond;
     y_MUX_uxn_device_h_l138_c3_3609_iftrue <= VAR_y_MUX_uxn_device_h_l138_c3_3609_iftrue;
     y_MUX_uxn_device_h_l138_c3_3609_iffalse <= VAR_y_MUX_uxn_device_h_l138_c3_3609_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c3_3609_return_output := y_MUX_uxn_device_h_l138_c3_3609_return_output;

     -- color_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_color_MUX_uxn_device_h_l57_c7_c7bf_cond;
     color_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_color_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     color_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_color_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l57_c7_c7bf_return_output := color_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- MUX[uxn_device_h_l61_c20_563d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l61_c20_563d_cond <= VAR_MUX_uxn_device_h_l61_c20_563d_cond;
     MUX_uxn_device_h_l61_c20_563d_iftrue <= VAR_MUX_uxn_device_h_l61_c20_563d_iftrue;
     MUX_uxn_device_h_l61_c20_563d_iffalse <= VAR_MUX_uxn_device_h_l61_c20_563d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l61_c20_563d_return_output := MUX_uxn_device_h_l61_c20_563d_return_output;

     -- auto_advance_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_cond;
     auto_advance_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_iftrue;
     auto_advance_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_return_output := auto_advance_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- x_MUX[uxn_device_h_l91_c3_684b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l91_c3_684b_cond <= VAR_x_MUX_uxn_device_h_l91_c3_684b_cond;
     x_MUX_uxn_device_h_l91_c3_684b_iftrue <= VAR_x_MUX_uxn_device_h_l91_c3_684b_iftrue;
     x_MUX_uxn_device_h_l91_c3_684b_iffalse <= VAR_x_MUX_uxn_device_h_l91_c3_684b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l91_c3_684b_return_output := x_MUX_uxn_device_h_l91_c3_684b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l147_c27_1768_cond := VAR_BIN_OP_GT_uxn_device_h_l147_c27_3e5e_return_output;
     VAR_vram_addr_uxn_device_h_l161_c5_5f76 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_3466_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l171_c5_878b := resize(VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_f7e9_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_right := VAR_MUX_uxn_device_h_l163_c21_620d_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_right := VAR_MUX_uxn_device_h_l164_c21_add7_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iftrue := VAR_MUX_uxn_device_h_l61_c20_563d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_color_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_layer_MUX_uxn_device_h_l58_c3_5d86_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_pixel_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_f2e3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l178_c7_f2e3_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l178_c7_f2e3_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_sprite_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_1fa7_iftrue := VAR_x_MUX_uxn_device_h_l107_c3_a442_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_7b1a_iftrue := VAR_x_MUX_uxn_device_h_l91_c3_684b_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_cb41_iftrue := VAR_y_MUX_uxn_device_h_l122_c3_e3ae_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_2eec_iftrue := VAR_y_MUX_uxn_device_h_l138_c3_3609_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_iffalse := VAR_result_vram_address_uxn_device_h_l171_c5_878b;
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_left := VAR_vram_addr_uxn_device_h_l161_c5_5f76;
     -- result_device_ram_address_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_cond;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_return_output := result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- pixel_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_cond;
     pixel_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     pixel_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_return_output := pixel_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- sprite_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_sprite_MUX_uxn_device_h_l68_c7_9347_cond;
     sprite_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_sprite_MUX_uxn_device_h_l68_c7_9347_iftrue;
     sprite_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_sprite_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l68_c7_9347_return_output := sprite_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_vram_value_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_cond;
     result_vram_value_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_iftrue;
     result_vram_value_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_return_output := result_vram_value_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- MUX[uxn_device_h_l147_c27_1768] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c27_1768_cond <= VAR_MUX_uxn_device_h_l147_c27_1768_cond;
     MUX_uxn_device_h_l147_c27_1768_iftrue <= VAR_MUX_uxn_device_h_l147_c27_1768_iftrue;
     MUX_uxn_device_h_l147_c27_1768_iffalse <= VAR_MUX_uxn_device_h_l147_c27_1768_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c27_1768_return_output := MUX_uxn_device_h_l147_c27_1768_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_cond;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_return_output := result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l58_c3_5d86] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_cond;
     is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iftrue;
     is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_return_output := is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_return_output;

     -- y_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_y_MUX_uxn_device_h_l137_c7_2eec_cond;
     y_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_y_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     y_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_y_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c7_2eec_return_output := y_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- BIN_OP_AND[uxn_device_h_l162_c5_da58] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l162_c5_da58_left <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_left;
     BIN_OP_AND_uxn_device_h_l162_c5_da58_right <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_return_output := BIN_OP_AND_uxn_device_h_l162_c5_da58_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_return_output := auto_advance_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- x_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_x_MUX_uxn_device_h_l106_c7_1fa7_cond;
     x_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_x_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     x_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_x_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l106_c7_1fa7_return_output := x_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- layer_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_cond;
     layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output := layer_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_cond;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_return_output := result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- color_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_color_MUX_uxn_device_h_l50_c7_b21d_cond;
     color_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_color_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     color_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_color_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l50_c7_b21d_return_output := color_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_left := VAR_BIN_OP_AND_uxn_device_h_l162_c5_da58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iftrue := VAR_MUX_uxn_device_h_l147_c27_1768_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_color_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_5d86_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_pixel_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_sprite_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_x_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_y_MUX_uxn_device_h_l137_c7_2eec_return_output;
     -- x_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_x_MUX_uxn_device_h_l99_c7_3c42_cond;
     x_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     x_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_3c42_return_output := x_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- BIN_OP_OR[uxn_device_h_l163_c5_0572] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l163_c5_0572_left <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_left;
     BIN_OP_OR_uxn_device_h_l163_c5_0572_right <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_return_output := BIN_OP_OR_uxn_device_h_l163_c5_0572_return_output;

     -- auto_advance_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_cond;
     auto_advance_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     auto_advance_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_return_output := auto_advance_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l146_c3_ff7b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_cond;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_return_output := result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_cond;
     is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_return_output := is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- layer_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_layer_MUX_uxn_device_h_l50_c7_b21d_cond;
     layer_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     layer_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l50_c7_b21d_return_output := layer_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_cond;
     result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_return_output := result_vram_value_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_cond;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_return_output := result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_cond;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_return_output := result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_cond;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_return_output := result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- y_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_y_MUX_uxn_device_h_l130_c7_8f1b_cond;
     y_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_y_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     y_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_y_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c7_8f1b_return_output := y_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- pixel_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_cond;
     pixel_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     pixel_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_return_output := pixel_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- sprite_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_cond;
     sprite_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     sprite_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_return_output := sprite_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- color_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_color_MUX_uxn_device_h_l40_c2_6ba0_cond;
     color_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_color_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     color_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_color_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l40_c2_6ba0_return_output := color_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_left := VAR_BIN_OP_OR_uxn_device_h_l163_c5_0572_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l137_c7_2eec_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_layer_MUX_uxn_device_h_l50_c7_b21d_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_2eec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ff7b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_2eec_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_sprite_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_y_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_cond;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_return_output := result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_cond;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_return_output := result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_cond;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output := result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_cond;
     result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_return_output := result_vram_value_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- auto_advance_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_cond;
     auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_return_output := auto_advance_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- x_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_x_MUX_uxn_device_h_l90_c7_7b1a_cond;
     x_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     x_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_7b1a_return_output := x_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- BIN_OP_OR[uxn_device_h_l164_c5_5399] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l164_c5_5399_left <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_left;
     BIN_OP_OR_uxn_device_h_l164_c5_5399_right <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_return_output := BIN_OP_OR_uxn_device_h_l164_c5_5399_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_cond;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_return_output := result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- layer_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_cond;
     layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output := layer_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_cond;
     is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_return_output := is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- sprite_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_cond;
     sprite_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     sprite_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_return_output := sprite_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- y_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_y_MUX_uxn_device_h_l121_c7_cb41_cond;
     y_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_y_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     y_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_y_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l121_c7_cb41_return_output := y_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_left := VAR_BIN_OP_OR_uxn_device_h_l164_c5_5399_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_auto_advance_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_b21d_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_2eec_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l137_c7_2eec_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_sprite_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_y_MUX_uxn_device_h_l121_c7_cb41_return_output;
     -- sprite_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_cond;
     sprite_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     sprite_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_return_output := sprite_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- y_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_y_MUX_uxn_device_h_l114_c7_a624_cond;
     y_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_a624_iftrue;
     y_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_a624_return_output := y_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- BIN_OP_OR[uxn_device_h_l165_c5_1d3a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l165_c5_1d3a_left <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_left;
     BIN_OP_OR_uxn_device_h_l165_c5_1d3a_right <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output := BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_cond;
     is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_return_output := is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_cond;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_return_output := result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- result_vram_value_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_cond;
     result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_return_output := result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- auto_advance_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_cond;
     auto_advance_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     auto_advance_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_return_output := auto_advance_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_cond;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_return_output := result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_cond;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_return_output := result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- x_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_x_MUX_uxn_device_h_l83_c7_e9a6_cond;
     x_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_x_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     x_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_x_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l83_c7_e9a6_return_output := x_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_cond;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_return_output := result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- Submodule level 7
     VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg4 := VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_1d3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_auto_advance_MUX_uxn_device_h_l121_c7_cb41_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_cb41_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_2eec_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_cb41_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_x_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_a624_return_output;
     -- vram_addr_MUX[uxn_device_h_l160_c4_836a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l160_c4_836a_cond <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_cond;
     vram_addr_MUX_uxn_device_h_l160_c4_836a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_iftrue;
     vram_addr_MUX_uxn_device_h_l160_c4_836a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_return_output := vram_addr_MUX_uxn_device_h_l160_c4_836a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c4_836a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c4_836a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_cond;
     result_vram_address_MUX_uxn_device_h_l160_c4_836a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c4_836a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_return_output := result_vram_address_MUX_uxn_device_h_l160_c4_836a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_cond;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_return_output := result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- x_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_x_MUX_uxn_device_h_l75_c7_221a_cond;
     x_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_x_MUX_uxn_device_h_l75_c7_221a_iftrue;
     x_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_x_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c7_221a_return_output := x_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_cond;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_return_output := result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_cond;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_return_output := result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_return_output := auto_advance_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- result_vram_value_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_cond;
     result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_return_output := result_vram_value_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_cond;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_return_output := result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- y_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_y_MUX_uxn_device_h_l106_c7_1fa7_cond;
     y_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_y_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     y_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_y_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l106_c7_1fa7_return_output := y_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_cb41_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l160_c4_836a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l121_c7_cb41_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_iftrue := VAR_vram_addr_MUX_uxn_device_h_l160_c4_836a_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_x_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_y_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     -- auto_advance_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_cond;
     auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_return_output := auto_advance_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- result_vram_value_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_cond;
     result_vram_value_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_iftrue;
     result_vram_value_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_return_output := result_vram_value_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- y_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_y_MUX_uxn_device_h_l99_c7_3c42_cond;
     y_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     y_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_3c42_return_output := y_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- vram_addr_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_cond;
     vram_addr_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_iftrue;
     vram_addr_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_return_output := vram_addr_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_cond;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_return_output := result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- x_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_x_MUX_uxn_device_h_l68_c7_9347_cond;
     x_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_x_MUX_uxn_device_h_l68_c7_9347_iftrue;
     x_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_x_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l68_c7_9347_return_output := x_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_cond;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_return_output := result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_cond;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_return_output := result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_cond;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output := result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- result_vram_address_MUX[uxn_device_h_l154_c3_827a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l154_c3_827a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_cond;
     result_vram_address_MUX_uxn_device_h_l154_c3_827a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_iftrue;
     result_vram_address_MUX_uxn_device_h_l154_c3_827a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_return_output := result_vram_address_MUX_uxn_device_h_l154_c3_827a_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_auto_advance_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_cb41_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_iftrue := VAR_vram_addr_MUX_uxn_device_h_l154_c3_827a_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_x_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_3c42_return_output;
     -- result_vram_address_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_cond;
     result_vram_address_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_iftrue;
     result_vram_address_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_return_output := result_vram_address_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_cond;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_return_output := result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- x_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_x_MUX_uxn_device_h_l57_c7_c7bf_cond;
     x_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_x_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     x_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_x_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l57_c7_c7bf_return_output := x_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_cond;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_return_output := result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- result_vram_value_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_cond;
     result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_return_output := result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- y_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_y_MUX_uxn_device_h_l90_c7_7b1a_cond;
     y_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     y_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_7b1a_return_output := y_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- vram_addr_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_cond;
     vram_addr_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_iftrue;
     vram_addr_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_return_output := vram_addr_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_return_output := auto_advance_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_cond;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_return_output := result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_vram_addr_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_x_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     -- result_vram_address_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_cond;
     result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_return_output := result_vram_address_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_return_output := result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_cond;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_return_output := result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- y_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_y_MUX_uxn_device_h_l83_c7_e9a6_cond;
     y_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_y_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     y_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_y_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l83_c7_e9a6_return_output := y_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_return_output := vram_addr_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- x_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_x_MUX_uxn_device_h_l50_c7_b21d_cond;
     x_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_x_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     x_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_x_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l50_c7_b21d_return_output := x_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- auto_advance_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_return_output := auto_advance_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_cb41_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_x_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_y_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     -- result_vram_value_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_cond;
     result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_return_output := result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_cond;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output := result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- vram_addr_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_cond;
     vram_addr_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     vram_addr_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_return_output := vram_addr_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- result_vram_address_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_cond;
     result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_return_output := result_vram_address_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_cond;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_return_output := result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- x_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_x_MUX_uxn_device_h_l40_c2_6ba0_cond;
     x_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_x_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     x_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_x_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l40_c2_6ba0_return_output := x_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- auto_advance_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_cond;
     auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_return_output := auto_advance_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- y_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_y_MUX_uxn_device_h_l75_c7_221a_cond;
     y_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_y_MUX_uxn_device_h_l75_c7_221a_iftrue;
     y_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_y_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c7_221a_return_output := y_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l137_c7_2eec_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iffalse := VAR_vram_addr_MUX_uxn_device_h_l137_c7_2eec_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_y_MUX_uxn_device_h_l75_c7_221a_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_return_output := result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- auto_advance_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_cond;
     auto_advance_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_iftrue;
     auto_advance_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_return_output := auto_advance_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_cond;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_return_output := result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_cond;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_return_output := result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_cond;
     result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_return_output := result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- result_vram_address_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_cond;
     result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output := result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- vram_addr_MUX[uxn_device_h_l130_c7_8f1b] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l130_c7_8f1b_cond <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_cond;
     vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iftrue;
     vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_return_output := vram_addr_MUX_uxn_device_h_l130_c7_8f1b_return_output;

     -- y_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_y_MUX_uxn_device_h_l68_c7_9347_cond;
     y_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_y_MUX_uxn_device_h_l68_c7_9347_iftrue;
     y_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_y_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l68_c7_9347_return_output := y_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_2eec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_2eec_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_auto_advance_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_iffalse := VAR_vram_addr_MUX_uxn_device_h_l130_c7_8f1b_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_y_MUX_uxn_device_h_l68_c7_9347_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_cond;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_return_output := result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_vram_address_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_cond;
     result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_return_output := result_vram_address_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_cond;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_return_output := result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_vram_value_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_cond;
     result_vram_value_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_iftrue;
     result_vram_value_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_return_output := result_vram_value_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- auto_advance_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_cond;
     auto_advance_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_iftrue;
     auto_advance_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_return_output := auto_advance_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_23e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_cond;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_return_output := result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- y_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_y_MUX_uxn_device_h_l57_c7_c7bf_cond;
     y_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_y_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     y_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_y_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l57_c7_c7bf_return_output := y_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- vram_addr_MUX[uxn_device_h_l121_c7_cb41] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l121_c7_cb41_cond <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_cond;
     vram_addr_MUX_uxn_device_h_l121_c7_cb41_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_iftrue;
     vram_addr_MUX_uxn_device_h_l121_c7_cb41_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_return_output := vram_addr_MUX_uxn_device_h_l121_c7_cb41_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_cond;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_return_output := result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_23e2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l121_c7_cb41_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_iffalse := VAR_vram_addr_MUX_uxn_device_h_l121_c7_cb41_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_y_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     -- result_vram_address_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_cond;
     result_vram_address_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_iftrue;
     result_vram_address_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_return_output := result_vram_address_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_cond;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_return_output := result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- y_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_y_MUX_uxn_device_h_l50_c7_b21d_cond;
     y_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_y_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     y_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_y_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l50_c7_b21d_return_output := y_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- auto_advance_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_cond;
     auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_return_output := auto_advance_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_a624] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_a624_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_a624_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_a624_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_return_output := vram_addr_MUX_uxn_device_h_l114_c7_a624_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_2455] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_return_output;

     -- result_vram_value_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_cond;
     result_vram_value_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_iftrue;
     result_vram_value_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_return_output := result_vram_value_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_cond;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output := result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_cond;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_return_output := result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_cond;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output := result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_2455_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_a624_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_y_MUX_uxn_device_h_l50_c7_b21d_return_output;
     -- auto_advance_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_cond;
     auto_advance_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     auto_advance_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_return_output := auto_advance_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_cond;
     result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output := result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_cond;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_return_output := result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_cond;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_return_output := result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_cond;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_return_output := result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_d3fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_return_output;

     -- vram_addr_MUX[uxn_device_h_l106_c7_1fa7] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l106_c7_1fa7_cond <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_cond;
     vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iftrue;
     vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_return_output := vram_addr_MUX_uxn_device_h_l106_c7_1fa7_return_output;

     -- result_vram_value_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_cond;
     result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_return_output := result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_cond;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_return_output := result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- y_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_y_MUX_uxn_device_h_l40_c2_6ba0_cond;
     y_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_y_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     y_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_y_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l40_c2_6ba0_return_output := y_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_d3fc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_iffalse := VAR_vram_addr_MUX_uxn_device_h_l106_c7_1fa7_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     -- result_vram_value_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_cond;
     result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_return_output := result_vram_value_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_cond;
     result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output := result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_cond;
     result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output := result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_cond;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_return_output := result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- auto_advance_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_cond;
     auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_return_output := auto_advance_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- vram_addr_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_cond;
     vram_addr_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     vram_addr_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_return_output := vram_addr_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_7bc6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_cond;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_return_output := result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_3c42] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_3c42_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_3c42_return_output;

     -- Submodule level 17
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_7bc6_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_3c42_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iffalse := VAR_vram_addr_MUX_uxn_device_h_l99_c7_3c42_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_db5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_return_output;

     -- vram_addr_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_cond;
     vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_return_output := vram_addr_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_cond;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_return_output := result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_cond;
     result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output := result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- result_vram_address_MUX[uxn_device_h_l90_c7_7b1a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_cond;
     result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_return_output := result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- Submodule level 18
     VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_db5c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iffalse := VAR_vram_addr_MUX_uxn_device_h_l90_c7_7b1a_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_cond;
     result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_return_output := result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- printf_uxn_device_h_l168_c5_e8e3[uxn_device_h_l168_c5_e8e3] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg0 <= VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg0;
     printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg1 <= VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg1;
     printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg2 <= VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg2;
     printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg3 <= VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg3;
     printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg4 <= VAR_printf_uxn_device_h_l168_c5_e8e3_uxn_device_h_l168_c5_e8e3_arg4;
     -- Outputs

     -- vram_addr_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_cond;
     vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_return_output := vram_addr_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- result_vram_address_MUX[uxn_device_h_l83_c7_e9a6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_cond;
     result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iftrue;
     result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output := result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output;

     -- Submodule level 19
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_iffalse := VAR_vram_addr_MUX_uxn_device_h_l83_c7_e9a6_return_output;
     -- vram_addr_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_cond;
     vram_addr_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_iftrue;
     vram_addr_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_return_output := vram_addr_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l75_c7_221a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l75_c7_221a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_cond;
     result_vram_address_MUX_uxn_device_h_l75_c7_221a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_iftrue;
     result_vram_address_MUX_uxn_device_h_l75_c7_221a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_return_output := result_vram_address_MUX_uxn_device_h_l75_c7_221a_return_output;

     -- Submodule level 20
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l75_c7_221a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_iffalse := VAR_vram_addr_MUX_uxn_device_h_l75_c7_221a_return_output;
     -- result_vram_address_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_cond;
     result_vram_address_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_iftrue;
     result_vram_address_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_return_output := result_vram_address_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- vram_addr_MUX[uxn_device_h_l68_c7_9347] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l68_c7_9347_cond <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_cond;
     vram_addr_MUX_uxn_device_h_l68_c7_9347_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_iftrue;
     vram_addr_MUX_uxn_device_h_l68_c7_9347_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_return_output := vram_addr_MUX_uxn_device_h_l68_c7_9347_return_output;

     -- Submodule level 21
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l68_c7_9347_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iffalse := VAR_vram_addr_MUX_uxn_device_h_l68_c7_9347_return_output;
     -- result_vram_address_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_cond;
     result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output := result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- vram_addr_MUX[uxn_device_h_l57_c7_c7bf] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l57_c7_c7bf_cond <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_cond;
     vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iftrue;
     vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_return_output := vram_addr_MUX_uxn_device_h_l57_c7_c7bf_return_output;

     -- Submodule level 22
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_iffalse := VAR_vram_addr_MUX_uxn_device_h_l57_c7_c7bf_return_output;
     -- vram_addr_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_cond;
     vram_addr_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     vram_addr_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_return_output := vram_addr_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l50_c7_b21d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l50_c7_b21d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_cond;
     result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iftrue;
     result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_return_output := result_vram_address_MUX_uxn_device_h_l50_c7_b21d_return_output;

     -- Submodule level 23
     VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l50_c7_b21d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iffalse := VAR_vram_addr_MUX_uxn_device_h_l50_c7_b21d_return_output;
     -- vram_addr_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_cond;
     vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_return_output := vram_addr_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- result_vram_address_MUX[uxn_device_h_l40_c2_6ba0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_cond <= VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_cond;
     result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iftrue;
     result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output := result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output;

     -- Submodule level 24
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l40_c2_6ba0_return_output;
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_1935_uxn_device_h_l32_l192_DUPLICATE_52a9 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1935_uxn_device_h_l32_l192_DUPLICATE_52a9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_1935(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l40_c2_6ba0_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l40_c2_6ba0_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l40_c2_6ba0_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l40_c2_6ba0_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l40_c2_6ba0_return_output);

     -- Submodule level 25
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1935_uxn_device_h_l32_l192_DUPLICATE_52a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1935_uxn_device_h_l32_l192_DUPLICATE_52a9_return_output;
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
