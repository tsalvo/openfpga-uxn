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
-- Submodules: 232
entity screen_deo_0CLK_766ce011 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_766ce011;
architecture arch of screen_deo_0CLK_766ce011 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal vram_addr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_addr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(3 downto 0) := to_unsigned(0, 4);
signal is_pixel_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_sprite_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_drawing_port : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
ram_address => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_vram_addr : unsigned(31 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_ram_addr : unsigned(15 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(3 downto 0);
signal REG_COMB_is_pixel_port : unsigned(0 downto 0);
signal REG_COMB_is_sprite_port : unsigned(0 downto 0);
signal REG_COMB_is_drawing_port : unsigned(0 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l95_c6_7cec]
signal BIN_OP_EQ_uxn_device_h_l95_c6_7cec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_7cec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_e6a3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l95_c2_d127]
signal x_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l95_c2_d127]
signal flip_x_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l95_c2_d127]
signal color_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(3 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l95_c2_d127]
signal is_drawing_port_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l95_c2_d127]
signal layer_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l95_c2_d127]
signal ram_addr_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l95_c2_d127]
signal ctrl_mode_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l95_c2_d127]
signal ctrl_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l95_c2_d127]
signal result_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c2_d127_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_d127_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_d127_return_output : device_out_result_t;

-- is_sprite_port_MUX[uxn_device_h_l95_c2_d127]
signal is_sprite_port_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l95_c2_d127]
signal y_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l95_c2_d127]
signal auto_advance_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(7 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l95_c2_d127]
signal is_pixel_port_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l95_c2_d127]
signal flip_y_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l95_c2_d127]
signal vram_addr_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l96_c19_78ab]
signal BIN_OP_EQ_uxn_device_h_l96_c19_78ab_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_78ab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_78ab_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l96_c19_209c]
signal MUX_uxn_device_h_l96_c19_209c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_209c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_209c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_209c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l97_c20_ab80]
signal BIN_OP_EQ_uxn_device_h_l97_c20_ab80_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_ab80_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_ab80_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l97_c20_f131]
signal MUX_uxn_device_h_l97_c20_f131_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_f131_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_f131_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_f131_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c21_bd61]
signal BIN_OP_OR_uxn_device_h_l98_c21_bd61_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_bd61_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_05be]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l102_c3_05be]
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l103_c32_eb59]
signal MUX_uxn_device_h_l103_c32_eb59_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l103_c32_eb59_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_eb59_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_eb59_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c11_3653]
signal BIN_OP_EQ_uxn_device_h_l109_c11_3653_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_3653_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_b7a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l109_c7_e6a3]
signal x_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l109_c7_e6a3]
signal flip_x_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l109_c7_e6a3]
signal color_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l109_c7_e6a3]
signal layer_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l109_c7_e6a3]
signal ram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l109_c7_e6a3]
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l109_c7_e6a3]
signal ctrl_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l109_c7_e6a3]
signal result_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l109_c7_e6a3_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_e6a3_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_e6a3_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l109_c7_e6a3]
signal y_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l109_c7_e6a3]
signal auto_advance_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l109_c7_e6a3]
signal flip_y_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l109_c7_e6a3]
signal vram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l110_c3_b2a8]
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_b1e6]
signal BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_5ed2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l114_c7_b7a7]
signal x_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l114_c7_b7a7]
signal flip_x_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l114_c7_b7a7]
signal color_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l114_c7_b7a7]
signal layer_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l114_c7_b7a7]
signal ram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l114_c7_b7a7]
signal ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l114_c7_b7a7]
signal ctrl_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l114_c7_b7a7]
signal result_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l114_c7_b7a7_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_b7a7_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_b7a7_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l114_c7_b7a7]
signal y_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_b7a7]
signal auto_advance_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l114_c7_b7a7]
signal flip_y_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_b7a7]
signal vram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(31 downto 0);

-- flip_x_MUX[uxn_device_h_l115_c3_f739]
signal flip_x_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l115_c3_f739]
signal color_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l115_c3_f739]
signal layer_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l115_c3_f739]
signal ctrl_mode_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l115_c3_f739]
signal ctrl_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_f739]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l115_c3_f739]
signal flip_y_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l118_c26_46cd]
signal CONST_SR_7_uxn_device_h_l118_c26_46cd_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l118_c26_46cd_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l119_c22_3510]
signal CONST_SR_6_uxn_device_h_l119_c22_3510_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l119_c22_3510_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l120_c23_4228]
signal CONST_SR_5_uxn_device_h_l120_c23_4228_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l120_c23_4228_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l121_c23_5a69]
signal CONST_SR_4_uxn_device_h_l121_c23_5a69_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l121_c23_5a69_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_89e8]
signal BIN_OP_EQ_uxn_device_h_l125_c11_89e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_89e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_2fc9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l125_c7_5ed2]
signal x_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l125_c7_5ed2]
signal ram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l125_c7_5ed2]
signal result_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l125_c7_5ed2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_5ed2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_5ed2_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l125_c7_5ed2]
signal y_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_5ed2]
signal auto_advance_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l125_c7_5ed2]
signal vram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l126_c3_d9d7]
signal x_MUX_uxn_device_h_l126_c3_d9d7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l126_c3_d9d7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_d9d7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_d9d7_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_d9d7]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c11_aa4a]
signal BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_8bf0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l132_c7_2fc9]
signal x_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l132_c7_2fc9]
signal ram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l132_c7_2fc9]
signal result_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l132_c7_2fc9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_2fc9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_2fc9_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l132_c7_2fc9]
signal y_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l132_c7_2fc9]
signal auto_advance_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l132_c7_2fc9]
signal vram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l133_c3_0c4b]
signal x_MUX_uxn_device_h_l133_c3_0c4b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l133_c3_0c4b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_0c4b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_0c4b_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c3_0c4b]
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l134_c4_ab6c]
signal BIN_OP_OR_uxn_device_h_l134_c4_ab6c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_ab6c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_ab6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c11_7dff]
signal BIN_OP_EQ_uxn_device_h_l138_c11_7dff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_7dff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_d962]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l138_c7_8bf0]
signal x_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l138_c7_8bf0]
signal ram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l138_c7_8bf0]
signal result_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l138_c7_8bf0_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_8bf0_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_8bf0_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l138_c7_8bf0]
signal y_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l138_c7_8bf0]
signal auto_advance_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l138_c7_8bf0]
signal vram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l139_c3_c911]
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l139_c3_c911]
signal y_MUX_uxn_device_h_l139_c3_c911_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l139_c3_c911_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_c911_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_c911_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_a9cf]
signal BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_f950]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l145_c7_d962]
signal x_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l145_c7_d962]
signal ram_addr_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l145_c7_d962]
signal result_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l145_c7_d962_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_d962_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_d962_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l145_c7_d962]
signal y_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_d962]
signal auto_advance_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_d962]
signal vram_addr_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l146_c3_6303]
signal y_MUX_uxn_device_h_l146_c3_6303_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l146_c3_6303_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_6303_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_6303_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l147_c4_77b1]
signal BIN_OP_OR_uxn_device_h_l147_c4_77b1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_77b1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_77b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c11_b9ee]
signal BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_8956]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l150_c7_f950]
signal x_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l150_c7_f950]
signal ram_addr_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l150_c7_f950]
signal result_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l150_c7_f950_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_f950_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_f950_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l150_c7_f950]
signal auto_advance_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l150_c7_f950]
signal vram_addr_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(31 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c3_9e16]
signal result_vram_address_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l151_c3_9e16]
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c3_9e16]
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l151_c3_9e16]
signal result_u8_value_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c3_9e16]
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c3_9e16]
signal auto_advance_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l151_c3_9e16]
signal vram_addr_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l154_c32_95db]
signal BIN_OP_AND_uxn_device_h_l154_c32_95db_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_95db_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_95db_return_output : unsigned(3 downto 0);

-- result_vram_address_MUX[uxn_device_h_l156_c4_5cac]
signal result_vram_address_MUX_uxn_device_h_l156_c4_5cac_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_5cac_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l156_c4_5cac]
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l156_c4_5cac]
signal vram_addr_MUX_uxn_device_h_l156_c4_5cac_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_5cac_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_5cac_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_5cac_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_ea74]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c18_7896]
signal BIN_OP_PLUS_uxn_device_h_l157_c18_7896_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_7896_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_7896_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l158_c5_780f]
signal BIN_OP_AND_uxn_device_h_l158_c5_780f_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_780f_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_780f_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l159_c19_c74b]
signal MUX_uxn_device_h_l159_c19_c74b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c19_c74b_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_c74b_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_c74b_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l159_c5_651e]
signal BIN_OP_OR_uxn_device_h_l159_c5_651e_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_651e_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_651e_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l160_c19_34d9]
signal MUX_uxn_device_h_l160_c19_34d9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l160_c19_34d9_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_34d9_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_34d9_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l160_c5_3dab]
signal BIN_OP_OR_uxn_device_h_l160_c5_3dab_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_3dab_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_3dab_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l161_c5_525d]
signal BIN_OP_OR_uxn_device_h_l161_c5_525d_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_525d_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_b8e0]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l165_c28_72a9]
signal BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_return_output : unsigned(64 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c8_0373]
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c8_0373]
signal auto_advance_MUX_uxn_device_h_l169_c8_0373_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_0373_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_0373_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_0373_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c11_8702]
signal BIN_OP_EQ_uxn_device_h_l174_c11_8702_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_8702_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_5046]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l174_c7_8956]
signal x_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l174_c7_8956_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_8956_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_8956_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l174_c7_8956]
signal ram_addr_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_8956_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_8956_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_8956_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l174_c7_8956]
signal result_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c7_8956_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_8956_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_8956_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l175_c3_b1f7]
signal x_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(15 downto 0);

-- result_vram_address_MUX[uxn_device_h_l175_c3_b1f7]
signal result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l175_c3_b1f7]
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l175_c3_b1f7]
signal result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_b1f7]
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l175_c3_b1f7]
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l175_c3_b1f7]
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l180_c9_3987]
signal UNARY_OP_NOT_uxn_device_h_l180_c9_3987_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l180_c4_9262]
signal x_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_9262]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c4_9262]
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c4_9262]
signal result_u8_value_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l180_c4_9262]
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c9_54b3]
signal BIN_OP_AND_uxn_device_h_l181_c9_54b3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_54b3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_54b3_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l181_c5_3f33]
signal x_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_3f33]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c5_3f33]
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c5_3f33]
signal result_u8_value_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l182_c6_2972]
signal BIN_OP_PLUS_uxn_device_h_l182_c6_2972_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_2972_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_2972_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l185_c34_3419]
signal CONST_SR_8_uxn_device_h_l185_c34_3419_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l185_c34_3419_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l191_c8_19ee]
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c11_a593]
signal BIN_OP_EQ_uxn_device_h_l195_c11_a593_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_a593_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_5c12]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l195_c7_5046]
signal ram_addr_MUX_uxn_device_h_l195_c7_5046_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_5046_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_5046_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_5046_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l195_c7_5046]
signal result_MUX_uxn_device_h_l195_c7_5046_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l195_c7_5046_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_5046_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_5046_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l196_c3_dccf]
signal ram_addr_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_dccf]
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l196_c3_dccf]
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l196_c3_dccf]
signal result_u8_value_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l197_c8_8acf]
signal BIN_OP_AND_uxn_device_h_l197_c8_8acf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_8acf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_8acf_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_8842]
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l197_c4_8842]
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l197_c4_8842]
signal result_u8_value_MUX_uxn_device_h_l197_c4_8842_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_8842_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_8842_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_8842_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l203_c8_0cb0]
signal ram_addr_MUX_uxn_device_h_l203_c8_0cb0_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_0cb0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l208_c11_4405]
signal BIN_OP_EQ_uxn_device_h_l208_c11_4405_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_4405_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_1f6a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l208_c7_5c12]
signal ram_addr_MUX_uxn_device_h_l208_c7_5c12_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_5c12_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_5c12_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_5c12_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l208_c7_5c12]
signal result_MUX_uxn_device_h_l208_c7_5c12_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l208_c7_5c12_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_5c12_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_5c12_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l209_c3_74f2]
signal ram_addr_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_74f2]
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l209_c3_74f2]
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l209_c3_74f2]
signal result_u8_value_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l210_c8_d625]
signal BIN_OP_AND_uxn_device_h_l210_c8_d625_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c8_d625_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c8_d625_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_f52f]
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l210_c4_f52f]
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l210_c4_f52f]
signal result_u8_value_MUX_uxn_device_h_l210_c4_f52f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_f52f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l213_c33_5b99]
signal CONST_SR_8_uxn_device_h_l213_c33_5b99_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l213_c33_5b99_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l216_c8_2bd3]
signal ram_addr_MUX_uxn_device_h_l216_c8_2bd3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_2bd3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l217_c4_f937]
signal BIN_OP_OR_uxn_device_h_l217_c4_f937_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_f937_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_f937_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l220_c11_7fcd]
signal BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_d782]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l220_c7_1f6a]
signal result_MUX_uxn_device_h_l220_c7_1f6a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l220_c7_1f6a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_1f6a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_1f6a_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_2aea]
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l221_c3_2aea]
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l221_c3_2aea]
signal result_u8_value_MUX_uxn_device_h_l221_c3_2aea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_2aea_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l222_c8_92f9]
signal BIN_OP_AND_uxn_device_h_l222_c8_92f9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c8_92f9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c8_92f9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_2de9]
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l222_c4_2de9]
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l222_c4_2de9]
signal result_u8_value_MUX_uxn_device_h_l222_c4_2de9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_2de9_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_e85e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l230_c3_c4c7]
signal result_MUX_uxn_device_h_l230_c3_c4c7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l230_c3_c4c7_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_c4c7_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_c4c7_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l231_c58_93a8]
signal BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_right : unsigned(3 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l231_c46_8d18]
signal screen_blit_uxn_device_h_l231_c46_8d18_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_8d18_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0
signal CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output : unsigned(7 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_56ba( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_deo_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_027a( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint1_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,1)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_6596( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.device_ram_address := ref_toks_5;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_c31f( ref_toks_0 : device_out_result_t;
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
      base.vram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_deo_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_ec79( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.u8_value := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6( ref_toks_0 : unsigned;
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
      base.is_device_ram_write := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_address := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.ram_address := ref_toks_6;
      base.is_deo_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_d321( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.is_deo_done := ref_toks_3;

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
-- BIN_OP_EQ_uxn_device_h_l95_c6_7cec
BIN_OP_EQ_uxn_device_h_l95_c6_7cec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c6_7cec_left,
BIN_OP_EQ_uxn_device_h_l95_c6_7cec_right,
BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- x_MUX_uxn_device_h_l95_c2_d127
x_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l95_c2_d127_cond,
x_MUX_uxn_device_h_l95_c2_d127_iftrue,
x_MUX_uxn_device_h_l95_c2_d127_iffalse,
x_MUX_uxn_device_h_l95_c2_d127_return_output);

-- flip_x_MUX_uxn_device_h_l95_c2_d127
flip_x_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l95_c2_d127_cond,
flip_x_MUX_uxn_device_h_l95_c2_d127_iftrue,
flip_x_MUX_uxn_device_h_l95_c2_d127_iffalse,
flip_x_MUX_uxn_device_h_l95_c2_d127_return_output);

-- color_MUX_uxn_device_h_l95_c2_d127
color_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l95_c2_d127_cond,
color_MUX_uxn_device_h_l95_c2_d127_iftrue,
color_MUX_uxn_device_h_l95_c2_d127_iffalse,
color_MUX_uxn_device_h_l95_c2_d127_return_output);

-- is_drawing_port_MUX_uxn_device_h_l95_c2_d127
is_drawing_port_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l95_c2_d127_cond,
is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iftrue,
is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iffalse,
is_drawing_port_MUX_uxn_device_h_l95_c2_d127_return_output);

-- layer_MUX_uxn_device_h_l95_c2_d127
layer_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l95_c2_d127_cond,
layer_MUX_uxn_device_h_l95_c2_d127_iftrue,
layer_MUX_uxn_device_h_l95_c2_d127_iffalse,
layer_MUX_uxn_device_h_l95_c2_d127_return_output);

-- ram_addr_MUX_uxn_device_h_l95_c2_d127
ram_addr_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l95_c2_d127_cond,
ram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue,
ram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse,
ram_addr_MUX_uxn_device_h_l95_c2_d127_return_output);

-- ctrl_mode_MUX_uxn_device_h_l95_c2_d127
ctrl_mode_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l95_c2_d127_cond,
ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iftrue,
ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iffalse,
ctrl_mode_MUX_uxn_device_h_l95_c2_d127_return_output);

-- ctrl_MUX_uxn_device_h_l95_c2_d127
ctrl_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l95_c2_d127_cond,
ctrl_MUX_uxn_device_h_l95_c2_d127_iftrue,
ctrl_MUX_uxn_device_h_l95_c2_d127_iffalse,
ctrl_MUX_uxn_device_h_l95_c2_d127_return_output);

-- result_MUX_uxn_device_h_l95_c2_d127
result_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l95_c2_d127_cond,
result_MUX_uxn_device_h_l95_c2_d127_iftrue,
result_MUX_uxn_device_h_l95_c2_d127_iffalse,
result_MUX_uxn_device_h_l95_c2_d127_return_output);

-- is_sprite_port_MUX_uxn_device_h_l95_c2_d127
is_sprite_port_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l95_c2_d127_cond,
is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iftrue,
is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iffalse,
is_sprite_port_MUX_uxn_device_h_l95_c2_d127_return_output);

-- y_MUX_uxn_device_h_l95_c2_d127
y_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l95_c2_d127_cond,
y_MUX_uxn_device_h_l95_c2_d127_iftrue,
y_MUX_uxn_device_h_l95_c2_d127_iffalse,
y_MUX_uxn_device_h_l95_c2_d127_return_output);

-- auto_advance_MUX_uxn_device_h_l95_c2_d127
auto_advance_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l95_c2_d127_cond,
auto_advance_MUX_uxn_device_h_l95_c2_d127_iftrue,
auto_advance_MUX_uxn_device_h_l95_c2_d127_iffalse,
auto_advance_MUX_uxn_device_h_l95_c2_d127_return_output);

-- is_pixel_port_MUX_uxn_device_h_l95_c2_d127
is_pixel_port_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l95_c2_d127_cond,
is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iftrue,
is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iffalse,
is_pixel_port_MUX_uxn_device_h_l95_c2_d127_return_output);

-- flip_y_MUX_uxn_device_h_l95_c2_d127
flip_y_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l95_c2_d127_cond,
flip_y_MUX_uxn_device_h_l95_c2_d127_iftrue,
flip_y_MUX_uxn_device_h_l95_c2_d127_iffalse,
flip_y_MUX_uxn_device_h_l95_c2_d127_return_output);

-- vram_addr_MUX_uxn_device_h_l95_c2_d127
vram_addr_MUX_uxn_device_h_l95_c2_d127 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l95_c2_d127_cond,
vram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue,
vram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse,
vram_addr_MUX_uxn_device_h_l95_c2_d127_return_output);

-- BIN_OP_EQ_uxn_device_h_l96_c19_78ab
BIN_OP_EQ_uxn_device_h_l96_c19_78ab : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l96_c19_78ab_left,
BIN_OP_EQ_uxn_device_h_l96_c19_78ab_right,
BIN_OP_EQ_uxn_device_h_l96_c19_78ab_return_output);

-- MUX_uxn_device_h_l96_c19_209c
MUX_uxn_device_h_l96_c19_209c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c19_209c_cond,
MUX_uxn_device_h_l96_c19_209c_iftrue,
MUX_uxn_device_h_l96_c19_209c_iffalse,
MUX_uxn_device_h_l96_c19_209c_return_output);

-- BIN_OP_EQ_uxn_device_h_l97_c20_ab80
BIN_OP_EQ_uxn_device_h_l97_c20_ab80 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l97_c20_ab80_left,
BIN_OP_EQ_uxn_device_h_l97_c20_ab80_right,
BIN_OP_EQ_uxn_device_h_l97_c20_ab80_return_output);

-- MUX_uxn_device_h_l97_c20_f131
MUX_uxn_device_h_l97_c20_f131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l97_c20_f131_cond,
MUX_uxn_device_h_l97_c20_f131_iftrue,
MUX_uxn_device_h_l97_c20_f131_iffalse,
MUX_uxn_device_h_l97_c20_f131_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c21_bd61
BIN_OP_OR_uxn_device_h_l98_c21_bd61 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c21_bd61_left,
BIN_OP_OR_uxn_device_h_l98_c21_bd61_right,
BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_05be
result_device_ram_address_MUX_uxn_device_h_l102_c3_05be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l102_c3_05be
result_is_deo_done_MUX_uxn_device_h_l102_c3_05be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_cond,
result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iftrue,
result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iffalse,
result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_return_output);

-- MUX_uxn_device_h_l103_c32_eb59
MUX_uxn_device_h_l103_c32_eb59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l103_c32_eb59_cond,
MUX_uxn_device_h_l103_c32_eb59_iftrue,
MUX_uxn_device_h_l103_c32_eb59_iffalse,
MUX_uxn_device_h_l103_c32_eb59_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c11_3653
BIN_OP_EQ_uxn_device_h_l109_c11_3653 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c11_3653_left,
BIN_OP_EQ_uxn_device_h_l109_c11_3653_right,
BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- x_MUX_uxn_device_h_l109_c7_e6a3
x_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l109_c7_e6a3_cond,
x_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
x_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
x_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- flip_x_MUX_uxn_device_h_l109_c7_e6a3
flip_x_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l109_c7_e6a3_cond,
flip_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
flip_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
flip_x_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- color_MUX_uxn_device_h_l109_c7_e6a3
color_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l109_c7_e6a3_cond,
color_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
color_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
color_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- layer_MUX_uxn_device_h_l109_c7_e6a3
layer_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l109_c7_e6a3_cond,
layer_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
layer_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
layer_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- ram_addr_MUX_uxn_device_h_l109_c7_e6a3
ram_addr_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond,
ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
ram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3
ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_cond,
ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- ctrl_MUX_uxn_device_h_l109_c7_e6a3
ctrl_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l109_c7_e6a3_cond,
ctrl_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
ctrl_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
ctrl_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- result_MUX_uxn_device_h_l109_c7_e6a3
result_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l109_c7_e6a3_cond,
result_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
result_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
result_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- y_MUX_uxn_device_h_l109_c7_e6a3
y_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l109_c7_e6a3_cond,
y_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
y_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
y_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- auto_advance_MUX_uxn_device_h_l109_c7_e6a3
auto_advance_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l109_c7_e6a3_cond,
auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
auto_advance_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- flip_y_MUX_uxn_device_h_l109_c7_e6a3
flip_y_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l109_c7_e6a3_cond,
flip_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
flip_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
flip_y_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- vram_addr_MUX_uxn_device_h_l109_c7_e6a3
vram_addr_MUX_uxn_device_h_l109_c7_e6a3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond,
vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue,
vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse,
vram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8
result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_cond,
result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_b1e6
BIN_OP_EQ_uxn_device_h_l114_c11_b1e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_left,
BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_right,
BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_return_output);

-- x_MUX_uxn_device_h_l114_c7_b7a7
x_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l114_c7_b7a7_cond,
x_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
x_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
x_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- flip_x_MUX_uxn_device_h_l114_c7_b7a7
flip_x_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l114_c7_b7a7_cond,
flip_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
flip_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
flip_x_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- color_MUX_uxn_device_h_l114_c7_b7a7
color_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l114_c7_b7a7_cond,
color_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
color_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
color_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- layer_MUX_uxn_device_h_l114_c7_b7a7
layer_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l114_c7_b7a7_cond,
layer_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
layer_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
layer_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- ram_addr_MUX_uxn_device_h_l114_c7_b7a7
ram_addr_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond,
ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
ram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7
ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_cond,
ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- ctrl_MUX_uxn_device_h_l114_c7_b7a7
ctrl_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l114_c7_b7a7_cond,
ctrl_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
ctrl_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
ctrl_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- result_MUX_uxn_device_h_l114_c7_b7a7
result_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l114_c7_b7a7_cond,
result_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
result_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
result_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- y_MUX_uxn_device_h_l114_c7_b7a7
y_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_b7a7_cond,
y_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
y_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
y_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_b7a7
auto_advance_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_b7a7_cond,
auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- flip_y_MUX_uxn_device_h_l114_c7_b7a7
flip_y_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l114_c7_b7a7_cond,
flip_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
flip_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
flip_y_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_b7a7
vram_addr_MUX_uxn_device_h_l114_c7_b7a7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond,
vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output);

-- flip_x_MUX_uxn_device_h_l115_c3_f739
flip_x_MUX_uxn_device_h_l115_c3_f739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l115_c3_f739_cond,
flip_x_MUX_uxn_device_h_l115_c3_f739_iftrue,
flip_x_MUX_uxn_device_h_l115_c3_f739_iffalse,
flip_x_MUX_uxn_device_h_l115_c3_f739_return_output);

-- color_MUX_uxn_device_h_l115_c3_f739
color_MUX_uxn_device_h_l115_c3_f739 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l115_c3_f739_cond,
color_MUX_uxn_device_h_l115_c3_f739_iftrue,
color_MUX_uxn_device_h_l115_c3_f739_iffalse,
color_MUX_uxn_device_h_l115_c3_f739_return_output);

-- layer_MUX_uxn_device_h_l115_c3_f739
layer_MUX_uxn_device_h_l115_c3_f739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l115_c3_f739_cond,
layer_MUX_uxn_device_h_l115_c3_f739_iftrue,
layer_MUX_uxn_device_h_l115_c3_f739_iffalse,
layer_MUX_uxn_device_h_l115_c3_f739_return_output);

-- ctrl_mode_MUX_uxn_device_h_l115_c3_f739
ctrl_mode_MUX_uxn_device_h_l115_c3_f739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l115_c3_f739_cond,
ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iftrue,
ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iffalse,
ctrl_mode_MUX_uxn_device_h_l115_c3_f739_return_output);

-- ctrl_MUX_uxn_device_h_l115_c3_f739
ctrl_MUX_uxn_device_h_l115_c3_f739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l115_c3_f739_cond,
ctrl_MUX_uxn_device_h_l115_c3_f739_iftrue,
ctrl_MUX_uxn_device_h_l115_c3_f739_iffalse,
ctrl_MUX_uxn_device_h_l115_c3_f739_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_f739
result_device_ram_address_MUX_uxn_device_h_l115_c3_f739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_return_output);

-- flip_y_MUX_uxn_device_h_l115_c3_f739
flip_y_MUX_uxn_device_h_l115_c3_f739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l115_c3_f739_cond,
flip_y_MUX_uxn_device_h_l115_c3_f739_iftrue,
flip_y_MUX_uxn_device_h_l115_c3_f739_iffalse,
flip_y_MUX_uxn_device_h_l115_c3_f739_return_output);

-- CONST_SR_7_uxn_device_h_l118_c26_46cd
CONST_SR_7_uxn_device_h_l118_c26_46cd : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l118_c26_46cd_x,
CONST_SR_7_uxn_device_h_l118_c26_46cd_return_output);

-- CONST_SR_6_uxn_device_h_l119_c22_3510
CONST_SR_6_uxn_device_h_l119_c22_3510 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l119_c22_3510_x,
CONST_SR_6_uxn_device_h_l119_c22_3510_return_output);

-- CONST_SR_5_uxn_device_h_l120_c23_4228
CONST_SR_5_uxn_device_h_l120_c23_4228 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l120_c23_4228_x,
CONST_SR_5_uxn_device_h_l120_c23_4228_return_output);

-- CONST_SR_4_uxn_device_h_l121_c23_5a69
CONST_SR_4_uxn_device_h_l121_c23_5a69 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l121_c23_5a69_x,
CONST_SR_4_uxn_device_h_l121_c23_5a69_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_89e8
BIN_OP_EQ_uxn_device_h_l125_c11_89e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_89e8_left,
BIN_OP_EQ_uxn_device_h_l125_c11_89e8_right,
BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_return_output);

-- x_MUX_uxn_device_h_l125_c7_5ed2
x_MUX_uxn_device_h_l125_c7_5ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l125_c7_5ed2_cond,
x_MUX_uxn_device_h_l125_c7_5ed2_iftrue,
x_MUX_uxn_device_h_l125_c7_5ed2_iffalse,
x_MUX_uxn_device_h_l125_c7_5ed2_return_output);

-- ram_addr_MUX_uxn_device_h_l125_c7_5ed2
ram_addr_MUX_uxn_device_h_l125_c7_5ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond,
ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue,
ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse,
ram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output);

-- result_MUX_uxn_device_h_l125_c7_5ed2
result_MUX_uxn_device_h_l125_c7_5ed2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l125_c7_5ed2_cond,
result_MUX_uxn_device_h_l125_c7_5ed2_iftrue,
result_MUX_uxn_device_h_l125_c7_5ed2_iffalse,
result_MUX_uxn_device_h_l125_c7_5ed2_return_output);

-- y_MUX_uxn_device_h_l125_c7_5ed2
y_MUX_uxn_device_h_l125_c7_5ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_5ed2_cond,
y_MUX_uxn_device_h_l125_c7_5ed2_iftrue,
y_MUX_uxn_device_h_l125_c7_5ed2_iffalse,
y_MUX_uxn_device_h_l125_c7_5ed2_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_5ed2
auto_advance_MUX_uxn_device_h_l125_c7_5ed2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_5ed2_cond,
auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_5ed2_return_output);

-- vram_addr_MUX_uxn_device_h_l125_c7_5ed2
vram_addr_MUX_uxn_device_h_l125_c7_5ed2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond,
vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue,
vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse,
vram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output);

-- x_MUX_uxn_device_h_l126_c3_d9d7
x_MUX_uxn_device_h_l126_c3_d9d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l126_c3_d9d7_cond,
x_MUX_uxn_device_h_l126_c3_d9d7_iftrue,
x_MUX_uxn_device_h_l126_c3_d9d7_iffalse,
x_MUX_uxn_device_h_l126_c3_d9d7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7
result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c11_aa4a
BIN_OP_EQ_uxn_device_h_l132_c11_aa4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_left,
BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_right,
BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_return_output);

-- x_MUX_uxn_device_h_l132_c7_2fc9
x_MUX_uxn_device_h_l132_c7_2fc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l132_c7_2fc9_cond,
x_MUX_uxn_device_h_l132_c7_2fc9_iftrue,
x_MUX_uxn_device_h_l132_c7_2fc9_iffalse,
x_MUX_uxn_device_h_l132_c7_2fc9_return_output);

-- ram_addr_MUX_uxn_device_h_l132_c7_2fc9
ram_addr_MUX_uxn_device_h_l132_c7_2fc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond,
ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue,
ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse,
ram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output);

-- result_MUX_uxn_device_h_l132_c7_2fc9
result_MUX_uxn_device_h_l132_c7_2fc9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l132_c7_2fc9_cond,
result_MUX_uxn_device_h_l132_c7_2fc9_iftrue,
result_MUX_uxn_device_h_l132_c7_2fc9_iffalse,
result_MUX_uxn_device_h_l132_c7_2fc9_return_output);

-- y_MUX_uxn_device_h_l132_c7_2fc9
y_MUX_uxn_device_h_l132_c7_2fc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l132_c7_2fc9_cond,
y_MUX_uxn_device_h_l132_c7_2fc9_iftrue,
y_MUX_uxn_device_h_l132_c7_2fc9_iffalse,
y_MUX_uxn_device_h_l132_c7_2fc9_return_output);

-- auto_advance_MUX_uxn_device_h_l132_c7_2fc9
auto_advance_MUX_uxn_device_h_l132_c7_2fc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l132_c7_2fc9_cond,
auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iftrue,
auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iffalse,
auto_advance_MUX_uxn_device_h_l132_c7_2fc9_return_output);

-- vram_addr_MUX_uxn_device_h_l132_c7_2fc9
vram_addr_MUX_uxn_device_h_l132_c7_2fc9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond,
vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue,
vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse,
vram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output);

-- x_MUX_uxn_device_h_l133_c3_0c4b
x_MUX_uxn_device_h_l133_c3_0c4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l133_c3_0c4b_cond,
x_MUX_uxn_device_h_l133_c3_0c4b_iftrue,
x_MUX_uxn_device_h_l133_c3_0c4b_iffalse,
x_MUX_uxn_device_h_l133_c3_0c4b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b
result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_return_output);

-- BIN_OP_OR_uxn_device_h_l134_c4_ab6c
BIN_OP_OR_uxn_device_h_l134_c4_ab6c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l134_c4_ab6c_left,
BIN_OP_OR_uxn_device_h_l134_c4_ab6c_right,
BIN_OP_OR_uxn_device_h_l134_c4_ab6c_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c11_7dff
BIN_OP_EQ_uxn_device_h_l138_c11_7dff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c11_7dff_left,
BIN_OP_EQ_uxn_device_h_l138_c11_7dff_right,
BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_return_output);

-- x_MUX_uxn_device_h_l138_c7_8bf0
x_MUX_uxn_device_h_l138_c7_8bf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l138_c7_8bf0_cond,
x_MUX_uxn_device_h_l138_c7_8bf0_iftrue,
x_MUX_uxn_device_h_l138_c7_8bf0_iffalse,
x_MUX_uxn_device_h_l138_c7_8bf0_return_output);

-- ram_addr_MUX_uxn_device_h_l138_c7_8bf0
ram_addr_MUX_uxn_device_h_l138_c7_8bf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond,
ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue,
ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse,
ram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output);

-- result_MUX_uxn_device_h_l138_c7_8bf0
result_MUX_uxn_device_h_l138_c7_8bf0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l138_c7_8bf0_cond,
result_MUX_uxn_device_h_l138_c7_8bf0_iftrue,
result_MUX_uxn_device_h_l138_c7_8bf0_iffalse,
result_MUX_uxn_device_h_l138_c7_8bf0_return_output);

-- y_MUX_uxn_device_h_l138_c7_8bf0
y_MUX_uxn_device_h_l138_c7_8bf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c7_8bf0_cond,
y_MUX_uxn_device_h_l138_c7_8bf0_iftrue,
y_MUX_uxn_device_h_l138_c7_8bf0_iffalse,
y_MUX_uxn_device_h_l138_c7_8bf0_return_output);

-- auto_advance_MUX_uxn_device_h_l138_c7_8bf0
auto_advance_MUX_uxn_device_h_l138_c7_8bf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l138_c7_8bf0_cond,
auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iftrue,
auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iffalse,
auto_advance_MUX_uxn_device_h_l138_c7_8bf0_return_output);

-- vram_addr_MUX_uxn_device_h_l138_c7_8bf0
vram_addr_MUX_uxn_device_h_l138_c7_8bf0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond,
vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue,
vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse,
vram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l139_c3_c911
result_device_ram_address_MUX_uxn_device_h_l139_c3_c911 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_cond,
result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iftrue,
result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iffalse,
result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_return_output);

-- y_MUX_uxn_device_h_l139_c3_c911
y_MUX_uxn_device_h_l139_c3_c911 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l139_c3_c911_cond,
y_MUX_uxn_device_h_l139_c3_c911_iftrue,
y_MUX_uxn_device_h_l139_c3_c911_iffalse,
y_MUX_uxn_device_h_l139_c3_c911_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_a9cf
BIN_OP_EQ_uxn_device_h_l145_c11_a9cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_left,
BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_right,
BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_return_output);

-- x_MUX_uxn_device_h_l145_c7_d962
x_MUX_uxn_device_h_l145_c7_d962 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l145_c7_d962_cond,
x_MUX_uxn_device_h_l145_c7_d962_iftrue,
x_MUX_uxn_device_h_l145_c7_d962_iffalse,
x_MUX_uxn_device_h_l145_c7_d962_return_output);

-- ram_addr_MUX_uxn_device_h_l145_c7_d962
ram_addr_MUX_uxn_device_h_l145_c7_d962 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l145_c7_d962_cond,
ram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue,
ram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse,
ram_addr_MUX_uxn_device_h_l145_c7_d962_return_output);

-- result_MUX_uxn_device_h_l145_c7_d962
result_MUX_uxn_device_h_l145_c7_d962 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l145_c7_d962_cond,
result_MUX_uxn_device_h_l145_c7_d962_iftrue,
result_MUX_uxn_device_h_l145_c7_d962_iffalse,
result_MUX_uxn_device_h_l145_c7_d962_return_output);

-- y_MUX_uxn_device_h_l145_c7_d962
y_MUX_uxn_device_h_l145_c7_d962 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l145_c7_d962_cond,
y_MUX_uxn_device_h_l145_c7_d962_iftrue,
y_MUX_uxn_device_h_l145_c7_d962_iffalse,
y_MUX_uxn_device_h_l145_c7_d962_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_d962
auto_advance_MUX_uxn_device_h_l145_c7_d962 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_d962_cond,
auto_advance_MUX_uxn_device_h_l145_c7_d962_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_d962_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_d962_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_d962
vram_addr_MUX_uxn_device_h_l145_c7_d962 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_d962_cond,
vram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_d962_return_output);

-- y_MUX_uxn_device_h_l146_c3_6303
y_MUX_uxn_device_h_l146_c3_6303 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l146_c3_6303_cond,
y_MUX_uxn_device_h_l146_c3_6303_iftrue,
y_MUX_uxn_device_h_l146_c3_6303_iffalse,
y_MUX_uxn_device_h_l146_c3_6303_return_output);

-- BIN_OP_OR_uxn_device_h_l147_c4_77b1
BIN_OP_OR_uxn_device_h_l147_c4_77b1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l147_c4_77b1_left,
BIN_OP_OR_uxn_device_h_l147_c4_77b1_right,
BIN_OP_OR_uxn_device_h_l147_c4_77b1_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c11_b9ee
BIN_OP_EQ_uxn_device_h_l150_c11_b9ee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_left,
BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_right,
BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_return_output);

-- x_MUX_uxn_device_h_l150_c7_f950
x_MUX_uxn_device_h_l150_c7_f950 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l150_c7_f950_cond,
x_MUX_uxn_device_h_l150_c7_f950_iftrue,
x_MUX_uxn_device_h_l150_c7_f950_iffalse,
x_MUX_uxn_device_h_l150_c7_f950_return_output);

-- ram_addr_MUX_uxn_device_h_l150_c7_f950
ram_addr_MUX_uxn_device_h_l150_c7_f950 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l150_c7_f950_cond,
ram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue,
ram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse,
ram_addr_MUX_uxn_device_h_l150_c7_f950_return_output);

-- result_MUX_uxn_device_h_l150_c7_f950
result_MUX_uxn_device_h_l150_c7_f950 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l150_c7_f950_cond,
result_MUX_uxn_device_h_l150_c7_f950_iftrue,
result_MUX_uxn_device_h_l150_c7_f950_iffalse,
result_MUX_uxn_device_h_l150_c7_f950_return_output);

-- auto_advance_MUX_uxn_device_h_l150_c7_f950
auto_advance_MUX_uxn_device_h_l150_c7_f950 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l150_c7_f950_cond,
auto_advance_MUX_uxn_device_h_l150_c7_f950_iftrue,
auto_advance_MUX_uxn_device_h_l150_c7_f950_iffalse,
auto_advance_MUX_uxn_device_h_l150_c7_f950_return_output);

-- vram_addr_MUX_uxn_device_h_l150_c7_f950
vram_addr_MUX_uxn_device_h_l150_c7_f950 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l150_c7_f950_cond,
vram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue,
vram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse,
vram_addr_MUX_uxn_device_h_l150_c7_f950_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c3_9e16
result_vram_address_MUX_uxn_device_h_l151_c3_9e16 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c3_9e16_cond,
result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c3_9e16_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_cond,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16
result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_return_output);

-- result_u8_value_MUX_uxn_device_h_l151_c3_9e16
result_u8_value_MUX_uxn_device_h_l151_c3_9e16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l151_c3_9e16_cond,
result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iftrue,
result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iffalse,
result_u8_value_MUX_uxn_device_h_l151_c3_9e16_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16
result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c3_9e16
auto_advance_MUX_uxn_device_h_l151_c3_9e16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c3_9e16_cond,
auto_advance_MUX_uxn_device_h_l151_c3_9e16_iftrue,
auto_advance_MUX_uxn_device_h_l151_c3_9e16_iffalse,
auto_advance_MUX_uxn_device_h_l151_c3_9e16_return_output);

-- vram_addr_MUX_uxn_device_h_l151_c3_9e16
vram_addr_MUX_uxn_device_h_l151_c3_9e16 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l151_c3_9e16_cond,
vram_addr_MUX_uxn_device_h_l151_c3_9e16_iftrue,
vram_addr_MUX_uxn_device_h_l151_c3_9e16_iffalse,
vram_addr_MUX_uxn_device_h_l151_c3_9e16_return_output);

-- BIN_OP_AND_uxn_device_h_l154_c32_95db
BIN_OP_AND_uxn_device_h_l154_c32_95db : entity work.BIN_OP_AND_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l154_c32_95db_left,
BIN_OP_AND_uxn_device_h_l154_c32_95db_right,
BIN_OP_AND_uxn_device_h_l154_c32_95db_return_output);

-- result_vram_address_MUX_uxn_device_h_l156_c4_5cac
result_vram_address_MUX_uxn_device_h_l156_c4_5cac : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l156_c4_5cac_cond,
result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iftrue,
result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iffalse,
result_vram_address_MUX_uxn_device_h_l156_c4_5cac_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac
result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_cond,
result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iftrue,
result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iffalse,
result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_return_output);

-- vram_addr_MUX_uxn_device_h_l156_c4_5cac
vram_addr_MUX_uxn_device_h_l156_c4_5cac : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l156_c4_5cac_cond,
vram_addr_MUX_uxn_device_h_l156_c4_5cac_iftrue,
vram_addr_MUX_uxn_device_h_l156_c4_5cac_iffalse,
vram_addr_MUX_uxn_device_h_l156_c4_5cac_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c18_7896
BIN_OP_PLUS_uxn_device_h_l157_c18_7896 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c18_7896_left,
BIN_OP_PLUS_uxn_device_h_l157_c18_7896_right,
BIN_OP_PLUS_uxn_device_h_l157_c18_7896_return_output);

-- BIN_OP_AND_uxn_device_h_l158_c5_780f
BIN_OP_AND_uxn_device_h_l158_c5_780f : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l158_c5_780f_left,
BIN_OP_AND_uxn_device_h_l158_c5_780f_right,
BIN_OP_AND_uxn_device_h_l158_c5_780f_return_output);

-- MUX_uxn_device_h_l159_c19_c74b
MUX_uxn_device_h_l159_c19_c74b : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l159_c19_c74b_cond,
MUX_uxn_device_h_l159_c19_c74b_iftrue,
MUX_uxn_device_h_l159_c19_c74b_iffalse,
MUX_uxn_device_h_l159_c19_c74b_return_output);

-- BIN_OP_OR_uxn_device_h_l159_c5_651e
BIN_OP_OR_uxn_device_h_l159_c5_651e : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l159_c5_651e_left,
BIN_OP_OR_uxn_device_h_l159_c5_651e_right,
BIN_OP_OR_uxn_device_h_l159_c5_651e_return_output);

-- MUX_uxn_device_h_l160_c19_34d9
MUX_uxn_device_h_l160_c19_34d9 : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l160_c19_34d9_cond,
MUX_uxn_device_h_l160_c19_34d9_iftrue,
MUX_uxn_device_h_l160_c19_34d9_iffalse,
MUX_uxn_device_h_l160_c19_34d9_return_output);

-- BIN_OP_OR_uxn_device_h_l160_c5_3dab
BIN_OP_OR_uxn_device_h_l160_c5_3dab : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l160_c5_3dab_left,
BIN_OP_OR_uxn_device_h_l160_c5_3dab_right,
BIN_OP_OR_uxn_device_h_l160_c5_3dab_return_output);

-- BIN_OP_OR_uxn_device_h_l161_c5_525d
BIN_OP_OR_uxn_device_h_l161_c5_525d : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l161_c5_525d_left,
BIN_OP_OR_uxn_device_h_l161_c5_525d_right,
BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l165_c28_72a9
BIN_OP_PLUS_uxn_device_h_l165_c28_72a9 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_left,
BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_right,
BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c8_0373
result_device_ram_address_MUX_uxn_device_h_l169_c8_0373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c8_0373
auto_advance_MUX_uxn_device_h_l169_c8_0373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c8_0373_cond,
auto_advance_MUX_uxn_device_h_l169_c8_0373_iftrue,
auto_advance_MUX_uxn_device_h_l169_c8_0373_iffalse,
auto_advance_MUX_uxn_device_h_l169_c8_0373_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c11_8702
BIN_OP_EQ_uxn_device_h_l174_c11_8702 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c11_8702_left,
BIN_OP_EQ_uxn_device_h_l174_c11_8702_right,
BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_return_output);

-- x_MUX_uxn_device_h_l174_c7_8956
x_MUX_uxn_device_h_l174_c7_8956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l174_c7_8956_cond,
x_MUX_uxn_device_h_l174_c7_8956_iftrue,
x_MUX_uxn_device_h_l174_c7_8956_iffalse,
x_MUX_uxn_device_h_l174_c7_8956_return_output);

-- ram_addr_MUX_uxn_device_h_l174_c7_8956
ram_addr_MUX_uxn_device_h_l174_c7_8956 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l174_c7_8956_cond,
ram_addr_MUX_uxn_device_h_l174_c7_8956_iftrue,
ram_addr_MUX_uxn_device_h_l174_c7_8956_iffalse,
ram_addr_MUX_uxn_device_h_l174_c7_8956_return_output);

-- result_MUX_uxn_device_h_l174_c7_8956
result_MUX_uxn_device_h_l174_c7_8956 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c7_8956_cond,
result_MUX_uxn_device_h_l174_c7_8956_iftrue,
result_MUX_uxn_device_h_l174_c7_8956_iffalse,
result_MUX_uxn_device_h_l174_c7_8956_return_output);

-- x_MUX_uxn_device_h_l175_c3_b1f7
x_MUX_uxn_device_h_l175_c3_b1f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l175_c3_b1f7_cond,
x_MUX_uxn_device_h_l175_c3_b1f7_iftrue,
x_MUX_uxn_device_h_l175_c3_b1f7_iffalse,
x_MUX_uxn_device_h_l175_c3_b1f7_return_output);

-- result_vram_address_MUX_uxn_device_h_l175_c3_b1f7
result_vram_address_MUX_uxn_device_h_l175_c3_b1f7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_cond,
result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue,
result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse,
result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7
result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_cond,
result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output);

-- result_u8_value_MUX_uxn_device_h_l175_c3_b1f7
result_u8_value_MUX_uxn_device_h_l175_c3_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_cond,
result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iftrue,
result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iffalse,
result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7
result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_cond,
result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7
result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_cond,
result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_return_output);

-- UNARY_OP_NOT_uxn_device_h_l180_c9_3987
UNARY_OP_NOT_uxn_device_h_l180_c9_3987 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l180_c9_3987_expr,
UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output);

-- x_MUX_uxn_device_h_l180_c4_9262
x_MUX_uxn_device_h_l180_c4_9262 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l180_c4_9262_cond,
x_MUX_uxn_device_h_l180_c4_9262_iftrue,
x_MUX_uxn_device_h_l180_c4_9262_iffalse,
x_MUX_uxn_device_h_l180_c4_9262_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c4_9262
result_device_ram_address_MUX_uxn_device_h_l180_c4_9262 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c4_9262
result_u8_value_MUX_uxn_device_h_l180_c4_9262 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c4_9262_cond,
result_u8_value_MUX_uxn_device_h_l180_c4_9262_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c4_9262_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c4_9262_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l180_c4_9262
result_is_deo_done_MUX_uxn_device_h_l180_c4_9262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_cond,
result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iftrue,
result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iffalse,
result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c9_54b3
BIN_OP_AND_uxn_device_h_l181_c9_54b3 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c9_54b3_left,
BIN_OP_AND_uxn_device_h_l181_c9_54b3_right,
BIN_OP_AND_uxn_device_h_l181_c9_54b3_return_output);

-- x_MUX_uxn_device_h_l181_c5_3f33
x_MUX_uxn_device_h_l181_c5_3f33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c5_3f33_cond,
x_MUX_uxn_device_h_l181_c5_3f33_iftrue,
x_MUX_uxn_device_h_l181_c5_3f33_iffalse,
x_MUX_uxn_device_h_l181_c5_3f33_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33
result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c5_3f33
result_u8_value_MUX_uxn_device_h_l181_c5_3f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c5_3f33_cond,
result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c5_3f33_return_output);

-- BIN_OP_PLUS_uxn_device_h_l182_c6_2972
BIN_OP_PLUS_uxn_device_h_l182_c6_2972 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l182_c6_2972_left,
BIN_OP_PLUS_uxn_device_h_l182_c6_2972_right,
BIN_OP_PLUS_uxn_device_h_l182_c6_2972_return_output);

-- CONST_SR_8_uxn_device_h_l185_c34_3419
CONST_SR_8_uxn_device_h_l185_c34_3419 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l185_c34_3419_x,
CONST_SR_8_uxn_device_h_l185_c34_3419_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee
result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_cond,
result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iftrue,
result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iffalse,
result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c11_a593
BIN_OP_EQ_uxn_device_h_l195_c11_a593 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c11_a593_left,
BIN_OP_EQ_uxn_device_h_l195_c11_a593_right,
BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_return_output);

-- ram_addr_MUX_uxn_device_h_l195_c7_5046
ram_addr_MUX_uxn_device_h_l195_c7_5046 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l195_c7_5046_cond,
ram_addr_MUX_uxn_device_h_l195_c7_5046_iftrue,
ram_addr_MUX_uxn_device_h_l195_c7_5046_iffalse,
ram_addr_MUX_uxn_device_h_l195_c7_5046_return_output);

-- result_MUX_uxn_device_h_l195_c7_5046
result_MUX_uxn_device_h_l195_c7_5046 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l195_c7_5046_cond,
result_MUX_uxn_device_h_l195_c7_5046_iftrue,
result_MUX_uxn_device_h_l195_c7_5046_iffalse,
result_MUX_uxn_device_h_l195_c7_5046_return_output);

-- ram_addr_MUX_uxn_device_h_l196_c3_dccf
ram_addr_MUX_uxn_device_h_l196_c3_dccf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l196_c3_dccf_cond,
ram_addr_MUX_uxn_device_h_l196_c3_dccf_iftrue,
ram_addr_MUX_uxn_device_h_l196_c3_dccf_iffalse,
ram_addr_MUX_uxn_device_h_l196_c3_dccf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_cond,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf
result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_cond,
result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_return_output);

-- result_u8_value_MUX_uxn_device_h_l196_c3_dccf
result_u8_value_MUX_uxn_device_h_l196_c3_dccf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l196_c3_dccf_cond,
result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iftrue,
result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iffalse,
result_u8_value_MUX_uxn_device_h_l196_c3_dccf_return_output);

-- BIN_OP_AND_uxn_device_h_l197_c8_8acf
BIN_OP_AND_uxn_device_h_l197_c8_8acf : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l197_c8_8acf_left,
BIN_OP_AND_uxn_device_h_l197_c8_8acf_right,
BIN_OP_AND_uxn_device_h_l197_c8_8acf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_cond,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l197_c4_8842
result_device_ram_address_MUX_uxn_device_h_l197_c4_8842 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_cond,
result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iftrue,
result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iffalse,
result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_return_output);

-- result_u8_value_MUX_uxn_device_h_l197_c4_8842
result_u8_value_MUX_uxn_device_h_l197_c4_8842 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l197_c4_8842_cond,
result_u8_value_MUX_uxn_device_h_l197_c4_8842_iftrue,
result_u8_value_MUX_uxn_device_h_l197_c4_8842_iffalse,
result_u8_value_MUX_uxn_device_h_l197_c4_8842_return_output);

-- ram_addr_MUX_uxn_device_h_l203_c8_0cb0
ram_addr_MUX_uxn_device_h_l203_c8_0cb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l203_c8_0cb0_cond,
ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iftrue,
ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iffalse,
ram_addr_MUX_uxn_device_h_l203_c8_0cb0_return_output);

-- BIN_OP_EQ_uxn_device_h_l208_c11_4405
BIN_OP_EQ_uxn_device_h_l208_c11_4405 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l208_c11_4405_left,
BIN_OP_EQ_uxn_device_h_l208_c11_4405_right,
BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_return_output);

-- ram_addr_MUX_uxn_device_h_l208_c7_5c12
ram_addr_MUX_uxn_device_h_l208_c7_5c12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l208_c7_5c12_cond,
ram_addr_MUX_uxn_device_h_l208_c7_5c12_iftrue,
ram_addr_MUX_uxn_device_h_l208_c7_5c12_iffalse,
ram_addr_MUX_uxn_device_h_l208_c7_5c12_return_output);

-- result_MUX_uxn_device_h_l208_c7_5c12
result_MUX_uxn_device_h_l208_c7_5c12 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l208_c7_5c12_cond,
result_MUX_uxn_device_h_l208_c7_5c12_iftrue,
result_MUX_uxn_device_h_l208_c7_5c12_iffalse,
result_MUX_uxn_device_h_l208_c7_5c12_return_output);

-- ram_addr_MUX_uxn_device_h_l209_c3_74f2
ram_addr_MUX_uxn_device_h_l209_c3_74f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l209_c3_74f2_cond,
ram_addr_MUX_uxn_device_h_l209_c3_74f2_iftrue,
ram_addr_MUX_uxn_device_h_l209_c3_74f2_iffalse,
ram_addr_MUX_uxn_device_h_l209_c3_74f2_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_cond,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2
result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_cond,
result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_return_output);

-- result_u8_value_MUX_uxn_device_h_l209_c3_74f2
result_u8_value_MUX_uxn_device_h_l209_c3_74f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l209_c3_74f2_cond,
result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iftrue,
result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iffalse,
result_u8_value_MUX_uxn_device_h_l209_c3_74f2_return_output);

-- BIN_OP_AND_uxn_device_h_l210_c8_d625
BIN_OP_AND_uxn_device_h_l210_c8_d625 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l210_c8_d625_left,
BIN_OP_AND_uxn_device_h_l210_c8_d625_right,
BIN_OP_AND_uxn_device_h_l210_c8_d625_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f
result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_cond,
result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_return_output);

-- result_u8_value_MUX_uxn_device_h_l210_c4_f52f
result_u8_value_MUX_uxn_device_h_l210_c4_f52f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l210_c4_f52f_cond,
result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iftrue,
result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iffalse,
result_u8_value_MUX_uxn_device_h_l210_c4_f52f_return_output);

-- CONST_SR_8_uxn_device_h_l213_c33_5b99
CONST_SR_8_uxn_device_h_l213_c33_5b99 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l213_c33_5b99_x,
CONST_SR_8_uxn_device_h_l213_c33_5b99_return_output);

-- ram_addr_MUX_uxn_device_h_l216_c8_2bd3
ram_addr_MUX_uxn_device_h_l216_c8_2bd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l216_c8_2bd3_cond,
ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iftrue,
ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iffalse,
ram_addr_MUX_uxn_device_h_l216_c8_2bd3_return_output);

-- BIN_OP_OR_uxn_device_h_l217_c4_f937
BIN_OP_OR_uxn_device_h_l217_c4_f937 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l217_c4_f937_left,
BIN_OP_OR_uxn_device_h_l217_c4_f937_right,
BIN_OP_OR_uxn_device_h_l217_c4_f937_return_output);

-- BIN_OP_EQ_uxn_device_h_l220_c11_7fcd
BIN_OP_EQ_uxn_device_h_l220_c11_7fcd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_left,
BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_right,
BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_return_output);

-- result_MUX_uxn_device_h_l220_c7_1f6a
result_MUX_uxn_device_h_l220_c7_1f6a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l220_c7_1f6a_cond,
result_MUX_uxn_device_h_l220_c7_1f6a_iftrue,
result_MUX_uxn_device_h_l220_c7_1f6a_iffalse,
result_MUX_uxn_device_h_l220_c7_1f6a_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_cond,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea
result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_cond,
result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iftrue,
result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iffalse,
result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_return_output);

-- result_u8_value_MUX_uxn_device_h_l221_c3_2aea
result_u8_value_MUX_uxn_device_h_l221_c3_2aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l221_c3_2aea_cond,
result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iftrue,
result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iffalse,
result_u8_value_MUX_uxn_device_h_l221_c3_2aea_return_output);

-- BIN_OP_AND_uxn_device_h_l222_c8_92f9
BIN_OP_AND_uxn_device_h_l222_c8_92f9 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l222_c8_92f9_left,
BIN_OP_AND_uxn_device_h_l222_c8_92f9_right,
BIN_OP_AND_uxn_device_h_l222_c8_92f9_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_cond,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9
result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_cond,
result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_return_output);

-- result_u8_value_MUX_uxn_device_h_l222_c4_2de9
result_u8_value_MUX_uxn_device_h_l222_c4_2de9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l222_c4_2de9_cond,
result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iftrue,
result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iffalse,
result_u8_value_MUX_uxn_device_h_l222_c4_2de9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_return_output);

-- result_MUX_uxn_device_h_l230_c3_c4c7
result_MUX_uxn_device_h_l230_c3_c4c7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l230_c3_c4c7_cond,
result_MUX_uxn_device_h_l230_c3_c4c7_iftrue,
result_MUX_uxn_device_h_l230_c3_c4c7_iffalse,
result_MUX_uxn_device_h_l230_c3_c4c7_return_output);

-- BIN_OP_MINUS_uxn_device_h_l231_c58_93a8
BIN_OP_MINUS_uxn_device_h_l231_c58_93a8 : entity work.BIN_OP_MINUS_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_left,
BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_right,
BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_return_output);

-- screen_blit_uxn_device_h_l231_c46_8d18
screen_blit_uxn_device_h_l231_c46_8d18 : entity work.screen_blit_0CLK_b1675d32 port map (
clk,
screen_blit_uxn_device_h_l231_c46_8d18_CLOCK_ENABLE,
screen_blit_uxn_device_h_l231_c46_8d18_phase,
screen_blit_uxn_device_h_l231_c46_8d18_ctrl,
screen_blit_uxn_device_h_l231_c46_8d18_auto_advance,
screen_blit_uxn_device_h_l231_c46_8d18_x,
screen_blit_uxn_device_h_l231_c46_8d18_y,
screen_blit_uxn_device_h_l231_c46_8d18_ram_addr,
screen_blit_uxn_device_h_l231_c46_8d18_previous_ram_read,
screen_blit_uxn_device_h_l231_c46_8d18_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_x,
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_x,
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 vram_addr,
 x,
 y,
 ram_addr,
 ctrl,
 auto_advance,
 color,
 is_pixel_port,
 is_sprite_port,
 is_drawing_port,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 x_MUX_uxn_device_h_l95_c2_d127_return_output,
 flip_x_MUX_uxn_device_h_l95_c2_d127_return_output,
 color_MUX_uxn_device_h_l95_c2_d127_return_output,
 is_drawing_port_MUX_uxn_device_h_l95_c2_d127_return_output,
 layer_MUX_uxn_device_h_l95_c2_d127_return_output,
 ram_addr_MUX_uxn_device_h_l95_c2_d127_return_output,
 ctrl_mode_MUX_uxn_device_h_l95_c2_d127_return_output,
 ctrl_MUX_uxn_device_h_l95_c2_d127_return_output,
 result_MUX_uxn_device_h_l95_c2_d127_return_output,
 is_sprite_port_MUX_uxn_device_h_l95_c2_d127_return_output,
 y_MUX_uxn_device_h_l95_c2_d127_return_output,
 auto_advance_MUX_uxn_device_h_l95_c2_d127_return_output,
 is_pixel_port_MUX_uxn_device_h_l95_c2_d127_return_output,
 flip_y_MUX_uxn_device_h_l95_c2_d127_return_output,
 vram_addr_MUX_uxn_device_h_l95_c2_d127_return_output,
 BIN_OP_EQ_uxn_device_h_l96_c19_78ab_return_output,
 MUX_uxn_device_h_l96_c19_209c_return_output,
 BIN_OP_EQ_uxn_device_h_l97_c20_ab80_return_output,
 MUX_uxn_device_h_l97_c20_f131_return_output,
 BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_return_output,
 result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_return_output,
 MUX_uxn_device_h_l103_c32_eb59_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 x_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 flip_x_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 color_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 layer_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 ram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 ctrl_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 result_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 y_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 auto_advance_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 flip_y_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 vram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_return_output,
 x_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 flip_x_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 color_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 layer_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 ram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 ctrl_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 result_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 y_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 flip_y_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output,
 flip_x_MUX_uxn_device_h_l115_c3_f739_return_output,
 color_MUX_uxn_device_h_l115_c3_f739_return_output,
 layer_MUX_uxn_device_h_l115_c3_f739_return_output,
 ctrl_mode_MUX_uxn_device_h_l115_c3_f739_return_output,
 ctrl_MUX_uxn_device_h_l115_c3_f739_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_return_output,
 flip_y_MUX_uxn_device_h_l115_c3_f739_return_output,
 CONST_SR_7_uxn_device_h_l118_c26_46cd_return_output,
 CONST_SR_6_uxn_device_h_l119_c22_3510_return_output,
 CONST_SR_5_uxn_device_h_l120_c23_4228_return_output,
 CONST_SR_4_uxn_device_h_l121_c23_5a69_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_return_output,
 x_MUX_uxn_device_h_l125_c7_5ed2_return_output,
 ram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output,
 result_MUX_uxn_device_h_l125_c7_5ed2_return_output,
 y_MUX_uxn_device_h_l125_c7_5ed2_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_5ed2_return_output,
 vram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output,
 x_MUX_uxn_device_h_l126_c3_d9d7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_return_output,
 x_MUX_uxn_device_h_l132_c7_2fc9_return_output,
 ram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output,
 result_MUX_uxn_device_h_l132_c7_2fc9_return_output,
 y_MUX_uxn_device_h_l132_c7_2fc9_return_output,
 auto_advance_MUX_uxn_device_h_l132_c7_2fc9_return_output,
 vram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output,
 x_MUX_uxn_device_h_l133_c3_0c4b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_return_output,
 BIN_OP_OR_uxn_device_h_l134_c4_ab6c_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_return_output,
 x_MUX_uxn_device_h_l138_c7_8bf0_return_output,
 ram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output,
 result_MUX_uxn_device_h_l138_c7_8bf0_return_output,
 y_MUX_uxn_device_h_l138_c7_8bf0_return_output,
 auto_advance_MUX_uxn_device_h_l138_c7_8bf0_return_output,
 vram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_return_output,
 y_MUX_uxn_device_h_l139_c3_c911_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_return_output,
 x_MUX_uxn_device_h_l145_c7_d962_return_output,
 ram_addr_MUX_uxn_device_h_l145_c7_d962_return_output,
 result_MUX_uxn_device_h_l145_c7_d962_return_output,
 y_MUX_uxn_device_h_l145_c7_d962_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_d962_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_d962_return_output,
 y_MUX_uxn_device_h_l146_c3_6303_return_output,
 BIN_OP_OR_uxn_device_h_l147_c4_77b1_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_return_output,
 x_MUX_uxn_device_h_l150_c7_f950_return_output,
 ram_addr_MUX_uxn_device_h_l150_c7_f950_return_output,
 result_MUX_uxn_device_h_l150_c7_f950_return_output,
 auto_advance_MUX_uxn_device_h_l150_c7_f950_return_output,
 vram_addr_MUX_uxn_device_h_l150_c7_f950_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c3_9e16_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_return_output,
 result_u8_value_MUX_uxn_device_h_l151_c3_9e16_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_return_output,
 auto_advance_MUX_uxn_device_h_l151_c3_9e16_return_output,
 vram_addr_MUX_uxn_device_h_l151_c3_9e16_return_output,
 BIN_OP_AND_uxn_device_h_l154_c32_95db_return_output,
 result_vram_address_MUX_uxn_device_h_l156_c4_5cac_return_output,
 result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_return_output,
 vram_addr_MUX_uxn_device_h_l156_c4_5cac_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c18_7896_return_output,
 BIN_OP_AND_uxn_device_h_l158_c5_780f_return_output,
 MUX_uxn_device_h_l159_c19_c74b_return_output,
 BIN_OP_OR_uxn_device_h_l159_c5_651e_return_output,
 MUX_uxn_device_h_l160_c19_34d9_return_output,
 BIN_OP_OR_uxn_device_h_l160_c5_3dab_return_output,
 BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_return_output,
 BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_return_output,
 auto_advance_MUX_uxn_device_h_l169_c8_0373_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_return_output,
 x_MUX_uxn_device_h_l174_c7_8956_return_output,
 ram_addr_MUX_uxn_device_h_l174_c7_8956_return_output,
 result_MUX_uxn_device_h_l174_c7_8956_return_output,
 x_MUX_uxn_device_h_l175_c3_b1f7_return_output,
 result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output,
 result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_return_output,
 UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output,
 x_MUX_uxn_device_h_l180_c4_9262_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c4_9262_return_output,
 result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_return_output,
 BIN_OP_AND_uxn_device_h_l181_c9_54b3_return_output,
 x_MUX_uxn_device_h_l181_c5_3f33_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c5_3f33_return_output,
 BIN_OP_PLUS_uxn_device_h_l182_c6_2972_return_output,
 CONST_SR_8_uxn_device_h_l185_c34_3419_return_output,
 result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_return_output,
 ram_addr_MUX_uxn_device_h_l195_c7_5046_return_output,
 result_MUX_uxn_device_h_l195_c7_5046_return_output,
 ram_addr_MUX_uxn_device_h_l196_c3_dccf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_return_output,
 result_u8_value_MUX_uxn_device_h_l196_c3_dccf_return_output,
 BIN_OP_AND_uxn_device_h_l197_c8_8acf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_return_output,
 result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_return_output,
 result_u8_value_MUX_uxn_device_h_l197_c4_8842_return_output,
 ram_addr_MUX_uxn_device_h_l203_c8_0cb0_return_output,
 BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_return_output,
 ram_addr_MUX_uxn_device_h_l208_c7_5c12_return_output,
 result_MUX_uxn_device_h_l208_c7_5c12_return_output,
 ram_addr_MUX_uxn_device_h_l209_c3_74f2_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_return_output,
 result_u8_value_MUX_uxn_device_h_l209_c3_74f2_return_output,
 BIN_OP_AND_uxn_device_h_l210_c8_d625_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_return_output,
 result_u8_value_MUX_uxn_device_h_l210_c4_f52f_return_output,
 CONST_SR_8_uxn_device_h_l213_c33_5b99_return_output,
 ram_addr_MUX_uxn_device_h_l216_c8_2bd3_return_output,
 BIN_OP_OR_uxn_device_h_l217_c4_f937_return_output,
 BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_return_output,
 result_MUX_uxn_device_h_l220_c7_1f6a_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_return_output,
 result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_return_output,
 result_u8_value_MUX_uxn_device_h_l221_c3_2aea_return_output,
 BIN_OP_AND_uxn_device_h_l222_c8_92f9_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_return_output,
 result_u8_value_MUX_uxn_device_h_l222_c4_2de9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_return_output,
 result_MUX_uxn_device_h_l230_c3_c4c7_return_output,
 BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_return_output,
 screen_blit_uxn_device_h_l231_c46_8d18_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c2_d127_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_d127_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_d127_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_e6a3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_d127_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l101_c3_456a : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_209c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_209c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_209c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_209c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_f131_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_f131_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_f131_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_f131_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_eb59_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_eb59_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_eb59_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_eb59_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l109_c7_e6a3_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_e6a3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_e6a3_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_b7a7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_a3f6 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l114_c7_b7a7_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_b7a7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_b7a7_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_5ed2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l122_c4_726d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_e704_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_46cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_46cd_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_f109_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_3510_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_3510_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_da01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_4228_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_4228_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_9ca2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_5a69_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_5a69_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_68ed_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_d9d7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l125_c7_5ed2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_5ed2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_5ed2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_2fc9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_d9d7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_d9d7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_d9d7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_61ca : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0c4b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l132_c7_2fc9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_2fc9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_2fc9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_8bf0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0c4b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0c4b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0c4b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l135_c4_23b5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l138_c7_8bf0_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_8bf0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_8bf0_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_d962_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_c911_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l142_c4_9f2c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_c911_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_c911_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_c911_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l145_c7_d962_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_d962_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_f950_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_6303_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_6303_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_6303_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_6303_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_8956_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l150_c7_f950_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6596_uxn_device_h_l150_c7_f950_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_f950_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_8956_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_9e16_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l153_c4_0a34 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_76d7_return_output : unsigned(7 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l165_c5_9a28 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l157_c5_67d4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_c74b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_c74b_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_c74b_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_c74b_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_34d9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_34d9_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_34d9_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_34d9_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_return_output : unsigned(64 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l171_c4_40a2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_8956_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_8956_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c7_8956_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c31f_uxn_device_h_l174_c7_8956_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_8956_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_5046_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_8956_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l178_c4_c6eb : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l179_c4_d8cc : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l181_c5_3f33_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l182_c6_5f2f : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l184_c6_7c3f : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_3419_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_3419_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_b80c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l192_c4_0277 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l195_c7_5046_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_5046_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_5046_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_5c12_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_5046_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l197_c4_8842_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l199_c5_085b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_83a5_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l208_c7_5c12_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_5c12_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_5c12_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_1f6a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_5c12_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c4_f52f_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l212_c5_5302 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_5b99_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_5b99_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_ef83_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l220_c7_1f6a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_1f6a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_1f6a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_c4c7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_1f6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c4_2de9_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l224_c5_6644 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_c10c_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l230_c3_c4c7_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_c4c7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_c4c7_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_c4c7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_c4c7_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l233_c4_e184 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_318d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_1a3b_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_7934_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_2c56_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_e665_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_4cec_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l242_c4_890c : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l147_l217_l134_l127_l204_l140_DUPLICATE_3732_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_6b75_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_12ea_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l175_l151_DUPLICATE_7299_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l175_l151_DUPLICATE_4300_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l175_l180_DUPLICATE_7ee3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vram_addr : unsigned(31 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ram_addr : unsigned(15 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(3 downto 0);
variable REG_VAR_is_pixel_port : unsigned(0 downto 0);
variable REG_VAR_is_sprite_port : unsigned(0 downto 0);
variable REG_VAR_is_drawing_port : unsigned(0 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vram_addr := vram_addr;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ram_addr := ram_addr;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_color := color;
  REG_VAR_is_pixel_port := is_pixel_port;
  REG_VAR_is_sprite_port := is_sprite_port;
  REG_VAR_is_drawing_port := is_drawing_port;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l142_c4_9f2c := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iftrue := VAR_result_device_ram_address_uxn_device_h_l142_c4_9f2c;
     VAR_MUX_uxn_device_h_l103_c32_eb59_iftrue := resize(to_unsigned(46, 6), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_right := to_unsigned(10, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l159_c19_c74b_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_right := to_unsigned(11, 4);
     VAR_result_device_ram_address_uxn_device_h_l233_c4_e184 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l199_c5_085b := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iftrue := VAR_result_device_ram_address_uxn_device_h_l199_c5_085b;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_right := to_unsigned(4, 3);
     VAR_MUX_uxn_device_h_l97_c20_f131_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l242_c4_890c := resize(to_unsigned(0, 1), 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_61ca := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_61ca;
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_right := to_unsigned(262143, 18);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_right := to_unsigned(5, 3);
     VAR_result_device_ram_address_uxn_device_h_l212_c5_5302 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iftrue := VAR_result_device_ram_address_uxn_device_h_l212_c5_5302;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_right := to_unsigned(12, 4);
     VAR_vram_addr_uxn_device_h_l101_c3_456a := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue := VAR_vram_addr_uxn_device_h_l101_c3_456a;
     VAR_result_device_ram_address_uxn_device_h_l153_c4_0a34 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue := VAR_result_device_ram_address_uxn_device_h_l153_c4_0a34;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l192_c4_0277 := resize(to_unsigned(45, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iftrue := VAR_result_device_ram_address_uxn_device_h_l192_c4_0277;
     VAR_result_device_ram_address_uxn_device_h_l122_c4_726d := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iftrue := VAR_result_device_ram_address_uxn_device_h_l122_c4_726d;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l171_c4_40a2 := resize(to_unsigned(44, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iftrue := VAR_result_device_ram_address_uxn_device_h_l171_c4_40a2;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l184_c6_7c3f := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iftrue := VAR_result_device_ram_address_uxn_device_h_l184_c6_7c3f;
     VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iftrue := to_unsigned(0, 1);
     VAR_result_vram_address_uxn_device_h_l178_c4_c6eb := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue := VAR_result_vram_address_uxn_device_h_l178_c4_c6eb;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iftrue := to_unsigned(0, 1);
     VAR_result_u8_value_uxn_device_h_l179_c4_d8cc := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_d8cc;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_d8cc;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_right := to_unsigned(400, 32);
     VAR_MUX_uxn_device_h_l96_c19_209c_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_a3f6 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_a3f6;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_right := to_unsigned(9, 4);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_right := to_unsigned(400, 32);
     VAR_result_device_ram_address_uxn_device_h_l224_c5_6644 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iftrue := VAR_result_device_ram_address_uxn_device_h_l224_c5_6644;
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l160_c19_34d9_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_MUX_uxn_device_h_l103_c32_eb59_iffalse := resize(to_unsigned(47, 6), 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l97_c20_f131_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_right := unsigned'(X"f0000000");
     VAR_MUX_uxn_device_h_l96_c19_209c_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l135_c4_23b5 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iftrue := VAR_result_device_ram_address_uxn_device_h_l135_c4_23b5;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l160_c19_34d9_iftrue := to_unsigned(2097152, 22);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l159_c19_c74b_iftrue := to_unsigned(1048576, 21);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_left := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_left := color;
     VAR_color_MUX_uxn_device_h_l109_c7_e6a3_iftrue := color;
     VAR_color_MUX_uxn_device_h_l114_c7_b7a7_iffalse := color;
     VAR_color_MUX_uxn_device_h_l115_c3_f739_iffalse := color;
     VAR_color_MUX_uxn_device_h_l95_c2_d127_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_ctrl := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iftrue := ctrl_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_cond := ctrl_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_cond := ctrl_mode;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l160_c19_34d9_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l159_c19_c74b_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_iftrue := flip_y;
     VAR_color_MUX_uxn_device_h_l115_c3_f739_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l115_c3_f739_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l126_c3_d9d7_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l133_c3_0c4b_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l139_c3_c911_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l146_c3_6303_cond := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_cond := is_pixel_port;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l175_c3_b1f7_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_cond := is_sprite_port;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_cond := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l230_c3_c4c7_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l115_c3_f739_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l95_c2_d127_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l121_c23_5a69_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l120_c23_4228_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l119_c22_3510_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l118_c26_46cd_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l145_c7_d962_iftrue := result;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_iffalse := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_left := x;
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_x := x;
     VAR_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue := x;
     VAR_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue := x;
     VAR_x_MUX_uxn_device_h_l126_c3_d9d7_iffalse := x;
     VAR_x_MUX_uxn_device_h_l133_c3_0c4b_iffalse := x;
     VAR_x_MUX_uxn_device_h_l138_c7_8bf0_iftrue := x;
     VAR_x_MUX_uxn_device_h_l145_c7_d962_iftrue := x;
     VAR_x_MUX_uxn_device_h_l150_c7_f950_iftrue := x;
     VAR_x_MUX_uxn_device_h_l174_c7_8956_iffalse := x;
     VAR_x_MUX_uxn_device_h_l175_c3_b1f7_iffalse := x;
     VAR_x_MUX_uxn_device_h_l180_c4_9262_iffalse := x;
     VAR_x_MUX_uxn_device_h_l181_c5_3f33_iffalse := x;
     VAR_x_MUX_uxn_device_h_l95_c2_d127_iftrue := x;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_left := y;
     VAR_CONST_SR_8_uxn_device_h_l213_c33_5b99_x := y;
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_y := y;
     VAR_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_5ed2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l132_c7_2fc9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l139_c3_c911_iffalse := y;
     VAR_y_MUX_uxn_device_h_l145_c7_d962_iffalse := y;
     VAR_y_MUX_uxn_device_h_l146_c3_6303_iffalse := y;
     VAR_y_MUX_uxn_device_h_l95_c2_d127_iftrue := y;
     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l95_c6_7cec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c6_7cec_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_left;
     BIN_OP_EQ_uxn_device_h_l95_c6_7cec_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output := BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;

     -- ctrl_MUX[uxn_device_h_l115_c3_f739] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l115_c3_f739_cond <= VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_cond;
     ctrl_MUX_uxn_device_h_l115_c3_f739_iftrue <= VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_iftrue;
     ctrl_MUX_uxn_device_h_l115_c3_f739_iffalse <= VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_return_output := ctrl_MUX_uxn_device_h_l115_c3_f739_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output := result.is_device_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l147_l217_l134_l127_l204_l140_DUPLICATE_3732 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l147_l217_l134_l127_l204_l140_DUPLICATE_3732_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l151_c3_9e16] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_9e16_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l174_c11_8702] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c11_8702_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_left;
     BIN_OP_EQ_uxn_device_h_l174_c11_8702_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output := BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output;

     -- BIN_OP_EQ[uxn_device_h_l220_c11_7fcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_left <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_left;
     BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_right <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output := BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l175_l151_DUPLICATE_4300 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l175_l151_DUPLICATE_4300_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_device_h_l182_c6_2972] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l182_c6_2972_left <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_left;
     BIN_OP_PLUS_uxn_device_h_l182_c6_2972_right <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_return_output := BIN_OP_PLUS_uxn_device_h_l182_c6_2972_return_output;

     -- CONST_SR_8[uxn_device_h_l213_c33_5b99] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l213_c33_5b99_x <= VAR_CONST_SR_8_uxn_device_h_l213_c33_5b99_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l213_c33_5b99_return_output := CONST_SR_8_uxn_device_h_l213_c33_5b99_return_output;

     -- BIN_OP_EQ[uxn_device_h_l195_c11_a593] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c11_a593_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_left;
     BIN_OP_EQ_uxn_device_h_l195_c11_a593_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output := BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output;

     -- BIN_OP_AND[uxn_device_h_l197_c8_8acf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l197_c8_8acf_left <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_left;
     BIN_OP_AND_uxn_device_h_l197_c8_8acf_right <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_return_output := BIN_OP_AND_uxn_device_h_l197_c8_8acf_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l117_c12_e704] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_e704_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CAST_TO_uint8_t[uxn_device_h_l200_c23_83a5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_83a5_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0 LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output := CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output;

     -- CONST_SR_6[uxn_device_h_l119_c22_3510] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l119_c22_3510_x <= VAR_CONST_SR_6_uxn_device_h_l119_c22_3510_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l119_c22_3510_return_output := CONST_SR_6_uxn_device_h_l119_c22_3510_return_output;

     -- BIN_OP_EQ[uxn_device_h_l150_c11_b9ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_left;
     BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output := BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c11_89e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_89e8_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_89e8_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_12ea LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_12ea_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l145_c11_a9cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l230_c3_c4c7] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_c4c7_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l242_c4_890c,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_device_h_l154_c32_95db] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l154_c32_95db_left <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_left;
     BIN_OP_AND_uxn_device_h_l154_c32_95db_right <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_return_output := BIN_OP_AND_uxn_device_h_l154_c32_95db_return_output;

     -- auto_advance_MUX[uxn_device_h_l169_c8_0373] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c8_0373_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_cond;
     auto_advance_MUX_uxn_device_h_l169_c8_0373_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c8_0373_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_return_output := auto_advance_MUX_uxn_device_h_l169_c8_0373_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_6b75 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_6b75_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l138_c11_7dff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c11_7dff_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_left;
     BIN_OP_EQ_uxn_device_h_l138_c11_7dff_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output := BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;

     -- BIN_OP_EQ[uxn_device_h_l208_c11_4405] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l208_c11_4405_left <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_left;
     BIN_OP_EQ_uxn_device_h_l208_c11_4405_right <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output := BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l231_c58_93a8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_left <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_left;
     BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_right <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_return_output := BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_return_output;

     -- MUX[uxn_device_h_l160_c19_34d9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l160_c19_34d9_cond <= VAR_MUX_uxn_device_h_l160_c19_34d9_cond;
     MUX_uxn_device_h_l160_c19_34d9_iftrue <= VAR_MUX_uxn_device_h_l160_c19_34d9_iftrue;
     MUX_uxn_device_h_l160_c19_34d9_iffalse <= VAR_MUX_uxn_device_h_l160_c19_34d9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l160_c19_34d9_return_output := MUX_uxn_device_h_l160_c19_34d9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l156_c4_5cac] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_cond;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_return_output := result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_return_output;

     -- MUX[uxn_device_h_l159_c19_c74b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l159_c19_c74b_cond <= VAR_MUX_uxn_device_h_l159_c19_c74b_cond;
     MUX_uxn_device_h_l159_c19_c74b_iftrue <= VAR_MUX_uxn_device_h_l159_c19_c74b_iftrue;
     MUX_uxn_device_h_l159_c19_c74b_iffalse <= VAR_MUX_uxn_device_h_l159_c19_c74b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l159_c19_c74b_return_output := MUX_uxn_device_h_l159_c19_c74b_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l175_l151_DUPLICATE_7299 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l175_l151_DUPLICATE_7299_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l175_l180_DUPLICATE_7ee3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l175_l180_DUPLICATE_7ee3_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l132_c11_aa4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_left;
     BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output := BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l180_c9_3987] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l180_c9_3987_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output := UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c11_3653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c11_3653_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_left;
     BIN_OP_EQ_uxn_device_h_l109_c11_3653_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output := BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_b1e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;

     -- CONST_SR_7[uxn_device_h_l118_c26_46cd] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l118_c26_46cd_x <= VAR_CONST_SR_7_uxn_device_h_l118_c26_46cd_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l118_c26_46cd_return_output := CONST_SR_7_uxn_device_h_l118_c26_46cd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l96_c19_78ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l96_c19_78ab_left <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_left;
     BIN_OP_EQ_uxn_device_h_l96_c19_78ab_right <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_return_output := BIN_OP_EQ_uxn_device_h_l96_c19_78ab_return_output;

     -- CONST_SR_4[uxn_device_h_l121_c23_5a69] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l121_c23_5a69_x <= VAR_CONST_SR_4_uxn_device_h_l121_c23_5a69_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l121_c23_5a69_return_output := CONST_SR_4_uxn_device_h_l121_c23_5a69_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l225_c23_c10c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_c10c_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l97_c20_ab80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l97_c20_ab80_left <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_left;
     BIN_OP_EQ_uxn_device_h_l97_c20_ab80_right <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_return_output := BIN_OP_EQ_uxn_device_h_l97_c20_ab80_return_output;

     -- CONST_SR_5[uxn_device_h_l120_c23_4228] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l120_c23_4228_x <= VAR_CONST_SR_5_uxn_device_h_l120_c23_4228_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l120_c23_4228_return_output := CONST_SR_5_uxn_device_h_l120_c23_4228_return_output;

     -- BIN_OP_AND[uxn_device_h_l181_c9_54b3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c9_54b3_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_left;
     BIN_OP_AND_uxn_device_h_l181_c9_54b3_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_return_output := BIN_OP_AND_uxn_device_h_l181_c9_54b3_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l181_c5_3f33_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l181_c9_54b3_return_output, 1);
     VAR_MUX_uxn_device_h_l197_c4_8842_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l197_c8_8acf_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3653_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_b7a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b1e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_5ed2_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_5ed2_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_5ed2_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_89e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_2fc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_2fc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_2fc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_aa4a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_8bf0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_8bf0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_8bf0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_7dff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;
     VAR_result_MUX_uxn_device_h_l145_c7_d962_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_d962_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_d962_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_a9cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_f950_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_f950_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b9ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_8956_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_8956_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_8702_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_5046_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a593_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_5c12_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_4405_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_1f6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_7fcd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_d127_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_7cec_return_output;
     VAR_MUX_uxn_device_h_l96_c19_209c_cond := VAR_BIN_OP_EQ_uxn_device_h_l96_c19_78ab_return_output;
     VAR_MUX_uxn_device_h_l97_c20_f131_cond := VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ab80_return_output;
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_phase := VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_93a8_return_output;
     VAR_x_uxn_device_h_l182_c6_5f2f := resize(VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_2972_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l147_l217_l134_l127_l204_l140_DUPLICATE_3732_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l147_l217_l134_l127_l204_l140_DUPLICATE_3732_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l147_l217_l134_l127_l204_l140_DUPLICATE_3732_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l147_l217_l134_l127_l204_l140_DUPLICATE_3732_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_12ea_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_12ea_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_6b75_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_6b75_return_output;
     VAR_color_MUX_uxn_device_h_l115_c3_f739_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_e704_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_83a5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_c10c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l175_l180_DUPLICATE_7ee3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l175_l180_DUPLICATE_7ee3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_dba3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l175_l151_DUPLICATE_4300_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l175_l151_DUPLICATE_4300_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l175_l151_DUPLICATE_7299_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l175_l151_DUPLICATE_7299_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l169_l209_l210_l110_l133_l115_l222_l102_l181_l221_l191_l196_l197_l139_l126_l180_DUPLICATE_f287_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l209_l210_l151_l222_l221_l175_l197_l196_DUPLICATE_e3ec_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_76e0_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_right := VAR_MUX_uxn_device_h_l159_c19_c74b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_right := VAR_MUX_uxn_device_h_l160_c19_34d9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_9262_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_3987_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c8_0373_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_iftrue := VAR_ctrl_MUX_uxn_device_h_l115_c3_f739_return_output;
     VAR_result_MUX_uxn_device_h_l230_c3_c4c7_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_c4c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_5cac_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_9e16_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_cond := VAR_MUX_uxn_device_h_l181_c5_3f33_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_cond := VAR_MUX_uxn_device_h_l181_c5_3f33_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_cond := VAR_MUX_uxn_device_h_l181_c5_3f33_interm_cond;
     VAR_x_MUX_uxn_device_h_l181_c5_3f33_cond := VAR_MUX_uxn_device_h_l181_c5_3f33_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_cond := VAR_MUX_uxn_device_h_l197_c4_8842_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_cond := VAR_MUX_uxn_device_h_l197_c4_8842_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_cond := VAR_MUX_uxn_device_h_l197_c4_8842_interm_cond;
     VAR_CONST_SR_8_uxn_device_h_l185_c34_3419_x := VAR_x_uxn_device_h_l182_c6_5f2f;
     VAR_x_MUX_uxn_device_h_l181_c5_3f33_iftrue := VAR_x_uxn_device_h_l182_c6_5f2f;
     -- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_8842] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_return_output := result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l191_c8_19ee] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_cond;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_return_output := result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l213_c23_ef83] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_ef83_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l213_c33_5b99_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l121_c13_68ed] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_68ed_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l121_c23_5a69_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l139_c3_c911] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_cond;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_return_output := result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_return_output;

     -- BIN_OP_OR[uxn_device_h_l147_c4_77b1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l147_c4_77b1_left <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_left;
     BIN_OP_OR_uxn_device_h_l147_c4_77b1_right <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_return_output := BIN_OP_OR_uxn_device_h_l147_c4_77b1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_f739] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l181_c5_3f33] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c3_9e16] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c3_9e16_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_cond;
     auto_advance_MUX_uxn_device_h_l151_c3_9e16_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c3_9e16_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_return_output := auto_advance_MUX_uxn_device_h_l151_c3_9e16_return_output;

     -- BIN_OP_OR[uxn_device_h_l134_c4_ab6c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l134_c4_ab6c_left <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_left;
     BIN_OP_OR_uxn_device_h_l134_c4_ab6c_right <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_return_output := BIN_OP_OR_uxn_device_h_l134_c4_ab6c_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l120_c13_9ca2] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_9ca2_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l120_c23_4228_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l151_c3_9e16] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l197_c4_8842] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_cond;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_return_output := result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_return_output;

     -- BIN_OP_AND[uxn_device_h_l210_c8_d625] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l210_c8_d625_left <= VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_left;
     BIN_OP_AND_uxn_device_h_l210_c8_d625_right <= VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_return_output := BIN_OP_AND_uxn_device_h_l210_c8_d625_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l118_c16_f109] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_f109_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l118_c26_46cd_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- CONST_SR_8[uxn_device_h_l185_c34_3419] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l185_c34_3419_x <= VAR_CONST_SR_8_uxn_device_h_l185_c34_3419_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l185_c34_3419_return_output := CONST_SR_8_uxn_device_h_l185_c34_3419_return_output;

     -- BIN_OP_OR[uxn_device_h_l217_c4_f937] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l217_c4_f937_left <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_left;
     BIN_OP_OR_uxn_device_h_l217_c4_f937_right <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_return_output := BIN_OP_OR_uxn_device_h_l217_c4_f937_return_output;

     -- MUX[uxn_device_h_l97_c20_f131] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l97_c20_f131_cond <= VAR_MUX_uxn_device_h_l97_c20_f131_cond;
     MUX_uxn_device_h_l97_c20_f131_iftrue <= VAR_MUX_uxn_device_h_l97_c20_f131_iftrue;
     MUX_uxn_device_h_l97_c20_f131_iffalse <= VAR_MUX_uxn_device_h_l97_c20_f131_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l97_c20_f131_return_output := MUX_uxn_device_h_l97_c20_f131_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l151_c3_9e16] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_cond;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_return_output := result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_return_output;

     -- color_MUX[uxn_device_h_l115_c3_f739] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l115_c3_f739_cond <= VAR_color_MUX_uxn_device_h_l115_c3_f739_cond;
     color_MUX_uxn_device_h_l115_c3_f739_iftrue <= VAR_color_MUX_uxn_device_h_l115_c3_f739_iftrue;
     color_MUX_uxn_device_h_l115_c3_f739_iffalse <= VAR_color_MUX_uxn_device_h_l115_c3_f739_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l115_c3_f739_return_output := color_MUX_uxn_device_h_l115_c3_f739_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l110_c3_b2a8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_cond;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_return_output := result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_d9d7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c3_0c4b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l119_c12_da01] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_da01_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l119_c22_3510_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l154_c22_76d7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_76d7_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_95db_return_output);

     -- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output := CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output;

     -- ctrl_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_cond;
     ctrl_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     ctrl_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_return_output := ctrl_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- BIN_OP_AND[uxn_device_h_l222_c8_92f9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l222_c8_92f9_left <= VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_left;
     BIN_OP_AND_uxn_device_h_l222_c8_92f9_right <= VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_return_output := BIN_OP_AND_uxn_device_h_l222_c8_92f9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l180_c4_9262] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_cond;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_return_output := result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_return_output;

     -- result_vram_address_MUX[uxn_device_h_l175_c3_b1f7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_cond;
     result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue;
     result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output := result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_ea74] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l169_c8_0373] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_return_output;

     -- result_u8_value_MUX[uxn_device_h_l197_c4_8842] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l197_c4_8842_cond <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_cond;
     result_u8_value_MUX_uxn_device_h_l197_c4_8842_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_iftrue;
     result_u8_value_MUX_uxn_device_h_l197_c4_8842_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_return_output := result_u8_value_MUX_uxn_device_h_l197_c4_8842_return_output;

     -- x_MUX[uxn_device_h_l181_c5_3f33] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c5_3f33_cond <= VAR_x_MUX_uxn_device_h_l181_c5_3f33_cond;
     x_MUX_uxn_device_h_l181_c5_3f33_iftrue <= VAR_x_MUX_uxn_device_h_l181_c5_3f33_iftrue;
     x_MUX_uxn_device_h_l181_c5_3f33_iffalse <= VAR_x_MUX_uxn_device_h_l181_c5_3f33_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c5_3f33_return_output := x_MUX_uxn_device_h_l181_c5_3f33_return_output;

     -- MUX[uxn_device_h_l96_c19_209c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c19_209c_cond <= VAR_MUX_uxn_device_h_l96_c19_209c_cond;
     MUX_uxn_device_h_l96_c19_209c_iftrue <= VAR_MUX_uxn_device_h_l96_c19_209c_iftrue;
     MUX_uxn_device_h_l96_c19_209c_iffalse <= VAR_MUX_uxn_device_h_l96_c19_209c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c19_209c_return_output := MUX_uxn_device_h_l96_c19_209c_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_b8e0] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l175_c3_b1f7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_cond;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output := result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_3f33] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l210_c4_f52f_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l210_c8_d625_return_output, 1);
     VAR_MUX_uxn_device_h_l222_c4_2de9_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l222_c8_92f9_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ea74_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_b8e0_return_output;
     VAR_x_MUX_uxn_device_h_l133_c3_0c4b_iftrue := VAR_BIN_OP_OR_uxn_device_h_l134_c4_ab6c_return_output;
     VAR_y_MUX_uxn_device_h_l146_c3_6303_iftrue := VAR_BIN_OP_OR_uxn_device_h_l147_c4_77b1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iftrue := VAR_BIN_OP_OR_uxn_device_h_l217_c4_f937_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_f109_return_output;
     VAR_layer_MUX_uxn_device_h_l115_c3_f739_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_da01_return_output;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_9ca2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_68ed_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_76d7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_ef83_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output;
     VAR_x_MUX_uxn_device_h_l126_c3_d9d7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output;
     VAR_y_MUX_uxn_device_h_l139_c3_c911_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_5c07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_left := VAR_MUX_uxn_device_h_l96_c19_209c_return_output;
     VAR_MUX_uxn_device_h_l103_c32_eb59_cond := VAR_MUX_uxn_device_h_l96_c19_209c_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iftrue := VAR_MUX_uxn_device_h_l96_c19_209c_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_right := VAR_MUX_uxn_device_h_l97_c20_f131_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iftrue := VAR_MUX_uxn_device_h_l97_c20_f131_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_iftrue := VAR_auto_advance_MUX_uxn_device_h_l151_c3_9e16_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_b7a7_iftrue := VAR_color_MUX_uxn_device_h_l115_c3_f739_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_ctrl_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0373_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_3f33_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_19ee_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_8842_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_9262_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_3f33_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_8842_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l197_c4_8842_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_9262_iftrue := VAR_x_MUX_uxn_device_h_l181_c5_3f33_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_cond := VAR_MUX_uxn_device_h_l210_c4_f52f_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_cond := VAR_MUX_uxn_device_h_l210_c4_f52f_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_cond := VAR_MUX_uxn_device_h_l210_c4_f52f_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_cond := VAR_MUX_uxn_device_h_l222_c4_2de9_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_cond := VAR_MUX_uxn_device_h_l222_c4_2de9_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_cond := VAR_MUX_uxn_device_h_l222_c4_2de9_interm_cond;
     -- ctrl_mode_MUX[uxn_device_h_l115_c3_f739] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l115_c3_f739_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_cond;
     ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iftrue;
     ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_return_output := ctrl_mode_MUX_uxn_device_h_l115_c3_f739_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l109_c7_e6a3] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_e6a3_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_b2a8_return_output);

     -- x_MUX[uxn_device_h_l126_c3_d9d7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l126_c3_d9d7_cond <= VAR_x_MUX_uxn_device_h_l126_c3_d9d7_cond;
     x_MUX_uxn_device_h_l126_c3_d9d7_iftrue <= VAR_x_MUX_uxn_device_h_l126_c3_d9d7_iftrue;
     x_MUX_uxn_device_h_l126_c3_d9d7_iffalse <= VAR_x_MUX_uxn_device_h_l126_c3_d9d7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l126_c3_d9d7_return_output := x_MUX_uxn_device_h_l126_c3_d9d7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c4_9262] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c3_9e16] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l165_c28_72a9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_left;
     BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_return_output := BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l196_c3_dccf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_cond;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_return_output := result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_return_output;

     -- y_MUX[uxn_device_h_l139_c3_c911] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l139_c3_c911_cond <= VAR_y_MUX_uxn_device_h_l139_c3_c911_cond;
     y_MUX_uxn_device_h_l139_c3_c911_iftrue <= VAR_y_MUX_uxn_device_h_l139_c3_c911_iftrue;
     y_MUX_uxn_device_h_l139_c3_c911_iffalse <= VAR_y_MUX_uxn_device_h_l139_c3_c911_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l139_c3_c911_return_output := y_MUX_uxn_device_h_l139_c3_c911_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l132_c7_2fc9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_2fc9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0c4b_return_output);

     -- BIN_OP_OR[uxn_device_h_l98_c21_bd61] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c21_bd61_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_left;
     BIN_OP_OR_uxn_device_h_l98_c21_bd61_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output := BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_cond;
     is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iftrue;
     is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_return_output := is_pixel_port_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- auto_advance_MUX[uxn_device_h_l150_c7_f950] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l150_c7_f950_cond <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_cond;
     auto_advance_MUX_uxn_device_h_l150_c7_f950_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_iftrue;
     auto_advance_MUX_uxn_device_h_l150_c7_f950_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_return_output := auto_advance_MUX_uxn_device_h_l150_c7_f950_return_output;

     -- result_u8_value_MUX[uxn_device_h_l196_c3_dccf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l196_c3_dccf_cond <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_cond;
     result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iftrue;
     result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_return_output := result_u8_value_MUX_uxn_device_h_l196_c3_dccf_return_output;

     -- ram_addr_MUX[uxn_device_h_l203_c8_0cb0] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l203_c8_0cb0_cond <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_cond;
     ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iftrue;
     ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_return_output := ram_addr_MUX_uxn_device_h_l203_c8_0cb0_return_output;

     -- result_u8_value_MUX[uxn_device_h_l151_c3_9e16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l151_c3_9e16_cond <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_cond;
     result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iftrue;
     result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_return_output := result_u8_value_MUX_uxn_device_h_l151_c3_9e16_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l114_c7_b7a7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_b7a7_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f739_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_2de9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_return_output := result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_return_output;

     -- ctrl_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_cond;
     ctrl_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     ctrl_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_return_output := ctrl_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- y_MUX[uxn_device_h_l146_c3_6303] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l146_c3_6303_cond <= VAR_y_MUX_uxn_device_h_l146_c3_6303_cond;
     y_MUX_uxn_device_h_l146_c3_6303_iftrue <= VAR_y_MUX_uxn_device_h_l146_c3_6303_iftrue;
     y_MUX_uxn_device_h_l146_c3_6303_iffalse <= VAR_y_MUX_uxn_device_h_l146_c3_6303_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l146_c3_6303_return_output := y_MUX_uxn_device_h_l146_c3_6303_return_output;

     -- result_u8_value_MUX[uxn_device_h_l222_c4_2de9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l222_c4_2de9_cond <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_cond;
     result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iftrue;
     result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_return_output := result_u8_value_MUX_uxn_device_h_l222_c4_2de9_return_output;

     -- MUX[uxn_device_h_l103_c32_eb59] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l103_c32_eb59_cond <= VAR_MUX_uxn_device_h_l103_c32_eb59_cond;
     MUX_uxn_device_h_l103_c32_eb59_iftrue <= VAR_MUX_uxn_device_h_l103_c32_eb59_iftrue;
     MUX_uxn_device_h_l103_c32_eb59_iffalse <= VAR_MUX_uxn_device_h_l103_c32_eb59_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l103_c32_eb59_return_output := MUX_uxn_device_h_l103_c32_eb59_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l175_c3_b1f7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_cond;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_return_output := result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l210_c4_f52f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_cond;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_return_output := result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_return_output;

     -- x_MUX[uxn_device_h_l180_c4_9262] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l180_c4_9262_cond <= VAR_x_MUX_uxn_device_h_l180_c4_9262_cond;
     x_MUX_uxn_device_h_l180_c4_9262_iftrue <= VAR_x_MUX_uxn_device_h_l180_c4_9262_iftrue;
     x_MUX_uxn_device_h_l180_c4_9262_iffalse <= VAR_x_MUX_uxn_device_h_l180_c4_9262_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l180_c4_9262_return_output := x_MUX_uxn_device_h_l180_c4_9262_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_9262] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l185_c24_b80c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_b80c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l185_c34_3419_return_output);

     -- flip_y_MUX[uxn_device_h_l115_c3_f739] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l115_c3_f739_cond <= VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_cond;
     flip_y_MUX_uxn_device_h_l115_c3_f739_iftrue <= VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_iftrue;
     flip_y_MUX_uxn_device_h_l115_c3_f739_iffalse <= VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_return_output := flip_y_MUX_uxn_device_h_l115_c3_f739_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l138_c7_8bf0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_8bf0_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_c911_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_f52f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_return_output;

     -- x_MUX[uxn_device_h_l133_c3_0c4b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l133_c3_0c4b_cond <= VAR_x_MUX_uxn_device_h_l133_c3_0c4b_cond;
     x_MUX_uxn_device_h_l133_c3_0c4b_iftrue <= VAR_x_MUX_uxn_device_h_l133_c3_0c4b_iftrue;
     x_MUX_uxn_device_h_l133_c3_0c4b_iffalse <= VAR_x_MUX_uxn_device_h_l133_c3_0c4b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l133_c3_0c4b_return_output := x_MUX_uxn_device_h_l133_c3_0c4b_return_output;

     -- layer_MUX[uxn_device_h_l115_c3_f739] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l115_c3_f739_cond <= VAR_layer_MUX_uxn_device_h_l115_c3_f739_cond;
     layer_MUX_uxn_device_h_l115_c3_f739_iftrue <= VAR_layer_MUX_uxn_device_h_l115_c3_f739_iftrue;
     layer_MUX_uxn_device_h_l115_c3_f739_iffalse <= VAR_layer_MUX_uxn_device_h_l115_c3_f739_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l115_c3_f739_return_output := layer_MUX_uxn_device_h_l115_c3_f739_return_output;

     -- color_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_color_MUX_uxn_device_h_l114_c7_b7a7_cond;
     color_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_color_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     color_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_color_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l114_c7_b7a7_return_output := color_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_cond;
     is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iftrue;
     is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_return_output := is_sprite_port_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- flip_x_MUX[uxn_device_h_l115_c3_f739] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l115_c3_f739_cond <= VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_cond;
     flip_x_MUX_uxn_device_h_l115_c3_f739_iftrue <= VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_iftrue;
     flip_x_MUX_uxn_device_h_l115_c3_f739_iffalse <= VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_return_output := flip_x_MUX_uxn_device_h_l115_c3_f739_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_dccf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_return_output := result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l125_c7_5ed2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_5ed2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_d9d7_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l157_c18_7896] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c18_7896_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_left;
     BIN_OP_PLUS_uxn_device_h_l157_c18_7896_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_return_output := BIN_OP_PLUS_uxn_device_h_l157_c18_7896_return_output;

     -- ram_addr_MUX[uxn_device_h_l216_c8_2bd3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l216_c8_2bd3_cond <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_cond;
     ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iftrue;
     ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_return_output := ram_addr_MUX_uxn_device_h_l216_c8_2bd3_return_output;

     -- result_u8_value_MUX[uxn_device_h_l210_c4_f52f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l210_c4_f52f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_cond;
     result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iftrue;
     result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_return_output := result_u8_value_MUX_uxn_device_h_l210_c4_f52f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l222_c4_2de9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_cond;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_return_output := result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_return_output;

     -- Submodule level 3
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iftrue := VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_bd61_return_output;
     VAR_vram_addr_uxn_device_h_l157_c5_67d4 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7896_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l165_c5_9a28 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_72a9_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_b80c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iftrue := VAR_MUX_uxn_device_h_l103_c32_eb59_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_iffalse := VAR_auto_advance_MUX_uxn_device_h_l150_c7_f950_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_color_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_ctrl_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_f739_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue := VAR_flip_x_MUX_uxn_device_h_l115_c3_f739_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue := VAR_flip_y_MUX_uxn_device_h_l115_c3_f739_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_d127_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_iftrue := VAR_layer_MUX_uxn_device_h_l115_c3_f739_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_iffalse := VAR_ram_addr_MUX_uxn_device_h_l203_c8_0cb0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l216_c8_2bd3_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_e6a3_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_b7a7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_5ed2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_5ed2_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_2fc9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_2fc9_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_8bf0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_8bf0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_9262_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_f52f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_2de9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_9262_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_f52f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_2de9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l210_c4_f52f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l222_c4_2de9_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_5ed2_iftrue := VAR_x_MUX_uxn_device_h_l126_c3_d9d7_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_2fc9_iftrue := VAR_x_MUX_uxn_device_h_l133_c3_0c4b_return_output;
     VAR_x_MUX_uxn_device_h_l175_c3_b1f7_iftrue := VAR_x_MUX_uxn_device_h_l180_c4_9262_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_8bf0_iftrue := VAR_y_MUX_uxn_device_h_l139_c3_c911_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_d962_iftrue := VAR_y_MUX_uxn_device_h_l146_c3_6303_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iffalse := VAR_result_vram_address_uxn_device_h_l165_c5_9a28;
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_left := VAR_vram_addr_uxn_device_h_l157_c5_67d4;
     -- flip_y_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_cond;
     flip_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     flip_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_return_output := flip_y_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_5ed2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_return_output;

     -- y_MUX[uxn_device_h_l145_c7_d962] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l145_c7_d962_cond <= VAR_y_MUX_uxn_device_h_l145_c7_d962_cond;
     y_MUX_uxn_device_h_l145_c7_d962_iftrue <= VAR_y_MUX_uxn_device_h_l145_c7_d962_iftrue;
     y_MUX_uxn_device_h_l145_c7_d962_iffalse <= VAR_y_MUX_uxn_device_h_l145_c7_d962_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l145_c7_d962_return_output := y_MUX_uxn_device_h_l145_c7_d962_return_output;

     -- ctrl_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_cond;
     ctrl_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_iftrue;
     ctrl_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_return_output := ctrl_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- result_u8_value_MUX[uxn_device_h_l209_c3_74f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l209_c3_74f2_cond <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_cond;
     result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iftrue;
     result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_return_output := result_u8_value_MUX_uxn_device_h_l209_c3_74f2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_b1f7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output;

     -- result_u8_value_MUX[uxn_device_h_l221_c3_2aea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l221_c3_2aea_cond <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_cond;
     result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iftrue;
     result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_return_output := result_u8_value_MUX_uxn_device_h_l221_c3_2aea_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_05be] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l102_c3_05be] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_cond;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_return_output := result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_cond;
     is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iftrue;
     is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_return_output := is_drawing_port_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- BIN_OP_AND[uxn_device_h_l158_c5_780f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l158_c5_780f_left <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_left;
     BIN_OP_AND_uxn_device_h_l158_c5_780f_right <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_return_output := BIN_OP_AND_uxn_device_h_l158_c5_780f_return_output;

     -- ram_addr_MUX[uxn_device_h_l196_c3_dccf] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l196_c3_dccf_cond <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_cond;
     ram_addr_MUX_uxn_device_h_l196_c3_dccf_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_iftrue;
     ram_addr_MUX_uxn_device_h_l196_c3_dccf_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_return_output := ram_addr_MUX_uxn_device_h_l196_c3_dccf_return_output;

     -- ram_addr_MUX[uxn_device_h_l209_c3_74f2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l209_c3_74f2_cond <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_cond;
     ram_addr_MUX_uxn_device_h_l209_c3_74f2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_iftrue;
     ram_addr_MUX_uxn_device_h_l209_c3_74f2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_return_output := ram_addr_MUX_uxn_device_h_l209_c3_74f2_return_output;

     -- color_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_color_MUX_uxn_device_h_l109_c7_e6a3_cond;
     color_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_color_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     color_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_color_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l109_c7_e6a3_return_output := color_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l221_c3_2aea] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_cond;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_return_output := result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l195_c7_5046] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_5046_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_dccf_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_dccf_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_dccf_return_output);

     -- result_u8_value_MUX[uxn_device_h_l181_c5_3f33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c5_3f33_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_cond;
     result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_return_output := result_u8_value_MUX_uxn_device_h_l181_c5_3f33_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_2aea] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_return_output := result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_d962] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_d962_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_d962_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_d962_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_return_output := auto_advance_MUX_uxn_device_h_l145_c7_d962_return_output;

     -- layer_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_cond;
     layer_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     layer_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_return_output := layer_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_cond;
     ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_return_output := ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l209_c3_74f2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_cond;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_return_output := result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l175_c3_b1f7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_cond;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output := result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output;

     -- flip_x_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_cond;
     flip_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     flip_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_return_output := flip_x_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_74f2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_return_output := result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_return_output;

     -- x_MUX[uxn_device_h_l175_c3_b1f7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l175_c3_b1f7_cond <= VAR_x_MUX_uxn_device_h_l175_c3_b1f7_cond;
     x_MUX_uxn_device_h_l175_c3_b1f7_iftrue <= VAR_x_MUX_uxn_device_h_l175_c3_b1f7_iftrue;
     x_MUX_uxn_device_h_l175_c3_b1f7_iffalse <= VAR_x_MUX_uxn_device_h_l175_c3_b1f7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l175_c3_b1f7_return_output := x_MUX_uxn_device_h_l175_c3_b1f7_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_left := VAR_BIN_OP_AND_uxn_device_h_l158_c5_780f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5ed2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_d962_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_color_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_flip_x_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_flip_y_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_layer_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_iftrue := VAR_ram_addr_MUX_uxn_device_h_l196_c3_dccf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_iftrue := VAR_ram_addr_MUX_uxn_device_h_l209_c3_74f2_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_5046_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_5046_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c5_3f33_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_8956_iftrue := VAR_x_MUX_uxn_device_h_l175_c3_b1f7_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_8bf0_iffalse := VAR_y_MUX_uxn_device_h_l145_c7_d962_return_output;
     -- x_MUX[uxn_device_h_l174_c7_8956] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l174_c7_8956_cond <= VAR_x_MUX_uxn_device_h_l174_c7_8956_cond;
     x_MUX_uxn_device_h_l174_c7_8956_iftrue <= VAR_x_MUX_uxn_device_h_l174_c7_8956_iftrue;
     x_MUX_uxn_device_h_l174_c7_8956_iffalse <= VAR_x_MUX_uxn_device_h_l174_c7_8956_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l174_c7_8956_return_output := x_MUX_uxn_device_h_l174_c7_8956_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l95_c2_d127] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_d127_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_05be_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_05be_return_output);

     -- result_u8_value_MUX[uxn_device_h_l180_c4_9262] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c4_9262_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_cond;
     result_u8_value_MUX_uxn_device_h_l180_c4_9262_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c4_9262_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_return_output := result_u8_value_MUX_uxn_device_h_l180_c4_9262_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l220_c7_1f6a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_1f6a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_2aea_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_2aea_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_2aea_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_cond;
     ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_return_output := ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- auto_advance_MUX[uxn_device_h_l138_c7_8bf0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l138_c7_8bf0_cond <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_cond;
     auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iftrue;
     auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_return_output := auto_advance_MUX_uxn_device_h_l138_c7_8bf0_return_output;

     -- y_MUX[uxn_device_h_l138_c7_8bf0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c7_8bf0_cond <= VAR_y_MUX_uxn_device_h_l138_c7_8bf0_cond;
     y_MUX_uxn_device_h_l138_c7_8bf0_iftrue <= VAR_y_MUX_uxn_device_h_l138_c7_8bf0_iftrue;
     y_MUX_uxn_device_h_l138_c7_8bf0_iffalse <= VAR_y_MUX_uxn_device_h_l138_c7_8bf0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c7_8bf0_return_output := y_MUX_uxn_device_h_l138_c7_8bf0_return_output;

     -- flip_x_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_cond;
     flip_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     flip_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_return_output := flip_x_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_2fc9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_return_output;

     -- layer_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_cond;
     layer_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     layer_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_return_output := layer_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- flip_y_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_cond;
     flip_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     flip_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_return_output := flip_y_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l208_c7_5c12] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_5c12_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_74f2_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_74f2_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_74f2_return_output);

     -- ram_addr_MUX[uxn_device_h_l208_c7_5c12] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l208_c7_5c12_cond <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_cond;
     ram_addr_MUX_uxn_device_h_l208_c7_5c12_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_iftrue;
     ram_addr_MUX_uxn_device_h_l208_c7_5c12_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_return_output := ram_addr_MUX_uxn_device_h_l208_c7_5c12_return_output;

     -- color_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_color_MUX_uxn_device_h_l95_c2_d127_cond;
     color_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_color_MUX_uxn_device_h_l95_c2_d127_iftrue;
     color_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_color_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l95_c2_d127_return_output := color_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- BIN_OP_OR[uxn_device_h_l159_c5_651e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l159_c5_651e_left <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_left;
     BIN_OP_OR_uxn_device_h_l159_c5_651e_right <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_return_output := BIN_OP_OR_uxn_device_h_l159_c5_651e_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_left := VAR_BIN_OP_OR_uxn_device_h_l159_c5_651e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_2fc9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l138_c7_8bf0_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_flip_x_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_flip_y_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_layer_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_iffalse := VAR_ram_addr_MUX_uxn_device_h_l208_c7_5c12_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_d127_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_d127_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_5c12_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_5c12_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_1f6a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_1f6a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l180_c4_9262_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_f950_iffalse := VAR_x_MUX_uxn_device_h_l174_c7_8956_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_2fc9_iffalse := VAR_y_MUX_uxn_device_h_l138_c7_8bf0_return_output;
     -- ctrl_mode_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_cond;
     ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iftrue;
     ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_return_output := ctrl_mode_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- y_MUX[uxn_device_h_l132_c7_2fc9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l132_c7_2fc9_cond <= VAR_y_MUX_uxn_device_h_l132_c7_2fc9_cond;
     y_MUX_uxn_device_h_l132_c7_2fc9_iftrue <= VAR_y_MUX_uxn_device_h_l132_c7_2fc9_iftrue;
     y_MUX_uxn_device_h_l132_c7_2fc9_iffalse <= VAR_y_MUX_uxn_device_h_l132_c7_2fc9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l132_c7_2fc9_return_output := y_MUX_uxn_device_h_l132_c7_2fc9_return_output;

     -- flip_y_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_cond;
     flip_y_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_iftrue;
     flip_y_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_return_output := flip_y_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- ram_addr_MUX[uxn_device_h_l195_c7_5046] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l195_c7_5046_cond <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_cond;
     ram_addr_MUX_uxn_device_h_l195_c7_5046_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_iftrue;
     ram_addr_MUX_uxn_device_h_l195_c7_5046_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_return_output := ram_addr_MUX_uxn_device_h_l195_c7_5046_return_output;

     -- BIN_OP_OR[uxn_device_h_l160_c5_3dab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l160_c5_3dab_left <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_left;
     BIN_OP_OR_uxn_device_h_l160_c5_3dab_right <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_return_output := BIN_OP_OR_uxn_device_h_l160_c5_3dab_return_output;

     -- auto_advance_MUX[uxn_device_h_l132_c7_2fc9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l132_c7_2fc9_cond <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_cond;
     auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iftrue;
     auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_return_output := auto_advance_MUX_uxn_device_h_l132_c7_2fc9_return_output;

     -- layer_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_layer_MUX_uxn_device_h_l95_c2_d127_cond;
     layer_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_layer_MUX_uxn_device_h_l95_c2_d127_iftrue;
     layer_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_layer_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l95_c2_d127_return_output := layer_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_8bf0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_return_output;

     -- result_u8_value_MUX[uxn_device_h_l175_c3_b1f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_cond;
     result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iftrue;
     result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_return_output := result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_return_output;

     -- flip_x_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_cond;
     flip_x_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_iftrue;
     flip_x_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_return_output := flip_x_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- x_MUX[uxn_device_h_l150_c7_f950] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l150_c7_f950_cond <= VAR_x_MUX_uxn_device_h_l150_c7_f950_cond;
     x_MUX_uxn_device_h_l150_c7_f950_iftrue <= VAR_x_MUX_uxn_device_h_l150_c7_f950_iftrue;
     x_MUX_uxn_device_h_l150_c7_f950_iffalse <= VAR_x_MUX_uxn_device_h_l150_c7_f950_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l150_c7_f950_return_output := x_MUX_uxn_device_h_l150_c7_f950_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_left := VAR_BIN_OP_OR_uxn_device_h_l160_c5_3dab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_8bf0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l132_c7_2fc9_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_d127_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l95_c2_d127_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l95_c2_d127_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_iffalse := VAR_ram_addr_MUX_uxn_device_h_l195_c7_5046_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_d962_iffalse := VAR_x_MUX_uxn_device_h_l150_c7_f950_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_5ed2_iffalse := VAR_y_MUX_uxn_device_h_l132_c7_2fc9_return_output;
     -- BIN_OP_OR[uxn_device_h_l161_c5_525d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l161_c5_525d_left <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_left;
     BIN_OP_OR_uxn_device_h_l161_c5_525d_right <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output := BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output;

     -- y_MUX[uxn_device_h_l125_c7_5ed2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_5ed2_cond <= VAR_y_MUX_uxn_device_h_l125_c7_5ed2_cond;
     y_MUX_uxn_device_h_l125_c7_5ed2_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_5ed2_iftrue;
     y_MUX_uxn_device_h_l125_c7_5ed2_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_5ed2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_5ed2_return_output := y_MUX_uxn_device_h_l125_c7_5ed2_return_output;

     -- x_MUX[uxn_device_h_l145_c7_d962] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l145_c7_d962_cond <= VAR_x_MUX_uxn_device_h_l145_c7_d962_cond;
     x_MUX_uxn_device_h_l145_c7_d962_iftrue <= VAR_x_MUX_uxn_device_h_l145_c7_d962_iftrue;
     x_MUX_uxn_device_h_l145_c7_d962_iffalse <= VAR_x_MUX_uxn_device_h_l145_c7_d962_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l145_c7_d962_return_output := x_MUX_uxn_device_h_l145_c7_d962_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_d962] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_return_output;

     -- ram_addr_MUX[uxn_device_h_l174_c7_8956] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l174_c7_8956_cond <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_cond;
     ram_addr_MUX_uxn_device_h_l174_c7_8956_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_iftrue;
     ram_addr_MUX_uxn_device_h_l174_c7_8956_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_return_output := ram_addr_MUX_uxn_device_h_l174_c7_8956_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c31f[uxn_device_h_l174_c7_8956] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c31f_uxn_device_h_l174_c7_8956_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_c31f(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b1f7_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b1f7_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b1f7_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b1f7_return_output);

     -- auto_advance_MUX[uxn_device_h_l125_c7_5ed2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_5ed2_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_return_output := auto_advance_MUX_uxn_device_h_l125_c7_5ed2_return_output;

     -- Submodule level 7
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_525d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_d962_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_5ed2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse := VAR_ram_addr_MUX_uxn_device_h_l174_c7_8956_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_8956_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c31f_uxn_device_h_l174_c7_8956_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_8bf0_iffalse := VAR_x_MUX_uxn_device_h_l145_c7_d962_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_5ed2_return_output;
     -- vram_addr_MUX[uxn_device_h_l156_c4_5cac] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l156_c4_5cac_cond <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_cond;
     vram_addr_MUX_uxn_device_h_l156_c4_5cac_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_iftrue;
     vram_addr_MUX_uxn_device_h_l156_c4_5cac_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_return_output := vram_addr_MUX_uxn_device_h_l156_c4_5cac_return_output;

     -- result_vram_address_MUX[uxn_device_h_l156_c4_5cac] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l156_c4_5cac_cond <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_cond;
     result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iftrue;
     result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_return_output := result_vram_address_MUX_uxn_device_h_l156_c4_5cac_return_output;

     -- y_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_y_MUX_uxn_device_h_l114_c7_b7a7_cond;
     y_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     y_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_b7a7_return_output := y_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_f950] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_return_output;

     -- x_MUX[uxn_device_h_l138_c7_8bf0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l138_c7_8bf0_cond <= VAR_x_MUX_uxn_device_h_l138_c7_8bf0_cond;
     x_MUX_uxn_device_h_l138_c7_8bf0_iftrue <= VAR_x_MUX_uxn_device_h_l138_c7_8bf0_iftrue;
     x_MUX_uxn_device_h_l138_c7_8bf0_iffalse <= VAR_x_MUX_uxn_device_h_l138_c7_8bf0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l138_c7_8bf0_return_output := x_MUX_uxn_device_h_l138_c7_8bf0_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_return_output := auto_advance_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- ram_addr_MUX[uxn_device_h_l150_c7_f950] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l150_c7_f950_cond <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_cond;
     ram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue;
     ram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_return_output := ram_addr_MUX_uxn_device_h_l150_c7_f950_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_f950_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse := VAR_ram_addr_MUX_uxn_device_h_l150_c7_f950_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l156_c4_5cac_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_iftrue := VAR_vram_addr_MUX_uxn_device_h_l156_c4_5cac_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_2fc9_iffalse := VAR_x_MUX_uxn_device_h_l138_c7_8bf0_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_8956] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c3_9e16] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c3_9e16_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_cond;
     result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_return_output := result_vram_address_MUX_uxn_device_h_l151_c3_9e16_return_output;

     -- ram_addr_MUX[uxn_device_h_l145_c7_d962] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l145_c7_d962_cond <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_cond;
     ram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue;
     ram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_return_output := ram_addr_MUX_uxn_device_h_l145_c7_d962_return_output;

     -- y_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_y_MUX_uxn_device_h_l109_c7_e6a3_cond;
     y_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_y_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     y_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_y_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l109_c7_e6a3_return_output := y_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- vram_addr_MUX[uxn_device_h_l151_c3_9e16] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l151_c3_9e16_cond <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_cond;
     vram_addr_MUX_uxn_device_h_l151_c3_9e16_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_iftrue;
     vram_addr_MUX_uxn_device_h_l151_c3_9e16_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_return_output := vram_addr_MUX_uxn_device_h_l151_c3_9e16_return_output;

     -- x_MUX[uxn_device_h_l132_c7_2fc9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l132_c7_2fc9_cond <= VAR_x_MUX_uxn_device_h_l132_c7_2fc9_cond;
     x_MUX_uxn_device_h_l132_c7_2fc9_iftrue <= VAR_x_MUX_uxn_device_h_l132_c7_2fc9_iftrue;
     x_MUX_uxn_device_h_l132_c7_2fc9_iffalse <= VAR_x_MUX_uxn_device_h_l132_c7_2fc9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l132_c7_2fc9_return_output := x_MUX_uxn_device_h_l132_c7_2fc9_return_output;

     -- auto_advance_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_cond;
     auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_return_output := auto_advance_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8956_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_auto_advance_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse := VAR_ram_addr_MUX_uxn_device_h_l145_c7_d962_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue := VAR_vram_addr_MUX_uxn_device_h_l151_c3_9e16_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_5ed2_iffalse := VAR_x_MUX_uxn_device_h_l132_c7_2fc9_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_y_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_5046] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6596[uxn_device_h_l150_c7_f950] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6596_uxn_device_h_l150_c7_f950_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_6596(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9e16_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9e16_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9e16_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9e16_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9e16_return_output);

     -- auto_advance_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_cond;
     auto_advance_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_iftrue;
     auto_advance_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_return_output := auto_advance_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- vram_addr_MUX[uxn_device_h_l150_c7_f950] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l150_c7_f950_cond <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_cond;
     vram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_iftrue;
     vram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_return_output := vram_addr_MUX_uxn_device_h_l150_c7_f950_return_output;

     -- x_MUX[uxn_device_h_l125_c7_5ed2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l125_c7_5ed2_cond <= VAR_x_MUX_uxn_device_h_l125_c7_5ed2_cond;
     x_MUX_uxn_device_h_l125_c7_5ed2_iftrue <= VAR_x_MUX_uxn_device_h_l125_c7_5ed2_iftrue;
     x_MUX_uxn_device_h_l125_c7_5ed2_iffalse <= VAR_x_MUX_uxn_device_h_l125_c7_5ed2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l125_c7_5ed2_return_output := x_MUX_uxn_device_h_l125_c7_5ed2_return_output;

     -- ram_addr_MUX[uxn_device_h_l138_c7_8bf0] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond;
     ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue;
     ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output := ram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output;

     -- y_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_y_MUX_uxn_device_h_l95_c2_d127_cond;
     y_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_y_MUX_uxn_device_h_l95_c2_d127_iftrue;
     y_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_y_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l95_c2_d127_return_output := y_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5046_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_f950_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_6596_uxn_device_h_l150_c7_f950_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse := VAR_vram_addr_MUX_uxn_device_h_l150_c7_f950_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse := VAR_x_MUX_uxn_device_h_l125_c7_5ed2_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l95_c2_d127_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_5c12] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_d962] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_d962_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_return_output := vram_addr_MUX_uxn_device_h_l145_c7_d962_return_output;

     -- x_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_x_MUX_uxn_device_h_l114_c7_b7a7_cond;
     x_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_x_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     x_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_x_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l114_c7_b7a7_return_output := x_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- ram_addr_MUX[uxn_device_h_l132_c7_2fc9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond;
     ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue;
     ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output := ram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_5c12_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_d962_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_x_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     -- vram_addr_MUX[uxn_device_h_l138_c7_8bf0] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_cond;
     vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iftrue;
     vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output := vram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output;

     -- x_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_x_MUX_uxn_device_h_l109_c7_e6a3_cond;
     x_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_x_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     x_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_x_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l109_c7_e6a3_return_output := x_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- ram_addr_MUX[uxn_device_h_l125_c7_5ed2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond;
     ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue;
     ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output := ram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_1f6a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_1f6a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse := VAR_ram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse := VAR_vram_addr_MUX_uxn_device_h_l138_c7_8bf0_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_x_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     -- vram_addr_MUX[uxn_device_h_l132_c7_2fc9] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_cond;
     vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iftrue;
     vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output := vram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output;

     -- ram_addr_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond;
     ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output := ram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- x_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_x_MUX_uxn_device_h_l95_c2_d127_cond;
     x_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_x_MUX_uxn_device_h_l95_c2_d127_iftrue;
     x_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_x_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l95_c2_d127_return_output := x_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_d782] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_return_output;

     -- Submodule level 13
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_d782_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_ram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse := VAR_vram_addr_MUX_uxn_device_h_l132_c7_2fc9_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l95_c2_d127_return_output;
     -- vram_addr_MUX[uxn_device_h_l125_c7_5ed2] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_cond;
     vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iftrue;
     vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output := vram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output;

     -- ram_addr_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond;
     ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output := ram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_e85e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_return_output;

     -- Submodule level 14
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e85e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_ram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse := VAR_vram_addr_MUX_uxn_device_h_l125_c7_5ed2_return_output;
     -- ram_addr_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_cond;
     ram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue;
     ram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_return_output := ram_addr_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- screen_blit[uxn_device_h_l231_c46_8d18] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l231_c46_8d18_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l231_c46_8d18_phase <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_phase;
     screen_blit_uxn_device_h_l231_c46_8d18_ctrl <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_ctrl;
     screen_blit_uxn_device_h_l231_c46_8d18_auto_advance <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_auto_advance;
     screen_blit_uxn_device_h_l231_c46_8d18_x <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_x;
     screen_blit_uxn_device_h_l231_c46_8d18_y <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_y;
     screen_blit_uxn_device_h_l231_c46_8d18_ram_addr <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_ram_addr;
     screen_blit_uxn_device_h_l231_c46_8d18_previous_ram_read <= VAR_screen_blit_uxn_device_h_l231_c46_8d18_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output := screen_blit_uxn_device_h_l231_c46_8d18_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output := vram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- Submodule level 15
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l236_c30_7934] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_7934_return_output := VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output.vram_write_layer;

     -- vram_addr_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_cond;
     vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output := vram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l234_c27_318d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_318d_return_output := VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d[uxn_device_h_l238_c25_e665] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_e665_return_output := VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output.ram_address;

     -- CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d[uxn_device_h_l235_c26_1a3b] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_1a3b_return_output := VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l237_c22_2c56] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_2c56_return_output := VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l239_c25_4cec] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_4cec_return_output := VAR_screen_blit_uxn_device_h_l231_c46_8d18_return_output.is_blit_done;

     -- Submodule level 16
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_vram_addr_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6[uxn_device_h_l230_c3_c4c7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_c4c7_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l233_c4_e184,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_318d_return_output,
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_1a3b_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_7934_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_2c56_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_e665_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_4cec_return_output);

     -- vram_addr_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_cond;
     vram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_iftrue;
     vram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_return_output := vram_addr_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l230_c3_c4c7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_c4c7_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l95_c2_d127_return_output;
     -- result_MUX[uxn_device_h_l230_c3_c4c7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l230_c3_c4c7_cond <= VAR_result_MUX_uxn_device_h_l230_c3_c4c7_cond;
     result_MUX_uxn_device_h_l230_c3_c4c7_iftrue <= VAR_result_MUX_uxn_device_h_l230_c3_c4c7_iftrue;
     result_MUX_uxn_device_h_l230_c3_c4c7_iffalse <= VAR_result_MUX_uxn_device_h_l230_c3_c4c7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l230_c3_c4c7_return_output := result_MUX_uxn_device_h_l230_c3_c4c7_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l220_c7_1f6a_iffalse := VAR_result_MUX_uxn_device_h_l230_c3_c4c7_return_output;
     -- result_MUX[uxn_device_h_l220_c7_1f6a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l220_c7_1f6a_cond <= VAR_result_MUX_uxn_device_h_l220_c7_1f6a_cond;
     result_MUX_uxn_device_h_l220_c7_1f6a_iftrue <= VAR_result_MUX_uxn_device_h_l220_c7_1f6a_iftrue;
     result_MUX_uxn_device_h_l220_c7_1f6a_iffalse <= VAR_result_MUX_uxn_device_h_l220_c7_1f6a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l220_c7_1f6a_return_output := result_MUX_uxn_device_h_l220_c7_1f6a_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l208_c7_5c12_iffalse := VAR_result_MUX_uxn_device_h_l220_c7_1f6a_return_output;
     -- result_MUX[uxn_device_h_l208_c7_5c12] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l208_c7_5c12_cond <= VAR_result_MUX_uxn_device_h_l208_c7_5c12_cond;
     result_MUX_uxn_device_h_l208_c7_5c12_iftrue <= VAR_result_MUX_uxn_device_h_l208_c7_5c12_iftrue;
     result_MUX_uxn_device_h_l208_c7_5c12_iffalse <= VAR_result_MUX_uxn_device_h_l208_c7_5c12_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l208_c7_5c12_return_output := result_MUX_uxn_device_h_l208_c7_5c12_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l195_c7_5046_iffalse := VAR_result_MUX_uxn_device_h_l208_c7_5c12_return_output;
     -- result_MUX[uxn_device_h_l195_c7_5046] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l195_c7_5046_cond <= VAR_result_MUX_uxn_device_h_l195_c7_5046_cond;
     result_MUX_uxn_device_h_l195_c7_5046_iftrue <= VAR_result_MUX_uxn_device_h_l195_c7_5046_iftrue;
     result_MUX_uxn_device_h_l195_c7_5046_iffalse <= VAR_result_MUX_uxn_device_h_l195_c7_5046_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l195_c7_5046_return_output := result_MUX_uxn_device_h_l195_c7_5046_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l174_c7_8956_iffalse := VAR_result_MUX_uxn_device_h_l195_c7_5046_return_output;
     -- result_MUX[uxn_device_h_l174_c7_8956] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c7_8956_cond <= VAR_result_MUX_uxn_device_h_l174_c7_8956_cond;
     result_MUX_uxn_device_h_l174_c7_8956_iftrue <= VAR_result_MUX_uxn_device_h_l174_c7_8956_iftrue;
     result_MUX_uxn_device_h_l174_c7_8956_iffalse <= VAR_result_MUX_uxn_device_h_l174_c7_8956_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c7_8956_return_output := result_MUX_uxn_device_h_l174_c7_8956_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l150_c7_f950_iffalse := VAR_result_MUX_uxn_device_h_l174_c7_8956_return_output;
     -- result_MUX[uxn_device_h_l150_c7_f950] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l150_c7_f950_cond <= VAR_result_MUX_uxn_device_h_l150_c7_f950_cond;
     result_MUX_uxn_device_h_l150_c7_f950_iftrue <= VAR_result_MUX_uxn_device_h_l150_c7_f950_iftrue;
     result_MUX_uxn_device_h_l150_c7_f950_iffalse <= VAR_result_MUX_uxn_device_h_l150_c7_f950_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l150_c7_f950_return_output := result_MUX_uxn_device_h_l150_c7_f950_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l145_c7_d962_iffalse := VAR_result_MUX_uxn_device_h_l150_c7_f950_return_output;
     -- result_MUX[uxn_device_h_l145_c7_d962] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l145_c7_d962_cond <= VAR_result_MUX_uxn_device_h_l145_c7_d962_cond;
     result_MUX_uxn_device_h_l145_c7_d962_iftrue <= VAR_result_MUX_uxn_device_h_l145_c7_d962_iftrue;
     result_MUX_uxn_device_h_l145_c7_d962_iffalse <= VAR_result_MUX_uxn_device_h_l145_c7_d962_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l145_c7_d962_return_output := result_MUX_uxn_device_h_l145_c7_d962_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l138_c7_8bf0_iffalse := VAR_result_MUX_uxn_device_h_l145_c7_d962_return_output;
     -- result_MUX[uxn_device_h_l138_c7_8bf0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l138_c7_8bf0_cond <= VAR_result_MUX_uxn_device_h_l138_c7_8bf0_cond;
     result_MUX_uxn_device_h_l138_c7_8bf0_iftrue <= VAR_result_MUX_uxn_device_h_l138_c7_8bf0_iftrue;
     result_MUX_uxn_device_h_l138_c7_8bf0_iffalse <= VAR_result_MUX_uxn_device_h_l138_c7_8bf0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l138_c7_8bf0_return_output := result_MUX_uxn_device_h_l138_c7_8bf0_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l132_c7_2fc9_iffalse := VAR_result_MUX_uxn_device_h_l138_c7_8bf0_return_output;
     -- result_MUX[uxn_device_h_l132_c7_2fc9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l132_c7_2fc9_cond <= VAR_result_MUX_uxn_device_h_l132_c7_2fc9_cond;
     result_MUX_uxn_device_h_l132_c7_2fc9_iftrue <= VAR_result_MUX_uxn_device_h_l132_c7_2fc9_iftrue;
     result_MUX_uxn_device_h_l132_c7_2fc9_iffalse <= VAR_result_MUX_uxn_device_h_l132_c7_2fc9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l132_c7_2fc9_return_output := result_MUX_uxn_device_h_l132_c7_2fc9_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l125_c7_5ed2_iffalse := VAR_result_MUX_uxn_device_h_l132_c7_2fc9_return_output;
     -- result_MUX[uxn_device_h_l125_c7_5ed2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l125_c7_5ed2_cond <= VAR_result_MUX_uxn_device_h_l125_c7_5ed2_cond;
     result_MUX_uxn_device_h_l125_c7_5ed2_iftrue <= VAR_result_MUX_uxn_device_h_l125_c7_5ed2_iftrue;
     result_MUX_uxn_device_h_l125_c7_5ed2_iffalse <= VAR_result_MUX_uxn_device_h_l125_c7_5ed2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l125_c7_5ed2_return_output := result_MUX_uxn_device_h_l125_c7_5ed2_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l114_c7_b7a7_iffalse := VAR_result_MUX_uxn_device_h_l125_c7_5ed2_return_output;
     -- result_MUX[uxn_device_h_l114_c7_b7a7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l114_c7_b7a7_cond <= VAR_result_MUX_uxn_device_h_l114_c7_b7a7_cond;
     result_MUX_uxn_device_h_l114_c7_b7a7_iftrue <= VAR_result_MUX_uxn_device_h_l114_c7_b7a7_iftrue;
     result_MUX_uxn_device_h_l114_c7_b7a7_iffalse <= VAR_result_MUX_uxn_device_h_l114_c7_b7a7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l114_c7_b7a7_return_output := result_MUX_uxn_device_h_l114_c7_b7a7_return_output;

     -- Submodule level 28
     VAR_result_MUX_uxn_device_h_l109_c7_e6a3_iffalse := VAR_result_MUX_uxn_device_h_l114_c7_b7a7_return_output;
     -- result_MUX[uxn_device_h_l109_c7_e6a3] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l109_c7_e6a3_cond <= VAR_result_MUX_uxn_device_h_l109_c7_e6a3_cond;
     result_MUX_uxn_device_h_l109_c7_e6a3_iftrue <= VAR_result_MUX_uxn_device_h_l109_c7_e6a3_iftrue;
     result_MUX_uxn_device_h_l109_c7_e6a3_iffalse <= VAR_result_MUX_uxn_device_h_l109_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l109_c7_e6a3_return_output := result_MUX_uxn_device_h_l109_c7_e6a3_return_output;

     -- Submodule level 29
     VAR_result_MUX_uxn_device_h_l95_c2_d127_iffalse := VAR_result_MUX_uxn_device_h_l109_c7_e6a3_return_output;
     -- result_MUX[uxn_device_h_l95_c2_d127] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l95_c2_d127_cond <= VAR_result_MUX_uxn_device_h_l95_c2_d127_cond;
     result_MUX_uxn_device_h_l95_c2_d127_iftrue <= VAR_result_MUX_uxn_device_h_l95_c2_d127_iftrue;
     result_MUX_uxn_device_h_l95_c2_d127_iffalse <= VAR_result_MUX_uxn_device_h_l95_c2_d127_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l95_c2_d127_return_output := result_MUX_uxn_device_h_l95_c2_d127_return_output;

     -- Submodule level 30
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l95_c2_d127_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l95_c2_d127_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_vram_addr <= REG_VAR_vram_addr;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ram_addr <= REG_VAR_ram_addr;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_color <= REG_VAR_color;
REG_COMB_is_pixel_port <= REG_VAR_is_pixel_port;
REG_COMB_is_sprite_port <= REG_VAR_is_sprite_port;
REG_COMB_is_drawing_port <= REG_VAR_is_drawing_port;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     vram_addr <= REG_COMB_vram_addr;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     ram_addr <= REG_COMB_ram_addr;
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     color <= REG_COMB_color;
     is_pixel_port <= REG_COMB_is_pixel_port;
     is_sprite_port <= REG_COMB_is_sprite_port;
     is_drawing_port <= REG_COMB_is_drawing_port;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
