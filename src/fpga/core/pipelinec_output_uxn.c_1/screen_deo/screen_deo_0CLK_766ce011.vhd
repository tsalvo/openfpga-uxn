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
-- BIN_OP_EQ[uxn_device_h_l95_c6_52f4]
signal BIN_OP_EQ_uxn_device_h_l95_c6_52f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_52f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_c4d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l95_c2_a178]
signal auto_advance_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l95_c2_a178]
signal flip_x_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l95_c2_a178]
signal result_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c2_a178_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_a178_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_a178_return_output : device_out_result_t;

-- is_pixel_port_MUX[uxn_device_h_l95_c2_a178]
signal is_pixel_port_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l95_c2_a178]
signal flip_y_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l95_c2_a178]
signal is_drawing_port_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l95_c2_a178]
signal ctrl_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l95_c2_a178]
signal ram_addr_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l95_c2_a178]
signal vram_addr_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l95_c2_a178]
signal y_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l95_c2_a178]
signal ctrl_mode_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l95_c2_a178]
signal layer_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l95_c2_a178]
signal color_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l95_c2_a178]
signal x_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(15 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l95_c2_a178]
signal is_sprite_port_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l96_c19_4e57]
signal BIN_OP_EQ_uxn_device_h_l96_c19_4e57_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_4e57_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_4e57_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l96_c19_d523]
signal MUX_uxn_device_h_l96_c19_d523_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_d523_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_d523_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_d523_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l97_c20_c543]
signal BIN_OP_EQ_uxn_device_h_l97_c20_c543_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_c543_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_c543_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l97_c20_90f9]
signal MUX_uxn_device_h_l97_c20_90f9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_90f9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_90f9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_90f9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c21_3559]
signal BIN_OP_OR_uxn_device_h_l98_c21_3559_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_3559_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_c7e2]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l102_c3_c7e2]
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l103_c32_2d31]
signal MUX_uxn_device_h_l103_c32_2d31_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l103_c32_2d31_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_2d31_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_2d31_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c11_3dbe]
signal BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_3684]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l109_c7_c4d5]
signal auto_advance_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l109_c7_c4d5]
signal flip_x_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l109_c7_c4d5]
signal result_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l109_c7_c4d5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_c4d5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_c4d5_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l109_c7_c4d5]
signal flip_y_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l109_c7_c4d5]
signal ctrl_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l109_c7_c4d5]
signal ram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l109_c7_c4d5]
signal vram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l109_c7_c4d5]
signal y_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l109_c7_c4d5]
signal ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l109_c7_c4d5]
signal layer_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l109_c7_c4d5]
signal color_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l109_c7_c4d5]
signal x_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l110_c3_3941]
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_eced]
signal BIN_OP_EQ_uxn_device_h_l114_c11_eced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_eced_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_bd57]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_3684]
signal auto_advance_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l114_c7_3684]
signal flip_x_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l114_c7_3684]
signal result_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l114_c7_3684_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_3684_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_3684_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l114_c7_3684]
signal flip_y_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l114_c7_3684]
signal ctrl_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l114_c7_3684]
signal ram_addr_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_3684]
signal vram_addr_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l114_c7_3684]
signal y_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l114_c7_3684]
signal ctrl_mode_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l114_c7_3684]
signal layer_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l114_c7_3684]
signal color_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l114_c7_3684]
signal x_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l115_c3_1dda]
signal flip_x_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_1dda]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l115_c3_1dda]
signal flip_y_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l115_c3_1dda]
signal ctrl_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l115_c3_1dda]
signal ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l115_c3_1dda]
signal layer_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l115_c3_1dda]
signal color_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(3 downto 0);

-- CONST_SR_7[uxn_device_h_l118_c26_70b3]
signal CONST_SR_7_uxn_device_h_l118_c26_70b3_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l118_c26_70b3_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l119_c22_41f0]
signal CONST_SR_6_uxn_device_h_l119_c22_41f0_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l119_c22_41f0_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l120_c23_e03f]
signal CONST_SR_5_uxn_device_h_l120_c23_e03f_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l120_c23_e03f_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l121_c23_9152]
signal CONST_SR_4_uxn_device_h_l121_c23_9152_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l121_c23_9152_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_43c9]
signal BIN_OP_EQ_uxn_device_h_l125_c11_43c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_43c9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_165e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_bd57]
signal auto_advance_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l125_c7_bd57]
signal result_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l125_c7_bd57_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_bd57_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_bd57_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l125_c7_bd57]
signal ram_addr_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l125_c7_bd57]
signal vram_addr_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l125_c7_bd57]
signal y_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l125_c7_bd57]
signal x_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_ce74]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l126_c3_ce74]
signal x_MUX_uxn_device_h_l126_c3_ce74_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l126_c3_ce74_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_ce74_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_ce74_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c11_710f]
signal BIN_OP_EQ_uxn_device_h_l132_c11_710f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_710f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_f10a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l132_c7_165e]
signal auto_advance_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l132_c7_165e]
signal result_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l132_c7_165e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_165e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_165e_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l132_c7_165e]
signal ram_addr_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l132_c7_165e]
signal vram_addr_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l132_c7_165e]
signal y_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l132_c7_165e]
signal x_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c3_26ac]
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l133_c3_26ac]
signal x_MUX_uxn_device_h_l133_c3_26ac_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l133_c3_26ac_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_26ac_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_26ac_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l134_c4_7412]
signal BIN_OP_OR_uxn_device_h_l134_c4_7412_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_7412_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_7412_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c11_df0d]
signal BIN_OP_EQ_uxn_device_h_l138_c11_df0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_df0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_e716]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l138_c7_f10a]
signal auto_advance_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l138_c7_f10a]
signal result_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l138_c7_f10a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_f10a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_f10a_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l138_c7_f10a]
signal ram_addr_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l138_c7_f10a]
signal vram_addr_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l138_c7_f10a]
signal y_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l138_c7_f10a]
signal x_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l139_c3_b104]
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l139_c3_b104]
signal y_MUX_uxn_device_h_l139_c3_b104_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l139_c3_b104_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_b104_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_b104_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_40e2]
signal BIN_OP_EQ_uxn_device_h_l145_c11_40e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_40e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_8efb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_e716]
signal auto_advance_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l145_c7_e716]
signal result_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l145_c7_e716_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_e716_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_e716_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l145_c7_e716]
signal ram_addr_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_e716]
signal vram_addr_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l145_c7_e716]
signal y_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l145_c7_e716]
signal x_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l146_c3_3b93]
signal y_MUX_uxn_device_h_l146_c3_3b93_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l146_c3_3b93_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_3b93_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_3b93_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l147_c4_e0d5]
signal BIN_OP_OR_uxn_device_h_l147_c4_e0d5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_e0d5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_e0d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c11_225a]
signal BIN_OP_EQ_uxn_device_h_l150_c11_225a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_225a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_edab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l150_c7_8efb]
signal auto_advance_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l150_c7_8efb]
signal result_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l150_c7_8efb_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_8efb_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_8efb_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l150_c7_8efb]
signal ram_addr_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l150_c7_8efb]
signal vram_addr_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(31 downto 0);

-- x_MUX[uxn_device_h_l150_c7_8efb]
signal x_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c3_17b5]
signal auto_advance_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c3_17b5]
signal result_vram_address_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l151_c3_17b5]
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c3_17b5]
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c3_17b5]
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l151_c3_17b5]
signal result_u8_value_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l151_c3_17b5]
signal vram_addr_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l154_c32_1f10]
signal BIN_OP_AND_uxn_device_h_l154_c32_1f10_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_1f10_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_1f10_return_output : unsigned(3 downto 0);

-- result_vram_address_MUX[uxn_device_h_l156_c4_1b99]
signal result_vram_address_MUX_uxn_device_h_l156_c4_1b99_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_1b99_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l156_c4_1b99]
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l156_c4_1b99]
signal vram_addr_MUX_uxn_device_h_l156_c4_1b99_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_1b99_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_1b99_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_1b99_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_ae10]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c18_1c8c]
signal BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l158_c5_093b]
signal BIN_OP_AND_uxn_device_h_l158_c5_093b_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_093b_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_093b_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l159_c19_54bc]
signal MUX_uxn_device_h_l159_c19_54bc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c19_54bc_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_54bc_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_54bc_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l159_c5_77dd]
signal BIN_OP_OR_uxn_device_h_l159_c5_77dd_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_77dd_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_77dd_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l160_c19_e13f]
signal MUX_uxn_device_h_l160_c19_e13f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l160_c19_e13f_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_e13f_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_e13f_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l160_c5_0c72]
signal BIN_OP_OR_uxn_device_h_l160_c5_0c72_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_0c72_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_0c72_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l161_c5_6b04]
signal BIN_OP_OR_uxn_device_h_l161_c5_6b04_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_6b04_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_0150]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l165_c28_f171]
signal BIN_OP_PLUS_uxn_device_h_l165_c28_f171_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_f171_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_f171_return_output : unsigned(64 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c8_31f8]
signal auto_advance_MUX_uxn_device_h_l169_c8_31f8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_31f8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_31f8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_31f8_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c8_31f8]
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c11_dcbc]
signal BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_4ccf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l174_c7_edab]
signal result_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c7_edab_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_edab_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_edab_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l174_c7_edab]
signal ram_addr_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_edab_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_edab_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_edab_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l174_c7_edab]
signal x_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l174_c7_edab_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_edab_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_edab_return_output : unsigned(15 downto 0);

-- result_vram_address_MUX[uxn_device_h_l175_c3_25f5]
signal result_vram_address_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l175_c3_25f5]
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l175_c3_25f5]
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l175_c3_25f5]
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_25f5]
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l175_c3_25f5]
signal result_u8_value_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l175_c3_25f5]
signal x_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l180_c9_fd6d]
signal UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_5a14]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c4_5a14]
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l180_c4_5a14]
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c4_5a14]
signal result_u8_value_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l180_c4_5a14]
signal x_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c9_5097]
signal BIN_OP_AND_uxn_device_h_l181_c9_5097_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_5097_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_5097_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_e3d6]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c5_e3d6]
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c5_e3d6]
signal result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l181_c5_e3d6]
signal x_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l182_c6_6b80]
signal BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l185_c34_94c2]
signal CONST_SR_8_uxn_device_h_l185_c34_94c2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l185_c34_94c2_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l191_c8_bd52]
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c11_a0fd]
signal BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_39c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l195_c7_4ccf]
signal result_MUX_uxn_device_h_l195_c7_4ccf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l195_c7_4ccf_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_4ccf_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_4ccf_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l195_c7_4ccf]
signal ram_addr_MUX_uxn_device_h_l195_c7_4ccf_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_4ccf_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_2dd9]
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l196_c3_2dd9]
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l196_c3_2dd9]
signal result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l196_c3_2dd9]
signal ram_addr_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l197_c8_afa1]
signal BIN_OP_AND_uxn_device_h_l197_c8_afa1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_afa1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_afa1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_2a54]
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l197_c4_2a54]
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l197_c4_2a54]
signal result_u8_value_MUX_uxn_device_h_l197_c4_2a54_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_2a54_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l203_c8_3091]
signal ram_addr_MUX_uxn_device_h_l203_c8_3091_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_3091_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_3091_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_3091_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l208_c11_8755]
signal BIN_OP_EQ_uxn_device_h_l208_c11_8755_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_8755_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_7c80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l208_c7_39c6]
signal result_MUX_uxn_device_h_l208_c7_39c6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l208_c7_39c6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_39c6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_39c6_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l208_c7_39c6]
signal ram_addr_MUX_uxn_device_h_l208_c7_39c6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_39c6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_39c6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_39c6_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_d064]
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l209_c3_d064]
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l209_c3_d064]
signal result_u8_value_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l209_c3_d064]
signal ram_addr_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l210_c9_46f8]
signal BIN_OP_AND_uxn_device_h_l210_c9_46f8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_46f8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_46f8_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_1c8f]
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l210_c4_1c8f]
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l210_c4_1c8f]
signal result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l213_c33_6549]
signal CONST_SR_8_uxn_device_h_l213_c33_6549_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l213_c33_6549_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l216_c8_36a7]
signal ram_addr_MUX_uxn_device_h_l216_c8_36a7_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_36a7_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_36a7_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_36a7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l217_c4_deef]
signal BIN_OP_OR_uxn_device_h_l217_c4_deef_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_deef_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_deef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l220_c11_561f]
signal BIN_OP_EQ_uxn_device_h_l220_c11_561f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_561f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_8c96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l220_c7_7c80]
signal result_MUX_uxn_device_h_l220_c7_7c80_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l220_c7_7c80_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_7c80_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_7c80_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_8a3a]
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l221_c3_8a3a]
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l221_c3_8a3a]
signal result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l222_c9_b12f]
signal BIN_OP_AND_uxn_device_h_l222_c9_b12f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_b12f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_b12f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_9e7e]
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l222_c4_9e7e]
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l222_c4_9e7e]
signal result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_9988]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l230_c3_6d34]
signal result_MUX_uxn_device_h_l230_c3_6d34_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l230_c3_6d34_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_6d34_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_6d34_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l231_c58_5618]
signal BIN_OP_MINUS_uxn_device_h_l231_c58_5618_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_5618_right : unsigned(3 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_5618_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l231_c46_4d61]
signal screen_blit_uxn_device_h_l231_c46_4d61_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_4d61_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90
signal CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_2f92( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_4;
      base.u8_value := ref_toks_5;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_855d( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.u8_value := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l95_c6_52f4
BIN_OP_EQ_uxn_device_h_l95_c6_52f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c6_52f4_left,
BIN_OP_EQ_uxn_device_h_l95_c6_52f4_right,
BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- auto_advance_MUX_uxn_device_h_l95_c2_a178
auto_advance_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l95_c2_a178_cond,
auto_advance_MUX_uxn_device_h_l95_c2_a178_iftrue,
auto_advance_MUX_uxn_device_h_l95_c2_a178_iffalse,
auto_advance_MUX_uxn_device_h_l95_c2_a178_return_output);

-- flip_x_MUX_uxn_device_h_l95_c2_a178
flip_x_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l95_c2_a178_cond,
flip_x_MUX_uxn_device_h_l95_c2_a178_iftrue,
flip_x_MUX_uxn_device_h_l95_c2_a178_iffalse,
flip_x_MUX_uxn_device_h_l95_c2_a178_return_output);

-- result_MUX_uxn_device_h_l95_c2_a178
result_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l95_c2_a178_cond,
result_MUX_uxn_device_h_l95_c2_a178_iftrue,
result_MUX_uxn_device_h_l95_c2_a178_iffalse,
result_MUX_uxn_device_h_l95_c2_a178_return_output);

-- is_pixel_port_MUX_uxn_device_h_l95_c2_a178
is_pixel_port_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l95_c2_a178_cond,
is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iftrue,
is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iffalse,
is_pixel_port_MUX_uxn_device_h_l95_c2_a178_return_output);

-- flip_y_MUX_uxn_device_h_l95_c2_a178
flip_y_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l95_c2_a178_cond,
flip_y_MUX_uxn_device_h_l95_c2_a178_iftrue,
flip_y_MUX_uxn_device_h_l95_c2_a178_iffalse,
flip_y_MUX_uxn_device_h_l95_c2_a178_return_output);

-- is_drawing_port_MUX_uxn_device_h_l95_c2_a178
is_drawing_port_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l95_c2_a178_cond,
is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iftrue,
is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iffalse,
is_drawing_port_MUX_uxn_device_h_l95_c2_a178_return_output);

-- ctrl_MUX_uxn_device_h_l95_c2_a178
ctrl_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l95_c2_a178_cond,
ctrl_MUX_uxn_device_h_l95_c2_a178_iftrue,
ctrl_MUX_uxn_device_h_l95_c2_a178_iffalse,
ctrl_MUX_uxn_device_h_l95_c2_a178_return_output);

-- ram_addr_MUX_uxn_device_h_l95_c2_a178
ram_addr_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l95_c2_a178_cond,
ram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue,
ram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse,
ram_addr_MUX_uxn_device_h_l95_c2_a178_return_output);

-- vram_addr_MUX_uxn_device_h_l95_c2_a178
vram_addr_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l95_c2_a178_cond,
vram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue,
vram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse,
vram_addr_MUX_uxn_device_h_l95_c2_a178_return_output);

-- y_MUX_uxn_device_h_l95_c2_a178
y_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l95_c2_a178_cond,
y_MUX_uxn_device_h_l95_c2_a178_iftrue,
y_MUX_uxn_device_h_l95_c2_a178_iffalse,
y_MUX_uxn_device_h_l95_c2_a178_return_output);

-- ctrl_mode_MUX_uxn_device_h_l95_c2_a178
ctrl_mode_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l95_c2_a178_cond,
ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iftrue,
ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iffalse,
ctrl_mode_MUX_uxn_device_h_l95_c2_a178_return_output);

-- layer_MUX_uxn_device_h_l95_c2_a178
layer_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l95_c2_a178_cond,
layer_MUX_uxn_device_h_l95_c2_a178_iftrue,
layer_MUX_uxn_device_h_l95_c2_a178_iffalse,
layer_MUX_uxn_device_h_l95_c2_a178_return_output);

-- color_MUX_uxn_device_h_l95_c2_a178
color_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l95_c2_a178_cond,
color_MUX_uxn_device_h_l95_c2_a178_iftrue,
color_MUX_uxn_device_h_l95_c2_a178_iffalse,
color_MUX_uxn_device_h_l95_c2_a178_return_output);

-- x_MUX_uxn_device_h_l95_c2_a178
x_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l95_c2_a178_cond,
x_MUX_uxn_device_h_l95_c2_a178_iftrue,
x_MUX_uxn_device_h_l95_c2_a178_iffalse,
x_MUX_uxn_device_h_l95_c2_a178_return_output);

-- is_sprite_port_MUX_uxn_device_h_l95_c2_a178
is_sprite_port_MUX_uxn_device_h_l95_c2_a178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l95_c2_a178_cond,
is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iftrue,
is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iffalse,
is_sprite_port_MUX_uxn_device_h_l95_c2_a178_return_output);

-- BIN_OP_EQ_uxn_device_h_l96_c19_4e57
BIN_OP_EQ_uxn_device_h_l96_c19_4e57 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l96_c19_4e57_left,
BIN_OP_EQ_uxn_device_h_l96_c19_4e57_right,
BIN_OP_EQ_uxn_device_h_l96_c19_4e57_return_output);

-- MUX_uxn_device_h_l96_c19_d523
MUX_uxn_device_h_l96_c19_d523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c19_d523_cond,
MUX_uxn_device_h_l96_c19_d523_iftrue,
MUX_uxn_device_h_l96_c19_d523_iffalse,
MUX_uxn_device_h_l96_c19_d523_return_output);

-- BIN_OP_EQ_uxn_device_h_l97_c20_c543
BIN_OP_EQ_uxn_device_h_l97_c20_c543 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l97_c20_c543_left,
BIN_OP_EQ_uxn_device_h_l97_c20_c543_right,
BIN_OP_EQ_uxn_device_h_l97_c20_c543_return_output);

-- MUX_uxn_device_h_l97_c20_90f9
MUX_uxn_device_h_l97_c20_90f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l97_c20_90f9_cond,
MUX_uxn_device_h_l97_c20_90f9_iftrue,
MUX_uxn_device_h_l97_c20_90f9_iffalse,
MUX_uxn_device_h_l97_c20_90f9_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c21_3559
BIN_OP_OR_uxn_device_h_l98_c21_3559 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c21_3559_left,
BIN_OP_OR_uxn_device_h_l98_c21_3559_right,
BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2
result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2
result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_cond,
result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_return_output);

-- MUX_uxn_device_h_l103_c32_2d31
MUX_uxn_device_h_l103_c32_2d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l103_c32_2d31_cond,
MUX_uxn_device_h_l103_c32_2d31_iftrue,
MUX_uxn_device_h_l103_c32_2d31_iffalse,
MUX_uxn_device_h_l103_c32_2d31_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c11_3dbe
BIN_OP_EQ_uxn_device_h_l109_c11_3dbe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_left,
BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_right,
BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_return_output);

-- auto_advance_MUX_uxn_device_h_l109_c7_c4d5
auto_advance_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l109_c7_c4d5_cond,
auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
auto_advance_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- flip_x_MUX_uxn_device_h_l109_c7_c4d5
flip_x_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l109_c7_c4d5_cond,
flip_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
flip_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
flip_x_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- result_MUX_uxn_device_h_l109_c7_c4d5
result_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l109_c7_c4d5_cond,
result_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
result_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
result_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- flip_y_MUX_uxn_device_h_l109_c7_c4d5
flip_y_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l109_c7_c4d5_cond,
flip_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
flip_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
flip_y_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- ctrl_MUX_uxn_device_h_l109_c7_c4d5
ctrl_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l109_c7_c4d5_cond,
ctrl_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
ctrl_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
ctrl_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- ram_addr_MUX_uxn_device_h_l109_c7_c4d5
ram_addr_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond,
ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
ram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- vram_addr_MUX_uxn_device_h_l109_c7_c4d5
vram_addr_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond,
vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
vram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- y_MUX_uxn_device_h_l109_c7_c4d5
y_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l109_c7_c4d5_cond,
y_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
y_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
y_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5
ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_cond,
ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- layer_MUX_uxn_device_h_l109_c7_c4d5
layer_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l109_c7_c4d5_cond,
layer_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
layer_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
layer_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- color_MUX_uxn_device_h_l109_c7_c4d5
color_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l109_c7_c4d5_cond,
color_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
color_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
color_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- x_MUX_uxn_device_h_l109_c7_c4d5
x_MUX_uxn_device_h_l109_c7_c4d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l109_c7_c4d5_cond,
x_MUX_uxn_device_h_l109_c7_c4d5_iftrue,
x_MUX_uxn_device_h_l109_c7_c4d5_iffalse,
x_MUX_uxn_device_h_l109_c7_c4d5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l110_c3_3941
result_device_ram_address_MUX_uxn_device_h_l110_c3_3941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_cond,
result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iftrue,
result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iffalse,
result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_eced
BIN_OP_EQ_uxn_device_h_l114_c11_eced : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_eced_left,
BIN_OP_EQ_uxn_device_h_l114_c11_eced_right,
BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_3684
auto_advance_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_3684_cond,
auto_advance_MUX_uxn_device_h_l114_c7_3684_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_3684_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_3684_return_output);

-- flip_x_MUX_uxn_device_h_l114_c7_3684
flip_x_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l114_c7_3684_cond,
flip_x_MUX_uxn_device_h_l114_c7_3684_iftrue,
flip_x_MUX_uxn_device_h_l114_c7_3684_iffalse,
flip_x_MUX_uxn_device_h_l114_c7_3684_return_output);

-- result_MUX_uxn_device_h_l114_c7_3684
result_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l114_c7_3684_cond,
result_MUX_uxn_device_h_l114_c7_3684_iftrue,
result_MUX_uxn_device_h_l114_c7_3684_iffalse,
result_MUX_uxn_device_h_l114_c7_3684_return_output);

-- flip_y_MUX_uxn_device_h_l114_c7_3684
flip_y_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l114_c7_3684_cond,
flip_y_MUX_uxn_device_h_l114_c7_3684_iftrue,
flip_y_MUX_uxn_device_h_l114_c7_3684_iffalse,
flip_y_MUX_uxn_device_h_l114_c7_3684_return_output);

-- ctrl_MUX_uxn_device_h_l114_c7_3684
ctrl_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l114_c7_3684_cond,
ctrl_MUX_uxn_device_h_l114_c7_3684_iftrue,
ctrl_MUX_uxn_device_h_l114_c7_3684_iffalse,
ctrl_MUX_uxn_device_h_l114_c7_3684_return_output);

-- ram_addr_MUX_uxn_device_h_l114_c7_3684
ram_addr_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l114_c7_3684_cond,
ram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue,
ram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse,
ram_addr_MUX_uxn_device_h_l114_c7_3684_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_3684
vram_addr_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_3684_cond,
vram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_3684_return_output);

-- y_MUX_uxn_device_h_l114_c7_3684
y_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_3684_cond,
y_MUX_uxn_device_h_l114_c7_3684_iftrue,
y_MUX_uxn_device_h_l114_c7_3684_iffalse,
y_MUX_uxn_device_h_l114_c7_3684_return_output);

-- ctrl_mode_MUX_uxn_device_h_l114_c7_3684
ctrl_mode_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l114_c7_3684_cond,
ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iftrue,
ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iffalse,
ctrl_mode_MUX_uxn_device_h_l114_c7_3684_return_output);

-- layer_MUX_uxn_device_h_l114_c7_3684
layer_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l114_c7_3684_cond,
layer_MUX_uxn_device_h_l114_c7_3684_iftrue,
layer_MUX_uxn_device_h_l114_c7_3684_iffalse,
layer_MUX_uxn_device_h_l114_c7_3684_return_output);

-- color_MUX_uxn_device_h_l114_c7_3684
color_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l114_c7_3684_cond,
color_MUX_uxn_device_h_l114_c7_3684_iftrue,
color_MUX_uxn_device_h_l114_c7_3684_iffalse,
color_MUX_uxn_device_h_l114_c7_3684_return_output);

-- x_MUX_uxn_device_h_l114_c7_3684
x_MUX_uxn_device_h_l114_c7_3684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l114_c7_3684_cond,
x_MUX_uxn_device_h_l114_c7_3684_iftrue,
x_MUX_uxn_device_h_l114_c7_3684_iffalse,
x_MUX_uxn_device_h_l114_c7_3684_return_output);

-- flip_x_MUX_uxn_device_h_l115_c3_1dda
flip_x_MUX_uxn_device_h_l115_c3_1dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l115_c3_1dda_cond,
flip_x_MUX_uxn_device_h_l115_c3_1dda_iftrue,
flip_x_MUX_uxn_device_h_l115_c3_1dda_iffalse,
flip_x_MUX_uxn_device_h_l115_c3_1dda_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda
result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_return_output);

-- flip_y_MUX_uxn_device_h_l115_c3_1dda
flip_y_MUX_uxn_device_h_l115_c3_1dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l115_c3_1dda_cond,
flip_y_MUX_uxn_device_h_l115_c3_1dda_iftrue,
flip_y_MUX_uxn_device_h_l115_c3_1dda_iffalse,
flip_y_MUX_uxn_device_h_l115_c3_1dda_return_output);

-- ctrl_MUX_uxn_device_h_l115_c3_1dda
ctrl_MUX_uxn_device_h_l115_c3_1dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l115_c3_1dda_cond,
ctrl_MUX_uxn_device_h_l115_c3_1dda_iftrue,
ctrl_MUX_uxn_device_h_l115_c3_1dda_iffalse,
ctrl_MUX_uxn_device_h_l115_c3_1dda_return_output);

-- ctrl_mode_MUX_uxn_device_h_l115_c3_1dda
ctrl_mode_MUX_uxn_device_h_l115_c3_1dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_cond,
ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iftrue,
ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iffalse,
ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_return_output);

-- layer_MUX_uxn_device_h_l115_c3_1dda
layer_MUX_uxn_device_h_l115_c3_1dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l115_c3_1dda_cond,
layer_MUX_uxn_device_h_l115_c3_1dda_iftrue,
layer_MUX_uxn_device_h_l115_c3_1dda_iffalse,
layer_MUX_uxn_device_h_l115_c3_1dda_return_output);

-- color_MUX_uxn_device_h_l115_c3_1dda
color_MUX_uxn_device_h_l115_c3_1dda : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l115_c3_1dda_cond,
color_MUX_uxn_device_h_l115_c3_1dda_iftrue,
color_MUX_uxn_device_h_l115_c3_1dda_iffalse,
color_MUX_uxn_device_h_l115_c3_1dda_return_output);

-- CONST_SR_7_uxn_device_h_l118_c26_70b3
CONST_SR_7_uxn_device_h_l118_c26_70b3 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l118_c26_70b3_x,
CONST_SR_7_uxn_device_h_l118_c26_70b3_return_output);

-- CONST_SR_6_uxn_device_h_l119_c22_41f0
CONST_SR_6_uxn_device_h_l119_c22_41f0 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l119_c22_41f0_x,
CONST_SR_6_uxn_device_h_l119_c22_41f0_return_output);

-- CONST_SR_5_uxn_device_h_l120_c23_e03f
CONST_SR_5_uxn_device_h_l120_c23_e03f : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l120_c23_e03f_x,
CONST_SR_5_uxn_device_h_l120_c23_e03f_return_output);

-- CONST_SR_4_uxn_device_h_l121_c23_9152
CONST_SR_4_uxn_device_h_l121_c23_9152 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l121_c23_9152_x,
CONST_SR_4_uxn_device_h_l121_c23_9152_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_43c9
BIN_OP_EQ_uxn_device_h_l125_c11_43c9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_43c9_left,
BIN_OP_EQ_uxn_device_h_l125_c11_43c9_right,
BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_bd57
auto_advance_MUX_uxn_device_h_l125_c7_bd57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_bd57_cond,
auto_advance_MUX_uxn_device_h_l125_c7_bd57_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_bd57_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_bd57_return_output);

-- result_MUX_uxn_device_h_l125_c7_bd57
result_MUX_uxn_device_h_l125_c7_bd57 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l125_c7_bd57_cond,
result_MUX_uxn_device_h_l125_c7_bd57_iftrue,
result_MUX_uxn_device_h_l125_c7_bd57_iffalse,
result_MUX_uxn_device_h_l125_c7_bd57_return_output);

-- ram_addr_MUX_uxn_device_h_l125_c7_bd57
ram_addr_MUX_uxn_device_h_l125_c7_bd57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l125_c7_bd57_cond,
ram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue,
ram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse,
ram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output);

-- vram_addr_MUX_uxn_device_h_l125_c7_bd57
vram_addr_MUX_uxn_device_h_l125_c7_bd57 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l125_c7_bd57_cond,
vram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue,
vram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse,
vram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output);

-- y_MUX_uxn_device_h_l125_c7_bd57
y_MUX_uxn_device_h_l125_c7_bd57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_bd57_cond,
y_MUX_uxn_device_h_l125_c7_bd57_iftrue,
y_MUX_uxn_device_h_l125_c7_bd57_iffalse,
y_MUX_uxn_device_h_l125_c7_bd57_return_output);

-- x_MUX_uxn_device_h_l125_c7_bd57
x_MUX_uxn_device_h_l125_c7_bd57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l125_c7_bd57_cond,
x_MUX_uxn_device_h_l125_c7_bd57_iftrue,
x_MUX_uxn_device_h_l125_c7_bd57_iffalse,
x_MUX_uxn_device_h_l125_c7_bd57_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74
result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_return_output);

-- x_MUX_uxn_device_h_l126_c3_ce74
x_MUX_uxn_device_h_l126_c3_ce74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l126_c3_ce74_cond,
x_MUX_uxn_device_h_l126_c3_ce74_iftrue,
x_MUX_uxn_device_h_l126_c3_ce74_iffalse,
x_MUX_uxn_device_h_l126_c3_ce74_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c11_710f
BIN_OP_EQ_uxn_device_h_l132_c11_710f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c11_710f_left,
BIN_OP_EQ_uxn_device_h_l132_c11_710f_right,
BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_return_output);

-- auto_advance_MUX_uxn_device_h_l132_c7_165e
auto_advance_MUX_uxn_device_h_l132_c7_165e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l132_c7_165e_cond,
auto_advance_MUX_uxn_device_h_l132_c7_165e_iftrue,
auto_advance_MUX_uxn_device_h_l132_c7_165e_iffalse,
auto_advance_MUX_uxn_device_h_l132_c7_165e_return_output);

-- result_MUX_uxn_device_h_l132_c7_165e
result_MUX_uxn_device_h_l132_c7_165e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l132_c7_165e_cond,
result_MUX_uxn_device_h_l132_c7_165e_iftrue,
result_MUX_uxn_device_h_l132_c7_165e_iffalse,
result_MUX_uxn_device_h_l132_c7_165e_return_output);

-- ram_addr_MUX_uxn_device_h_l132_c7_165e
ram_addr_MUX_uxn_device_h_l132_c7_165e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l132_c7_165e_cond,
ram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue,
ram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse,
ram_addr_MUX_uxn_device_h_l132_c7_165e_return_output);

-- vram_addr_MUX_uxn_device_h_l132_c7_165e
vram_addr_MUX_uxn_device_h_l132_c7_165e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l132_c7_165e_cond,
vram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue,
vram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse,
vram_addr_MUX_uxn_device_h_l132_c7_165e_return_output);

-- y_MUX_uxn_device_h_l132_c7_165e
y_MUX_uxn_device_h_l132_c7_165e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l132_c7_165e_cond,
y_MUX_uxn_device_h_l132_c7_165e_iftrue,
y_MUX_uxn_device_h_l132_c7_165e_iffalse,
y_MUX_uxn_device_h_l132_c7_165e_return_output);

-- x_MUX_uxn_device_h_l132_c7_165e
x_MUX_uxn_device_h_l132_c7_165e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l132_c7_165e_cond,
x_MUX_uxn_device_h_l132_c7_165e_iftrue,
x_MUX_uxn_device_h_l132_c7_165e_iffalse,
x_MUX_uxn_device_h_l132_c7_165e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac
result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_return_output);

-- x_MUX_uxn_device_h_l133_c3_26ac
x_MUX_uxn_device_h_l133_c3_26ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l133_c3_26ac_cond,
x_MUX_uxn_device_h_l133_c3_26ac_iftrue,
x_MUX_uxn_device_h_l133_c3_26ac_iffalse,
x_MUX_uxn_device_h_l133_c3_26ac_return_output);

-- BIN_OP_OR_uxn_device_h_l134_c4_7412
BIN_OP_OR_uxn_device_h_l134_c4_7412 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l134_c4_7412_left,
BIN_OP_OR_uxn_device_h_l134_c4_7412_right,
BIN_OP_OR_uxn_device_h_l134_c4_7412_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c11_df0d
BIN_OP_EQ_uxn_device_h_l138_c11_df0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c11_df0d_left,
BIN_OP_EQ_uxn_device_h_l138_c11_df0d_right,
BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_return_output);

-- auto_advance_MUX_uxn_device_h_l138_c7_f10a
auto_advance_MUX_uxn_device_h_l138_c7_f10a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l138_c7_f10a_cond,
auto_advance_MUX_uxn_device_h_l138_c7_f10a_iftrue,
auto_advance_MUX_uxn_device_h_l138_c7_f10a_iffalse,
auto_advance_MUX_uxn_device_h_l138_c7_f10a_return_output);

-- result_MUX_uxn_device_h_l138_c7_f10a
result_MUX_uxn_device_h_l138_c7_f10a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l138_c7_f10a_cond,
result_MUX_uxn_device_h_l138_c7_f10a_iftrue,
result_MUX_uxn_device_h_l138_c7_f10a_iffalse,
result_MUX_uxn_device_h_l138_c7_f10a_return_output);

-- ram_addr_MUX_uxn_device_h_l138_c7_f10a
ram_addr_MUX_uxn_device_h_l138_c7_f10a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l138_c7_f10a_cond,
ram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue,
ram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse,
ram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output);

-- vram_addr_MUX_uxn_device_h_l138_c7_f10a
vram_addr_MUX_uxn_device_h_l138_c7_f10a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l138_c7_f10a_cond,
vram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue,
vram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse,
vram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output);

-- y_MUX_uxn_device_h_l138_c7_f10a
y_MUX_uxn_device_h_l138_c7_f10a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c7_f10a_cond,
y_MUX_uxn_device_h_l138_c7_f10a_iftrue,
y_MUX_uxn_device_h_l138_c7_f10a_iffalse,
y_MUX_uxn_device_h_l138_c7_f10a_return_output);

-- x_MUX_uxn_device_h_l138_c7_f10a
x_MUX_uxn_device_h_l138_c7_f10a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l138_c7_f10a_cond,
x_MUX_uxn_device_h_l138_c7_f10a_iftrue,
x_MUX_uxn_device_h_l138_c7_f10a_iffalse,
x_MUX_uxn_device_h_l138_c7_f10a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l139_c3_b104
result_device_ram_address_MUX_uxn_device_h_l139_c3_b104 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_cond,
result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iftrue,
result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iffalse,
result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_return_output);

-- y_MUX_uxn_device_h_l139_c3_b104
y_MUX_uxn_device_h_l139_c3_b104 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l139_c3_b104_cond,
y_MUX_uxn_device_h_l139_c3_b104_iftrue,
y_MUX_uxn_device_h_l139_c3_b104_iffalse,
y_MUX_uxn_device_h_l139_c3_b104_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_40e2
BIN_OP_EQ_uxn_device_h_l145_c11_40e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_40e2_left,
BIN_OP_EQ_uxn_device_h_l145_c11_40e2_right,
BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_e716
auto_advance_MUX_uxn_device_h_l145_c7_e716 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_e716_cond,
auto_advance_MUX_uxn_device_h_l145_c7_e716_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_e716_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_e716_return_output);

-- result_MUX_uxn_device_h_l145_c7_e716
result_MUX_uxn_device_h_l145_c7_e716 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l145_c7_e716_cond,
result_MUX_uxn_device_h_l145_c7_e716_iftrue,
result_MUX_uxn_device_h_l145_c7_e716_iffalse,
result_MUX_uxn_device_h_l145_c7_e716_return_output);

-- ram_addr_MUX_uxn_device_h_l145_c7_e716
ram_addr_MUX_uxn_device_h_l145_c7_e716 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l145_c7_e716_cond,
ram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue,
ram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse,
ram_addr_MUX_uxn_device_h_l145_c7_e716_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_e716
vram_addr_MUX_uxn_device_h_l145_c7_e716 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_e716_cond,
vram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_e716_return_output);

-- y_MUX_uxn_device_h_l145_c7_e716
y_MUX_uxn_device_h_l145_c7_e716 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l145_c7_e716_cond,
y_MUX_uxn_device_h_l145_c7_e716_iftrue,
y_MUX_uxn_device_h_l145_c7_e716_iffalse,
y_MUX_uxn_device_h_l145_c7_e716_return_output);

-- x_MUX_uxn_device_h_l145_c7_e716
x_MUX_uxn_device_h_l145_c7_e716 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l145_c7_e716_cond,
x_MUX_uxn_device_h_l145_c7_e716_iftrue,
x_MUX_uxn_device_h_l145_c7_e716_iffalse,
x_MUX_uxn_device_h_l145_c7_e716_return_output);

-- y_MUX_uxn_device_h_l146_c3_3b93
y_MUX_uxn_device_h_l146_c3_3b93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l146_c3_3b93_cond,
y_MUX_uxn_device_h_l146_c3_3b93_iftrue,
y_MUX_uxn_device_h_l146_c3_3b93_iffalse,
y_MUX_uxn_device_h_l146_c3_3b93_return_output);

-- BIN_OP_OR_uxn_device_h_l147_c4_e0d5
BIN_OP_OR_uxn_device_h_l147_c4_e0d5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l147_c4_e0d5_left,
BIN_OP_OR_uxn_device_h_l147_c4_e0d5_right,
BIN_OP_OR_uxn_device_h_l147_c4_e0d5_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c11_225a
BIN_OP_EQ_uxn_device_h_l150_c11_225a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c11_225a_left,
BIN_OP_EQ_uxn_device_h_l150_c11_225a_right,
BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_return_output);

-- auto_advance_MUX_uxn_device_h_l150_c7_8efb
auto_advance_MUX_uxn_device_h_l150_c7_8efb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l150_c7_8efb_cond,
auto_advance_MUX_uxn_device_h_l150_c7_8efb_iftrue,
auto_advance_MUX_uxn_device_h_l150_c7_8efb_iffalse,
auto_advance_MUX_uxn_device_h_l150_c7_8efb_return_output);

-- result_MUX_uxn_device_h_l150_c7_8efb
result_MUX_uxn_device_h_l150_c7_8efb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l150_c7_8efb_cond,
result_MUX_uxn_device_h_l150_c7_8efb_iftrue,
result_MUX_uxn_device_h_l150_c7_8efb_iffalse,
result_MUX_uxn_device_h_l150_c7_8efb_return_output);

-- ram_addr_MUX_uxn_device_h_l150_c7_8efb
ram_addr_MUX_uxn_device_h_l150_c7_8efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l150_c7_8efb_cond,
ram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue,
ram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse,
ram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output);

-- vram_addr_MUX_uxn_device_h_l150_c7_8efb
vram_addr_MUX_uxn_device_h_l150_c7_8efb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l150_c7_8efb_cond,
vram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue,
vram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse,
vram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output);

-- x_MUX_uxn_device_h_l150_c7_8efb
x_MUX_uxn_device_h_l150_c7_8efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l150_c7_8efb_cond,
x_MUX_uxn_device_h_l150_c7_8efb_iftrue,
x_MUX_uxn_device_h_l150_c7_8efb_iffalse,
x_MUX_uxn_device_h_l150_c7_8efb_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c3_17b5
auto_advance_MUX_uxn_device_h_l151_c3_17b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c3_17b5_cond,
auto_advance_MUX_uxn_device_h_l151_c3_17b5_iftrue,
auto_advance_MUX_uxn_device_h_l151_c3_17b5_iffalse,
auto_advance_MUX_uxn_device_h_l151_c3_17b5_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c3_17b5
result_vram_address_MUX_uxn_device_h_l151_c3_17b5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c3_17b5_cond,
result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c3_17b5_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5
result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_cond,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5
result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5
result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_return_output);

-- result_u8_value_MUX_uxn_device_h_l151_c3_17b5
result_u8_value_MUX_uxn_device_h_l151_c3_17b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l151_c3_17b5_cond,
result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iftrue,
result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iffalse,
result_u8_value_MUX_uxn_device_h_l151_c3_17b5_return_output);

-- vram_addr_MUX_uxn_device_h_l151_c3_17b5
vram_addr_MUX_uxn_device_h_l151_c3_17b5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l151_c3_17b5_cond,
vram_addr_MUX_uxn_device_h_l151_c3_17b5_iftrue,
vram_addr_MUX_uxn_device_h_l151_c3_17b5_iffalse,
vram_addr_MUX_uxn_device_h_l151_c3_17b5_return_output);

-- BIN_OP_AND_uxn_device_h_l154_c32_1f10
BIN_OP_AND_uxn_device_h_l154_c32_1f10 : entity work.BIN_OP_AND_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l154_c32_1f10_left,
BIN_OP_AND_uxn_device_h_l154_c32_1f10_right,
BIN_OP_AND_uxn_device_h_l154_c32_1f10_return_output);

-- result_vram_address_MUX_uxn_device_h_l156_c4_1b99
result_vram_address_MUX_uxn_device_h_l156_c4_1b99 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l156_c4_1b99_cond,
result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iftrue,
result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iffalse,
result_vram_address_MUX_uxn_device_h_l156_c4_1b99_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99
result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_cond,
result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iftrue,
result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iffalse,
result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_return_output);

-- vram_addr_MUX_uxn_device_h_l156_c4_1b99
vram_addr_MUX_uxn_device_h_l156_c4_1b99 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l156_c4_1b99_cond,
vram_addr_MUX_uxn_device_h_l156_c4_1b99_iftrue,
vram_addr_MUX_uxn_device_h_l156_c4_1b99_iffalse,
vram_addr_MUX_uxn_device_h_l156_c4_1b99_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c
BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_left,
BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_right,
BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_return_output);

-- BIN_OP_AND_uxn_device_h_l158_c5_093b
BIN_OP_AND_uxn_device_h_l158_c5_093b : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l158_c5_093b_left,
BIN_OP_AND_uxn_device_h_l158_c5_093b_right,
BIN_OP_AND_uxn_device_h_l158_c5_093b_return_output);

-- MUX_uxn_device_h_l159_c19_54bc
MUX_uxn_device_h_l159_c19_54bc : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l159_c19_54bc_cond,
MUX_uxn_device_h_l159_c19_54bc_iftrue,
MUX_uxn_device_h_l159_c19_54bc_iffalse,
MUX_uxn_device_h_l159_c19_54bc_return_output);

-- BIN_OP_OR_uxn_device_h_l159_c5_77dd
BIN_OP_OR_uxn_device_h_l159_c5_77dd : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l159_c5_77dd_left,
BIN_OP_OR_uxn_device_h_l159_c5_77dd_right,
BIN_OP_OR_uxn_device_h_l159_c5_77dd_return_output);

-- MUX_uxn_device_h_l160_c19_e13f
MUX_uxn_device_h_l160_c19_e13f : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l160_c19_e13f_cond,
MUX_uxn_device_h_l160_c19_e13f_iftrue,
MUX_uxn_device_h_l160_c19_e13f_iffalse,
MUX_uxn_device_h_l160_c19_e13f_return_output);

-- BIN_OP_OR_uxn_device_h_l160_c5_0c72
BIN_OP_OR_uxn_device_h_l160_c5_0c72 : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l160_c5_0c72_left,
BIN_OP_OR_uxn_device_h_l160_c5_0c72_right,
BIN_OP_OR_uxn_device_h_l160_c5_0c72_return_output);

-- BIN_OP_OR_uxn_device_h_l161_c5_6b04
BIN_OP_OR_uxn_device_h_l161_c5_6b04 : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l161_c5_6b04_left,
BIN_OP_OR_uxn_device_h_l161_c5_6b04_right,
BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_return_output);

-- BIN_OP_PLUS_uxn_device_h_l165_c28_f171
BIN_OP_PLUS_uxn_device_h_l165_c28_f171 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l165_c28_f171_left,
BIN_OP_PLUS_uxn_device_h_l165_c28_f171_right,
BIN_OP_PLUS_uxn_device_h_l165_c28_f171_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c8_31f8
auto_advance_MUX_uxn_device_h_l169_c8_31f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c8_31f8_cond,
auto_advance_MUX_uxn_device_h_l169_c8_31f8_iftrue,
auto_advance_MUX_uxn_device_h_l169_c8_31f8_iffalse,
auto_advance_MUX_uxn_device_h_l169_c8_31f8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8
result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c11_dcbc
BIN_OP_EQ_uxn_device_h_l174_c11_dcbc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_left,
BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_right,
BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_return_output);

-- result_MUX_uxn_device_h_l174_c7_edab
result_MUX_uxn_device_h_l174_c7_edab : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c7_edab_cond,
result_MUX_uxn_device_h_l174_c7_edab_iftrue,
result_MUX_uxn_device_h_l174_c7_edab_iffalse,
result_MUX_uxn_device_h_l174_c7_edab_return_output);

-- ram_addr_MUX_uxn_device_h_l174_c7_edab
ram_addr_MUX_uxn_device_h_l174_c7_edab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l174_c7_edab_cond,
ram_addr_MUX_uxn_device_h_l174_c7_edab_iftrue,
ram_addr_MUX_uxn_device_h_l174_c7_edab_iffalse,
ram_addr_MUX_uxn_device_h_l174_c7_edab_return_output);

-- x_MUX_uxn_device_h_l174_c7_edab
x_MUX_uxn_device_h_l174_c7_edab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l174_c7_edab_cond,
x_MUX_uxn_device_h_l174_c7_edab_iftrue,
x_MUX_uxn_device_h_l174_c7_edab_iffalse,
x_MUX_uxn_device_h_l174_c7_edab_return_output);

-- result_vram_address_MUX_uxn_device_h_l175_c3_25f5
result_vram_address_MUX_uxn_device_h_l175_c3_25f5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l175_c3_25f5_cond,
result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue,
result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse,
result_vram_address_MUX_uxn_device_h_l175_c3_25f5_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5
result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_cond,
result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue,
result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse,
result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5
result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_cond,
result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5
result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_cond,
result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_cond,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_return_output);

-- result_u8_value_MUX_uxn_device_h_l175_c3_25f5
result_u8_value_MUX_uxn_device_h_l175_c3_25f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l175_c3_25f5_cond,
result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iftrue,
result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iffalse,
result_u8_value_MUX_uxn_device_h_l175_c3_25f5_return_output);

-- x_MUX_uxn_device_h_l175_c3_25f5
x_MUX_uxn_device_h_l175_c3_25f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l175_c3_25f5_cond,
x_MUX_uxn_device_h_l175_c3_25f5_iftrue,
x_MUX_uxn_device_h_l175_c3_25f5_iffalse,
x_MUX_uxn_device_h_l175_c3_25f5_return_output);

-- UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d
UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_expr,
UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14
result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14
result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_cond,
result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iftrue,
result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iffalse,
result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c4_5a14
result_u8_value_MUX_uxn_device_h_l180_c4_5a14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c4_5a14_cond,
result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c4_5a14_return_output);

-- x_MUX_uxn_device_h_l180_c4_5a14
x_MUX_uxn_device_h_l180_c4_5a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l180_c4_5a14_cond,
x_MUX_uxn_device_h_l180_c4_5a14_iftrue,
x_MUX_uxn_device_h_l180_c4_5a14_iffalse,
x_MUX_uxn_device_h_l180_c4_5a14_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c9_5097
BIN_OP_AND_uxn_device_h_l181_c9_5097 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c9_5097_left,
BIN_OP_AND_uxn_device_h_l181_c9_5097_right,
BIN_OP_AND_uxn_device_h_l181_c9_5097_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6
result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c5_e3d6
result_u8_value_MUX_uxn_device_h_l181_c5_e3d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_cond,
result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_return_output);

-- x_MUX_uxn_device_h_l181_c5_e3d6
x_MUX_uxn_device_h_l181_c5_e3d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c5_e3d6_cond,
x_MUX_uxn_device_h_l181_c5_e3d6_iftrue,
x_MUX_uxn_device_h_l181_c5_e3d6_iffalse,
x_MUX_uxn_device_h_l181_c5_e3d6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l182_c6_6b80
BIN_OP_PLUS_uxn_device_h_l182_c6_6b80 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_left,
BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_right,
BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_return_output);

-- CONST_SR_8_uxn_device_h_l185_c34_94c2
CONST_SR_8_uxn_device_h_l185_c34_94c2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l185_c34_94c2_x,
CONST_SR_8_uxn_device_h_l185_c34_94c2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52
result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_cond,
result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iftrue,
result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iffalse,
result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c11_a0fd
BIN_OP_EQ_uxn_device_h_l195_c11_a0fd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_left,
BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_right,
BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_return_output);

-- result_MUX_uxn_device_h_l195_c7_4ccf
result_MUX_uxn_device_h_l195_c7_4ccf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l195_c7_4ccf_cond,
result_MUX_uxn_device_h_l195_c7_4ccf_iftrue,
result_MUX_uxn_device_h_l195_c7_4ccf_iffalse,
result_MUX_uxn_device_h_l195_c7_4ccf_return_output);

-- ram_addr_MUX_uxn_device_h_l195_c7_4ccf
ram_addr_MUX_uxn_device_h_l195_c7_4ccf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l195_c7_4ccf_cond,
ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iftrue,
ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iffalse,
ram_addr_MUX_uxn_device_h_l195_c7_4ccf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_cond,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9
result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_cond,
result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_return_output);

-- result_u8_value_MUX_uxn_device_h_l196_c3_2dd9
result_u8_value_MUX_uxn_device_h_l196_c3_2dd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_cond,
result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iftrue,
result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iffalse,
result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_return_output);

-- ram_addr_MUX_uxn_device_h_l196_c3_2dd9
ram_addr_MUX_uxn_device_h_l196_c3_2dd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l196_c3_2dd9_cond,
ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iftrue,
ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iffalse,
ram_addr_MUX_uxn_device_h_l196_c3_2dd9_return_output);

-- BIN_OP_AND_uxn_device_h_l197_c8_afa1
BIN_OP_AND_uxn_device_h_l197_c8_afa1 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l197_c8_afa1_left,
BIN_OP_AND_uxn_device_h_l197_c8_afa1_right,
BIN_OP_AND_uxn_device_h_l197_c8_afa1_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_cond,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54
result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_cond,
result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iftrue,
result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iffalse,
result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_return_output);

-- result_u8_value_MUX_uxn_device_h_l197_c4_2a54
result_u8_value_MUX_uxn_device_h_l197_c4_2a54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l197_c4_2a54_cond,
result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iftrue,
result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iffalse,
result_u8_value_MUX_uxn_device_h_l197_c4_2a54_return_output);

-- ram_addr_MUX_uxn_device_h_l203_c8_3091
ram_addr_MUX_uxn_device_h_l203_c8_3091 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l203_c8_3091_cond,
ram_addr_MUX_uxn_device_h_l203_c8_3091_iftrue,
ram_addr_MUX_uxn_device_h_l203_c8_3091_iffalse,
ram_addr_MUX_uxn_device_h_l203_c8_3091_return_output);

-- BIN_OP_EQ_uxn_device_h_l208_c11_8755
BIN_OP_EQ_uxn_device_h_l208_c11_8755 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l208_c11_8755_left,
BIN_OP_EQ_uxn_device_h_l208_c11_8755_right,
BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_return_output);

-- result_MUX_uxn_device_h_l208_c7_39c6
result_MUX_uxn_device_h_l208_c7_39c6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l208_c7_39c6_cond,
result_MUX_uxn_device_h_l208_c7_39c6_iftrue,
result_MUX_uxn_device_h_l208_c7_39c6_iffalse,
result_MUX_uxn_device_h_l208_c7_39c6_return_output);

-- ram_addr_MUX_uxn_device_h_l208_c7_39c6
ram_addr_MUX_uxn_device_h_l208_c7_39c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l208_c7_39c6_cond,
ram_addr_MUX_uxn_device_h_l208_c7_39c6_iftrue,
ram_addr_MUX_uxn_device_h_l208_c7_39c6_iffalse,
ram_addr_MUX_uxn_device_h_l208_c7_39c6_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_cond,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l209_c3_d064
result_device_ram_address_MUX_uxn_device_h_l209_c3_d064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_cond,
result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iftrue,
result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iffalse,
result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_return_output);

-- result_u8_value_MUX_uxn_device_h_l209_c3_d064
result_u8_value_MUX_uxn_device_h_l209_c3_d064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l209_c3_d064_cond,
result_u8_value_MUX_uxn_device_h_l209_c3_d064_iftrue,
result_u8_value_MUX_uxn_device_h_l209_c3_d064_iffalse,
result_u8_value_MUX_uxn_device_h_l209_c3_d064_return_output);

-- ram_addr_MUX_uxn_device_h_l209_c3_d064
ram_addr_MUX_uxn_device_h_l209_c3_d064 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l209_c3_d064_cond,
ram_addr_MUX_uxn_device_h_l209_c3_d064_iftrue,
ram_addr_MUX_uxn_device_h_l209_c3_d064_iffalse,
ram_addr_MUX_uxn_device_h_l209_c3_d064_return_output);

-- BIN_OP_AND_uxn_device_h_l210_c9_46f8
BIN_OP_AND_uxn_device_h_l210_c9_46f8 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l210_c9_46f8_left,
BIN_OP_AND_uxn_device_h_l210_c9_46f8_right,
BIN_OP_AND_uxn_device_h_l210_c9_46f8_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f
result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_cond,
result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_return_output);

-- result_u8_value_MUX_uxn_device_h_l210_c4_1c8f
result_u8_value_MUX_uxn_device_h_l210_c4_1c8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_cond,
result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iftrue,
result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iffalse,
result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_return_output);

-- CONST_SR_8_uxn_device_h_l213_c33_6549
CONST_SR_8_uxn_device_h_l213_c33_6549 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l213_c33_6549_x,
CONST_SR_8_uxn_device_h_l213_c33_6549_return_output);

-- ram_addr_MUX_uxn_device_h_l216_c8_36a7
ram_addr_MUX_uxn_device_h_l216_c8_36a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l216_c8_36a7_cond,
ram_addr_MUX_uxn_device_h_l216_c8_36a7_iftrue,
ram_addr_MUX_uxn_device_h_l216_c8_36a7_iffalse,
ram_addr_MUX_uxn_device_h_l216_c8_36a7_return_output);

-- BIN_OP_OR_uxn_device_h_l217_c4_deef
BIN_OP_OR_uxn_device_h_l217_c4_deef : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l217_c4_deef_left,
BIN_OP_OR_uxn_device_h_l217_c4_deef_right,
BIN_OP_OR_uxn_device_h_l217_c4_deef_return_output);

-- BIN_OP_EQ_uxn_device_h_l220_c11_561f
BIN_OP_EQ_uxn_device_h_l220_c11_561f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l220_c11_561f_left,
BIN_OP_EQ_uxn_device_h_l220_c11_561f_right,
BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_return_output);

-- result_MUX_uxn_device_h_l220_c7_7c80
result_MUX_uxn_device_h_l220_c7_7c80 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l220_c7_7c80_cond,
result_MUX_uxn_device_h_l220_c7_7c80_iftrue,
result_MUX_uxn_device_h_l220_c7_7c80_iffalse,
result_MUX_uxn_device_h_l220_c7_7c80_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a
result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_cond,
result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_return_output);

-- result_u8_value_MUX_uxn_device_h_l221_c3_8a3a
result_u8_value_MUX_uxn_device_h_l221_c3_8a3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_cond,
result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iftrue,
result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iffalse,
result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_return_output);

-- BIN_OP_AND_uxn_device_h_l222_c9_b12f
BIN_OP_AND_uxn_device_h_l222_c9_b12f : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l222_c9_b12f_left,
BIN_OP_AND_uxn_device_h_l222_c9_b12f_right,
BIN_OP_AND_uxn_device_h_l222_c9_b12f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e
result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_cond,
result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_return_output);

-- result_u8_value_MUX_uxn_device_h_l222_c4_9e7e
result_u8_value_MUX_uxn_device_h_l222_c4_9e7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_cond,
result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iftrue,
result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iffalse,
result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_return_output);

-- result_MUX_uxn_device_h_l230_c3_6d34
result_MUX_uxn_device_h_l230_c3_6d34 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l230_c3_6d34_cond,
result_MUX_uxn_device_h_l230_c3_6d34_iftrue,
result_MUX_uxn_device_h_l230_c3_6d34_iffalse,
result_MUX_uxn_device_h_l230_c3_6d34_return_output);

-- BIN_OP_MINUS_uxn_device_h_l231_c58_5618
BIN_OP_MINUS_uxn_device_h_l231_c58_5618 : entity work.BIN_OP_MINUS_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l231_c58_5618_left,
BIN_OP_MINUS_uxn_device_h_l231_c58_5618_right,
BIN_OP_MINUS_uxn_device_h_l231_c58_5618_return_output);

-- screen_blit_uxn_device_h_l231_c46_4d61
screen_blit_uxn_device_h_l231_c46_4d61 : entity work.screen_blit_0CLK_b1675d32 port map (
clk,
screen_blit_uxn_device_h_l231_c46_4d61_CLOCK_ENABLE,
screen_blit_uxn_device_h_l231_c46_4d61_phase,
screen_blit_uxn_device_h_l231_c46_4d61_ctrl,
screen_blit_uxn_device_h_l231_c46_4d61_auto_advance,
screen_blit_uxn_device_h_l231_c46_4d61_x,
screen_blit_uxn_device_h_l231_c46_4d61_y,
screen_blit_uxn_device_h_l231_c46_4d61_ram_addr,
screen_blit_uxn_device_h_l231_c46_4d61_previous_ram_read,
screen_blit_uxn_device_h_l231_c46_4d61_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_x,
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90
CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_x,
CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output);



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
 BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 auto_advance_MUX_uxn_device_h_l95_c2_a178_return_output,
 flip_x_MUX_uxn_device_h_l95_c2_a178_return_output,
 result_MUX_uxn_device_h_l95_c2_a178_return_output,
 is_pixel_port_MUX_uxn_device_h_l95_c2_a178_return_output,
 flip_y_MUX_uxn_device_h_l95_c2_a178_return_output,
 is_drawing_port_MUX_uxn_device_h_l95_c2_a178_return_output,
 ctrl_MUX_uxn_device_h_l95_c2_a178_return_output,
 ram_addr_MUX_uxn_device_h_l95_c2_a178_return_output,
 vram_addr_MUX_uxn_device_h_l95_c2_a178_return_output,
 y_MUX_uxn_device_h_l95_c2_a178_return_output,
 ctrl_mode_MUX_uxn_device_h_l95_c2_a178_return_output,
 layer_MUX_uxn_device_h_l95_c2_a178_return_output,
 color_MUX_uxn_device_h_l95_c2_a178_return_output,
 x_MUX_uxn_device_h_l95_c2_a178_return_output,
 is_sprite_port_MUX_uxn_device_h_l95_c2_a178_return_output,
 BIN_OP_EQ_uxn_device_h_l96_c19_4e57_return_output,
 MUX_uxn_device_h_l96_c19_d523_return_output,
 BIN_OP_EQ_uxn_device_h_l97_c20_c543_return_output,
 MUX_uxn_device_h_l97_c20_90f9_return_output,
 BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_return_output,
 MUX_uxn_device_h_l103_c32_2d31_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_return_output,
 auto_advance_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 flip_x_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 result_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 flip_y_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 ctrl_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 ram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 vram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 y_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 layer_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 color_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 x_MUX_uxn_device_h_l109_c7_c4d5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_3684_return_output,
 flip_x_MUX_uxn_device_h_l114_c7_3684_return_output,
 result_MUX_uxn_device_h_l114_c7_3684_return_output,
 flip_y_MUX_uxn_device_h_l114_c7_3684_return_output,
 ctrl_MUX_uxn_device_h_l114_c7_3684_return_output,
 ram_addr_MUX_uxn_device_h_l114_c7_3684_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_3684_return_output,
 y_MUX_uxn_device_h_l114_c7_3684_return_output,
 ctrl_mode_MUX_uxn_device_h_l114_c7_3684_return_output,
 layer_MUX_uxn_device_h_l114_c7_3684_return_output,
 color_MUX_uxn_device_h_l114_c7_3684_return_output,
 x_MUX_uxn_device_h_l114_c7_3684_return_output,
 flip_x_MUX_uxn_device_h_l115_c3_1dda_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_return_output,
 flip_y_MUX_uxn_device_h_l115_c3_1dda_return_output,
 ctrl_MUX_uxn_device_h_l115_c3_1dda_return_output,
 ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_return_output,
 layer_MUX_uxn_device_h_l115_c3_1dda_return_output,
 color_MUX_uxn_device_h_l115_c3_1dda_return_output,
 CONST_SR_7_uxn_device_h_l118_c26_70b3_return_output,
 CONST_SR_6_uxn_device_h_l119_c22_41f0_return_output,
 CONST_SR_5_uxn_device_h_l120_c23_e03f_return_output,
 CONST_SR_4_uxn_device_h_l121_c23_9152_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_bd57_return_output,
 result_MUX_uxn_device_h_l125_c7_bd57_return_output,
 ram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output,
 vram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output,
 y_MUX_uxn_device_h_l125_c7_bd57_return_output,
 x_MUX_uxn_device_h_l125_c7_bd57_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_return_output,
 x_MUX_uxn_device_h_l126_c3_ce74_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_return_output,
 auto_advance_MUX_uxn_device_h_l132_c7_165e_return_output,
 result_MUX_uxn_device_h_l132_c7_165e_return_output,
 ram_addr_MUX_uxn_device_h_l132_c7_165e_return_output,
 vram_addr_MUX_uxn_device_h_l132_c7_165e_return_output,
 y_MUX_uxn_device_h_l132_c7_165e_return_output,
 x_MUX_uxn_device_h_l132_c7_165e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_return_output,
 x_MUX_uxn_device_h_l133_c3_26ac_return_output,
 BIN_OP_OR_uxn_device_h_l134_c4_7412_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_return_output,
 auto_advance_MUX_uxn_device_h_l138_c7_f10a_return_output,
 result_MUX_uxn_device_h_l138_c7_f10a_return_output,
 ram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output,
 vram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output,
 y_MUX_uxn_device_h_l138_c7_f10a_return_output,
 x_MUX_uxn_device_h_l138_c7_f10a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_return_output,
 y_MUX_uxn_device_h_l139_c3_b104_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_e716_return_output,
 result_MUX_uxn_device_h_l145_c7_e716_return_output,
 ram_addr_MUX_uxn_device_h_l145_c7_e716_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_e716_return_output,
 y_MUX_uxn_device_h_l145_c7_e716_return_output,
 x_MUX_uxn_device_h_l145_c7_e716_return_output,
 y_MUX_uxn_device_h_l146_c3_3b93_return_output,
 BIN_OP_OR_uxn_device_h_l147_c4_e0d5_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_return_output,
 auto_advance_MUX_uxn_device_h_l150_c7_8efb_return_output,
 result_MUX_uxn_device_h_l150_c7_8efb_return_output,
 ram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output,
 vram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output,
 x_MUX_uxn_device_h_l150_c7_8efb_return_output,
 auto_advance_MUX_uxn_device_h_l151_c3_17b5_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c3_17b5_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_return_output,
 result_u8_value_MUX_uxn_device_h_l151_c3_17b5_return_output,
 vram_addr_MUX_uxn_device_h_l151_c3_17b5_return_output,
 BIN_OP_AND_uxn_device_h_l154_c32_1f10_return_output,
 result_vram_address_MUX_uxn_device_h_l156_c4_1b99_return_output,
 result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_return_output,
 vram_addr_MUX_uxn_device_h_l156_c4_1b99_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_return_output,
 BIN_OP_AND_uxn_device_h_l158_c5_093b_return_output,
 MUX_uxn_device_h_l159_c19_54bc_return_output,
 BIN_OP_OR_uxn_device_h_l159_c5_77dd_return_output,
 MUX_uxn_device_h_l160_c19_e13f_return_output,
 BIN_OP_OR_uxn_device_h_l160_c5_0c72_return_output,
 BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_return_output,
 BIN_OP_PLUS_uxn_device_h_l165_c28_f171_return_output,
 auto_advance_MUX_uxn_device_h_l169_c8_31f8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_return_output,
 result_MUX_uxn_device_h_l174_c7_edab_return_output,
 ram_addr_MUX_uxn_device_h_l174_c7_edab_return_output,
 x_MUX_uxn_device_h_l174_c7_edab_return_output,
 result_vram_address_MUX_uxn_device_h_l175_c3_25f5_return_output,
 result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_return_output,
 result_u8_value_MUX_uxn_device_h_l175_c3_25f5_return_output,
 x_MUX_uxn_device_h_l175_c3_25f5_return_output,
 UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_return_output,
 result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c4_5a14_return_output,
 x_MUX_uxn_device_h_l180_c4_5a14_return_output,
 BIN_OP_AND_uxn_device_h_l181_c9_5097_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_return_output,
 x_MUX_uxn_device_h_l181_c5_e3d6_return_output,
 BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_return_output,
 CONST_SR_8_uxn_device_h_l185_c34_94c2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_return_output,
 result_MUX_uxn_device_h_l195_c7_4ccf_return_output,
 ram_addr_MUX_uxn_device_h_l195_c7_4ccf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_return_output,
 result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_return_output,
 ram_addr_MUX_uxn_device_h_l196_c3_2dd9_return_output,
 BIN_OP_AND_uxn_device_h_l197_c8_afa1_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_return_output,
 result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_return_output,
 result_u8_value_MUX_uxn_device_h_l197_c4_2a54_return_output,
 ram_addr_MUX_uxn_device_h_l203_c8_3091_return_output,
 BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_return_output,
 result_MUX_uxn_device_h_l208_c7_39c6_return_output,
 ram_addr_MUX_uxn_device_h_l208_c7_39c6_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_return_output,
 result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_return_output,
 result_u8_value_MUX_uxn_device_h_l209_c3_d064_return_output,
 ram_addr_MUX_uxn_device_h_l209_c3_d064_return_output,
 BIN_OP_AND_uxn_device_h_l210_c9_46f8_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_return_output,
 result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_return_output,
 CONST_SR_8_uxn_device_h_l213_c33_6549_return_output,
 ram_addr_MUX_uxn_device_h_l216_c8_36a7_return_output,
 BIN_OP_OR_uxn_device_h_l217_c4_deef_return_output,
 BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_return_output,
 result_MUX_uxn_device_h_l220_c7_7c80_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_return_output,
 result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_return_output,
 BIN_OP_AND_uxn_device_h_l222_c9_b12f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_return_output,
 result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_return_output,
 result_MUX_uxn_device_h_l230_c3_6d34_return_output,
 BIN_OP_MINUS_uxn_device_h_l231_c58_5618_return_output,
 screen_blit_uxn_device_h_l231_c46_4d61_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c2_a178_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_a178_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_a178_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_c4d5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_a178_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l101_c3_428a : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_c4d5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_d523_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_d523_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_d523_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_d523_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_90f9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_90f9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_90f9_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_90f9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_2d31_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_2d31_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_2d31_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_2d31_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l109_c7_c4d5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_c4d5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_c4d5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_3684_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_3684_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_c4d5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_6d4d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l114_c7_3684_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_3684_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_3684_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_bd57_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_3684_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_3684_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_bd57_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_3684_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l122_c4_3b29 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_1dda_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_1dda_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_1dda_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_cb43_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_70b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_70b3_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_bdea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_41f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_41f0_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_165d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_e03f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_e03f_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_d4e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_9152_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_9152_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_e0ac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l125_c7_bd57_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_bd57_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_bd57_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_165e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_bd57_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_ce74_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_bd57_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_165e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_bd57_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_85da : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_ce74_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_ce74_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_ce74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l132_c7_165e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_165e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_165e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_f10a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_165e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_26ac_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_165e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_f10a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_165e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l135_c4_8edd : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_26ac_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_26ac_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_26ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l138_c7_f10a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_f10a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_f10a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_e716_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_b104_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_f10a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_f10a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_e716_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_f10a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l142_c4_a464 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_b104_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_b104_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_b104_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l145_c7_e716_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_e716_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_8efb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_3b93_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_e716_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_e716_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_8efb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_e716_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_3b93_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_3b93_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_3b93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l150_c7_8efb_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2f92_uxn_device_h_l150_c7_8efb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_8efb_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_edab_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_8efb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_8efb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_edab_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_8efb_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_17b5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l153_c4_7370 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_755e_return_output : unsigned(7 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l165_c5_2344 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l157_c5_1978 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_54bc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_54bc_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_54bc_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_54bc_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_e13f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_e13f_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_e13f_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_e13f_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_return_output : unsigned(64 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l171_c4_debb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c7_edab_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_855d_uxn_device_h_l174_c7_edab_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_edab_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_4ccf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_edab_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_edab_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_edab_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l178_c4_cddc : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_25f5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_5a14_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_25f5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_25f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l179_c4_7c9f : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_5a14_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_e3d6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_5a14_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_5a14_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l181_c5_e3d6_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l184_c6_4097 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_e3d6_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l182_c6_5b7c : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_e3d6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_e3d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_94c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_94c2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_7562_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l192_c4_09b3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l195_c7_4ccf_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_4ccf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_4ccf_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_39c6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_4ccf_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l197_c4_2a54_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l199_c5_c960 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_4bf4_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l208_c7_39c6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_39c6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_39c6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_7c80_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_39c6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c4_1c8f_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l212_c5_6329 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_6549_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_6549_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_26b9_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l220_c7_7c80_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_7c80_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_7c80_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_6d34_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_7c80_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c4_9e7e_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l224_c5_0e56 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_a968_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l230_c3_6d34_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_6d34_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_6d34_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_6d34_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_6d34_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l233_c4_702d : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_cf22_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_6fb8_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_6a4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_50bb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_0a94_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_b0d2_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l242_c4_4cb8 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l217_l134_l147_l140_l127_l204_DUPLICATE_ddfb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l165_l157_DUPLICATE_75ff_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_d42a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_6c27_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_4046_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_ddc4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_right := to_unsigned(400, 32);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_6d4d := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_6d4d;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_right := to_unsigned(2, 2);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_right := to_unsigned(400, 32);
     VAR_result_device_ram_address_uxn_device_h_l199_c5_c960 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iftrue := VAR_result_device_ram_address_uxn_device_h_l199_c5_c960;
     VAR_MUX_uxn_device_h_l159_c19_54bc_iftrue := to_unsigned(1048576, 21);
     VAR_MUX_uxn_device_h_l159_c19_54bc_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l97_c20_90f9_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l192_c4_09b3 := resize(to_unsigned(45, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iftrue := VAR_result_device_ram_address_uxn_device_h_l192_c4_09b3;
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_right := to_unsigned(3, 2);
     VAR_result_device_ram_address_uxn_device_h_l122_c4_3b29 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iftrue := VAR_result_device_ram_address_uxn_device_h_l122_c4_3b29;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_right := to_unsigned(11, 4);
     VAR_result_device_ram_address_uxn_device_h_l233_c4_702d := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l184_c6_4097 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iftrue := VAR_result_device_ram_address_uxn_device_h_l184_c6_4097;
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_right := to_unsigned(1, 1);
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_right := unsigned'(X"f0000000");
     VAR_MUX_uxn_device_h_l160_c19_e13f_iftrue := to_unsigned(2097152, 22);
     VAR_result_device_ram_address_uxn_device_h_l153_c4_7370 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue := VAR_result_device_ram_address_uxn_device_h_l153_c4_7370;
     VAR_MUX_uxn_device_h_l97_c20_90f9_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l96_c19_d523_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_right := to_unsigned(9, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_85da := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_85da;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_right := to_unsigned(4, 3);
     VAR_result_device_ram_address_uxn_device_h_l224_c5_0e56 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iftrue := VAR_result_device_ram_address_uxn_device_h_l224_c5_0e56;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_right := to_unsigned(15, 4);
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l160_c19_e13f_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l96_c19_d523_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l135_c4_8edd := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iftrue := VAR_result_device_ram_address_uxn_device_h_l135_c4_8edd;
     VAR_result_u8_value_uxn_device_h_l179_c4_7c9f := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_7c9f;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_7c9f;
     VAR_result_device_ram_address_uxn_device_h_l142_c4_a464 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iftrue := VAR_result_device_ram_address_uxn_device_h_l142_c4_a464;
     VAR_MUX_uxn_device_h_l103_c32_2d31_iftrue := resize(to_unsigned(46, 6), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_right := to_unsigned(5, 3);
     VAR_result_vram_address_uxn_device_h_l178_c4_cddc := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue := VAR_result_vram_address_uxn_device_h_l178_c4_cddc;
     VAR_result_device_ram_address_uxn_device_h_l171_c4_debb := resize(to_unsigned(44, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iftrue := VAR_result_device_ram_address_uxn_device_h_l171_c4_debb;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_right := to_unsigned(8, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_right := to_unsigned(262143, 18);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iffalse := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iftrue := to_unsigned(0, 1);
     VAR_vram_addr_uxn_device_h_l101_c3_428a := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue := VAR_vram_addr_uxn_device_h_l101_c3_428a;
     VAR_result_device_ram_address_uxn_device_h_l212_c5_6329 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iftrue := VAR_result_device_ram_address_uxn_device_h_l212_c5_6329;
     VAR_result_device_ram_address_uxn_device_h_l242_c4_4cb8 := resize(to_unsigned(0, 1), 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l103_c32_2d31_iffalse := resize(to_unsigned(47, 6), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_left := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_left := color;
     VAR_color_MUX_uxn_device_h_l109_c7_c4d5_iftrue := color;
     VAR_color_MUX_uxn_device_h_l114_c7_3684_iffalse := color;
     VAR_color_MUX_uxn_device_h_l115_c3_1dda_iffalse := color;
     VAR_color_MUX_uxn_device_h_l95_c2_a178_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_ctrl := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iftrue := ctrl_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_cond := ctrl_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_cond := ctrl_mode;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l160_c19_e13f_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l159_c19_54bc_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_iftrue := flip_y;
     VAR_color_MUX_uxn_device_h_l115_c3_1dda_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l115_c3_1dda_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l126_c3_ce74_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l133_c3_26ac_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l139_c3_b104_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l146_c3_3b93_cond := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_cond := is_pixel_port;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l175_c3_25f5_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_cond := is_sprite_port;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_cond := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l230_c3_6d34_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l114_c7_3684_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l115_c3_1dda_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l95_c2_a178_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l121_c23_9152_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l120_c23_e03f_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l119_c22_41f0_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l118_c26_70b3_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l145_c7_e716_iftrue := result;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_iffalse := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_left := x;
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_x := x;
     VAR_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue := x;
     VAR_x_MUX_uxn_device_h_l114_c7_3684_iftrue := x;
     VAR_x_MUX_uxn_device_h_l126_c3_ce74_iffalse := x;
     VAR_x_MUX_uxn_device_h_l133_c3_26ac_iffalse := x;
     VAR_x_MUX_uxn_device_h_l138_c7_f10a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l145_c7_e716_iftrue := x;
     VAR_x_MUX_uxn_device_h_l150_c7_8efb_iftrue := x;
     VAR_x_MUX_uxn_device_h_l174_c7_edab_iffalse := x;
     VAR_x_MUX_uxn_device_h_l175_c3_25f5_iffalse := x;
     VAR_x_MUX_uxn_device_h_l180_c4_5a14_iffalse := x;
     VAR_x_MUX_uxn_device_h_l181_c5_e3d6_iffalse := x;
     VAR_x_MUX_uxn_device_h_l95_c2_a178_iftrue := x;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_left := y;
     VAR_CONST_SR_8_uxn_device_h_l213_c33_6549_x := y;
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_y := y;
     VAR_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_3684_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_bd57_iftrue := y;
     VAR_y_MUX_uxn_device_h_l132_c7_165e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l139_c3_b104_iffalse := y;
     VAR_y_MUX_uxn_device_h_l145_c7_e716_iffalse := y;
     VAR_y_MUX_uxn_device_h_l146_c3_3b93_iffalse := y;
     VAR_y_MUX_uxn_device_h_l95_c2_a178_iftrue := y;
     -- CONST_SR_8[uxn_device_h_l213_c33_6549] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l213_c33_6549_x <= VAR_CONST_SR_8_uxn_device_h_l213_c33_6549_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l213_c33_6549_return_output := CONST_SR_8_uxn_device_h_l213_c33_6549_return_output;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l151_c3_17b5] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_17b5_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l96_c19_4e57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l96_c19_4e57_left <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_left;
     BIN_OP_EQ_uxn_device_h_l96_c19_4e57_right <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_return_output := BIN_OP_EQ_uxn_device_h_l96_c19_4e57_return_output;

     -- BIN_OP_EQ[uxn_device_h_l150_c11_225a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c11_225a_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_left;
     BIN_OP_EQ_uxn_device_h_l150_c11_225a_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output := BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output;

     -- auto_advance_MUX[uxn_device_h_l169_c8_31f8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c8_31f8_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_cond;
     auto_advance_MUX_uxn_device_h_l169_c8_31f8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c8_31f8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_return_output := auto_advance_MUX_uxn_device_h_l169_c8_31f8_return_output;

     -- CONST_SR_6[uxn_device_h_l119_c22_41f0] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l119_c22_41f0_x <= VAR_CONST_SR_6_uxn_device_h_l119_c22_41f0_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l119_c22_41f0_return_output := CONST_SR_6_uxn_device_h_l119_c22_41f0_return_output;

     -- ctrl_MUX[uxn_device_h_l115_c3_1dda] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l115_c3_1dda_cond <= VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_cond;
     ctrl_MUX_uxn_device_h_l115_c3_1dda_iftrue <= VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_iftrue;
     ctrl_MUX_uxn_device_h_l115_c3_1dda_iffalse <= VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_return_output := ctrl_MUX_uxn_device_h_l115_c3_1dda_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_d42a LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_d42a_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- CAST_TO_uint8_t[uxn_device_h_l225_c23_a968] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_a968_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output := result.device_ram_address;

     -- CONST_SR_7[uxn_device_h_l118_c26_70b3] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l118_c26_70b3_x <= VAR_CONST_SR_7_uxn_device_h_l118_c26_70b3_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l118_c26_70b3_return_output := CONST_SR_7_uxn_device_h_l118_c26_70b3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l95_c6_52f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c6_52f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_left;
     BIN_OP_EQ_uxn_device_h_l95_c6_52f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output := BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l165_l157_DUPLICATE_75ff LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l165_l157_DUPLICATE_75ff_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_6c27 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_6c27_return_output := result.vram_address;

     -- result_is_vram_write_MUX[uxn_device_h_l156_c4_1b99] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_cond;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_return_output := result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_return_output;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_40e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_40e2_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_40e2_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c11_df0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c11_df0d_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_left;
     BIN_OP_EQ_uxn_device_h_l138_c11_df0d_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output := BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_ddc4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_ddc4_return_output := result.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output := result.is_device_ram_write;

     -- UNARY_OP_NOT[uxn_device_h_l180_c9_fd6d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output := UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l195_c11_a0fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_left;
     BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output := BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c11_43c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_43c9_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_43c9_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l220_c11_561f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l220_c11_561f_left <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_left;
     BIN_OP_EQ_uxn_device_h_l220_c11_561f_right <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output := BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l217_l134_l147_l140_l127_l204_DUPLICATE_ddfb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l217_l134_l147_l140_l127_l204_DUPLICATE_ddfb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CAST_TO_uint8_t[uxn_device_h_l200_c23_4bf4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_4bf4_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_AND[uxn_device_h_l154_c32_1f10] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l154_c32_1f10_left <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_left;
     BIN_OP_AND_uxn_device_h_l154_c32_1f10_right <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_return_output := BIN_OP_AND_uxn_device_h_l154_c32_1f10_return_output;

     -- CONST_SR_4[uxn_device_h_l121_c23_9152] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l121_c23_9152_x <= VAR_CONST_SR_4_uxn_device_h_l121_c23_9152_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l121_c23_9152_return_output := CONST_SR_4_uxn_device_h_l121_c23_9152_return_output;

     -- BIN_OP_AND[uxn_device_h_l197_c8_afa1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l197_c8_afa1_left <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_left;
     BIN_OP_AND_uxn_device_h_l197_c8_afa1_right <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_return_output := BIN_OP_AND_uxn_device_h_l197_c8_afa1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c11_3dbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_left;
     BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output := BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;

     -- BIN_OP_EQ[uxn_device_h_l132_c11_710f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c11_710f_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_left;
     BIN_OP_EQ_uxn_device_h_l132_c11_710f_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output := BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;

     -- CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90 LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output := CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l230_c3_6d34] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_6d34_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l242_c4_4cb8,
     to_unsigned(1, 1));

     -- MUX[uxn_device_h_l160_c19_e13f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l160_c19_e13f_cond <= VAR_MUX_uxn_device_h_l160_c19_e13f_cond;
     MUX_uxn_device_h_l160_c19_e13f_iftrue <= VAR_MUX_uxn_device_h_l160_c19_e13f_iftrue;
     MUX_uxn_device_h_l160_c19_e13f_iffalse <= VAR_MUX_uxn_device_h_l160_c19_e13f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l160_c19_e13f_return_output := MUX_uxn_device_h_l160_c19_e13f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l208_c11_8755] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l208_c11_8755_left <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_left;
     BIN_OP_EQ_uxn_device_h_l208_c11_8755_right <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output := BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c11_dcbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_left;
     BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output := BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output;

     -- BIN_OP_AND[uxn_device_h_l181_c9_5097] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c9_5097_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_left;
     BIN_OP_AND_uxn_device_h_l181_c9_5097_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_return_output := BIN_OP_AND_uxn_device_h_l181_c9_5097_return_output;

     -- MUX[uxn_device_h_l159_c19_54bc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l159_c19_54bc_cond <= VAR_MUX_uxn_device_h_l159_c19_54bc_cond;
     MUX_uxn_device_h_l159_c19_54bc_iftrue <= VAR_MUX_uxn_device_h_l159_c19_54bc_iftrue;
     MUX_uxn_device_h_l159_c19_54bc_iffalse <= VAR_MUX_uxn_device_h_l159_c19_54bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l159_c19_54bc_return_output := MUX_uxn_device_h_l159_c19_54bc_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l182_c6_6b80] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_left <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_left;
     BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_right <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_return_output := BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l117_c12_cb43] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_cb43_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_MINUS[uxn_device_h_l231_c58_5618] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l231_c58_5618_left <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_left;
     BIN_OP_MINUS_uxn_device_h_l231_c58_5618_right <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_return_output := BIN_OP_MINUS_uxn_device_h_l231_c58_5618_return_output;

     -- BIN_OP_EQ[uxn_device_h_l97_c20_c543] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l97_c20_c543_left <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_left;
     BIN_OP_EQ_uxn_device_h_l97_c20_c543_right <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_return_output := BIN_OP_EQ_uxn_device_h_l97_c20_c543_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_eced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_eced_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_eced_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_4046 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_4046_return_output := result.is_vram_write;

     -- CONST_SR_5[uxn_device_h_l120_c23_e03f] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l120_c23_e03f_x <= VAR_CONST_SR_5_uxn_device_h_l120_c23_e03f_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l120_c23_e03f_return_output := CONST_SR_5_uxn_device_h_l120_c23_e03f_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l181_c5_e3d6_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l181_c9_5097_return_output, 1);
     VAR_MUX_uxn_device_h_l197_c4_2a54_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l197_c8_afa1_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_3dbe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_3684_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_eced_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_bd57_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_bd57_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_bd57_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_43c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_165e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_165e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_165e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_710f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_f10a_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_f10a_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_f10a_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_df0d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;
     VAR_result_MUX_uxn_device_h_l145_c7_e716_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_e716_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_e716_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_40e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_8efb_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_8efb_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_225a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_edab_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_edab_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_dcbc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_4ccf_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_a0fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_39c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_8755_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_7c80_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_561f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_a178_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_52f4_return_output;
     VAR_MUX_uxn_device_h_l96_c19_d523_cond := VAR_BIN_OP_EQ_uxn_device_h_l96_c19_4e57_return_output;
     VAR_MUX_uxn_device_h_l97_c20_90f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l97_c20_c543_return_output;
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_phase := VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_5618_return_output;
     VAR_x_uxn_device_h_l182_c6_5b7c := resize(VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_6b80_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l217_l134_l147_l140_l127_l204_DUPLICATE_ddfb_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l217_l134_l147_l140_l127_l204_DUPLICATE_ddfb_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l217_l134_l147_l140_l127_l204_DUPLICATE_ddfb_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l217_l134_l147_l140_l127_l204_DUPLICATE_ddfb_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_d42a_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_d42a_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l165_l157_DUPLICATE_75ff_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l165_l157_DUPLICATE_75ff_return_output;
     VAR_color_MUX_uxn_device_h_l115_c3_1dda_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_cb43_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_4bf4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_a968_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_ddc4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_ddc4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l197_l180_l196_l209_l210_l222_l181_l221_l175_DUPLICATE_4234_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_4046_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_4046_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_6c27_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_6c27_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l197_l180_l139_l126_l169_l196_l221_l209_l210_l110_l133_l115_l181_l222_l191_l102_DUPLICATE_4d0f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l197_l196_l151_l209_l210_l222_l221_l175_DUPLICATE_617a_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_4c90_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_right := VAR_MUX_uxn_device_h_l159_c19_54bc_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_right := VAR_MUX_uxn_device_h_l160_c19_e13f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_5a14_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fd6d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c8_31f8_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_iftrue := VAR_ctrl_MUX_uxn_device_h_l115_c3_1dda_return_output;
     VAR_result_MUX_uxn_device_h_l230_c3_6d34_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_6d34_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_1b99_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_17b5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_cond := VAR_MUX_uxn_device_h_l181_c5_e3d6_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_cond := VAR_MUX_uxn_device_h_l181_c5_e3d6_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_cond := VAR_MUX_uxn_device_h_l181_c5_e3d6_interm_cond;
     VAR_x_MUX_uxn_device_h_l181_c5_e3d6_cond := VAR_MUX_uxn_device_h_l181_c5_e3d6_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_cond := VAR_MUX_uxn_device_h_l197_c4_2a54_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_cond := VAR_MUX_uxn_device_h_l197_c4_2a54_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_cond := VAR_MUX_uxn_device_h_l197_c4_2a54_interm_cond;
     VAR_CONST_SR_8_uxn_device_h_l185_c34_94c2_x := VAR_x_uxn_device_h_l182_c6_5b7c;
     VAR_x_MUX_uxn_device_h_l181_c5_e3d6_iftrue := VAR_x_uxn_device_h_l182_c6_5b7c;
     -- result_device_ram_address_MUX[uxn_device_h_l139_c3_b104] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_cond;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_return_output := result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_return_output;

     -- BIN_OP_OR[uxn_device_h_l217_c4_deef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l217_c4_deef_left <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_left;
     BIN_OP_OR_uxn_device_h_l217_c4_deef_right <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_return_output := BIN_OP_OR_uxn_device_h_l217_c4_deef_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l181_c5_e3d6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l154_c22_755e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_755e_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_1f10_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l120_c13_d4e0] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_d4e0_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l120_c23_e03f_return_output);

     -- ctrl_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_cond;
     ctrl_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_iftrue;
     ctrl_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_return_output := ctrl_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l213_c23_26b9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_26b9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l213_c33_6549_return_output);

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_0150] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l119_c12_165d] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_165d_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l119_c22_41f0_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l197_c4_2a54] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_cond;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_return_output := result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_return_output;

     -- BIN_OP_AND[uxn_device_h_l210_c9_46f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l210_c9_46f8_left <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_left;
     BIN_OP_AND_uxn_device_h_l210_c9_46f8_right <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_return_output := BIN_OP_AND_uxn_device_h_l210_c9_46f8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l110_c3_3941] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_cond;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_return_output := result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l121_c13_e0ac] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_e0ac_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l121_c23_9152_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l191_c8_bd52] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_cond;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_return_output := result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_2a54] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_return_output := result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_return_output;

     -- result_u8_value_MUX[uxn_device_h_l197_c4_2a54] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l197_c4_2a54_cond <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_cond;
     result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iftrue;
     result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_return_output := result_u8_value_MUX_uxn_device_h_l197_c4_2a54_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l118_c16_bdea] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_bdea_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l118_c26_70b3_return_output);

     -- BIN_OP_OR[uxn_device_h_l147_c4_e0d5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l147_c4_e0d5_left <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_left;
     BIN_OP_OR_uxn_device_h_l147_c4_e0d5_right <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_return_output := BIN_OP_OR_uxn_device_h_l147_c4_e0d5_return_output;

     -- MUX[uxn_device_h_l96_c19_d523] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c19_d523_cond <= VAR_MUX_uxn_device_h_l96_c19_d523_cond;
     MUX_uxn_device_h_l96_c19_d523_iftrue <= VAR_MUX_uxn_device_h_l96_c19_d523_iftrue;
     MUX_uxn_device_h_l96_c19_d523_iffalse <= VAR_MUX_uxn_device_h_l96_c19_d523_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c19_d523_return_output := MUX_uxn_device_h_l96_c19_d523_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_1dda] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_ae10] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l180_c4_5a14] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_cond;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_return_output := result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l151_c3_17b5] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_cond;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_return_output := result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c3_17b5] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c3_17b5_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_cond;
     auto_advance_MUX_uxn_device_h_l151_c3_17b5_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c3_17b5_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_return_output := auto_advance_MUX_uxn_device_h_l151_c3_17b5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l169_c8_31f8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_return_output;

     -- x_MUX[uxn_device_h_l181_c5_e3d6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c5_e3d6_cond <= VAR_x_MUX_uxn_device_h_l181_c5_e3d6_cond;
     x_MUX_uxn_device_h_l181_c5_e3d6_iftrue <= VAR_x_MUX_uxn_device_h_l181_c5_e3d6_iftrue;
     x_MUX_uxn_device_h_l181_c5_e3d6_iffalse <= VAR_x_MUX_uxn_device_h_l181_c5_e3d6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c5_e3d6_return_output := x_MUX_uxn_device_h_l181_c5_e3d6_return_output;

     -- BIN_OP_OR[uxn_device_h_l134_c4_7412] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l134_c4_7412_left <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_left;
     BIN_OP_OR_uxn_device_h_l134_c4_7412_right <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_return_output := BIN_OP_OR_uxn_device_h_l134_c4_7412_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output := CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output;

     -- BIN_OP_AND[uxn_device_h_l222_c9_b12f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l222_c9_b12f_left <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_left;
     BIN_OP_AND_uxn_device_h_l222_c9_b12f_right <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_return_output := BIN_OP_AND_uxn_device_h_l222_c9_b12f_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c3_17b5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_ce74] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_return_output;

     -- color_MUX[uxn_device_h_l115_c3_1dda] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l115_c3_1dda_cond <= VAR_color_MUX_uxn_device_h_l115_c3_1dda_cond;
     color_MUX_uxn_device_h_l115_c3_1dda_iftrue <= VAR_color_MUX_uxn_device_h_l115_c3_1dda_iftrue;
     color_MUX_uxn_device_h_l115_c3_1dda_iffalse <= VAR_color_MUX_uxn_device_h_l115_c3_1dda_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l115_c3_1dda_return_output := color_MUX_uxn_device_h_l115_c3_1dda_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_e3d6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_return_output;

     -- CONST_SR_8[uxn_device_h_l185_c34_94c2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l185_c34_94c2_x <= VAR_CONST_SR_8_uxn_device_h_l185_c34_94c2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l185_c34_94c2_return_output := CONST_SR_8_uxn_device_h_l185_c34_94c2_return_output;

     -- MUX[uxn_device_h_l97_c20_90f9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l97_c20_90f9_cond <= VAR_MUX_uxn_device_h_l97_c20_90f9_cond;
     MUX_uxn_device_h_l97_c20_90f9_iftrue <= VAR_MUX_uxn_device_h_l97_c20_90f9_iftrue;
     MUX_uxn_device_h_l97_c20_90f9_iffalse <= VAR_MUX_uxn_device_h_l97_c20_90f9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l97_c20_90f9_return_output := MUX_uxn_device_h_l97_c20_90f9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- result_vram_address_MUX[uxn_device_h_l175_c3_25f5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l175_c3_25f5_cond <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_cond;
     result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue;
     result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_return_output := result_vram_address_MUX_uxn_device_h_l175_c3_25f5_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l175_c3_25f5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_cond;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_return_output := result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c3_26ac] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l210_c4_1c8f_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l210_c9_46f8_return_output, 1);
     VAR_MUX_uxn_device_h_l222_c4_9e7e_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l222_c9_b12f_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_ae10_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_0150_return_output;
     VAR_x_MUX_uxn_device_h_l133_c3_26ac_iftrue := VAR_BIN_OP_OR_uxn_device_h_l134_c4_7412_return_output;
     VAR_y_MUX_uxn_device_h_l146_c3_3b93_iftrue := VAR_BIN_OP_OR_uxn_device_h_l147_c4_e0d5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_iftrue := VAR_BIN_OP_OR_uxn_device_h_l217_c4_deef_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_bdea_return_output;
     VAR_layer_MUX_uxn_device_h_l115_c3_1dda_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_165d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_d4e0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_e0ac_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_755e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_26b9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output;
     VAR_x_MUX_uxn_device_h_l126_c3_ce74_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output;
     VAR_y_MUX_uxn_device_h_l139_c3_b104_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_36be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_left := VAR_MUX_uxn_device_h_l96_c19_d523_return_output;
     VAR_MUX_uxn_device_h_l103_c32_2d31_cond := VAR_MUX_uxn_device_h_l96_c19_d523_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iftrue := VAR_MUX_uxn_device_h_l96_c19_d523_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_right := VAR_MUX_uxn_device_h_l97_c20_90f9_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iftrue := VAR_MUX_uxn_device_h_l97_c20_90f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_iftrue := VAR_auto_advance_MUX_uxn_device_h_l151_c3_17b5_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_3684_iftrue := VAR_color_MUX_uxn_device_h_l115_c3_1dda_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_ctrl_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_31f8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_e3d6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_bd52_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_2a54_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_5a14_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_e3d6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_2a54_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l197_c4_2a54_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_5a14_iftrue := VAR_x_MUX_uxn_device_h_l181_c5_e3d6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_cond := VAR_MUX_uxn_device_h_l210_c4_1c8f_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_cond := VAR_MUX_uxn_device_h_l210_c4_1c8f_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_cond := VAR_MUX_uxn_device_h_l210_c4_1c8f_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_cond := VAR_MUX_uxn_device_h_l222_c4_9e7e_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_cond := VAR_MUX_uxn_device_h_l222_c4_9e7e_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_cond := VAR_MUX_uxn_device_h_l222_c4_9e7e_interm_cond;
     -- result_device_ram_address_MUX[uxn_device_h_l210_c4_1c8f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_cond;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_return_output := result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- result_u8_value_MUX[uxn_device_h_l196_c3_2dd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_cond <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_cond;
     result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iftrue;
     result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_return_output := result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_return_output;

     -- flip_y_MUX[uxn_device_h_l115_c3_1dda] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l115_c3_1dda_cond <= VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_cond;
     flip_y_MUX_uxn_device_h_l115_c3_1dda_iftrue <= VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_iftrue;
     flip_y_MUX_uxn_device_h_l115_c3_1dda_iffalse <= VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_return_output := flip_y_MUX_uxn_device_h_l115_c3_1dda_return_output;

     -- auto_advance_MUX[uxn_device_h_l150_c7_8efb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l150_c7_8efb_cond <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_cond;
     auto_advance_MUX_uxn_device_h_l150_c7_8efb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_iftrue;
     auto_advance_MUX_uxn_device_h_l150_c7_8efb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_return_output := auto_advance_MUX_uxn_device_h_l150_c7_8efb_return_output;

     -- MUX[uxn_device_h_l103_c32_2d31] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l103_c32_2d31_cond <= VAR_MUX_uxn_device_h_l103_c32_2d31_cond;
     MUX_uxn_device_h_l103_c32_2d31_iftrue <= VAR_MUX_uxn_device_h_l103_c32_2d31_iftrue;
     MUX_uxn_device_h_l103_c32_2d31_iffalse <= VAR_MUX_uxn_device_h_l103_c32_2d31_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l103_c32_2d31_return_output := MUX_uxn_device_h_l103_c32_2d31_return_output;

     -- y_MUX[uxn_device_h_l146_c3_3b93] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l146_c3_3b93_cond <= VAR_y_MUX_uxn_device_h_l146_c3_3b93_cond;
     y_MUX_uxn_device_h_l146_c3_3b93_iftrue <= VAR_y_MUX_uxn_device_h_l146_c3_3b93_iftrue;
     y_MUX_uxn_device_h_l146_c3_3b93_iffalse <= VAR_y_MUX_uxn_device_h_l146_c3_3b93_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l146_c3_3b93_return_output := y_MUX_uxn_device_h_l146_c3_3b93_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l222_c4_9e7e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_cond;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_return_output := result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_return_output;

     -- flip_x_MUX[uxn_device_h_l115_c3_1dda] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l115_c3_1dda_cond <= VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_cond;
     flip_x_MUX_uxn_device_h_l115_c3_1dda_iftrue <= VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_iftrue;
     flip_x_MUX_uxn_device_h_l115_c3_1dda_iffalse <= VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_return_output := flip_x_MUX_uxn_device_h_l115_c3_1dda_return_output;

     -- result_u8_value_MUX[uxn_device_h_l151_c3_17b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l151_c3_17b5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_cond;
     result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iftrue;
     result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_return_output := result_u8_value_MUX_uxn_device_h_l151_c3_17b5_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l175_c3_25f5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_cond;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_return_output := result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c4_5a14] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l196_c3_2dd9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_cond;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_return_output := result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l157_c18_1c8c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_left;
     BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_return_output := BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_cond;
     is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iftrue;
     is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_return_output := is_sprite_port_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l125_c7_bd57] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_bd57_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_ce74_return_output);

     -- ram_addr_MUX[uxn_device_h_l203_c8_3091] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l203_c8_3091_cond <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_cond;
     ram_addr_MUX_uxn_device_h_l203_c8_3091_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_iftrue;
     ram_addr_MUX_uxn_device_h_l203_c8_3091_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_return_output := ram_addr_MUX_uxn_device_h_l203_c8_3091_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_1c8f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_return_output;

     -- BIN_OP_OR[uxn_device_h_l98_c21_3559] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c21_3559_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_left;
     BIN_OP_OR_uxn_device_h_l98_c21_3559_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output := BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output;

     -- ram_addr_MUX[uxn_device_h_l216_c8_36a7] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l216_c8_36a7_cond <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_cond;
     ram_addr_MUX_uxn_device_h_l216_c8_36a7_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_iftrue;
     ram_addr_MUX_uxn_device_h_l216_c8_36a7_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_return_output := ram_addr_MUX_uxn_device_h_l216_c8_36a7_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l132_c7_165e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_165e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_26ac_return_output);

     -- y_MUX[uxn_device_h_l139_c3_b104] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l139_c3_b104_cond <= VAR_y_MUX_uxn_device_h_l139_c3_b104_cond;
     y_MUX_uxn_device_h_l139_c3_b104_iftrue <= VAR_y_MUX_uxn_device_h_l139_c3_b104_iftrue;
     y_MUX_uxn_device_h_l139_c3_b104_iffalse <= VAR_y_MUX_uxn_device_h_l139_c3_b104_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l139_c3_b104_return_output := y_MUX_uxn_device_h_l139_c3_b104_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_2dd9] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_return_output := result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l210_c4_1c8f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_cond;
     result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iftrue;
     result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_return_output := result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_5a14] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_return_output;

     -- color_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_color_MUX_uxn_device_h_l114_c7_3684_cond;
     color_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_color_MUX_uxn_device_h_l114_c7_3684_iftrue;
     color_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_color_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l114_c7_3684_return_output := color_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- x_MUX[uxn_device_h_l133_c3_26ac] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l133_c3_26ac_cond <= VAR_x_MUX_uxn_device_h_l133_c3_26ac_cond;
     x_MUX_uxn_device_h_l133_c3_26ac_iftrue <= VAR_x_MUX_uxn_device_h_l133_c3_26ac_iftrue;
     x_MUX_uxn_device_h_l133_c3_26ac_iffalse <= VAR_x_MUX_uxn_device_h_l133_c3_26ac_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l133_c3_26ac_return_output := x_MUX_uxn_device_h_l133_c3_26ac_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c3_17b5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_return_output;

     -- layer_MUX[uxn_device_h_l115_c3_1dda] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l115_c3_1dda_cond <= VAR_layer_MUX_uxn_device_h_l115_c3_1dda_cond;
     layer_MUX_uxn_device_h_l115_c3_1dda_iftrue <= VAR_layer_MUX_uxn_device_h_l115_c3_1dda_iftrue;
     layer_MUX_uxn_device_h_l115_c3_1dda_iffalse <= VAR_layer_MUX_uxn_device_h_l115_c3_1dda_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l115_c3_1dda_return_output := layer_MUX_uxn_device_h_l115_c3_1dda_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_cond;
     is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iftrue;
     is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_return_output := is_pixel_port_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l114_c7_3684] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_3684_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_1dda_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l185_c24_7562] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_7562_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l185_c34_94c2_return_output);

     -- x_MUX[uxn_device_h_l126_c3_ce74] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l126_c3_ce74_cond <= VAR_x_MUX_uxn_device_h_l126_c3_ce74_cond;
     x_MUX_uxn_device_h_l126_c3_ce74_iftrue <= VAR_x_MUX_uxn_device_h_l126_c3_ce74_iftrue;
     x_MUX_uxn_device_h_l126_c3_ce74_iffalse <= VAR_x_MUX_uxn_device_h_l126_c3_ce74_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l126_c3_ce74_return_output := x_MUX_uxn_device_h_l126_c3_ce74_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l138_c7_f10a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_f10a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_b104_return_output);

     -- x_MUX[uxn_device_h_l180_c4_5a14] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l180_c4_5a14_cond <= VAR_x_MUX_uxn_device_h_l180_c4_5a14_cond;
     x_MUX_uxn_device_h_l180_c4_5a14_iftrue <= VAR_x_MUX_uxn_device_h_l180_c4_5a14_iftrue;
     x_MUX_uxn_device_h_l180_c4_5a14_iffalse <= VAR_x_MUX_uxn_device_h_l180_c4_5a14_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l180_c4_5a14_return_output := x_MUX_uxn_device_h_l180_c4_5a14_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l115_c3_1dda] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_cond;
     ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iftrue;
     ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_return_output := ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_return_output;

     -- result_u8_value_MUX[uxn_device_h_l222_c4_9e7e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_cond;
     result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iftrue;
     result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_return_output := result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l165_c28_f171] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l165_c28_f171_left <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_left;
     BIN_OP_PLUS_uxn_device_h_l165_c28_f171_right <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_return_output := BIN_OP_PLUS_uxn_device_h_l165_c28_f171_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l109_c7_c4d5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_c4d5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_3941_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_9e7e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_return_output;

     -- ctrl_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_cond;
     ctrl_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     ctrl_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_return_output := ctrl_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- Submodule level 3
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iftrue := VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_3559_return_output;
     VAR_vram_addr_uxn_device_h_l157_c5_1978 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_1c8c_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l165_c5_2344 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_f171_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_7562_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iftrue := VAR_MUX_uxn_device_h_l103_c32_2d31_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_iffalse := VAR_auto_advance_MUX_uxn_device_h_l150_c7_8efb_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_color_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_ctrl_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_1dda_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_iftrue := VAR_flip_x_MUX_uxn_device_h_l115_c3_1dda_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_iftrue := VAR_flip_y_MUX_uxn_device_h_l115_c3_1dda_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_a178_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_3684_iftrue := VAR_layer_MUX_uxn_device_h_l115_c3_1dda_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l203_c8_3091_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_iffalse := VAR_ram_addr_MUX_uxn_device_h_l216_c8_36a7_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_c4d5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_3684_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_3684_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_bd57_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_bd57_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_165e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_165e_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_f10a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_f10a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_5a14_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_1c8f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_9e7e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_5a14_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_1c8f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_9e7e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l210_c4_1c8f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l222_c4_9e7e_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_bd57_iftrue := VAR_x_MUX_uxn_device_h_l126_c3_ce74_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_165e_iftrue := VAR_x_MUX_uxn_device_h_l133_c3_26ac_return_output;
     VAR_x_MUX_uxn_device_h_l175_c3_25f5_iftrue := VAR_x_MUX_uxn_device_h_l180_c4_5a14_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_f10a_iftrue := VAR_y_MUX_uxn_device_h_l139_c3_b104_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_e716_iftrue := VAR_y_MUX_uxn_device_h_l146_c3_3b93_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iffalse := VAR_result_vram_address_uxn_device_h_l165_c5_2344;
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_left := VAR_vram_addr_uxn_device_h_l157_c5_1978;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_bd57] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_return_output;

     -- result_u8_value_MUX[uxn_device_h_l181_c5_e3d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_cond;
     result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_return_output := result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_return_output;

     -- layer_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_layer_MUX_uxn_device_h_l114_c7_3684_cond;
     layer_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_layer_MUX_uxn_device_h_l114_c7_3684_iftrue;
     layer_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_layer_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l114_c7_3684_return_output := layer_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l102_c3_c7e2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_cond;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_return_output := result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_return_output;

     -- ram_addr_MUX[uxn_device_h_l209_c3_d064] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l209_c3_d064_cond <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_cond;
     ram_addr_MUX_uxn_device_h_l209_c3_d064_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_iftrue;
     ram_addr_MUX_uxn_device_h_l209_c3_d064_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_return_output := ram_addr_MUX_uxn_device_h_l209_c3_d064_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_8a3a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l209_c3_d064] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_cond;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_return_output := result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l221_c3_8a3a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_cond;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_return_output := result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_return_output;

     -- ram_addr_MUX[uxn_device_h_l196_c3_2dd9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l196_c3_2dd9_cond <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_cond;
     ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iftrue;
     ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_return_output := ram_addr_MUX_uxn_device_h_l196_c3_2dd9_return_output;

     -- y_MUX[uxn_device_h_l145_c7_e716] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l145_c7_e716_cond <= VAR_y_MUX_uxn_device_h_l145_c7_e716_cond;
     y_MUX_uxn_device_h_l145_c7_e716_iftrue <= VAR_y_MUX_uxn_device_h_l145_c7_e716_iftrue;
     y_MUX_uxn_device_h_l145_c7_e716_iffalse <= VAR_y_MUX_uxn_device_h_l145_c7_e716_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l145_c7_e716_return_output := y_MUX_uxn_device_h_l145_c7_e716_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l175_c3_25f5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_cond;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_return_output := result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_return_output;

     -- flip_x_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_cond;
     flip_x_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_iftrue;
     flip_x_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_return_output := flip_x_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- result_u8_value_MUX[uxn_device_h_l209_c3_d064] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l209_c3_d064_cond <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_cond;
     result_u8_value_MUX_uxn_device_h_l209_c3_d064_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_iftrue;
     result_u8_value_MUX_uxn_device_h_l209_c3_d064_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_return_output := result_u8_value_MUX_uxn_device_h_l209_c3_d064_return_output;

     -- x_MUX[uxn_device_h_l175_c3_25f5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l175_c3_25f5_cond <= VAR_x_MUX_uxn_device_h_l175_c3_25f5_cond;
     x_MUX_uxn_device_h_l175_c3_25f5_iftrue <= VAR_x_MUX_uxn_device_h_l175_c3_25f5_iftrue;
     x_MUX_uxn_device_h_l175_c3_25f5_iffalse <= VAR_x_MUX_uxn_device_h_l175_c3_25f5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l175_c3_25f5_return_output := x_MUX_uxn_device_h_l175_c3_25f5_return_output;

     -- flip_y_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_cond;
     flip_y_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_iftrue;
     flip_y_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_return_output := flip_y_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- color_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_color_MUX_uxn_device_h_l109_c7_c4d5_cond;
     color_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_color_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     color_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_color_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l109_c7_c4d5_return_output := color_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- BIN_OP_AND[uxn_device_h_l158_c5_093b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l158_c5_093b_left <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_left;
     BIN_OP_AND_uxn_device_h_l158_c5_093b_right <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_return_output := BIN_OP_AND_uxn_device_h_l158_c5_093b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_25f5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_return_output := result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_d064] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_return_output := result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_cond;
     ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iftrue;
     ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_return_output := ctrl_mode_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l195_c7_4ccf] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_4ccf_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_2dd9_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_2dd9_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_2dd9_return_output);

     -- ctrl_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_cond;
     ctrl_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_iftrue;
     ctrl_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_return_output := ctrl_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- result_u8_value_MUX[uxn_device_h_l221_c3_8a3a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_cond;
     result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iftrue;
     result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_return_output := result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_e716] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_e716_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_e716_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_e716_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_return_output := auto_advance_MUX_uxn_device_h_l145_c7_e716_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_c7e2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_cond;
     is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iftrue;
     is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_return_output := is_drawing_port_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_left := VAR_BIN_OP_AND_uxn_device_h_l158_c5_093b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_bd57_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_e716_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_color_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_flip_x_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_flip_y_MUX_uxn_device_h_l114_c7_3684_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_layer_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iftrue := VAR_ram_addr_MUX_uxn_device_h_l196_c3_2dd9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_iftrue := VAR_ram_addr_MUX_uxn_device_h_l209_c3_d064_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_4ccf_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_4ccf_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c5_e3d6_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_edab_iftrue := VAR_x_MUX_uxn_device_h_l175_c3_25f5_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_f10a_iffalse := VAR_y_MUX_uxn_device_h_l145_c7_e716_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l220_c7_7c80] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_7c80_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_8a3a_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_8a3a_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_8a3a_return_output);

     -- ram_addr_MUX[uxn_device_h_l208_c7_39c6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l208_c7_39c6_cond <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_cond;
     ram_addr_MUX_uxn_device_h_l208_c7_39c6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_iftrue;
     ram_addr_MUX_uxn_device_h_l208_c7_39c6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_return_output := ram_addr_MUX_uxn_device_h_l208_c7_39c6_return_output;

     -- auto_advance_MUX[uxn_device_h_l138_c7_f10a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l138_c7_f10a_cond <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_cond;
     auto_advance_MUX_uxn_device_h_l138_c7_f10a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_iftrue;
     auto_advance_MUX_uxn_device_h_l138_c7_f10a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_return_output := auto_advance_MUX_uxn_device_h_l138_c7_f10a_return_output;

     -- layer_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_cond;
     layer_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     layer_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_return_output := layer_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l180_c4_5a14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c4_5a14_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_cond;
     result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_return_output := result_u8_value_MUX_uxn_device_h_l180_c4_5a14_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l208_c7_39c6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_39c6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_d064_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_d064_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_d064_return_output);

     -- color_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_color_MUX_uxn_device_h_l95_c2_a178_cond;
     color_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_color_MUX_uxn_device_h_l95_c2_a178_iftrue;
     color_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_color_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l95_c2_a178_return_output := color_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- flip_y_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_cond;
     flip_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     flip_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_return_output := flip_y_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_165e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_cond;
     ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_return_output := ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- BIN_OP_OR[uxn_device_h_l159_c5_77dd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l159_c5_77dd_left <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_left;
     BIN_OP_OR_uxn_device_h_l159_c5_77dd_right <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_return_output := BIN_OP_OR_uxn_device_h_l159_c5_77dd_return_output;

     -- y_MUX[uxn_device_h_l138_c7_f10a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c7_f10a_cond <= VAR_y_MUX_uxn_device_h_l138_c7_f10a_cond;
     y_MUX_uxn_device_h_l138_c7_f10a_iftrue <= VAR_y_MUX_uxn_device_h_l138_c7_f10a_iftrue;
     y_MUX_uxn_device_h_l138_c7_f10a_iffalse <= VAR_y_MUX_uxn_device_h_l138_c7_f10a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c7_f10a_return_output := y_MUX_uxn_device_h_l138_c7_f10a_return_output;

     -- flip_x_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_cond;
     flip_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     flip_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_return_output := flip_x_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- x_MUX[uxn_device_h_l174_c7_edab] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l174_c7_edab_cond <= VAR_x_MUX_uxn_device_h_l174_c7_edab_cond;
     x_MUX_uxn_device_h_l174_c7_edab_iftrue <= VAR_x_MUX_uxn_device_h_l174_c7_edab_iftrue;
     x_MUX_uxn_device_h_l174_c7_edab_iffalse <= VAR_x_MUX_uxn_device_h_l174_c7_edab_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l174_c7_edab_return_output := x_MUX_uxn_device_h_l174_c7_edab_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l95_c2_a178] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_a178_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_c7e2_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_c7e2_return_output);

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_left := VAR_BIN_OP_OR_uxn_device_h_l159_c5_77dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_165e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l138_c7_f10a_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_flip_x_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_flip_y_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_layer_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iffalse := VAR_ram_addr_MUX_uxn_device_h_l208_c7_39c6_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_a178_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_a178_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_39c6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_39c6_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_7c80_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_7c80_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l180_c4_5a14_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_8efb_iffalse := VAR_x_MUX_uxn_device_h_l174_c7_edab_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_165e_iffalse := VAR_y_MUX_uxn_device_h_l138_c7_f10a_return_output;
     -- BIN_OP_OR[uxn_device_h_l160_c5_0c72] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l160_c5_0c72_left <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_left;
     BIN_OP_OR_uxn_device_h_l160_c5_0c72_right <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_return_output := BIN_OP_OR_uxn_device_h_l160_c5_0c72_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_f10a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_return_output;

     -- flip_y_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_cond;
     flip_y_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_iftrue;
     flip_y_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_return_output := flip_y_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- x_MUX[uxn_device_h_l150_c7_8efb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l150_c7_8efb_cond <= VAR_x_MUX_uxn_device_h_l150_c7_8efb_cond;
     x_MUX_uxn_device_h_l150_c7_8efb_iftrue <= VAR_x_MUX_uxn_device_h_l150_c7_8efb_iftrue;
     x_MUX_uxn_device_h_l150_c7_8efb_iffalse <= VAR_x_MUX_uxn_device_h_l150_c7_8efb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l150_c7_8efb_return_output := x_MUX_uxn_device_h_l150_c7_8efb_return_output;

     -- result_u8_value_MUX[uxn_device_h_l175_c3_25f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l175_c3_25f5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_cond;
     result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iftrue;
     result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_return_output := result_u8_value_MUX_uxn_device_h_l175_c3_25f5_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_cond;
     ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iftrue;
     ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_return_output := ctrl_mode_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- y_MUX[uxn_device_h_l132_c7_165e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l132_c7_165e_cond <= VAR_y_MUX_uxn_device_h_l132_c7_165e_cond;
     y_MUX_uxn_device_h_l132_c7_165e_iftrue <= VAR_y_MUX_uxn_device_h_l132_c7_165e_iftrue;
     y_MUX_uxn_device_h_l132_c7_165e_iffalse <= VAR_y_MUX_uxn_device_h_l132_c7_165e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l132_c7_165e_return_output := y_MUX_uxn_device_h_l132_c7_165e_return_output;

     -- layer_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_layer_MUX_uxn_device_h_l95_c2_a178_cond;
     layer_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_layer_MUX_uxn_device_h_l95_c2_a178_iftrue;
     layer_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_layer_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l95_c2_a178_return_output := layer_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- ram_addr_MUX[uxn_device_h_l195_c7_4ccf] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l195_c7_4ccf_cond <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_cond;
     ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iftrue;
     ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_return_output := ram_addr_MUX_uxn_device_h_l195_c7_4ccf_return_output;

     -- auto_advance_MUX[uxn_device_h_l132_c7_165e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l132_c7_165e_cond <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_cond;
     auto_advance_MUX_uxn_device_h_l132_c7_165e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_iftrue;
     auto_advance_MUX_uxn_device_h_l132_c7_165e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_return_output := auto_advance_MUX_uxn_device_h_l132_c7_165e_return_output;

     -- flip_x_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_cond;
     flip_x_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_iftrue;
     flip_x_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_return_output := flip_x_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_left := VAR_BIN_OP_OR_uxn_device_h_l160_c5_0c72_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_f10a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_iffalse := VAR_auto_advance_MUX_uxn_device_h_l132_c7_165e_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_a178_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l95_c2_a178_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l95_c2_a178_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_iffalse := VAR_ram_addr_MUX_uxn_device_h_l195_c7_4ccf_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_e716_iffalse := VAR_x_MUX_uxn_device_h_l150_c7_8efb_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_bd57_iffalse := VAR_y_MUX_uxn_device_h_l132_c7_165e_return_output;
     -- x_MUX[uxn_device_h_l145_c7_e716] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l145_c7_e716_cond <= VAR_x_MUX_uxn_device_h_l145_c7_e716_cond;
     x_MUX_uxn_device_h_l145_c7_e716_iftrue <= VAR_x_MUX_uxn_device_h_l145_c7_e716_iftrue;
     x_MUX_uxn_device_h_l145_c7_e716_iffalse <= VAR_x_MUX_uxn_device_h_l145_c7_e716_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l145_c7_e716_return_output := x_MUX_uxn_device_h_l145_c7_e716_return_output;

     -- y_MUX[uxn_device_h_l125_c7_bd57] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_bd57_cond <= VAR_y_MUX_uxn_device_h_l125_c7_bd57_cond;
     y_MUX_uxn_device_h_l125_c7_bd57_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_bd57_iftrue;
     y_MUX_uxn_device_h_l125_c7_bd57_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_bd57_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_bd57_return_output := y_MUX_uxn_device_h_l125_c7_bd57_return_output;

     -- ram_addr_MUX[uxn_device_h_l174_c7_edab] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l174_c7_edab_cond <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_cond;
     ram_addr_MUX_uxn_device_h_l174_c7_edab_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_iftrue;
     ram_addr_MUX_uxn_device_h_l174_c7_edab_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_return_output := ram_addr_MUX_uxn_device_h_l174_c7_edab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_e716] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_return_output;

     -- auto_advance_MUX[uxn_device_h_l125_c7_bd57] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_bd57_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_bd57_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_bd57_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_return_output := auto_advance_MUX_uxn_device_h_l125_c7_bd57_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_855d[uxn_device_h_l174_c7_edab] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_855d_uxn_device_h_l174_c7_edab_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_855d(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_25f5_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_25f5_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_25f5_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_25f5_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_25f5_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_25f5_return_output);

     -- BIN_OP_OR[uxn_device_h_l161_c5_6b04] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l161_c5_6b04_left <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_left;
     BIN_OP_OR_uxn_device_h_l161_c5_6b04_right <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output := BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output;

     -- Submodule level 7
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_6b04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_e716_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_bd57_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l174_c7_edab_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_edab_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_855d_uxn_device_h_l174_c7_edab_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_f10a_iffalse := VAR_x_MUX_uxn_device_h_l145_c7_e716_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_3684_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_bd57_return_output;
     -- x_MUX[uxn_device_h_l138_c7_f10a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l138_c7_f10a_cond <= VAR_x_MUX_uxn_device_h_l138_c7_f10a_cond;
     x_MUX_uxn_device_h_l138_c7_f10a_iftrue <= VAR_x_MUX_uxn_device_h_l138_c7_f10a_iftrue;
     x_MUX_uxn_device_h_l138_c7_f10a_iffalse <= VAR_x_MUX_uxn_device_h_l138_c7_f10a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l138_c7_f10a_return_output := x_MUX_uxn_device_h_l138_c7_f10a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l156_c4_1b99] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l156_c4_1b99_cond <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_cond;
     result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iftrue;
     result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_return_output := result_vram_address_MUX_uxn_device_h_l156_c4_1b99_return_output;

     -- ram_addr_MUX[uxn_device_h_l150_c7_8efb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l150_c7_8efb_cond <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_cond;
     ram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue;
     ram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output := ram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output;

     -- y_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_y_MUX_uxn_device_h_l114_c7_3684_cond;
     y_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_3684_iftrue;
     y_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_3684_return_output := y_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- vram_addr_MUX[uxn_device_h_l156_c4_1b99] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l156_c4_1b99_cond <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_cond;
     vram_addr_MUX_uxn_device_h_l156_c4_1b99_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_iftrue;
     vram_addr_MUX_uxn_device_h_l156_c4_1b99_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_return_output := vram_addr_MUX_uxn_device_h_l156_c4_1b99_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_return_output := auto_advance_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_8efb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_8efb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse := VAR_ram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l156_c4_1b99_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_iftrue := VAR_vram_addr_MUX_uxn_device_h_l156_c4_1b99_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_165e_iffalse := VAR_x_MUX_uxn_device_h_l138_c7_f10a_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_3684_return_output;
     -- vram_addr_MUX[uxn_device_h_l151_c3_17b5] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l151_c3_17b5_cond <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_cond;
     vram_addr_MUX_uxn_device_h_l151_c3_17b5_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_iftrue;
     vram_addr_MUX_uxn_device_h_l151_c3_17b5_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_return_output := vram_addr_MUX_uxn_device_h_l151_c3_17b5_return_output;

     -- y_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_y_MUX_uxn_device_h_l109_c7_c4d5_cond;
     y_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_y_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     y_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_y_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l109_c7_c4d5_return_output := y_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- auto_advance_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_cond;
     auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_return_output := auto_advance_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c3_17b5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c3_17b5_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_cond;
     result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_return_output := result_vram_address_MUX_uxn_device_h_l151_c3_17b5_return_output;

     -- ram_addr_MUX[uxn_device_h_l145_c7_e716] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l145_c7_e716_cond <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_cond;
     ram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue;
     ram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_return_output := ram_addr_MUX_uxn_device_h_l145_c7_e716_return_output;

     -- x_MUX[uxn_device_h_l132_c7_165e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l132_c7_165e_cond <= VAR_x_MUX_uxn_device_h_l132_c7_165e_cond;
     x_MUX_uxn_device_h_l132_c7_165e_iftrue <= VAR_x_MUX_uxn_device_h_l132_c7_165e_iftrue;
     x_MUX_uxn_device_h_l132_c7_165e_iffalse <= VAR_x_MUX_uxn_device_h_l132_c7_165e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l132_c7_165e_return_output := x_MUX_uxn_device_h_l132_c7_165e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_edab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_edab_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_auto_advance_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l145_c7_e716_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue := VAR_vram_addr_MUX_uxn_device_h_l151_c3_17b5_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_bd57_iffalse := VAR_x_MUX_uxn_device_h_l132_c7_165e_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_y_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2f92[uxn_device_h_l150_c7_8efb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2f92_uxn_device_h_l150_c7_8efb_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_2f92(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_17b5_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_17b5_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_17b5_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_17b5_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_17b5_return_output);

     -- ram_addr_MUX[uxn_device_h_l138_c7_f10a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l138_c7_f10a_cond <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_cond;
     ram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue;
     ram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output := ram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output;

     -- auto_advance_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_cond;
     auto_advance_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_iftrue;
     auto_advance_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_return_output := auto_advance_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- x_MUX[uxn_device_h_l125_c7_bd57] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l125_c7_bd57_cond <= VAR_x_MUX_uxn_device_h_l125_c7_bd57_cond;
     x_MUX_uxn_device_h_l125_c7_bd57_iftrue <= VAR_x_MUX_uxn_device_h_l125_c7_bd57_iftrue;
     x_MUX_uxn_device_h_l125_c7_bd57_iffalse <= VAR_x_MUX_uxn_device_h_l125_c7_bd57_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l125_c7_bd57_return_output := x_MUX_uxn_device_h_l125_c7_bd57_return_output;

     -- y_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_y_MUX_uxn_device_h_l95_c2_a178_cond;
     y_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_y_MUX_uxn_device_h_l95_c2_a178_iftrue;
     y_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_y_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l95_c2_a178_return_output := y_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_4ccf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_return_output;

     -- vram_addr_MUX[uxn_device_h_l150_c7_8efb] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l150_c7_8efb_cond <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_cond;
     vram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_iftrue;
     vram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output := vram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_4ccf_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_8efb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2f92_uxn_device_h_l150_c7_8efb_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse := VAR_vram_addr_MUX_uxn_device_h_l150_c7_8efb_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_3684_iffalse := VAR_x_MUX_uxn_device_h_l125_c7_bd57_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l95_c2_a178_return_output;
     -- x_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_x_MUX_uxn_device_h_l114_c7_3684_cond;
     x_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_x_MUX_uxn_device_h_l114_c7_3684_iftrue;
     x_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_x_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l114_c7_3684_return_output := x_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- ram_addr_MUX[uxn_device_h_l132_c7_165e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l132_c7_165e_cond <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_cond;
     ram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue;
     ram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_return_output := ram_addr_MUX_uxn_device_h_l132_c7_165e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_39c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_e716] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_e716_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_return_output := vram_addr_MUX_uxn_device_h_l145_c7_e716_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_39c6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse := VAR_ram_addr_MUX_uxn_device_h_l132_c7_165e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_e716_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_x_MUX_uxn_device_h_l114_c7_3684_return_output;
     -- ram_addr_MUX[uxn_device_h_l125_c7_bd57] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l125_c7_bd57_cond <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_cond;
     ram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue;
     ram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output := ram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_7c80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_return_output;

     -- vram_addr_MUX[uxn_device_h_l138_c7_f10a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l138_c7_f10a_cond <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_cond;
     vram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_iftrue;
     vram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output := vram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output;

     -- x_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_x_MUX_uxn_device_h_l109_c7_c4d5_cond;
     x_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_x_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     x_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_x_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l109_c7_c4d5_return_output := x_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_7c80_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse := VAR_ram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse := VAR_vram_addr_MUX_uxn_device_h_l138_c7_f10a_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_x_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     -- ram_addr_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_cond;
     ram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue;
     ram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_return_output := ram_addr_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- x_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_x_MUX_uxn_device_h_l95_c2_a178_cond;
     x_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_x_MUX_uxn_device_h_l95_c2_a178_iftrue;
     x_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_x_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l95_c2_a178_return_output := x_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_8c96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_return_output;

     -- vram_addr_MUX[uxn_device_h_l132_c7_165e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l132_c7_165e_cond <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_cond;
     vram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_iftrue;
     vram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_return_output := vram_addr_MUX_uxn_device_h_l132_c7_165e_return_output;

     -- Submodule level 13
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_8c96_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_ram_addr_MUX_uxn_device_h_l114_c7_3684_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse := VAR_vram_addr_MUX_uxn_device_h_l132_c7_165e_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l95_c2_a178_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_9988] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_return_output;

     -- ram_addr_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond;
     ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output := ram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- vram_addr_MUX[uxn_device_h_l125_c7_bd57] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l125_c7_bd57_cond <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_cond;
     vram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_iftrue;
     vram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output := vram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output;

     -- Submodule level 14
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_9988_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_ram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse := VAR_vram_addr_MUX_uxn_device_h_l125_c7_bd57_return_output;
     -- ram_addr_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_cond;
     ram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue;
     ram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_return_output := ram_addr_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- screen_blit[uxn_device_h_l231_c46_4d61] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l231_c46_4d61_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l231_c46_4d61_phase <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_phase;
     screen_blit_uxn_device_h_l231_c46_4d61_ctrl <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_ctrl;
     screen_blit_uxn_device_h_l231_c46_4d61_auto_advance <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_auto_advance;
     screen_blit_uxn_device_h_l231_c46_4d61_x <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_x;
     screen_blit_uxn_device_h_l231_c46_4d61_y <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_y;
     screen_blit_uxn_device_h_l231_c46_4d61_ram_addr <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_ram_addr;
     screen_blit_uxn_device_h_l231_c46_4d61_previous_ram_read <= VAR_screen_blit_uxn_device_h_l231_c46_4d61_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output := screen_blit_uxn_device_h_l231_c46_4d61_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_return_output := vram_addr_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- Submodule level 15
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_3684_return_output;
     -- CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d[uxn_device_h_l238_c25_0a94] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_0a94_return_output := VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l236_c30_6a4a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_6a4a_return_output := VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l237_c22_50bb] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_50bb_return_output := VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output.u8_value;

     -- vram_addr_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_cond;
     vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output := vram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l234_c27_cf22] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_cf22_return_output := VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output.is_vram_write;

     -- CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d[uxn_device_h_l235_c26_6fb8] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_6fb8_return_output := VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l239_c25_b0d2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_b0d2_return_output := VAR_screen_blit_uxn_device_h_l231_c46_4d61_return_output.is_blit_done;

     -- Submodule level 16
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_vram_addr_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6[uxn_device_h_l230_c3_6d34] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_6d34_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l233_c4_702d,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_cf22_return_output,
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_6fb8_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_6a4a_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_50bb_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_0a94_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_b0d2_return_output);

     -- vram_addr_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_cond;
     vram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_iftrue;
     vram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_return_output := vram_addr_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l230_c3_6d34_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_6d34_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l95_c2_a178_return_output;
     -- result_MUX[uxn_device_h_l230_c3_6d34] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l230_c3_6d34_cond <= VAR_result_MUX_uxn_device_h_l230_c3_6d34_cond;
     result_MUX_uxn_device_h_l230_c3_6d34_iftrue <= VAR_result_MUX_uxn_device_h_l230_c3_6d34_iftrue;
     result_MUX_uxn_device_h_l230_c3_6d34_iffalse <= VAR_result_MUX_uxn_device_h_l230_c3_6d34_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l230_c3_6d34_return_output := result_MUX_uxn_device_h_l230_c3_6d34_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l220_c7_7c80_iffalse := VAR_result_MUX_uxn_device_h_l230_c3_6d34_return_output;
     -- result_MUX[uxn_device_h_l220_c7_7c80] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l220_c7_7c80_cond <= VAR_result_MUX_uxn_device_h_l220_c7_7c80_cond;
     result_MUX_uxn_device_h_l220_c7_7c80_iftrue <= VAR_result_MUX_uxn_device_h_l220_c7_7c80_iftrue;
     result_MUX_uxn_device_h_l220_c7_7c80_iffalse <= VAR_result_MUX_uxn_device_h_l220_c7_7c80_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l220_c7_7c80_return_output := result_MUX_uxn_device_h_l220_c7_7c80_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l208_c7_39c6_iffalse := VAR_result_MUX_uxn_device_h_l220_c7_7c80_return_output;
     -- result_MUX[uxn_device_h_l208_c7_39c6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l208_c7_39c6_cond <= VAR_result_MUX_uxn_device_h_l208_c7_39c6_cond;
     result_MUX_uxn_device_h_l208_c7_39c6_iftrue <= VAR_result_MUX_uxn_device_h_l208_c7_39c6_iftrue;
     result_MUX_uxn_device_h_l208_c7_39c6_iffalse <= VAR_result_MUX_uxn_device_h_l208_c7_39c6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l208_c7_39c6_return_output := result_MUX_uxn_device_h_l208_c7_39c6_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l195_c7_4ccf_iffalse := VAR_result_MUX_uxn_device_h_l208_c7_39c6_return_output;
     -- result_MUX[uxn_device_h_l195_c7_4ccf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l195_c7_4ccf_cond <= VAR_result_MUX_uxn_device_h_l195_c7_4ccf_cond;
     result_MUX_uxn_device_h_l195_c7_4ccf_iftrue <= VAR_result_MUX_uxn_device_h_l195_c7_4ccf_iftrue;
     result_MUX_uxn_device_h_l195_c7_4ccf_iffalse <= VAR_result_MUX_uxn_device_h_l195_c7_4ccf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l195_c7_4ccf_return_output := result_MUX_uxn_device_h_l195_c7_4ccf_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l174_c7_edab_iffalse := VAR_result_MUX_uxn_device_h_l195_c7_4ccf_return_output;
     -- result_MUX[uxn_device_h_l174_c7_edab] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c7_edab_cond <= VAR_result_MUX_uxn_device_h_l174_c7_edab_cond;
     result_MUX_uxn_device_h_l174_c7_edab_iftrue <= VAR_result_MUX_uxn_device_h_l174_c7_edab_iftrue;
     result_MUX_uxn_device_h_l174_c7_edab_iffalse <= VAR_result_MUX_uxn_device_h_l174_c7_edab_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c7_edab_return_output := result_MUX_uxn_device_h_l174_c7_edab_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l150_c7_8efb_iffalse := VAR_result_MUX_uxn_device_h_l174_c7_edab_return_output;
     -- result_MUX[uxn_device_h_l150_c7_8efb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l150_c7_8efb_cond <= VAR_result_MUX_uxn_device_h_l150_c7_8efb_cond;
     result_MUX_uxn_device_h_l150_c7_8efb_iftrue <= VAR_result_MUX_uxn_device_h_l150_c7_8efb_iftrue;
     result_MUX_uxn_device_h_l150_c7_8efb_iffalse <= VAR_result_MUX_uxn_device_h_l150_c7_8efb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l150_c7_8efb_return_output := result_MUX_uxn_device_h_l150_c7_8efb_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l145_c7_e716_iffalse := VAR_result_MUX_uxn_device_h_l150_c7_8efb_return_output;
     -- result_MUX[uxn_device_h_l145_c7_e716] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l145_c7_e716_cond <= VAR_result_MUX_uxn_device_h_l145_c7_e716_cond;
     result_MUX_uxn_device_h_l145_c7_e716_iftrue <= VAR_result_MUX_uxn_device_h_l145_c7_e716_iftrue;
     result_MUX_uxn_device_h_l145_c7_e716_iffalse <= VAR_result_MUX_uxn_device_h_l145_c7_e716_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l145_c7_e716_return_output := result_MUX_uxn_device_h_l145_c7_e716_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l138_c7_f10a_iffalse := VAR_result_MUX_uxn_device_h_l145_c7_e716_return_output;
     -- result_MUX[uxn_device_h_l138_c7_f10a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l138_c7_f10a_cond <= VAR_result_MUX_uxn_device_h_l138_c7_f10a_cond;
     result_MUX_uxn_device_h_l138_c7_f10a_iftrue <= VAR_result_MUX_uxn_device_h_l138_c7_f10a_iftrue;
     result_MUX_uxn_device_h_l138_c7_f10a_iffalse <= VAR_result_MUX_uxn_device_h_l138_c7_f10a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l138_c7_f10a_return_output := result_MUX_uxn_device_h_l138_c7_f10a_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l132_c7_165e_iffalse := VAR_result_MUX_uxn_device_h_l138_c7_f10a_return_output;
     -- result_MUX[uxn_device_h_l132_c7_165e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l132_c7_165e_cond <= VAR_result_MUX_uxn_device_h_l132_c7_165e_cond;
     result_MUX_uxn_device_h_l132_c7_165e_iftrue <= VAR_result_MUX_uxn_device_h_l132_c7_165e_iftrue;
     result_MUX_uxn_device_h_l132_c7_165e_iffalse <= VAR_result_MUX_uxn_device_h_l132_c7_165e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l132_c7_165e_return_output := result_MUX_uxn_device_h_l132_c7_165e_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l125_c7_bd57_iffalse := VAR_result_MUX_uxn_device_h_l132_c7_165e_return_output;
     -- result_MUX[uxn_device_h_l125_c7_bd57] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l125_c7_bd57_cond <= VAR_result_MUX_uxn_device_h_l125_c7_bd57_cond;
     result_MUX_uxn_device_h_l125_c7_bd57_iftrue <= VAR_result_MUX_uxn_device_h_l125_c7_bd57_iftrue;
     result_MUX_uxn_device_h_l125_c7_bd57_iffalse <= VAR_result_MUX_uxn_device_h_l125_c7_bd57_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l125_c7_bd57_return_output := result_MUX_uxn_device_h_l125_c7_bd57_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l114_c7_3684_iffalse := VAR_result_MUX_uxn_device_h_l125_c7_bd57_return_output;
     -- result_MUX[uxn_device_h_l114_c7_3684] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l114_c7_3684_cond <= VAR_result_MUX_uxn_device_h_l114_c7_3684_cond;
     result_MUX_uxn_device_h_l114_c7_3684_iftrue <= VAR_result_MUX_uxn_device_h_l114_c7_3684_iftrue;
     result_MUX_uxn_device_h_l114_c7_3684_iffalse <= VAR_result_MUX_uxn_device_h_l114_c7_3684_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l114_c7_3684_return_output := result_MUX_uxn_device_h_l114_c7_3684_return_output;

     -- Submodule level 28
     VAR_result_MUX_uxn_device_h_l109_c7_c4d5_iffalse := VAR_result_MUX_uxn_device_h_l114_c7_3684_return_output;
     -- result_MUX[uxn_device_h_l109_c7_c4d5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l109_c7_c4d5_cond <= VAR_result_MUX_uxn_device_h_l109_c7_c4d5_cond;
     result_MUX_uxn_device_h_l109_c7_c4d5_iftrue <= VAR_result_MUX_uxn_device_h_l109_c7_c4d5_iftrue;
     result_MUX_uxn_device_h_l109_c7_c4d5_iffalse <= VAR_result_MUX_uxn_device_h_l109_c7_c4d5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l109_c7_c4d5_return_output := result_MUX_uxn_device_h_l109_c7_c4d5_return_output;

     -- Submodule level 29
     VAR_result_MUX_uxn_device_h_l95_c2_a178_iffalse := VAR_result_MUX_uxn_device_h_l109_c7_c4d5_return_output;
     -- result_MUX[uxn_device_h_l95_c2_a178] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l95_c2_a178_cond <= VAR_result_MUX_uxn_device_h_l95_c2_a178_cond;
     result_MUX_uxn_device_h_l95_c2_a178_iftrue <= VAR_result_MUX_uxn_device_h_l95_c2_a178_iftrue;
     result_MUX_uxn_device_h_l95_c2_a178_iffalse <= VAR_result_MUX_uxn_device_h_l95_c2_a178_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l95_c2_a178_return_output := result_MUX_uxn_device_h_l95_c2_a178_return_output;

     -- Submodule level 30
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l95_c2_a178_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l95_c2_a178_return_output;
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
