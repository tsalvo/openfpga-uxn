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
signal vram_addr : unsigned(23 downto 0) := to_unsigned(0, 24);
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
vram_address => to_unsigned(0, 24),
ram_address => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_vram_addr : unsigned(23 downto 0);
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
-- BIN_OP_EQ[uxn_device_h_l95_c6_30f7]
signal BIN_OP_EQ_uxn_device_h_l95_c6_30f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_30f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_e187]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l95_c2_c85f]
signal ram_addr_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(15 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l95_c2_c85f]
signal is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l95_c2_c85f]
signal y_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(15 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l95_c2_c85f]
signal is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l95_c2_c85f]
signal result_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c2_c85f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_c85f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_c85f_return_output : device_out_result_t;

-- flip_x_MUX[uxn_device_h_l95_c2_c85f]
signal flip_x_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l95_c2_c85f]
signal layer_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l95_c2_c85f]
signal vram_addr_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l95_c2_c85f]
signal x_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l95_c2_c85f]
signal auto_advance_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l95_c2_c85f]
signal flip_y_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l95_c2_c85f]
signal ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l95_c2_c85f]
signal ctrl_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(7 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l95_c2_c85f]
signal is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l95_c2_c85f]
signal color_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l96_c19_52e2]
signal BIN_OP_EQ_uxn_device_h_l96_c19_52e2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_52e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_52e2_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l96_c19_feec]
signal MUX_uxn_device_h_l96_c19_feec_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_feec_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_feec_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_feec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l97_c20_9268]
signal BIN_OP_EQ_uxn_device_h_l97_c20_9268_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_9268_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_9268_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l97_c20_0ea0]
signal MUX_uxn_device_h_l97_c20_0ea0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_0ea0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_0ea0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_0ea0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c21_6364]
signal BIN_OP_OR_uxn_device_h_l98_c21_6364_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_6364_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_da0e]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l102_c3_da0e]
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l103_c32_9a99]
signal MUX_uxn_device_h_l103_c32_9a99_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l103_c32_9a99_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_9a99_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_9a99_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c11_6fd6]
signal BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_2337]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l109_c7_e187]
signal ram_addr_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l109_c7_e187]
signal y_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l109_c7_e187]
signal result_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l109_c7_e187_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_e187_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_e187_return_output : device_out_result_t;

-- flip_x_MUX[uxn_device_h_l109_c7_e187]
signal flip_x_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l109_c7_e187]
signal layer_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l109_c7_e187]
signal vram_addr_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l109_c7_e187]
signal x_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l109_c7_e187]
signal auto_advance_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l109_c7_e187]
signal flip_y_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l109_c7_e187]
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l109_c7_e187]
signal ctrl_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l109_c7_e187]
signal color_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l110_c3_ac09]
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_2767]
signal BIN_OP_EQ_uxn_device_h_l114_c11_2767_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_2767_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_3e72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l114_c7_2337]
signal ram_addr_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l114_c7_2337]
signal y_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l114_c7_2337]
signal result_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l114_c7_2337_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_2337_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_2337_return_output : device_out_result_t;

-- flip_x_MUX[uxn_device_h_l114_c7_2337]
signal flip_x_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l114_c7_2337]
signal layer_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_2337]
signal vram_addr_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l114_c7_2337]
signal x_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_2337]
signal auto_advance_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l114_c7_2337]
signal flip_y_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l114_c7_2337]
signal ctrl_mode_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l114_c7_2337]
signal ctrl_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l114_c7_2337]
signal color_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_ac2e]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l115_c3_ac2e]
signal flip_x_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l115_c3_ac2e]
signal layer_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l115_c3_ac2e]
signal flip_y_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l115_c3_ac2e]
signal ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l115_c3_ac2e]
signal ctrl_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l115_c3_ac2e]
signal color_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(3 downto 0);

-- CONST_SR_7[uxn_device_h_l118_c26_cb52]
signal CONST_SR_7_uxn_device_h_l118_c26_cb52_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l118_c26_cb52_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l119_c22_1bfd]
signal CONST_SR_6_uxn_device_h_l119_c22_1bfd_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l119_c22_1bfd_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l120_c23_2e3c]
signal CONST_SR_5_uxn_device_h_l120_c23_2e3c_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l120_c23_2e3c_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l121_c23_0f8e]
signal CONST_SR_4_uxn_device_h_l121_c23_0f8e_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l121_c23_0f8e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_604d]
signal BIN_OP_EQ_uxn_device_h_l125_c11_604d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_604d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_83ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l125_c7_3e72]
signal ram_addr_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l125_c7_3e72]
signal y_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l125_c7_3e72]
signal result_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l125_c7_3e72_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_3e72_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_3e72_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l125_c7_3e72]
signal vram_addr_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l125_c7_3e72]
signal x_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_3e72]
signal auto_advance_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_bba9]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l126_c3_bba9]
signal x_MUX_uxn_device_h_l126_c3_bba9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l126_c3_bba9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_bba9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_bba9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c11_3e1f]
signal BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_6dc2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l132_c7_83ea]
signal ram_addr_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l132_c7_83ea]
signal y_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l132_c7_83ea]
signal result_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l132_c7_83ea_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_83ea_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_83ea_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l132_c7_83ea]
signal vram_addr_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l132_c7_83ea]
signal x_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l132_c7_83ea]
signal auto_advance_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c3_9349]
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l133_c3_9349]
signal x_MUX_uxn_device_h_l133_c3_9349_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l133_c3_9349_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_9349_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_9349_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l134_c4_1eed]
signal BIN_OP_OR_uxn_device_h_l134_c4_1eed_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_1eed_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_1eed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c11_fee2]
signal BIN_OP_EQ_uxn_device_h_l138_c11_fee2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_fee2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_5fb2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l138_c7_6dc2]
signal ram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l138_c7_6dc2]
signal y_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l138_c7_6dc2]
signal result_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l138_c7_6dc2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_6dc2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_6dc2_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l138_c7_6dc2]
signal vram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l138_c7_6dc2]
signal x_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l138_c7_6dc2]
signal auto_advance_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l139_c3_4fb1]
signal y_MUX_uxn_device_h_l139_c3_4fb1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l139_c3_4fb1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_4fb1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_4fb1_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l139_c3_4fb1]
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_6849]
signal BIN_OP_EQ_uxn_device_h_l145_c11_6849_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_6849_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_7d97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l145_c7_5fb2]
signal ram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l145_c7_5fb2]
signal y_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l145_c7_5fb2]
signal result_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l145_c7_5fb2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_5fb2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_5fb2_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l145_c7_5fb2]
signal vram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l145_c7_5fb2]
signal x_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_5fb2]
signal auto_advance_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l146_c3_b47a]
signal y_MUX_uxn_device_h_l146_c3_b47a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l146_c3_b47a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_b47a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_b47a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l147_c4_acb5]
signal BIN_OP_OR_uxn_device_h_l147_c4_acb5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_acb5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_acb5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c11_351a]
signal BIN_OP_EQ_uxn_device_h_l150_c11_351a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_351a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_d18b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l150_c7_7d97]
signal ram_addr_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l150_c7_7d97]
signal result_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l150_c7_7d97_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_7d97_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_7d97_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l150_c7_7d97]
signal vram_addr_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(23 downto 0);

-- x_MUX[uxn_device_h_l150_c7_7d97]
signal x_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l150_c7_7d97]
signal auto_advance_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c3_9123]
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l151_c3_9123]
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c3_9123]
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l151_c3_9123]
signal result_u8_value_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c3_9123]
signal result_vram_address_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(23 downto 0);

-- vram_addr_MUX[uxn_device_h_l151_c3_9123]
signal vram_addr_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(23 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c3_9123]
signal auto_advance_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l154_c32_76fe]
signal BIN_OP_AND_uxn_device_h_l154_c32_76fe_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_76fe_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_76fe_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l156_c4_625a]
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l156_c4_625a]
signal result_vram_address_MUX_uxn_device_h_l156_c4_625a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_625a_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_625a_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_625a_return_output : unsigned(23 downto 0);

-- vram_addr_MUX[uxn_device_h_l156_c4_625a]
signal vram_addr_MUX_uxn_device_h_l156_c4_625a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_625a_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_625a_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_625a_return_output : unsigned(23 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_aa04]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_left : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_right : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_return_output : unsigned(47 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c18_fdbe]
signal BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_left : unsigned(47 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_right : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_return_output : unsigned(48 downto 0);

-- BIN_OP_AND[uxn_device_h_l158_c5_53ee]
signal BIN_OP_AND_uxn_device_h_l158_c5_53ee_left : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_53ee_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_53ee_return_output : unsigned(23 downto 0);

-- MUX[uxn_device_h_l159_c19_4976]
signal MUX_uxn_device_h_l159_c19_4976_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c19_4976_iftrue : unsigned(19 downto 0);
signal MUX_uxn_device_h_l159_c19_4976_iffalse : unsigned(19 downto 0);
signal MUX_uxn_device_h_l159_c19_4976_return_output : unsigned(19 downto 0);

-- BIN_OP_OR[uxn_device_h_l159_c5_00db]
signal BIN_OP_OR_uxn_device_h_l159_c5_00db_left : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_00db_right : unsigned(19 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_00db_return_output : unsigned(23 downto 0);

-- MUX[uxn_device_h_l160_c19_b931]
signal MUX_uxn_device_h_l160_c19_b931_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l160_c19_b931_iftrue : unsigned(18 downto 0);
signal MUX_uxn_device_h_l160_c19_b931_iffalse : unsigned(18 downto 0);
signal MUX_uxn_device_h_l160_c19_b931_return_output : unsigned(18 downto 0);

-- BIN_OP_OR[uxn_device_h_l160_c5_3e8c]
signal BIN_OP_OR_uxn_device_h_l160_c5_3e8c_left : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_3e8c_right : unsigned(18 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_3e8c_return_output : unsigned(23 downto 0);

-- BIN_OP_OR[uxn_device_h_l161_c5_311b]
signal BIN_OP_OR_uxn_device_h_l161_c5_311b_left : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_311b_right : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output : unsigned(23 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_e85b]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_left : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_right : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_return_output : unsigned(47 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l165_c28_2438]
signal BIN_OP_PLUS_uxn_device_h_l165_c28_2438_left : unsigned(47 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_2438_right : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_2438_return_output : unsigned(48 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c8_92c1]
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c8_92c1]
signal auto_advance_MUX_uxn_device_h_l169_c8_92c1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_92c1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_92c1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_92c1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c11_6bbb]
signal BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_5eea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l174_c7_d18b]
signal ram_addr_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_d18b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_d18b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_d18b_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l174_c7_d18b]
signal result_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c7_d18b_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_d18b_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_d18b_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l174_c7_d18b]
signal x_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l174_c7_d18b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_d18b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_d18b_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l175_c3_3f62]
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l175_c3_3f62]
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l175_c3_3f62]
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l175_c3_3f62]
signal result_u8_value_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l175_c3_3f62]
signal result_vram_address_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(23 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_3f62]
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l175_c3_3f62]
signal x_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l180_c9_d8a0]
signal UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c4_d6ff]
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l180_c4_d6ff]
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c4_d6ff]
signal result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_d6ff]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l180_c4_d6ff]
signal x_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c9_1d73]
signal BIN_OP_AND_uxn_device_h_l181_c9_1d73_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_1d73_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_1d73_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c5_9aed]
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_9aed]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c5_9aed]
signal result_u8_value_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l181_c5_9aed]
signal x_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l182_c6_7523]
signal BIN_OP_PLUS_uxn_device_h_l182_c6_7523_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_7523_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_7523_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l185_c34_c428]
signal CONST_SR_8_uxn_device_h_l185_c34_c428_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l185_c34_c428_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l191_c8_a901]
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c11_6082]
signal BIN_OP_EQ_uxn_device_h_l195_c11_6082_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_6082_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_c979]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l195_c7_5eea]
signal ram_addr_MUX_uxn_device_h_l195_c7_5eea_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_5eea_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_5eea_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_5eea_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l195_c7_5eea]
signal result_MUX_uxn_device_h_l195_c7_5eea_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l195_c7_5eea_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_5eea_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_5eea_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l196_c3_8f67]
signal ram_addr_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l196_c3_8f67]
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_8f67]
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l196_c3_8f67]
signal result_u8_value_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l197_c8_3d48]
signal BIN_OP_AND_uxn_device_h_l197_c8_3d48_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_3d48_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_3d48_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l197_c4_509b]
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_509b]
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l197_c4_509b]
signal result_u8_value_MUX_uxn_device_h_l197_c4_509b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_509b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_509b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_509b_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l203_c8_5cd3]
signal ram_addr_MUX_uxn_device_h_l203_c8_5cd3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_5cd3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l208_c11_5425]
signal BIN_OP_EQ_uxn_device_h_l208_c11_5425_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_5425_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_767e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l208_c7_c979]
signal ram_addr_MUX_uxn_device_h_l208_c7_c979_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_c979_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_c979_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_c979_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l208_c7_c979]
signal result_MUX_uxn_device_h_l208_c7_c979_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l208_c7_c979_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_c979_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_c979_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l209_c3_db96]
signal ram_addr_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l209_c3_db96]
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_db96]
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l209_c3_db96]
signal result_u8_value_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l210_c9_5372]
signal BIN_OP_AND_uxn_device_h_l210_c9_5372_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_5372_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_5372_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l210_c4_4ee5]
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_4ee5]
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l210_c4_4ee5]
signal result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l213_c33_483b]
signal CONST_SR_8_uxn_device_h_l213_c33_483b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l213_c33_483b_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l216_c8_cb35]
signal ram_addr_MUX_uxn_device_h_l216_c8_cb35_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_cb35_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_cb35_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_cb35_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l217_c4_c595]
signal BIN_OP_OR_uxn_device_h_l217_c4_c595_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_c595_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_c595_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l220_c11_2c37]
signal BIN_OP_EQ_uxn_device_h_l220_c11_2c37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_2c37_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_2f5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l220_c7_767e]
signal result_MUX_uxn_device_h_l220_c7_767e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l220_c7_767e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_767e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_767e_return_output : device_out_result_t;

-- result_device_ram_address_MUX[uxn_device_h_l221_c3_bfb8]
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_bfb8]
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l221_c3_bfb8]
signal result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l222_c9_dd34]
signal BIN_OP_AND_uxn_device_h_l222_c9_dd34_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_dd34_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_dd34_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l222_c4_1566]
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_1566]
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l222_c4_1566]
signal result_u8_value_MUX_uxn_device_h_l222_c4_1566_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_1566_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_1566_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_1566_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_6fdd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l230_c3_d854]
signal result_MUX_uxn_device_h_l230_c3_d854_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l230_c3_d854_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_d854_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_d854_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l231_c58_299d]
signal BIN_OP_MINUS_uxn_device_h_l231_c58_299d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_299d_right : unsigned(3 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_299d_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l231_c46_0413]
signal screen_blit_uxn_device_h_l231_c46_0413_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_0413_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232
signal CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c
signal CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_1b54( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.vram_address := ref_toks_5;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_8105( ref_toks_0 : device_out_result_t;
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
      base.is_vram_write := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
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

function CAST_TO_uint24_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,24)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l95_c6_30f7
BIN_OP_EQ_uxn_device_h_l95_c6_30f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c6_30f7_left,
BIN_OP_EQ_uxn_device_h_l95_c6_30f7_right,
BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_return_output);

-- ram_addr_MUX_uxn_device_h_l95_c2_c85f
ram_addr_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l95_c2_c85f_cond,
ram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue,
ram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse,
ram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- is_drawing_port_MUX_uxn_device_h_l95_c2_c85f
is_drawing_port_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_cond,
is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iftrue,
is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iffalse,
is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- y_MUX_uxn_device_h_l95_c2_c85f
y_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l95_c2_c85f_cond,
y_MUX_uxn_device_h_l95_c2_c85f_iftrue,
y_MUX_uxn_device_h_l95_c2_c85f_iffalse,
y_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- is_pixel_port_MUX_uxn_device_h_l95_c2_c85f
is_pixel_port_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_cond,
is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iftrue,
is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iffalse,
is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- result_MUX_uxn_device_h_l95_c2_c85f
result_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l95_c2_c85f_cond,
result_MUX_uxn_device_h_l95_c2_c85f_iftrue,
result_MUX_uxn_device_h_l95_c2_c85f_iffalse,
result_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- flip_x_MUX_uxn_device_h_l95_c2_c85f
flip_x_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l95_c2_c85f_cond,
flip_x_MUX_uxn_device_h_l95_c2_c85f_iftrue,
flip_x_MUX_uxn_device_h_l95_c2_c85f_iffalse,
flip_x_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- layer_MUX_uxn_device_h_l95_c2_c85f
layer_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l95_c2_c85f_cond,
layer_MUX_uxn_device_h_l95_c2_c85f_iftrue,
layer_MUX_uxn_device_h_l95_c2_c85f_iffalse,
layer_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- vram_addr_MUX_uxn_device_h_l95_c2_c85f
vram_addr_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l95_c2_c85f_cond,
vram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue,
vram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse,
vram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- x_MUX_uxn_device_h_l95_c2_c85f
x_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l95_c2_c85f_cond,
x_MUX_uxn_device_h_l95_c2_c85f_iftrue,
x_MUX_uxn_device_h_l95_c2_c85f_iffalse,
x_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- auto_advance_MUX_uxn_device_h_l95_c2_c85f
auto_advance_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l95_c2_c85f_cond,
auto_advance_MUX_uxn_device_h_l95_c2_c85f_iftrue,
auto_advance_MUX_uxn_device_h_l95_c2_c85f_iffalse,
auto_advance_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- flip_y_MUX_uxn_device_h_l95_c2_c85f
flip_y_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l95_c2_c85f_cond,
flip_y_MUX_uxn_device_h_l95_c2_c85f_iftrue,
flip_y_MUX_uxn_device_h_l95_c2_c85f_iffalse,
flip_y_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- ctrl_mode_MUX_uxn_device_h_l95_c2_c85f
ctrl_mode_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_cond,
ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iftrue,
ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iffalse,
ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- ctrl_MUX_uxn_device_h_l95_c2_c85f
ctrl_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l95_c2_c85f_cond,
ctrl_MUX_uxn_device_h_l95_c2_c85f_iftrue,
ctrl_MUX_uxn_device_h_l95_c2_c85f_iffalse,
ctrl_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- is_sprite_port_MUX_uxn_device_h_l95_c2_c85f
is_sprite_port_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_cond,
is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iftrue,
is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iffalse,
is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- color_MUX_uxn_device_h_l95_c2_c85f
color_MUX_uxn_device_h_l95_c2_c85f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l95_c2_c85f_cond,
color_MUX_uxn_device_h_l95_c2_c85f_iftrue,
color_MUX_uxn_device_h_l95_c2_c85f_iffalse,
color_MUX_uxn_device_h_l95_c2_c85f_return_output);

-- BIN_OP_EQ_uxn_device_h_l96_c19_52e2
BIN_OP_EQ_uxn_device_h_l96_c19_52e2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l96_c19_52e2_left,
BIN_OP_EQ_uxn_device_h_l96_c19_52e2_right,
BIN_OP_EQ_uxn_device_h_l96_c19_52e2_return_output);

-- MUX_uxn_device_h_l96_c19_feec
MUX_uxn_device_h_l96_c19_feec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c19_feec_cond,
MUX_uxn_device_h_l96_c19_feec_iftrue,
MUX_uxn_device_h_l96_c19_feec_iffalse,
MUX_uxn_device_h_l96_c19_feec_return_output);

-- BIN_OP_EQ_uxn_device_h_l97_c20_9268
BIN_OP_EQ_uxn_device_h_l97_c20_9268 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l97_c20_9268_left,
BIN_OP_EQ_uxn_device_h_l97_c20_9268_right,
BIN_OP_EQ_uxn_device_h_l97_c20_9268_return_output);

-- MUX_uxn_device_h_l97_c20_0ea0
MUX_uxn_device_h_l97_c20_0ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l97_c20_0ea0_cond,
MUX_uxn_device_h_l97_c20_0ea0_iftrue,
MUX_uxn_device_h_l97_c20_0ea0_iffalse,
MUX_uxn_device_h_l97_c20_0ea0_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c21_6364
BIN_OP_OR_uxn_device_h_l98_c21_6364 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c21_6364_left,
BIN_OP_OR_uxn_device_h_l98_c21_6364_right,
BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e
result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e
result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_cond,
result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_return_output);

-- MUX_uxn_device_h_l103_c32_9a99
MUX_uxn_device_h_l103_c32_9a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l103_c32_9a99_cond,
MUX_uxn_device_h_l103_c32_9a99_iftrue,
MUX_uxn_device_h_l103_c32_9a99_iffalse,
MUX_uxn_device_h_l103_c32_9a99_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c11_6fd6
BIN_OP_EQ_uxn_device_h_l109_c11_6fd6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_left,
BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_right,
BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_return_output);

-- ram_addr_MUX_uxn_device_h_l109_c7_e187
ram_addr_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l109_c7_e187_cond,
ram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue,
ram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse,
ram_addr_MUX_uxn_device_h_l109_c7_e187_return_output);

-- y_MUX_uxn_device_h_l109_c7_e187
y_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l109_c7_e187_cond,
y_MUX_uxn_device_h_l109_c7_e187_iftrue,
y_MUX_uxn_device_h_l109_c7_e187_iffalse,
y_MUX_uxn_device_h_l109_c7_e187_return_output);

-- result_MUX_uxn_device_h_l109_c7_e187
result_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l109_c7_e187_cond,
result_MUX_uxn_device_h_l109_c7_e187_iftrue,
result_MUX_uxn_device_h_l109_c7_e187_iffalse,
result_MUX_uxn_device_h_l109_c7_e187_return_output);

-- flip_x_MUX_uxn_device_h_l109_c7_e187
flip_x_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l109_c7_e187_cond,
flip_x_MUX_uxn_device_h_l109_c7_e187_iftrue,
flip_x_MUX_uxn_device_h_l109_c7_e187_iffalse,
flip_x_MUX_uxn_device_h_l109_c7_e187_return_output);

-- layer_MUX_uxn_device_h_l109_c7_e187
layer_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l109_c7_e187_cond,
layer_MUX_uxn_device_h_l109_c7_e187_iftrue,
layer_MUX_uxn_device_h_l109_c7_e187_iffalse,
layer_MUX_uxn_device_h_l109_c7_e187_return_output);

-- vram_addr_MUX_uxn_device_h_l109_c7_e187
vram_addr_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l109_c7_e187_cond,
vram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue,
vram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse,
vram_addr_MUX_uxn_device_h_l109_c7_e187_return_output);

-- x_MUX_uxn_device_h_l109_c7_e187
x_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l109_c7_e187_cond,
x_MUX_uxn_device_h_l109_c7_e187_iftrue,
x_MUX_uxn_device_h_l109_c7_e187_iffalse,
x_MUX_uxn_device_h_l109_c7_e187_return_output);

-- auto_advance_MUX_uxn_device_h_l109_c7_e187
auto_advance_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l109_c7_e187_cond,
auto_advance_MUX_uxn_device_h_l109_c7_e187_iftrue,
auto_advance_MUX_uxn_device_h_l109_c7_e187_iffalse,
auto_advance_MUX_uxn_device_h_l109_c7_e187_return_output);

-- flip_y_MUX_uxn_device_h_l109_c7_e187
flip_y_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l109_c7_e187_cond,
flip_y_MUX_uxn_device_h_l109_c7_e187_iftrue,
flip_y_MUX_uxn_device_h_l109_c7_e187_iffalse,
flip_y_MUX_uxn_device_h_l109_c7_e187_return_output);

-- ctrl_mode_MUX_uxn_device_h_l109_c7_e187
ctrl_mode_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l109_c7_e187_cond,
ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iftrue,
ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iffalse,
ctrl_mode_MUX_uxn_device_h_l109_c7_e187_return_output);

-- ctrl_MUX_uxn_device_h_l109_c7_e187
ctrl_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l109_c7_e187_cond,
ctrl_MUX_uxn_device_h_l109_c7_e187_iftrue,
ctrl_MUX_uxn_device_h_l109_c7_e187_iffalse,
ctrl_MUX_uxn_device_h_l109_c7_e187_return_output);

-- color_MUX_uxn_device_h_l109_c7_e187
color_MUX_uxn_device_h_l109_c7_e187 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l109_c7_e187_cond,
color_MUX_uxn_device_h_l109_c7_e187_iftrue,
color_MUX_uxn_device_h_l109_c7_e187_iffalse,
color_MUX_uxn_device_h_l109_c7_e187_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09
result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_cond,
result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iftrue,
result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iffalse,
result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_2767
BIN_OP_EQ_uxn_device_h_l114_c11_2767 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_2767_left,
BIN_OP_EQ_uxn_device_h_l114_c11_2767_right,
BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_return_output);

-- ram_addr_MUX_uxn_device_h_l114_c7_2337
ram_addr_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l114_c7_2337_cond,
ram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue,
ram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse,
ram_addr_MUX_uxn_device_h_l114_c7_2337_return_output);

-- y_MUX_uxn_device_h_l114_c7_2337
y_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_2337_cond,
y_MUX_uxn_device_h_l114_c7_2337_iftrue,
y_MUX_uxn_device_h_l114_c7_2337_iffalse,
y_MUX_uxn_device_h_l114_c7_2337_return_output);

-- result_MUX_uxn_device_h_l114_c7_2337
result_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l114_c7_2337_cond,
result_MUX_uxn_device_h_l114_c7_2337_iftrue,
result_MUX_uxn_device_h_l114_c7_2337_iffalse,
result_MUX_uxn_device_h_l114_c7_2337_return_output);

-- flip_x_MUX_uxn_device_h_l114_c7_2337
flip_x_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l114_c7_2337_cond,
flip_x_MUX_uxn_device_h_l114_c7_2337_iftrue,
flip_x_MUX_uxn_device_h_l114_c7_2337_iffalse,
flip_x_MUX_uxn_device_h_l114_c7_2337_return_output);

-- layer_MUX_uxn_device_h_l114_c7_2337
layer_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l114_c7_2337_cond,
layer_MUX_uxn_device_h_l114_c7_2337_iftrue,
layer_MUX_uxn_device_h_l114_c7_2337_iffalse,
layer_MUX_uxn_device_h_l114_c7_2337_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_2337
vram_addr_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_2337_cond,
vram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_2337_return_output);

-- x_MUX_uxn_device_h_l114_c7_2337
x_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l114_c7_2337_cond,
x_MUX_uxn_device_h_l114_c7_2337_iftrue,
x_MUX_uxn_device_h_l114_c7_2337_iffalse,
x_MUX_uxn_device_h_l114_c7_2337_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_2337
auto_advance_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_2337_cond,
auto_advance_MUX_uxn_device_h_l114_c7_2337_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_2337_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_2337_return_output);

-- flip_y_MUX_uxn_device_h_l114_c7_2337
flip_y_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l114_c7_2337_cond,
flip_y_MUX_uxn_device_h_l114_c7_2337_iftrue,
flip_y_MUX_uxn_device_h_l114_c7_2337_iffalse,
flip_y_MUX_uxn_device_h_l114_c7_2337_return_output);

-- ctrl_mode_MUX_uxn_device_h_l114_c7_2337
ctrl_mode_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l114_c7_2337_cond,
ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iftrue,
ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iffalse,
ctrl_mode_MUX_uxn_device_h_l114_c7_2337_return_output);

-- ctrl_MUX_uxn_device_h_l114_c7_2337
ctrl_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l114_c7_2337_cond,
ctrl_MUX_uxn_device_h_l114_c7_2337_iftrue,
ctrl_MUX_uxn_device_h_l114_c7_2337_iffalse,
ctrl_MUX_uxn_device_h_l114_c7_2337_return_output);

-- color_MUX_uxn_device_h_l114_c7_2337
color_MUX_uxn_device_h_l114_c7_2337 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l114_c7_2337_cond,
color_MUX_uxn_device_h_l114_c7_2337_iftrue,
color_MUX_uxn_device_h_l114_c7_2337_iffalse,
color_MUX_uxn_device_h_l114_c7_2337_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e
result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_return_output);

-- flip_x_MUX_uxn_device_h_l115_c3_ac2e
flip_x_MUX_uxn_device_h_l115_c3_ac2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l115_c3_ac2e_cond,
flip_x_MUX_uxn_device_h_l115_c3_ac2e_iftrue,
flip_x_MUX_uxn_device_h_l115_c3_ac2e_iffalse,
flip_x_MUX_uxn_device_h_l115_c3_ac2e_return_output);

-- layer_MUX_uxn_device_h_l115_c3_ac2e
layer_MUX_uxn_device_h_l115_c3_ac2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l115_c3_ac2e_cond,
layer_MUX_uxn_device_h_l115_c3_ac2e_iftrue,
layer_MUX_uxn_device_h_l115_c3_ac2e_iffalse,
layer_MUX_uxn_device_h_l115_c3_ac2e_return_output);

-- flip_y_MUX_uxn_device_h_l115_c3_ac2e
flip_y_MUX_uxn_device_h_l115_c3_ac2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l115_c3_ac2e_cond,
flip_y_MUX_uxn_device_h_l115_c3_ac2e_iftrue,
flip_y_MUX_uxn_device_h_l115_c3_ac2e_iffalse,
flip_y_MUX_uxn_device_h_l115_c3_ac2e_return_output);

-- ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e
ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_cond,
ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iftrue,
ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iffalse,
ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_return_output);

-- ctrl_MUX_uxn_device_h_l115_c3_ac2e
ctrl_MUX_uxn_device_h_l115_c3_ac2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l115_c3_ac2e_cond,
ctrl_MUX_uxn_device_h_l115_c3_ac2e_iftrue,
ctrl_MUX_uxn_device_h_l115_c3_ac2e_iffalse,
ctrl_MUX_uxn_device_h_l115_c3_ac2e_return_output);

-- color_MUX_uxn_device_h_l115_c3_ac2e
color_MUX_uxn_device_h_l115_c3_ac2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l115_c3_ac2e_cond,
color_MUX_uxn_device_h_l115_c3_ac2e_iftrue,
color_MUX_uxn_device_h_l115_c3_ac2e_iffalse,
color_MUX_uxn_device_h_l115_c3_ac2e_return_output);

-- CONST_SR_7_uxn_device_h_l118_c26_cb52
CONST_SR_7_uxn_device_h_l118_c26_cb52 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l118_c26_cb52_x,
CONST_SR_7_uxn_device_h_l118_c26_cb52_return_output);

-- CONST_SR_6_uxn_device_h_l119_c22_1bfd
CONST_SR_6_uxn_device_h_l119_c22_1bfd : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l119_c22_1bfd_x,
CONST_SR_6_uxn_device_h_l119_c22_1bfd_return_output);

-- CONST_SR_5_uxn_device_h_l120_c23_2e3c
CONST_SR_5_uxn_device_h_l120_c23_2e3c : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l120_c23_2e3c_x,
CONST_SR_5_uxn_device_h_l120_c23_2e3c_return_output);

-- CONST_SR_4_uxn_device_h_l121_c23_0f8e
CONST_SR_4_uxn_device_h_l121_c23_0f8e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l121_c23_0f8e_x,
CONST_SR_4_uxn_device_h_l121_c23_0f8e_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_604d
BIN_OP_EQ_uxn_device_h_l125_c11_604d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_604d_left,
BIN_OP_EQ_uxn_device_h_l125_c11_604d_right,
BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_return_output);

-- ram_addr_MUX_uxn_device_h_l125_c7_3e72
ram_addr_MUX_uxn_device_h_l125_c7_3e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l125_c7_3e72_cond,
ram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue,
ram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse,
ram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output);

-- y_MUX_uxn_device_h_l125_c7_3e72
y_MUX_uxn_device_h_l125_c7_3e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_3e72_cond,
y_MUX_uxn_device_h_l125_c7_3e72_iftrue,
y_MUX_uxn_device_h_l125_c7_3e72_iffalse,
y_MUX_uxn_device_h_l125_c7_3e72_return_output);

-- result_MUX_uxn_device_h_l125_c7_3e72
result_MUX_uxn_device_h_l125_c7_3e72 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l125_c7_3e72_cond,
result_MUX_uxn_device_h_l125_c7_3e72_iftrue,
result_MUX_uxn_device_h_l125_c7_3e72_iffalse,
result_MUX_uxn_device_h_l125_c7_3e72_return_output);

-- vram_addr_MUX_uxn_device_h_l125_c7_3e72
vram_addr_MUX_uxn_device_h_l125_c7_3e72 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l125_c7_3e72_cond,
vram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue,
vram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse,
vram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output);

-- x_MUX_uxn_device_h_l125_c7_3e72
x_MUX_uxn_device_h_l125_c7_3e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l125_c7_3e72_cond,
x_MUX_uxn_device_h_l125_c7_3e72_iftrue,
x_MUX_uxn_device_h_l125_c7_3e72_iffalse,
x_MUX_uxn_device_h_l125_c7_3e72_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_3e72
auto_advance_MUX_uxn_device_h_l125_c7_3e72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_3e72_cond,
auto_advance_MUX_uxn_device_h_l125_c7_3e72_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_3e72_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_3e72_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9
result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_return_output);

-- x_MUX_uxn_device_h_l126_c3_bba9
x_MUX_uxn_device_h_l126_c3_bba9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l126_c3_bba9_cond,
x_MUX_uxn_device_h_l126_c3_bba9_iftrue,
x_MUX_uxn_device_h_l126_c3_bba9_iffalse,
x_MUX_uxn_device_h_l126_c3_bba9_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c11_3e1f
BIN_OP_EQ_uxn_device_h_l132_c11_3e1f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_left,
BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_right,
BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_return_output);

-- ram_addr_MUX_uxn_device_h_l132_c7_83ea
ram_addr_MUX_uxn_device_h_l132_c7_83ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l132_c7_83ea_cond,
ram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue,
ram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse,
ram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output);

-- y_MUX_uxn_device_h_l132_c7_83ea
y_MUX_uxn_device_h_l132_c7_83ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l132_c7_83ea_cond,
y_MUX_uxn_device_h_l132_c7_83ea_iftrue,
y_MUX_uxn_device_h_l132_c7_83ea_iffalse,
y_MUX_uxn_device_h_l132_c7_83ea_return_output);

-- result_MUX_uxn_device_h_l132_c7_83ea
result_MUX_uxn_device_h_l132_c7_83ea : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l132_c7_83ea_cond,
result_MUX_uxn_device_h_l132_c7_83ea_iftrue,
result_MUX_uxn_device_h_l132_c7_83ea_iffalse,
result_MUX_uxn_device_h_l132_c7_83ea_return_output);

-- vram_addr_MUX_uxn_device_h_l132_c7_83ea
vram_addr_MUX_uxn_device_h_l132_c7_83ea : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l132_c7_83ea_cond,
vram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue,
vram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse,
vram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output);

-- x_MUX_uxn_device_h_l132_c7_83ea
x_MUX_uxn_device_h_l132_c7_83ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l132_c7_83ea_cond,
x_MUX_uxn_device_h_l132_c7_83ea_iftrue,
x_MUX_uxn_device_h_l132_c7_83ea_iffalse,
x_MUX_uxn_device_h_l132_c7_83ea_return_output);

-- auto_advance_MUX_uxn_device_h_l132_c7_83ea
auto_advance_MUX_uxn_device_h_l132_c7_83ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l132_c7_83ea_cond,
auto_advance_MUX_uxn_device_h_l132_c7_83ea_iftrue,
auto_advance_MUX_uxn_device_h_l132_c7_83ea_iffalse,
auto_advance_MUX_uxn_device_h_l132_c7_83ea_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c3_9349
result_device_ram_address_MUX_uxn_device_h_l133_c3_9349 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_return_output);

-- x_MUX_uxn_device_h_l133_c3_9349
x_MUX_uxn_device_h_l133_c3_9349 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l133_c3_9349_cond,
x_MUX_uxn_device_h_l133_c3_9349_iftrue,
x_MUX_uxn_device_h_l133_c3_9349_iffalse,
x_MUX_uxn_device_h_l133_c3_9349_return_output);

-- BIN_OP_OR_uxn_device_h_l134_c4_1eed
BIN_OP_OR_uxn_device_h_l134_c4_1eed : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l134_c4_1eed_left,
BIN_OP_OR_uxn_device_h_l134_c4_1eed_right,
BIN_OP_OR_uxn_device_h_l134_c4_1eed_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c11_fee2
BIN_OP_EQ_uxn_device_h_l138_c11_fee2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c11_fee2_left,
BIN_OP_EQ_uxn_device_h_l138_c11_fee2_right,
BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_return_output);

-- ram_addr_MUX_uxn_device_h_l138_c7_6dc2
ram_addr_MUX_uxn_device_h_l138_c7_6dc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond,
ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue,
ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse,
ram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output);

-- y_MUX_uxn_device_h_l138_c7_6dc2
y_MUX_uxn_device_h_l138_c7_6dc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c7_6dc2_cond,
y_MUX_uxn_device_h_l138_c7_6dc2_iftrue,
y_MUX_uxn_device_h_l138_c7_6dc2_iffalse,
y_MUX_uxn_device_h_l138_c7_6dc2_return_output);

-- result_MUX_uxn_device_h_l138_c7_6dc2
result_MUX_uxn_device_h_l138_c7_6dc2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l138_c7_6dc2_cond,
result_MUX_uxn_device_h_l138_c7_6dc2_iftrue,
result_MUX_uxn_device_h_l138_c7_6dc2_iffalse,
result_MUX_uxn_device_h_l138_c7_6dc2_return_output);

-- vram_addr_MUX_uxn_device_h_l138_c7_6dc2
vram_addr_MUX_uxn_device_h_l138_c7_6dc2 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond,
vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue,
vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse,
vram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output);

-- x_MUX_uxn_device_h_l138_c7_6dc2
x_MUX_uxn_device_h_l138_c7_6dc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l138_c7_6dc2_cond,
x_MUX_uxn_device_h_l138_c7_6dc2_iftrue,
x_MUX_uxn_device_h_l138_c7_6dc2_iffalse,
x_MUX_uxn_device_h_l138_c7_6dc2_return_output);

-- auto_advance_MUX_uxn_device_h_l138_c7_6dc2
auto_advance_MUX_uxn_device_h_l138_c7_6dc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l138_c7_6dc2_cond,
auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iftrue,
auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iffalse,
auto_advance_MUX_uxn_device_h_l138_c7_6dc2_return_output);

-- y_MUX_uxn_device_h_l139_c3_4fb1
y_MUX_uxn_device_h_l139_c3_4fb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l139_c3_4fb1_cond,
y_MUX_uxn_device_h_l139_c3_4fb1_iftrue,
y_MUX_uxn_device_h_l139_c3_4fb1_iffalse,
y_MUX_uxn_device_h_l139_c3_4fb1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1
result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_cond,
result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_6849
BIN_OP_EQ_uxn_device_h_l145_c11_6849 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_6849_left,
BIN_OP_EQ_uxn_device_h_l145_c11_6849_right,
BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_return_output);

-- ram_addr_MUX_uxn_device_h_l145_c7_5fb2
ram_addr_MUX_uxn_device_h_l145_c7_5fb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond,
ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue,
ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse,
ram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output);

-- y_MUX_uxn_device_h_l145_c7_5fb2
y_MUX_uxn_device_h_l145_c7_5fb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l145_c7_5fb2_cond,
y_MUX_uxn_device_h_l145_c7_5fb2_iftrue,
y_MUX_uxn_device_h_l145_c7_5fb2_iffalse,
y_MUX_uxn_device_h_l145_c7_5fb2_return_output);

-- result_MUX_uxn_device_h_l145_c7_5fb2
result_MUX_uxn_device_h_l145_c7_5fb2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l145_c7_5fb2_cond,
result_MUX_uxn_device_h_l145_c7_5fb2_iftrue,
result_MUX_uxn_device_h_l145_c7_5fb2_iffalse,
result_MUX_uxn_device_h_l145_c7_5fb2_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_5fb2
vram_addr_MUX_uxn_device_h_l145_c7_5fb2 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond,
vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output);

-- x_MUX_uxn_device_h_l145_c7_5fb2
x_MUX_uxn_device_h_l145_c7_5fb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l145_c7_5fb2_cond,
x_MUX_uxn_device_h_l145_c7_5fb2_iftrue,
x_MUX_uxn_device_h_l145_c7_5fb2_iffalse,
x_MUX_uxn_device_h_l145_c7_5fb2_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_5fb2
auto_advance_MUX_uxn_device_h_l145_c7_5fb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_5fb2_cond,
auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_5fb2_return_output);

-- y_MUX_uxn_device_h_l146_c3_b47a
y_MUX_uxn_device_h_l146_c3_b47a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l146_c3_b47a_cond,
y_MUX_uxn_device_h_l146_c3_b47a_iftrue,
y_MUX_uxn_device_h_l146_c3_b47a_iffalse,
y_MUX_uxn_device_h_l146_c3_b47a_return_output);

-- BIN_OP_OR_uxn_device_h_l147_c4_acb5
BIN_OP_OR_uxn_device_h_l147_c4_acb5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l147_c4_acb5_left,
BIN_OP_OR_uxn_device_h_l147_c4_acb5_right,
BIN_OP_OR_uxn_device_h_l147_c4_acb5_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c11_351a
BIN_OP_EQ_uxn_device_h_l150_c11_351a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c11_351a_left,
BIN_OP_EQ_uxn_device_h_l150_c11_351a_right,
BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_return_output);

-- ram_addr_MUX_uxn_device_h_l150_c7_7d97
ram_addr_MUX_uxn_device_h_l150_c7_7d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l150_c7_7d97_cond,
ram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue,
ram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse,
ram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output);

-- result_MUX_uxn_device_h_l150_c7_7d97
result_MUX_uxn_device_h_l150_c7_7d97 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l150_c7_7d97_cond,
result_MUX_uxn_device_h_l150_c7_7d97_iftrue,
result_MUX_uxn_device_h_l150_c7_7d97_iffalse,
result_MUX_uxn_device_h_l150_c7_7d97_return_output);

-- vram_addr_MUX_uxn_device_h_l150_c7_7d97
vram_addr_MUX_uxn_device_h_l150_c7_7d97 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l150_c7_7d97_cond,
vram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue,
vram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse,
vram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output);

-- x_MUX_uxn_device_h_l150_c7_7d97
x_MUX_uxn_device_h_l150_c7_7d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l150_c7_7d97_cond,
x_MUX_uxn_device_h_l150_c7_7d97_iftrue,
x_MUX_uxn_device_h_l150_c7_7d97_iffalse,
x_MUX_uxn_device_h_l150_c7_7d97_return_output);

-- auto_advance_MUX_uxn_device_h_l150_c7_7d97
auto_advance_MUX_uxn_device_h_l150_c7_7d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l150_c7_7d97_cond,
auto_advance_MUX_uxn_device_h_l150_c7_7d97_iftrue,
auto_advance_MUX_uxn_device_h_l150_c7_7d97_iffalse,
auto_advance_MUX_uxn_device_h_l150_c7_7d97_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c3_9123
result_device_ram_address_MUX_uxn_device_h_l151_c3_9123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_cond,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c3_9123
result_is_vram_write_MUX_uxn_device_h_l151_c3_9123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_return_output);

-- result_u8_value_MUX_uxn_device_h_l151_c3_9123
result_u8_value_MUX_uxn_device_h_l151_c3_9123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l151_c3_9123_cond,
result_u8_value_MUX_uxn_device_h_l151_c3_9123_iftrue,
result_u8_value_MUX_uxn_device_h_l151_c3_9123_iffalse,
result_u8_value_MUX_uxn_device_h_l151_c3_9123_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c3_9123
result_vram_address_MUX_uxn_device_h_l151_c3_9123 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c3_9123_cond,
result_vram_address_MUX_uxn_device_h_l151_c3_9123_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c3_9123_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c3_9123_return_output);

-- vram_addr_MUX_uxn_device_h_l151_c3_9123
vram_addr_MUX_uxn_device_h_l151_c3_9123 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l151_c3_9123_cond,
vram_addr_MUX_uxn_device_h_l151_c3_9123_iftrue,
vram_addr_MUX_uxn_device_h_l151_c3_9123_iffalse,
vram_addr_MUX_uxn_device_h_l151_c3_9123_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c3_9123
auto_advance_MUX_uxn_device_h_l151_c3_9123 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c3_9123_cond,
auto_advance_MUX_uxn_device_h_l151_c3_9123_iftrue,
auto_advance_MUX_uxn_device_h_l151_c3_9123_iffalse,
auto_advance_MUX_uxn_device_h_l151_c3_9123_return_output);

-- BIN_OP_AND_uxn_device_h_l154_c32_76fe
BIN_OP_AND_uxn_device_h_l154_c32_76fe : entity work.BIN_OP_AND_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l154_c32_76fe_left,
BIN_OP_AND_uxn_device_h_l154_c32_76fe_right,
BIN_OP_AND_uxn_device_h_l154_c32_76fe_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l156_c4_625a
result_is_vram_write_MUX_uxn_device_h_l156_c4_625a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_cond,
result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_return_output);

-- result_vram_address_MUX_uxn_device_h_l156_c4_625a
result_vram_address_MUX_uxn_device_h_l156_c4_625a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l156_c4_625a_cond,
result_vram_address_MUX_uxn_device_h_l156_c4_625a_iftrue,
result_vram_address_MUX_uxn_device_h_l156_c4_625a_iffalse,
result_vram_address_MUX_uxn_device_h_l156_c4_625a_return_output);

-- vram_addr_MUX_uxn_device_h_l156_c4_625a
vram_addr_MUX_uxn_device_h_l156_c4_625a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l156_c4_625a_cond,
vram_addr_MUX_uxn_device_h_l156_c4_625a_iftrue,
vram_addr_MUX_uxn_device_h_l156_c4_625a_iffalse,
vram_addr_MUX_uxn_device_h_l156_c4_625a_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04 : entity work.BIN_OP_INFERRED_MULT_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe
BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe : entity work.BIN_OP_PLUS_uint48_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_left,
BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_right,
BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_return_output);

-- BIN_OP_AND_uxn_device_h_l158_c5_53ee
BIN_OP_AND_uxn_device_h_l158_c5_53ee : entity work.BIN_OP_AND_uint24_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l158_c5_53ee_left,
BIN_OP_AND_uxn_device_h_l158_c5_53ee_right,
BIN_OP_AND_uxn_device_h_l158_c5_53ee_return_output);

-- MUX_uxn_device_h_l159_c19_4976
MUX_uxn_device_h_l159_c19_4976 : entity work.MUX_uint1_t_uint20_t_uint20_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l159_c19_4976_cond,
MUX_uxn_device_h_l159_c19_4976_iftrue,
MUX_uxn_device_h_l159_c19_4976_iffalse,
MUX_uxn_device_h_l159_c19_4976_return_output);

-- BIN_OP_OR_uxn_device_h_l159_c5_00db
BIN_OP_OR_uxn_device_h_l159_c5_00db : entity work.BIN_OP_OR_uint24_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l159_c5_00db_left,
BIN_OP_OR_uxn_device_h_l159_c5_00db_right,
BIN_OP_OR_uxn_device_h_l159_c5_00db_return_output);

-- MUX_uxn_device_h_l160_c19_b931
MUX_uxn_device_h_l160_c19_b931 : entity work.MUX_uint1_t_uint19_t_uint19_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l160_c19_b931_cond,
MUX_uxn_device_h_l160_c19_b931_iftrue,
MUX_uxn_device_h_l160_c19_b931_iffalse,
MUX_uxn_device_h_l160_c19_b931_return_output);

-- BIN_OP_OR_uxn_device_h_l160_c5_3e8c
BIN_OP_OR_uxn_device_h_l160_c5_3e8c : entity work.BIN_OP_OR_uint24_t_uint19_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l160_c5_3e8c_left,
BIN_OP_OR_uxn_device_h_l160_c5_3e8c_right,
BIN_OP_OR_uxn_device_h_l160_c5_3e8c_return_output);

-- BIN_OP_OR_uxn_device_h_l161_c5_311b
BIN_OP_OR_uxn_device_h_l161_c5_311b : entity work.BIN_OP_OR_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l161_c5_311b_left,
BIN_OP_OR_uxn_device_h_l161_c5_311b_right,
BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b : entity work.BIN_OP_INFERRED_MULT_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l165_c28_2438
BIN_OP_PLUS_uxn_device_h_l165_c28_2438 : entity work.BIN_OP_PLUS_uint48_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l165_c28_2438_left,
BIN_OP_PLUS_uxn_device_h_l165_c28_2438_right,
BIN_OP_PLUS_uxn_device_h_l165_c28_2438_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1
result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c8_92c1
auto_advance_MUX_uxn_device_h_l169_c8_92c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c8_92c1_cond,
auto_advance_MUX_uxn_device_h_l169_c8_92c1_iftrue,
auto_advance_MUX_uxn_device_h_l169_c8_92c1_iffalse,
auto_advance_MUX_uxn_device_h_l169_c8_92c1_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c11_6bbb
BIN_OP_EQ_uxn_device_h_l174_c11_6bbb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_left,
BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_right,
BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_return_output);

-- ram_addr_MUX_uxn_device_h_l174_c7_d18b
ram_addr_MUX_uxn_device_h_l174_c7_d18b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l174_c7_d18b_cond,
ram_addr_MUX_uxn_device_h_l174_c7_d18b_iftrue,
ram_addr_MUX_uxn_device_h_l174_c7_d18b_iffalse,
ram_addr_MUX_uxn_device_h_l174_c7_d18b_return_output);

-- result_MUX_uxn_device_h_l174_c7_d18b
result_MUX_uxn_device_h_l174_c7_d18b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c7_d18b_cond,
result_MUX_uxn_device_h_l174_c7_d18b_iftrue,
result_MUX_uxn_device_h_l174_c7_d18b_iffalse,
result_MUX_uxn_device_h_l174_c7_d18b_return_output);

-- x_MUX_uxn_device_h_l174_c7_d18b
x_MUX_uxn_device_h_l174_c7_d18b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l174_c7_d18b_cond,
x_MUX_uxn_device_h_l174_c7_d18b_iftrue,
x_MUX_uxn_device_h_l174_c7_d18b_iffalse,
x_MUX_uxn_device_h_l174_c7_d18b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62
result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_cond,
result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue,
result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse,
result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62
result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_cond,
result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue,
result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse,
result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62
result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_cond,
result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iftrue,
result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iffalse,
result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_return_output);

-- result_u8_value_MUX_uxn_device_h_l175_c3_3f62
result_u8_value_MUX_uxn_device_h_l175_c3_3f62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l175_c3_3f62_cond,
result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iftrue,
result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iffalse,
result_u8_value_MUX_uxn_device_h_l175_c3_3f62_return_output);

-- result_vram_address_MUX_uxn_device_h_l175_c3_3f62
result_vram_address_MUX_uxn_device_h_l175_c3_3f62 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l175_c3_3f62_cond,
result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue,
result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse,
result_vram_address_MUX_uxn_device_h_l175_c3_3f62_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_cond,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_return_output);

-- x_MUX_uxn_device_h_l175_c3_3f62
x_MUX_uxn_device_h_l175_c3_3f62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l175_c3_3f62_cond,
x_MUX_uxn_device_h_l175_c3_3f62_iftrue,
x_MUX_uxn_device_h_l175_c3_3f62_iffalse,
x_MUX_uxn_device_h_l175_c3_3f62_return_output);

-- UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0
UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_expr,
UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff
result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff
result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_cond,
result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iftrue,
result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iffalse,
result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c4_d6ff
result_u8_value_MUX_uxn_device_h_l180_c4_d6ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_cond,
result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_return_output);

-- x_MUX_uxn_device_h_l180_c4_d6ff
x_MUX_uxn_device_h_l180_c4_d6ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l180_c4_d6ff_cond,
x_MUX_uxn_device_h_l180_c4_d6ff_iftrue,
x_MUX_uxn_device_h_l180_c4_d6ff_iffalse,
x_MUX_uxn_device_h_l180_c4_d6ff_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c9_1d73
BIN_OP_AND_uxn_device_h_l181_c9_1d73 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c9_1d73_left,
BIN_OP_AND_uxn_device_h_l181_c9_1d73_right,
BIN_OP_AND_uxn_device_h_l181_c9_1d73_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed
result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c5_9aed
result_u8_value_MUX_uxn_device_h_l181_c5_9aed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c5_9aed_cond,
result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c5_9aed_return_output);

-- x_MUX_uxn_device_h_l181_c5_9aed
x_MUX_uxn_device_h_l181_c5_9aed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c5_9aed_cond,
x_MUX_uxn_device_h_l181_c5_9aed_iftrue,
x_MUX_uxn_device_h_l181_c5_9aed_iffalse,
x_MUX_uxn_device_h_l181_c5_9aed_return_output);

-- BIN_OP_PLUS_uxn_device_h_l182_c6_7523
BIN_OP_PLUS_uxn_device_h_l182_c6_7523 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l182_c6_7523_left,
BIN_OP_PLUS_uxn_device_h_l182_c6_7523_right,
BIN_OP_PLUS_uxn_device_h_l182_c6_7523_return_output);

-- CONST_SR_8_uxn_device_h_l185_c34_c428
CONST_SR_8_uxn_device_h_l185_c34_c428 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l185_c34_c428_x,
CONST_SR_8_uxn_device_h_l185_c34_c428_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l191_c8_a901
result_device_ram_address_MUX_uxn_device_h_l191_c8_a901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_cond,
result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iftrue,
result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iffalse,
result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c11_6082
BIN_OP_EQ_uxn_device_h_l195_c11_6082 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c11_6082_left,
BIN_OP_EQ_uxn_device_h_l195_c11_6082_right,
BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_return_output);

-- ram_addr_MUX_uxn_device_h_l195_c7_5eea
ram_addr_MUX_uxn_device_h_l195_c7_5eea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l195_c7_5eea_cond,
ram_addr_MUX_uxn_device_h_l195_c7_5eea_iftrue,
ram_addr_MUX_uxn_device_h_l195_c7_5eea_iffalse,
ram_addr_MUX_uxn_device_h_l195_c7_5eea_return_output);

-- result_MUX_uxn_device_h_l195_c7_5eea
result_MUX_uxn_device_h_l195_c7_5eea : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l195_c7_5eea_cond,
result_MUX_uxn_device_h_l195_c7_5eea_iftrue,
result_MUX_uxn_device_h_l195_c7_5eea_iffalse,
result_MUX_uxn_device_h_l195_c7_5eea_return_output);

-- ram_addr_MUX_uxn_device_h_l196_c3_8f67
ram_addr_MUX_uxn_device_h_l196_c3_8f67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l196_c3_8f67_cond,
ram_addr_MUX_uxn_device_h_l196_c3_8f67_iftrue,
ram_addr_MUX_uxn_device_h_l196_c3_8f67_iffalse,
ram_addr_MUX_uxn_device_h_l196_c3_8f67_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67
result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_cond,
result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iftrue,
result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iffalse,
result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_cond,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_return_output);

-- result_u8_value_MUX_uxn_device_h_l196_c3_8f67
result_u8_value_MUX_uxn_device_h_l196_c3_8f67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l196_c3_8f67_cond,
result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iftrue,
result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iffalse,
result_u8_value_MUX_uxn_device_h_l196_c3_8f67_return_output);

-- BIN_OP_AND_uxn_device_h_l197_c8_3d48
BIN_OP_AND_uxn_device_h_l197_c8_3d48 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l197_c8_3d48_left,
BIN_OP_AND_uxn_device_h_l197_c8_3d48_right,
BIN_OP_AND_uxn_device_h_l197_c8_3d48_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l197_c4_509b
result_device_ram_address_MUX_uxn_device_h_l197_c4_509b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_cond,
result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_return_output);

-- result_u8_value_MUX_uxn_device_h_l197_c4_509b
result_u8_value_MUX_uxn_device_h_l197_c4_509b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l197_c4_509b_cond,
result_u8_value_MUX_uxn_device_h_l197_c4_509b_iftrue,
result_u8_value_MUX_uxn_device_h_l197_c4_509b_iffalse,
result_u8_value_MUX_uxn_device_h_l197_c4_509b_return_output);

-- ram_addr_MUX_uxn_device_h_l203_c8_5cd3
ram_addr_MUX_uxn_device_h_l203_c8_5cd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l203_c8_5cd3_cond,
ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iftrue,
ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iffalse,
ram_addr_MUX_uxn_device_h_l203_c8_5cd3_return_output);

-- BIN_OP_EQ_uxn_device_h_l208_c11_5425
BIN_OP_EQ_uxn_device_h_l208_c11_5425 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l208_c11_5425_left,
BIN_OP_EQ_uxn_device_h_l208_c11_5425_right,
BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_return_output);

-- ram_addr_MUX_uxn_device_h_l208_c7_c979
ram_addr_MUX_uxn_device_h_l208_c7_c979 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l208_c7_c979_cond,
ram_addr_MUX_uxn_device_h_l208_c7_c979_iftrue,
ram_addr_MUX_uxn_device_h_l208_c7_c979_iffalse,
ram_addr_MUX_uxn_device_h_l208_c7_c979_return_output);

-- result_MUX_uxn_device_h_l208_c7_c979
result_MUX_uxn_device_h_l208_c7_c979 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l208_c7_c979_cond,
result_MUX_uxn_device_h_l208_c7_c979_iftrue,
result_MUX_uxn_device_h_l208_c7_c979_iffalse,
result_MUX_uxn_device_h_l208_c7_c979_return_output);

-- ram_addr_MUX_uxn_device_h_l209_c3_db96
ram_addr_MUX_uxn_device_h_l209_c3_db96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l209_c3_db96_cond,
ram_addr_MUX_uxn_device_h_l209_c3_db96_iftrue,
ram_addr_MUX_uxn_device_h_l209_c3_db96_iffalse,
ram_addr_MUX_uxn_device_h_l209_c3_db96_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l209_c3_db96
result_device_ram_address_MUX_uxn_device_h_l209_c3_db96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_cond,
result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iftrue,
result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iffalse,
result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_cond,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_return_output);

-- result_u8_value_MUX_uxn_device_h_l209_c3_db96
result_u8_value_MUX_uxn_device_h_l209_c3_db96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l209_c3_db96_cond,
result_u8_value_MUX_uxn_device_h_l209_c3_db96_iftrue,
result_u8_value_MUX_uxn_device_h_l209_c3_db96_iffalse,
result_u8_value_MUX_uxn_device_h_l209_c3_db96_return_output);

-- BIN_OP_AND_uxn_device_h_l210_c9_5372
BIN_OP_AND_uxn_device_h_l210_c9_5372 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l210_c9_5372_left,
BIN_OP_AND_uxn_device_h_l210_c9_5372_right,
BIN_OP_AND_uxn_device_h_l210_c9_5372_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5
result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_cond,
result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_cond,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_return_output);

-- result_u8_value_MUX_uxn_device_h_l210_c4_4ee5
result_u8_value_MUX_uxn_device_h_l210_c4_4ee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_cond,
result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iftrue,
result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iffalse,
result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_return_output);

-- CONST_SR_8_uxn_device_h_l213_c33_483b
CONST_SR_8_uxn_device_h_l213_c33_483b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l213_c33_483b_x,
CONST_SR_8_uxn_device_h_l213_c33_483b_return_output);

-- ram_addr_MUX_uxn_device_h_l216_c8_cb35
ram_addr_MUX_uxn_device_h_l216_c8_cb35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l216_c8_cb35_cond,
ram_addr_MUX_uxn_device_h_l216_c8_cb35_iftrue,
ram_addr_MUX_uxn_device_h_l216_c8_cb35_iffalse,
ram_addr_MUX_uxn_device_h_l216_c8_cb35_return_output);

-- BIN_OP_OR_uxn_device_h_l217_c4_c595
BIN_OP_OR_uxn_device_h_l217_c4_c595 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l217_c4_c595_left,
BIN_OP_OR_uxn_device_h_l217_c4_c595_right,
BIN_OP_OR_uxn_device_h_l217_c4_c595_return_output);

-- BIN_OP_EQ_uxn_device_h_l220_c11_2c37
BIN_OP_EQ_uxn_device_h_l220_c11_2c37 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l220_c11_2c37_left,
BIN_OP_EQ_uxn_device_h_l220_c11_2c37_right,
BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_return_output);

-- result_MUX_uxn_device_h_l220_c7_767e
result_MUX_uxn_device_h_l220_c7_767e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l220_c7_767e_cond,
result_MUX_uxn_device_h_l220_c7_767e_iftrue,
result_MUX_uxn_device_h_l220_c7_767e_iffalse,
result_MUX_uxn_device_h_l220_c7_767e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8
result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_cond,
result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_cond,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_return_output);

-- result_u8_value_MUX_uxn_device_h_l221_c3_bfb8
result_u8_value_MUX_uxn_device_h_l221_c3_bfb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_cond,
result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iftrue,
result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iffalse,
result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_return_output);

-- BIN_OP_AND_uxn_device_h_l222_c9_dd34
BIN_OP_AND_uxn_device_h_l222_c9_dd34 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l222_c9_dd34_left,
BIN_OP_AND_uxn_device_h_l222_c9_dd34_right,
BIN_OP_AND_uxn_device_h_l222_c9_dd34_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l222_c4_1566
result_device_ram_address_MUX_uxn_device_h_l222_c4_1566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_cond,
result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iftrue,
result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iffalse,
result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_cond,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_return_output);

-- result_u8_value_MUX_uxn_device_h_l222_c4_1566
result_u8_value_MUX_uxn_device_h_l222_c4_1566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l222_c4_1566_cond,
result_u8_value_MUX_uxn_device_h_l222_c4_1566_iftrue,
result_u8_value_MUX_uxn_device_h_l222_c4_1566_iffalse,
result_u8_value_MUX_uxn_device_h_l222_c4_1566_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_return_output);

-- result_MUX_uxn_device_h_l230_c3_d854
result_MUX_uxn_device_h_l230_c3_d854 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l230_c3_d854_cond,
result_MUX_uxn_device_h_l230_c3_d854_iftrue,
result_MUX_uxn_device_h_l230_c3_d854_iffalse,
result_MUX_uxn_device_h_l230_c3_d854_return_output);

-- BIN_OP_MINUS_uxn_device_h_l231_c58_299d
BIN_OP_MINUS_uxn_device_h_l231_c58_299d : entity work.BIN_OP_MINUS_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l231_c58_299d_left,
BIN_OP_MINUS_uxn_device_h_l231_c58_299d_right,
BIN_OP_MINUS_uxn_device_h_l231_c58_299d_return_output);

-- screen_blit_uxn_device_h_l231_c46_0413
screen_blit_uxn_device_h_l231_c46_0413 : entity work.screen_blit_0CLK_b1675d32 port map (
clk,
screen_blit_uxn_device_h_l231_c46_0413_CLOCK_ENABLE,
screen_blit_uxn_device_h_l231_c46_0413_phase,
screen_blit_uxn_device_h_l231_c46_0413_ctrl,
screen_blit_uxn_device_h_l231_c46_0413_auto_advance,
screen_blit_uxn_device_h_l231_c46_0413_x,
screen_blit_uxn_device_h_l231_c46_0413_y,
screen_blit_uxn_device_h_l231_c46_0413_ram_addr,
screen_blit_uxn_device_h_l231_c46_0413_previous_ram_read,
screen_blit_uxn_device_h_l231_c46_0413_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232
CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_x,
CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c
CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_x,
CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output);



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
 BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_return_output,
 ram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output,
 is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_return_output,
 y_MUX_uxn_device_h_l95_c2_c85f_return_output,
 is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_return_output,
 result_MUX_uxn_device_h_l95_c2_c85f_return_output,
 flip_x_MUX_uxn_device_h_l95_c2_c85f_return_output,
 layer_MUX_uxn_device_h_l95_c2_c85f_return_output,
 vram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output,
 x_MUX_uxn_device_h_l95_c2_c85f_return_output,
 auto_advance_MUX_uxn_device_h_l95_c2_c85f_return_output,
 flip_y_MUX_uxn_device_h_l95_c2_c85f_return_output,
 ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_return_output,
 ctrl_MUX_uxn_device_h_l95_c2_c85f_return_output,
 is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_return_output,
 color_MUX_uxn_device_h_l95_c2_c85f_return_output,
 BIN_OP_EQ_uxn_device_h_l96_c19_52e2_return_output,
 MUX_uxn_device_h_l96_c19_feec_return_output,
 BIN_OP_EQ_uxn_device_h_l97_c20_9268_return_output,
 MUX_uxn_device_h_l97_c20_0ea0_return_output,
 BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_return_output,
 MUX_uxn_device_h_l103_c32_9a99_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_return_output,
 ram_addr_MUX_uxn_device_h_l109_c7_e187_return_output,
 y_MUX_uxn_device_h_l109_c7_e187_return_output,
 result_MUX_uxn_device_h_l109_c7_e187_return_output,
 flip_x_MUX_uxn_device_h_l109_c7_e187_return_output,
 layer_MUX_uxn_device_h_l109_c7_e187_return_output,
 vram_addr_MUX_uxn_device_h_l109_c7_e187_return_output,
 x_MUX_uxn_device_h_l109_c7_e187_return_output,
 auto_advance_MUX_uxn_device_h_l109_c7_e187_return_output,
 flip_y_MUX_uxn_device_h_l109_c7_e187_return_output,
 ctrl_mode_MUX_uxn_device_h_l109_c7_e187_return_output,
 ctrl_MUX_uxn_device_h_l109_c7_e187_return_output,
 color_MUX_uxn_device_h_l109_c7_e187_return_output,
 result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_return_output,
 ram_addr_MUX_uxn_device_h_l114_c7_2337_return_output,
 y_MUX_uxn_device_h_l114_c7_2337_return_output,
 result_MUX_uxn_device_h_l114_c7_2337_return_output,
 flip_x_MUX_uxn_device_h_l114_c7_2337_return_output,
 layer_MUX_uxn_device_h_l114_c7_2337_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_2337_return_output,
 x_MUX_uxn_device_h_l114_c7_2337_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_2337_return_output,
 flip_y_MUX_uxn_device_h_l114_c7_2337_return_output,
 ctrl_mode_MUX_uxn_device_h_l114_c7_2337_return_output,
 ctrl_MUX_uxn_device_h_l114_c7_2337_return_output,
 color_MUX_uxn_device_h_l114_c7_2337_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_return_output,
 flip_x_MUX_uxn_device_h_l115_c3_ac2e_return_output,
 layer_MUX_uxn_device_h_l115_c3_ac2e_return_output,
 flip_y_MUX_uxn_device_h_l115_c3_ac2e_return_output,
 ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_return_output,
 ctrl_MUX_uxn_device_h_l115_c3_ac2e_return_output,
 color_MUX_uxn_device_h_l115_c3_ac2e_return_output,
 CONST_SR_7_uxn_device_h_l118_c26_cb52_return_output,
 CONST_SR_6_uxn_device_h_l119_c22_1bfd_return_output,
 CONST_SR_5_uxn_device_h_l120_c23_2e3c_return_output,
 CONST_SR_4_uxn_device_h_l121_c23_0f8e_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_return_output,
 ram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output,
 y_MUX_uxn_device_h_l125_c7_3e72_return_output,
 result_MUX_uxn_device_h_l125_c7_3e72_return_output,
 vram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output,
 x_MUX_uxn_device_h_l125_c7_3e72_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_3e72_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_return_output,
 x_MUX_uxn_device_h_l126_c3_bba9_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_return_output,
 ram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output,
 y_MUX_uxn_device_h_l132_c7_83ea_return_output,
 result_MUX_uxn_device_h_l132_c7_83ea_return_output,
 vram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output,
 x_MUX_uxn_device_h_l132_c7_83ea_return_output,
 auto_advance_MUX_uxn_device_h_l132_c7_83ea_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_return_output,
 x_MUX_uxn_device_h_l133_c3_9349_return_output,
 BIN_OP_OR_uxn_device_h_l134_c4_1eed_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_return_output,
 ram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output,
 y_MUX_uxn_device_h_l138_c7_6dc2_return_output,
 result_MUX_uxn_device_h_l138_c7_6dc2_return_output,
 vram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output,
 x_MUX_uxn_device_h_l138_c7_6dc2_return_output,
 auto_advance_MUX_uxn_device_h_l138_c7_6dc2_return_output,
 y_MUX_uxn_device_h_l139_c3_4fb1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_return_output,
 ram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output,
 y_MUX_uxn_device_h_l145_c7_5fb2_return_output,
 result_MUX_uxn_device_h_l145_c7_5fb2_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output,
 x_MUX_uxn_device_h_l145_c7_5fb2_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_5fb2_return_output,
 y_MUX_uxn_device_h_l146_c3_b47a_return_output,
 BIN_OP_OR_uxn_device_h_l147_c4_acb5_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_return_output,
 ram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output,
 result_MUX_uxn_device_h_l150_c7_7d97_return_output,
 vram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output,
 x_MUX_uxn_device_h_l150_c7_7d97_return_output,
 auto_advance_MUX_uxn_device_h_l150_c7_7d97_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_return_output,
 result_u8_value_MUX_uxn_device_h_l151_c3_9123_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c3_9123_return_output,
 vram_addr_MUX_uxn_device_h_l151_c3_9123_return_output,
 auto_advance_MUX_uxn_device_h_l151_c3_9123_return_output,
 BIN_OP_AND_uxn_device_h_l154_c32_76fe_return_output,
 result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_return_output,
 result_vram_address_MUX_uxn_device_h_l156_c4_625a_return_output,
 vram_addr_MUX_uxn_device_h_l156_c4_625a_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_return_output,
 BIN_OP_AND_uxn_device_h_l158_c5_53ee_return_output,
 MUX_uxn_device_h_l159_c19_4976_return_output,
 BIN_OP_OR_uxn_device_h_l159_c5_00db_return_output,
 MUX_uxn_device_h_l160_c19_b931_return_output,
 BIN_OP_OR_uxn_device_h_l160_c5_3e8c_return_output,
 BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_return_output,
 BIN_OP_PLUS_uxn_device_h_l165_c28_2438_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_return_output,
 auto_advance_MUX_uxn_device_h_l169_c8_92c1_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_return_output,
 ram_addr_MUX_uxn_device_h_l174_c7_d18b_return_output,
 result_MUX_uxn_device_h_l174_c7_d18b_return_output,
 x_MUX_uxn_device_h_l174_c7_d18b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_return_output,
 result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_return_output,
 result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_return_output,
 result_u8_value_MUX_uxn_device_h_l175_c3_3f62_return_output,
 result_vram_address_MUX_uxn_device_h_l175_c3_3f62_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_return_output,
 x_MUX_uxn_device_h_l175_c3_3f62_return_output,
 UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_return_output,
 result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_return_output,
 x_MUX_uxn_device_h_l180_c4_d6ff_return_output,
 BIN_OP_AND_uxn_device_h_l181_c9_1d73_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c5_9aed_return_output,
 x_MUX_uxn_device_h_l181_c5_9aed_return_output,
 BIN_OP_PLUS_uxn_device_h_l182_c6_7523_return_output,
 CONST_SR_8_uxn_device_h_l185_c34_c428_return_output,
 result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_return_output,
 ram_addr_MUX_uxn_device_h_l195_c7_5eea_return_output,
 result_MUX_uxn_device_h_l195_c7_5eea_return_output,
 ram_addr_MUX_uxn_device_h_l196_c3_8f67_return_output,
 result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_return_output,
 result_u8_value_MUX_uxn_device_h_l196_c3_8f67_return_output,
 BIN_OP_AND_uxn_device_h_l197_c8_3d48_return_output,
 result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_return_output,
 result_u8_value_MUX_uxn_device_h_l197_c4_509b_return_output,
 ram_addr_MUX_uxn_device_h_l203_c8_5cd3_return_output,
 BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_return_output,
 ram_addr_MUX_uxn_device_h_l208_c7_c979_return_output,
 result_MUX_uxn_device_h_l208_c7_c979_return_output,
 ram_addr_MUX_uxn_device_h_l209_c3_db96_return_output,
 result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_return_output,
 result_u8_value_MUX_uxn_device_h_l209_c3_db96_return_output,
 BIN_OP_AND_uxn_device_h_l210_c9_5372_return_output,
 result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_return_output,
 result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_return_output,
 CONST_SR_8_uxn_device_h_l213_c33_483b_return_output,
 ram_addr_MUX_uxn_device_h_l216_c8_cb35_return_output,
 BIN_OP_OR_uxn_device_h_l217_c4_c595_return_output,
 BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_return_output,
 result_MUX_uxn_device_h_l220_c7_767e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_return_output,
 result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_return_output,
 BIN_OP_AND_uxn_device_h_l222_c9_dd34_return_output,
 result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_return_output,
 result_u8_value_MUX_uxn_device_h_l222_c4_1566_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_return_output,
 result_MUX_uxn_device_h_l230_c3_d854_return_output,
 BIN_OP_MINUS_uxn_device_h_l231_c58_299d_return_output,
 screen_blit_uxn_device_h_l231_c46_0413_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c2_c85f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_c85f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_c85f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_e187_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_c85f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_uxn_device_h_l101_c3_0343 : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_c85f_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_c85f_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e187_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_c85f_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_c85f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_feec_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_feec_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_feec_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_feec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_0ea0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_0ea0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_0ea0_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_0ea0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_9a99_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_9a99_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_9a99_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_9a99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l109_c7_e187_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_e187_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_e187_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_2337_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e187_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e187_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_2337_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_e187_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_e593 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l114_c7_2337_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_2337_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_2337_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_3e72_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_2337_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_2337_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_2337_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l122_c4_350e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_ac2e_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_ac2e_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_ac2e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_024a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_cb52_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_cb52_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_8bee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_1bfd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_1bfd_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_126d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_2e3c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_2e3c_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_4f68_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_0f8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_0f8e_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_6714_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l125_c7_3e72_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_3e72_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_3e72_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_83ea_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_bba9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_89e3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_bba9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_bba9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_bba9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l132_c7_83ea_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_83ea_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_83ea_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_6dc2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_9349_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l135_c4_9d9f : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_9349_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_9349_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_9349_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_4fb1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l138_c7_6dc2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_6dc2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_6dc2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_5fb2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_4fb1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_4fb1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_4fb1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l142_c4_356f : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_b47a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l145_c7_5fb2_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_5fb2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_7d97_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_b47a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_b47a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_b47a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l150_c7_7d97_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b54_uxn_device_h_l150_c7_7d97_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_7d97_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_d18b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_d18b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l153_c4_8308 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_9123_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_4bd4_return_output : unsigned(7 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l165_c5_2ec9 : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l157_c5_dc16 : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_left : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_return_output : unsigned(48 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_left : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4976_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4976_iftrue : unsigned(19 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4976_iffalse : unsigned(19 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4976_return_output : unsigned(19 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_left : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_b931_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_b931_iftrue : unsigned(18 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_b931_iffalse : unsigned(18 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_b931_return_output : unsigned(18 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_right : unsigned(18 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_left : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_return_output : unsigned(48 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l171_c4_991d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c7_d18b_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8105_uxn_device_h_l174_c7_d18b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_d18b_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_5eea_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_d18b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_d18b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_d18b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l178_c4_3aec : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_3f62_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_d6ff_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_3f62_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_3f62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l179_c4_fd0b : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_d6ff_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_9aed_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_d6ff_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_d6ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l181_c5_9aed_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l184_c6_437a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_9aed_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l182_c6_fc23 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_9aed_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_9aed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_c428_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_c428_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_d04d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l192_c4_87f0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l195_c7_5eea_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l195_c7_5eea_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_5eea_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_c979_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_5eea_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l197_c4_509b_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l199_c5_65bb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_bd87_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l208_c7_c979_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l208_c7_c979_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_c979_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_767e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_c979_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c4_4ee5_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l212_c5_b98d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_483b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_483b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_a024_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l220_c7_767e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l220_c7_767e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_767e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_d854_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_767e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c4_1566_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l224_c5_dc4a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_2efc_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l230_c3_d854_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_d854_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_d854_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_d854_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_d854_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l233_c4_9cdf : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_1cbe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_09c3_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_b578_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_185f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_b1e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_56dd_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l242_c4_f09a : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l127_l147_l140_l204_l217_DUPLICATE_5744_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_7770_return_output : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_9391_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_f132_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_1c77_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vram_addr : unsigned(23 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l224_c5_dc4a := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iftrue := VAR_result_device_ram_address_uxn_device_h_l224_c5_dc4a;
     VAR_result_device_ram_address_uxn_device_h_l199_c5_65bb := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iftrue := VAR_result_device_ram_address_uxn_device_h_l199_c5_65bb;
     VAR_result_device_ram_address_uxn_device_h_l212_c5_b98d := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iftrue := VAR_result_device_ram_address_uxn_device_h_l212_c5_b98d;
     VAR_MUX_uxn_device_h_l96_c19_feec_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l184_c6_437a := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iftrue := VAR_result_device_ram_address_uxn_device_h_l184_c6_437a;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_right := to_unsigned(400, 24);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iftrue := to_unsigned(0, 1);
     VAR_result_u8_value_uxn_device_h_l179_c4_fd0b := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_fd0b;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_fd0b;
     VAR_result_device_ram_address_uxn_device_h_l192_c4_87f0 := resize(to_unsigned(45, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iftrue := VAR_result_device_ram_address_uxn_device_h_l192_c4_87f0;
     VAR_MUX_uxn_device_h_l103_c32_9a99_iffalse := resize(to_unsigned(47, 6), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_right := to_unsigned(3, 2);
     VAR_result_device_ram_address_uxn_device_h_l153_c4_8308 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iftrue := VAR_result_device_ram_address_uxn_device_h_l153_c4_8308;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l97_c20_0ea0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l160_c19_b931_iftrue := to_unsigned(262144, 19);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_right := to_unsigned(6, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_device_h_l159_c19_4976_iffalse := resize(to_unsigned(0, 1), 20);
     VAR_MUX_uxn_device_h_l103_c32_9a99_iftrue := resize(to_unsigned(46, 6), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l96_c19_feec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_right := to_unsigned(11, 4);
     VAR_result_device_ram_address_uxn_device_h_l135_c4_9d9f := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iftrue := VAR_result_device_ram_address_uxn_device_h_l135_c4_9d9f;
     VAR_MUX_uxn_device_h_l159_c19_4976_iftrue := to_unsigned(524288, 20);
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_right := to_unsigned(10, 4);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_e593 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_e593;
     VAR_result_vram_address_uxn_device_h_l178_c4_3aec := resize(to_unsigned(0, 1), 24);
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue := VAR_result_vram_address_uxn_device_h_l178_c4_3aec;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_89e3 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_89e3;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_right := to_unsigned(400, 24);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l97_c20_0ea0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_right := to_unsigned(15, 4);
     VAR_MUX_uxn_device_h_l160_c19_b931_iffalse := resize(to_unsigned(0, 1), 19);
     VAR_result_device_ram_address_uxn_device_h_l142_c4_356f := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iftrue := VAR_result_device_ram_address_uxn_device_h_l142_c4_356f;
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l233_c4_9cdf := resize(to_unsigned(0, 1), 8);
     VAR_vram_addr_uxn_device_h_l101_c3_0343 := resize(to_unsigned(0, 1), 24);
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue := VAR_vram_addr_uxn_device_h_l101_c3_0343;
     VAR_result_device_ram_address_uxn_device_h_l242_c4_f09a := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_right := to_unsigned(15728640, 24);
     VAR_result_device_ram_address_uxn_device_h_l122_c4_350e := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iftrue := VAR_result_device_ram_address_uxn_device_h_l122_c4_350e;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_right := to_unsigned(9, 4);
     VAR_result_device_ram_address_uxn_device_h_l171_c4_991d := resize(to_unsigned(44, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iftrue := VAR_result_device_ram_address_uxn_device_h_l171_c4_991d;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_left := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l231_c46_0413_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_left := color;
     VAR_color_MUX_uxn_device_h_l109_c7_e187_iftrue := color;
     VAR_color_MUX_uxn_device_h_l114_c7_2337_iffalse := color;
     VAR_color_MUX_uxn_device_h_l115_c3_ac2e_iffalse := color;
     VAR_color_MUX_uxn_device_h_l95_c2_c85f_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l231_c46_0413_ctrl := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iftrue := ctrl_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_cond := ctrl_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_cond := ctrl_mode;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l160_c19_b931_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l159_c19_4976_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_iftrue := flip_y;
     VAR_color_MUX_uxn_device_h_l115_c3_ac2e_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l126_c3_bba9_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l133_c3_9349_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l139_c3_4fb1_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l146_c3_b47a_cond := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_cond := is_pixel_port;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l175_c3_3f62_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_cond := is_sprite_port;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_cond := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l230_c3_d854_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l109_c7_e187_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l114_c7_2337_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l95_c2_c85f_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l121_c23_0f8e_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l120_c23_2e3c_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l119_c22_1bfd_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l118_c26_cb52_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l231_c46_0413_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l231_c46_0413_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l145_c7_5fb2_iftrue := result;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_iffalse := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_left := x;
     VAR_screen_blit_uxn_device_h_l231_c46_0413_x := x;
     VAR_x_MUX_uxn_device_h_l109_c7_e187_iftrue := x;
     VAR_x_MUX_uxn_device_h_l114_c7_2337_iftrue := x;
     VAR_x_MUX_uxn_device_h_l126_c3_bba9_iffalse := x;
     VAR_x_MUX_uxn_device_h_l133_c3_9349_iffalse := x;
     VAR_x_MUX_uxn_device_h_l138_c7_6dc2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l145_c7_5fb2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l150_c7_7d97_iftrue := x;
     VAR_x_MUX_uxn_device_h_l174_c7_d18b_iffalse := x;
     VAR_x_MUX_uxn_device_h_l175_c3_3f62_iffalse := x;
     VAR_x_MUX_uxn_device_h_l180_c4_d6ff_iffalse := x;
     VAR_x_MUX_uxn_device_h_l181_c5_9aed_iffalse := x;
     VAR_x_MUX_uxn_device_h_l95_c2_c85f_iftrue := x;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_left := y;
     VAR_CONST_SR_8_uxn_device_h_l213_c33_483b_x := y;
     VAR_screen_blit_uxn_device_h_l231_c46_0413_y := y;
     VAR_y_MUX_uxn_device_h_l109_c7_e187_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_2337_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_3e72_iftrue := y;
     VAR_y_MUX_uxn_device_h_l132_c7_83ea_iftrue := y;
     VAR_y_MUX_uxn_device_h_l139_c3_4fb1_iffalse := y;
     VAR_y_MUX_uxn_device_h_l145_c7_5fb2_iffalse := y;
     VAR_y_MUX_uxn_device_h_l146_c3_b47a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l95_c2_c85f_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l96_c19_52e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l96_c19_52e2_left <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_left;
     BIN_OP_EQ_uxn_device_h_l96_c19_52e2_right <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_return_output := BIN_OP_EQ_uxn_device_h_l96_c19_52e2_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output := result.u8_value;

     -- CAST_TO_uint8_t[uxn_device_h_l225_c23_2efc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_2efc_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_SR_8[uxn_device_h_l213_c33_483b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l213_c33_483b_x <= VAR_CONST_SR_8_uxn_device_h_l213_c33_483b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l213_c33_483b_return_output := CONST_SR_8_uxn_device_h_l213_c33_483b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_6849] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_6849_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_6849_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l182_c6_7523] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l182_c6_7523_left <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_left;
     BIN_OP_PLUS_uxn_device_h_l182_c6_7523_right <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_return_output := BIN_OP_PLUS_uxn_device_h_l182_c6_7523_return_output;

     -- ctrl_MUX[uxn_device_h_l115_c3_ac2e] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l115_c3_ac2e_cond <= VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_cond;
     ctrl_MUX_uxn_device_h_l115_c3_ac2e_iftrue <= VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_iftrue;
     ctrl_MUX_uxn_device_h_l115_c3_ac2e_iffalse <= VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_return_output := ctrl_MUX_uxn_device_h_l115_c3_ac2e_return_output;

     -- CONST_SR_6[uxn_device_h_l119_c22_1bfd] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l119_c22_1bfd_x <= VAR_CONST_SR_6_uxn_device_h_l119_c22_1bfd_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l119_c22_1bfd_return_output := CONST_SR_6_uxn_device_h_l119_c22_1bfd_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l117_c12_024a] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_024a_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_1c77 LATENCY=0
     VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_1c77_return_output := result.vram_address;

     -- CONST_SR_4[uxn_device_h_l121_c23_0f8e] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l121_c23_0f8e_x <= VAR_CONST_SR_4_uxn_device_h_l121_c23_0f8e_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l121_c23_0f8e_return_output := CONST_SR_4_uxn_device_h_l121_c23_0f8e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l208_c11_5425] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l208_c11_5425_left <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_left;
     BIN_OP_EQ_uxn_device_h_l208_c11_5425_right <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output := BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_f132 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_f132_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l125_c11_604d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_604d_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_604d_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;

     -- CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_7770 LATENCY=0
     VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_7770_return_output := CAST_TO_uint24_t_uint16_t(
     y);

     -- result_is_vram_write_MUX[uxn_device_h_l156_c4_625a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_cond;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_return_output := result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l132_c11_3e1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_left;
     BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output := BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c11_6fd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_left;
     BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output := BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c11_6bbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_left;
     BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output := BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c11_fee2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c11_fee2_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_left;
     BIN_OP_EQ_uxn_device_h_l138_c11_fee2_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output := BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;

     -- CONST_SR_7[uxn_device_h_l118_c26_cb52] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l118_c26_cb52_x <= VAR_CONST_SR_7_uxn_device_h_l118_c26_cb52_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l118_c26_cb52_return_output := CONST_SR_7_uxn_device_h_l118_c26_cb52_return_output;

     -- BIN_OP_EQ[uxn_device_h_l195_c11_6082] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c11_6082_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_left;
     BIN_OP_EQ_uxn_device_h_l195_c11_6082_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output := BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output;

     -- MUX[uxn_device_h_l160_c19_b931] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l160_c19_b931_cond <= VAR_MUX_uxn_device_h_l160_c19_b931_cond;
     MUX_uxn_device_h_l160_c19_b931_iftrue <= VAR_MUX_uxn_device_h_l160_c19_b931_iftrue;
     MUX_uxn_device_h_l160_c19_b931_iffalse <= VAR_MUX_uxn_device_h_l160_c19_b931_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l160_c19_b931_return_output := MUX_uxn_device_h_l160_c19_b931_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l200_c23_bd87] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_bd87_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l114_c11_2767] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_2767_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_2767_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be9c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be9c_return_output := result.is_deo_done;

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l151_c3_9123] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_9123_return_output := result.vram_write_layer;

     -- BIN_OP_AND[uxn_device_h_l154_c32_76fe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l154_c32_76fe_left <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_left;
     BIN_OP_AND_uxn_device_h_l154_c32_76fe_right <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_return_output := BIN_OP_AND_uxn_device_h_l154_c32_76fe_return_output;

     -- CONST_SR_5[uxn_device_h_l120_c23_2e3c] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l120_c23_2e3c_x <= VAR_CONST_SR_5_uxn_device_h_l120_c23_2e3c_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l120_c23_2e3c_return_output := CONST_SR_5_uxn_device_h_l120_c23_2e3c_return_output;

     -- BIN_OP_AND[uxn_device_h_l181_c9_1d73] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c9_1d73_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_left;
     BIN_OP_AND_uxn_device_h_l181_c9_1d73_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_return_output := BIN_OP_AND_uxn_device_h_l181_c9_1d73_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l230_c3_d854] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_d854_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l242_c4_f09a,
     to_unsigned(1, 1));

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l95_c6_30f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c6_30f7_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_left;
     BIN_OP_EQ_uxn_device_h_l95_c6_30f7_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output := BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;

     -- BIN_OP_AND[uxn_device_h_l197_c8_3d48] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l197_c8_3d48_left <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_left;
     BIN_OP_AND_uxn_device_h_l197_c8_3d48_right <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_return_output := BIN_OP_AND_uxn_device_h_l197_c8_3d48_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l180_c9_d8a0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output := UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output;

     -- MUX[uxn_device_h_l159_c19_4976] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l159_c19_4976_cond <= VAR_MUX_uxn_device_h_l159_c19_4976_cond;
     MUX_uxn_device_h_l159_c19_4976_iftrue <= VAR_MUX_uxn_device_h_l159_c19_4976_iftrue;
     MUX_uxn_device_h_l159_c19_4976_iffalse <= VAR_MUX_uxn_device_h_l159_c19_4976_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l159_c19_4976_return_output := MUX_uxn_device_h_l159_c19_4976_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l231_c58_299d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l231_c58_299d_left <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_left;
     BIN_OP_MINUS_uxn_device_h_l231_c58_299d_right <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_return_output := BIN_OP_MINUS_uxn_device_h_l231_c58_299d_return_output;

     -- CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_9391 LATENCY=0
     VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_9391_return_output := CAST_TO_uint24_t_uint16_t(
     x);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l127_l147_l140_l204_l217_DUPLICATE_5744 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l127_l147_l140_l204_l217_DUPLICATE_5744_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l220_c11_2c37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l220_c11_2c37_left <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_left;
     BIN_OP_EQ_uxn_device_h_l220_c11_2c37_right <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output := BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output;

     -- auto_advance_MUX[uxn_device_h_l169_c8_92c1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c8_92c1_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_cond;
     auto_advance_MUX_uxn_device_h_l169_c8_92c1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c8_92c1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_return_output := auto_advance_MUX_uxn_device_h_l169_c8_92c1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l97_c20_9268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l97_c20_9268_left <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_left;
     BIN_OP_EQ_uxn_device_h_l97_c20_9268_right <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_return_output := BIN_OP_EQ_uxn_device_h_l97_c20_9268_return_output;

     -- BIN_OP_EQ[uxn_device_h_l150_c11_351a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c11_351a_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_left;
     BIN_OP_EQ_uxn_device_h_l150_c11_351a_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output := BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output;

     -- CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output := CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l181_c5_9aed_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l181_c9_1d73_return_output, 1);
     VAR_MUX_uxn_device_h_l197_c4_509b_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l197_c8_3d48_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_6fd6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_2337_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_2767_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_3e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_3e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_3e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_604d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_83ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_83ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_83ea_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_3e1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_fee2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;
     VAR_result_MUX_uxn_device_h_l145_c7_5fb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_5fb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_5fb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_6849_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_7d97_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_7d97_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_351a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_d18b_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_d18b_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6bbb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_5eea_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_6082_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_c979_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_5425_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_767e_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2c37_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_c85f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_30f7_return_output;
     VAR_MUX_uxn_device_h_l96_c19_feec_cond := VAR_BIN_OP_EQ_uxn_device_h_l96_c19_52e2_return_output;
     VAR_MUX_uxn_device_h_l97_c20_0ea0_cond := VAR_BIN_OP_EQ_uxn_device_h_l97_c20_9268_return_output;
     VAR_screen_blit_uxn_device_h_l231_c46_0413_phase := VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_299d_return_output;
     VAR_x_uxn_device_h_l182_c6_fc23 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_7523_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l127_l147_l140_l204_l217_DUPLICATE_5744_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l127_l147_l140_l204_l217_DUPLICATE_5744_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l127_l147_l140_l204_l217_DUPLICATE_5744_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l127_l147_l140_l204_l217_DUPLICATE_5744_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_left := VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_7770_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_left := VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_7770_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_right := VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_9391_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_right := VAR_CAST_TO_uint24_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_9391_return_output;
     VAR_color_MUX_uxn_device_h_l115_c3_ac2e_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_024a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_bd87_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_2efc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be9c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be9c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l221_l175_l197_l180_l196_l209_l210_l222_l181_DUPLICATE_6f6f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_f132_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_f132_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_1c77_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_1c77_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l191_l102_l221_l197_l180_l139_l126_l169_l196_l222_l209_l210_l110_l133_l115_l181_DUPLICATE_8c6b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l221_l175_l197_l196_l151_l209_l210_l222_DUPLICATE_5eb0_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l222_l210_DUPLICATE_f24c_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_right := VAR_MUX_uxn_device_h_l159_c19_4976_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_right := VAR_MUX_uxn_device_h_l160_c19_b931_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_d6ff_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_d8a0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c8_92c1_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_iftrue := VAR_ctrl_MUX_uxn_device_h_l115_c3_ac2e_return_output;
     VAR_result_MUX_uxn_device_h_l230_c3_d854_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_d854_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_625a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_9123_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_cond := VAR_MUX_uxn_device_h_l181_c5_9aed_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_cond := VAR_MUX_uxn_device_h_l181_c5_9aed_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_cond := VAR_MUX_uxn_device_h_l181_c5_9aed_interm_cond;
     VAR_x_MUX_uxn_device_h_l181_c5_9aed_cond := VAR_MUX_uxn_device_h_l181_c5_9aed_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_cond := VAR_MUX_uxn_device_h_l197_c4_509b_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_cond := VAR_MUX_uxn_device_h_l197_c4_509b_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_cond := VAR_MUX_uxn_device_h_l197_c4_509b_interm_cond;
     VAR_CONST_SR_8_uxn_device_h_l185_c34_c428_x := VAR_x_uxn_device_h_l182_c6_fc23;
     VAR_x_MUX_uxn_device_h_l181_c5_9aed_iftrue := VAR_x_uxn_device_h_l182_c6_fc23;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- BIN_OP_OR[uxn_device_h_l147_c4_acb5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l147_c4_acb5_left <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_left;
     BIN_OP_OR_uxn_device_h_l147_c4_acb5_right <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_return_output := BIN_OP_OR_uxn_device_h_l147_c4_acb5_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c3_9123] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c3_9123_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_cond;
     auto_advance_MUX_uxn_device_h_l151_c3_9123_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c3_9123_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_return_output := auto_advance_MUX_uxn_device_h_l151_c3_9123_return_output;

     -- color_MUX[uxn_device_h_l115_c3_ac2e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l115_c3_ac2e_cond <= VAR_color_MUX_uxn_device_h_l115_c3_ac2e_cond;
     color_MUX_uxn_device_h_l115_c3_ac2e_iftrue <= VAR_color_MUX_uxn_device_h_l115_c3_ac2e_iftrue;
     color_MUX_uxn_device_h_l115_c3_ac2e_iffalse <= VAR_color_MUX_uxn_device_h_l115_c3_ac2e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l115_c3_ac2e_return_output := color_MUX_uxn_device_h_l115_c3_ac2e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l197_c4_509b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l197_c4_509b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_cond;
     result_u8_value_MUX_uxn_device_h_l197_c4_509b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_iftrue;
     result_u8_value_MUX_uxn_device_h_l197_c4_509b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_return_output := result_u8_value_MUX_uxn_device_h_l197_c4_509b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l169_c8_92c1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l197_c4_509b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_cond;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_return_output := result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_return_output;

     -- BIN_OP_AND[uxn_device_h_l210_c9_5372] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l210_c9_5372_left <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_left;
     BIN_OP_AND_uxn_device_h_l210_c9_5372_right <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_return_output := BIN_OP_AND_uxn_device_h_l210_c9_5372_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l139_c3_4fb1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_cond;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_return_output := result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_return_output;

     -- x_MUX[uxn_device_h_l181_c5_9aed] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c5_9aed_cond <= VAR_x_MUX_uxn_device_h_l181_c5_9aed_cond;
     x_MUX_uxn_device_h_l181_c5_9aed_iftrue <= VAR_x_MUX_uxn_device_h_l181_c5_9aed_iftrue;
     x_MUX_uxn_device_h_l181_c5_9aed_iffalse <= VAR_x_MUX_uxn_device_h_l181_c5_9aed_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c5_9aed_return_output := x_MUX_uxn_device_h_l181_c5_9aed_return_output;

     -- BIN_OP_AND[uxn_device_h_l222_c9_dd34] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l222_c9_dd34_left <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_left;
     BIN_OP_AND_uxn_device_h_l222_c9_dd34_right <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_return_output := BIN_OP_AND_uxn_device_h_l222_c9_dd34_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l121_c13_6714] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_6714_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l121_c23_0f8e_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l213_c23_a024] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_a024_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l213_c33_483b_return_output);

     -- BIN_OP_OR[uxn_device_h_l217_c4_c595] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l217_c4_c595_left <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_left;
     BIN_OP_OR_uxn_device_h_l217_c4_c595_right <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_return_output := BIN_OP_OR_uxn_device_h_l217_c4_c595_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l191_c8_a901] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_cond;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_return_output := result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output := CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l180_c4_d6ff] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_cond;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_return_output := result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c3_9349] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l118_c16_8bee] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_8bee_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l118_c26_cb52_return_output);

     -- BIN_OP_OR[uxn_device_h_l134_c4_1eed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l134_c4_1eed_left <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_left;
     BIN_OP_OR_uxn_device_h_l134_c4_1eed_right <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_return_output := BIN_OP_OR_uxn_device_h_l134_c4_1eed_return_output;

     -- MUX[uxn_device_h_l97_c20_0ea0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l97_c20_0ea0_cond <= VAR_MUX_uxn_device_h_l97_c20_0ea0_cond;
     MUX_uxn_device_h_l97_c20_0ea0_iftrue <= VAR_MUX_uxn_device_h_l97_c20_0ea0_iftrue;
     MUX_uxn_device_h_l97_c20_0ea0_iffalse <= VAR_MUX_uxn_device_h_l97_c20_0ea0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l97_c20_0ea0_return_output := MUX_uxn_device_h_l97_c20_0ea0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_ac2e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_return_output;

     -- CONST_SR_8[uxn_device_h_l185_c34_c428] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l185_c34_c428_x <= VAR_CONST_SR_8_uxn_device_h_l185_c34_c428_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l185_c34_c428_return_output := CONST_SR_8_uxn_device_h_l185_c34_c428_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l154_c22_4bd4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_4bd4_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_76fe_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_509b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_return_output;

     -- MUX[uxn_device_h_l96_c19_feec] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c19_feec_cond <= VAR_MUX_uxn_device_h_l96_c19_feec_cond;
     MUX_uxn_device_h_l96_c19_feec_iftrue <= VAR_MUX_uxn_device_h_l96_c19_feec_iftrue;
     MUX_uxn_device_h_l96_c19_feec_iffalse <= VAR_MUX_uxn_device_h_l96_c19_feec_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c19_feec_return_output := MUX_uxn_device_h_l96_c19_feec_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_9aed] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l120_c13_4f68] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_4f68_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l120_c23_2e3c_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l151_c3_9123] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_e85b] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l175_c3_3f62] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_cond;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_return_output := result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l110_c3_ac09] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_cond;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_return_output := result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_aa04] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_bba9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l119_c12_126d] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_126d_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l119_c22_1bfd_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l181_c5_9aed] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_return_output;

     -- result_vram_address_MUX[uxn_device_h_l175_c3_3f62] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l175_c3_3f62_cond <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_cond;
     result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue;
     result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_return_output := result_vram_address_MUX_uxn_device_h_l175_c3_3f62_return_output;

     -- ctrl_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_cond;
     ctrl_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_iftrue;
     ctrl_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_return_output := ctrl_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l151_c3_9123] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_cond;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_return_output := result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l210_c4_4ee5_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l210_c9_5372_return_output, 1);
     VAR_MUX_uxn_device_h_l222_c4_1566_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l222_c9_dd34_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_aa04_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_e85b_return_output;
     VAR_x_MUX_uxn_device_h_l133_c3_9349_iftrue := VAR_BIN_OP_OR_uxn_device_h_l134_c4_1eed_return_output;
     VAR_y_MUX_uxn_device_h_l146_c3_b47a_iftrue := VAR_BIN_OP_OR_uxn_device_h_l147_c4_acb5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_iftrue := VAR_BIN_OP_OR_uxn_device_h_l217_c4_c595_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_8bee_return_output;
     VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_126d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_4f68_return_output;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_6714_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_4bd4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_a024_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output;
     VAR_x_MUX_uxn_device_h_l126_c3_bba9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output;
     VAR_y_MUX_uxn_device_h_l139_c3_4fb1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l128_l141_l205_DUPLICATE_5232_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_left := VAR_MUX_uxn_device_h_l96_c19_feec_return_output;
     VAR_MUX_uxn_device_h_l103_c32_9a99_cond := VAR_MUX_uxn_device_h_l96_c19_feec_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iftrue := VAR_MUX_uxn_device_h_l96_c19_feec_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_right := VAR_MUX_uxn_device_h_l97_c20_0ea0_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iftrue := VAR_MUX_uxn_device_h_l97_c20_0ea0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_iftrue := VAR_auto_advance_MUX_uxn_device_h_l151_c3_9123_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_2337_iftrue := VAR_color_MUX_uxn_device_h_l115_c3_ac2e_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_ctrl_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_92c1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_9aed_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_a901_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_509b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_d6ff_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_9aed_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_509b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l197_c4_509b_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_d6ff_iftrue := VAR_x_MUX_uxn_device_h_l181_c5_9aed_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_cond := VAR_MUX_uxn_device_h_l210_c4_4ee5_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_cond := VAR_MUX_uxn_device_h_l210_c4_4ee5_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_cond := VAR_MUX_uxn_device_h_l210_c4_4ee5_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_cond := VAR_MUX_uxn_device_h_l222_c4_1566_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_cond := VAR_MUX_uxn_device_h_l222_c4_1566_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_cond := VAR_MUX_uxn_device_h_l222_c4_1566_interm_cond;
     -- color_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_color_MUX_uxn_device_h_l114_c7_2337_cond;
     color_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_color_MUX_uxn_device_h_l114_c7_2337_iftrue;
     color_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_color_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l114_c7_2337_return_output := color_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c4_d6ff] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l175_c3_3f62] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_cond;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_return_output := result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_return_output;

     -- MUX[uxn_device_h_l103_c32_9a99] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l103_c32_9a99_cond <= VAR_MUX_uxn_device_h_l103_c32_9a99_cond;
     MUX_uxn_device_h_l103_c32_9a99_iftrue <= VAR_MUX_uxn_device_h_l103_c32_9a99_iftrue;
     MUX_uxn_device_h_l103_c32_9a99_iffalse <= VAR_MUX_uxn_device_h_l103_c32_9a99_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l103_c32_9a99_return_output := MUX_uxn_device_h_l103_c32_9a99_return_output;

     -- auto_advance_MUX[uxn_device_h_l150_c7_7d97] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l150_c7_7d97_cond <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_cond;
     auto_advance_MUX_uxn_device_h_l150_c7_7d97_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_iftrue;
     auto_advance_MUX_uxn_device_h_l150_c7_7d97_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_return_output := auto_advance_MUX_uxn_device_h_l150_c7_7d97_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l185_c24_d04d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_d04d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l185_c34_c428_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l151_c3_9123] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l114_c7_2337] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_2337_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_ac2e_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_4ee5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_return_output := result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l125_c7_3e72] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_3e72_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_bba9_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l210_c4_4ee5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_cond;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_return_output := result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l115_c3_ac2e] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_cond;
     ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iftrue;
     ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_return_output := ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_1566] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_return_output := result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l165_c28_2438] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l165_c28_2438_left <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_left;
     BIN_OP_PLUS_uxn_device_h_l165_c28_2438_right <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_return_output := BIN_OP_PLUS_uxn_device_h_l165_c28_2438_return_output;

     -- result_u8_value_MUX[uxn_device_h_l210_c4_4ee5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_cond;
     result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iftrue;
     result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_return_output := result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l132_c7_83ea] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_83ea_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_9349_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l138_c7_6dc2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_6dc2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_4fb1_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_8f67] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_return_output := result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l157_c18_fdbe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_left;
     BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_return_output := BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_return_output;

     -- y_MUX[uxn_device_h_l146_c3_b47a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l146_c3_b47a_cond <= VAR_y_MUX_uxn_device_h_l146_c3_b47a_cond;
     y_MUX_uxn_device_h_l146_c3_b47a_iftrue <= VAR_y_MUX_uxn_device_h_l146_c3_b47a_iftrue;
     y_MUX_uxn_device_h_l146_c3_b47a_iffalse <= VAR_y_MUX_uxn_device_h_l146_c3_b47a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l146_c3_b47a_return_output := y_MUX_uxn_device_h_l146_c3_b47a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l196_c3_8f67] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_cond;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_return_output := result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_return_output;

     -- result_u8_value_MUX[uxn_device_h_l196_c3_8f67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l196_c3_8f67_cond <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_cond;
     result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iftrue;
     result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_return_output := result_u8_value_MUX_uxn_device_h_l196_c3_8f67_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_cond;
     is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_return_output := is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- layer_MUX[uxn_device_h_l115_c3_ac2e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l115_c3_ac2e_cond <= VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_cond;
     layer_MUX_uxn_device_h_l115_c3_ac2e_iftrue <= VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_iftrue;
     layer_MUX_uxn_device_h_l115_c3_ac2e_iffalse <= VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_return_output := layer_MUX_uxn_device_h_l115_c3_ac2e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l151_c3_9123] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l151_c3_9123_cond <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_cond;
     result_u8_value_MUX_uxn_device_h_l151_c3_9123_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_iftrue;
     result_u8_value_MUX_uxn_device_h_l151_c3_9123_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_return_output := result_u8_value_MUX_uxn_device_h_l151_c3_9123_return_output;

     -- x_MUX[uxn_device_h_l133_c3_9349] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l133_c3_9349_cond <= VAR_x_MUX_uxn_device_h_l133_c3_9349_cond;
     x_MUX_uxn_device_h_l133_c3_9349_iftrue <= VAR_x_MUX_uxn_device_h_l133_c3_9349_iftrue;
     x_MUX_uxn_device_h_l133_c3_9349_iffalse <= VAR_x_MUX_uxn_device_h_l133_c3_9349_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l133_c3_9349_return_output := x_MUX_uxn_device_h_l133_c3_9349_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_d6ff] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_return_output;

     -- result_u8_value_MUX[uxn_device_h_l222_c4_1566] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l222_c4_1566_cond <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_cond;
     result_u8_value_MUX_uxn_device_h_l222_c4_1566_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_iftrue;
     result_u8_value_MUX_uxn_device_h_l222_c4_1566_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_return_output := result_u8_value_MUX_uxn_device_h_l222_c4_1566_return_output;

     -- y_MUX[uxn_device_h_l139_c3_4fb1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l139_c3_4fb1_cond <= VAR_y_MUX_uxn_device_h_l139_c3_4fb1_cond;
     y_MUX_uxn_device_h_l139_c3_4fb1_iftrue <= VAR_y_MUX_uxn_device_h_l139_c3_4fb1_iftrue;
     y_MUX_uxn_device_h_l139_c3_4fb1_iffalse <= VAR_y_MUX_uxn_device_h_l139_c3_4fb1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l139_c3_4fb1_return_output := y_MUX_uxn_device_h_l139_c3_4fb1_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l109_c7_e187] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_e187_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_ac09_return_output);

     -- ram_addr_MUX[uxn_device_h_l216_c8_cb35] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l216_c8_cb35_cond <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_cond;
     ram_addr_MUX_uxn_device_h_l216_c8_cb35_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_iftrue;
     ram_addr_MUX_uxn_device_h_l216_c8_cb35_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_return_output := ram_addr_MUX_uxn_device_h_l216_c8_cb35_return_output;

     -- ctrl_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_cond;
     ctrl_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_iftrue;
     ctrl_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_return_output := ctrl_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_cond;
     is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_return_output := is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- flip_y_MUX[uxn_device_h_l115_c3_ac2e] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l115_c3_ac2e_cond <= VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_cond;
     flip_y_MUX_uxn_device_h_l115_c3_ac2e_iftrue <= VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_iftrue;
     flip_y_MUX_uxn_device_h_l115_c3_ac2e_iffalse <= VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_return_output := flip_y_MUX_uxn_device_h_l115_c3_ac2e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l222_c4_1566] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_cond;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_return_output := result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_return_output;

     -- flip_x_MUX[uxn_device_h_l115_c3_ac2e] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l115_c3_ac2e_cond <= VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_cond;
     flip_x_MUX_uxn_device_h_l115_c3_ac2e_iftrue <= VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_iftrue;
     flip_x_MUX_uxn_device_h_l115_c3_ac2e_iffalse <= VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_return_output := flip_x_MUX_uxn_device_h_l115_c3_ac2e_return_output;

     -- x_MUX[uxn_device_h_l180_c4_d6ff] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l180_c4_d6ff_cond <= VAR_x_MUX_uxn_device_h_l180_c4_d6ff_cond;
     x_MUX_uxn_device_h_l180_c4_d6ff_iftrue <= VAR_x_MUX_uxn_device_h_l180_c4_d6ff_iftrue;
     x_MUX_uxn_device_h_l180_c4_d6ff_iffalse <= VAR_x_MUX_uxn_device_h_l180_c4_d6ff_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l180_c4_d6ff_return_output := x_MUX_uxn_device_h_l180_c4_d6ff_return_output;

     -- ram_addr_MUX[uxn_device_h_l203_c8_5cd3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l203_c8_5cd3_cond <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_cond;
     ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iftrue;
     ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_return_output := ram_addr_MUX_uxn_device_h_l203_c8_5cd3_return_output;

     -- BIN_OP_OR[uxn_device_h_l98_c21_6364] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c21_6364_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_left;
     BIN_OP_OR_uxn_device_h_l98_c21_6364_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output := BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output;

     -- x_MUX[uxn_device_h_l126_c3_bba9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l126_c3_bba9_cond <= VAR_x_MUX_uxn_device_h_l126_c3_bba9_cond;
     x_MUX_uxn_device_h_l126_c3_bba9_iftrue <= VAR_x_MUX_uxn_device_h_l126_c3_bba9_iftrue;
     x_MUX_uxn_device_h_l126_c3_bba9_iffalse <= VAR_x_MUX_uxn_device_h_l126_c3_bba9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l126_c3_bba9_return_output := x_MUX_uxn_device_h_l126_c3_bba9_return_output;

     -- Submodule level 3
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_6364_return_output;
     VAR_vram_addr_uxn_device_h_l157_c5_dc16 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_fdbe_return_output, 24);
     VAR_result_vram_address_uxn_device_h_l165_c5_2ec9 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_2438_return_output, 24);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_d04d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iftrue := VAR_MUX_uxn_device_h_l103_c32_9a99_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l150_c7_7d97_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_color_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_ctrl_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_ac2e_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_iftrue := VAR_flip_x_MUX_uxn_device_h_l115_c3_ac2e_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_iftrue := VAR_flip_y_MUX_uxn_device_h_l115_c3_ac2e_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_c85f_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_2337_iftrue := VAR_layer_MUX_uxn_device_h_l115_c3_ac2e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_iffalse := VAR_ram_addr_MUX_uxn_device_h_l203_c8_5cd3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_iffalse := VAR_ram_addr_MUX_uxn_device_h_l216_c8_cb35_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_e187_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_e187_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_2337_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_2337_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_3e72_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_3e72_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_83ea_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_83ea_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_6dc2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_6dc2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_d6ff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4ee5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_1566_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_d6ff_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4ee5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_1566_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4ee5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l222_c4_1566_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_3e72_iftrue := VAR_x_MUX_uxn_device_h_l126_c3_bba9_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_83ea_iftrue := VAR_x_MUX_uxn_device_h_l133_c3_9349_return_output;
     VAR_x_MUX_uxn_device_h_l175_c3_3f62_iftrue := VAR_x_MUX_uxn_device_h_l180_c4_d6ff_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_6dc2_iftrue := VAR_y_MUX_uxn_device_h_l139_c3_4fb1_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_5fb2_iftrue := VAR_y_MUX_uxn_device_h_l146_c3_b47a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_iffalse := VAR_result_vram_address_uxn_device_h_l165_c5_2ec9;
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_left := VAR_vram_addr_uxn_device_h_l157_c5_dc16;
     -- result_u8_value_MUX[uxn_device_h_l209_c3_db96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l209_c3_db96_cond <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_cond;
     result_u8_value_MUX_uxn_device_h_l209_c3_db96_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_iftrue;
     result_u8_value_MUX_uxn_device_h_l209_c3_db96_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_return_output := result_u8_value_MUX_uxn_device_h_l209_c3_db96_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_3f62] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_return_output := result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e[uxn_device_h_l195_c7_5eea] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l195_c7_5eea_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8f67_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8f67_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8f67_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_db96] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_return_output := result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_return_output;

     -- ctrl_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_cond;
     ctrl_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     ctrl_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_return_output := ctrl_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l175_c3_3f62] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_cond;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_return_output := result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_return_output;

     -- x_MUX[uxn_device_h_l175_c3_3f62] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l175_c3_3f62_cond <= VAR_x_MUX_uxn_device_h_l175_c3_3f62_cond;
     x_MUX_uxn_device_h_l175_c3_3f62_iftrue <= VAR_x_MUX_uxn_device_h_l175_c3_3f62_iftrue;
     x_MUX_uxn_device_h_l175_c3_3f62_iffalse <= VAR_x_MUX_uxn_device_h_l175_c3_3f62_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l175_c3_3f62_return_output := x_MUX_uxn_device_h_l175_c3_3f62_return_output;

     -- layer_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_layer_MUX_uxn_device_h_l114_c7_2337_cond;
     layer_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_layer_MUX_uxn_device_h_l114_c7_2337_iftrue;
     layer_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_layer_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l114_c7_2337_return_output := layer_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- result_u8_value_MUX[uxn_device_h_l221_c3_bfb8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_cond <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_cond;
     result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iftrue;
     result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_return_output := result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_return_output;

     -- ram_addr_MUX[uxn_device_h_l196_c3_8f67] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l196_c3_8f67_cond <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_cond;
     ram_addr_MUX_uxn_device_h_l196_c3_8f67_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_iftrue;
     ram_addr_MUX_uxn_device_h_l196_c3_8f67_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_return_output := ram_addr_MUX_uxn_device_h_l196_c3_8f67_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_cond;
     is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_return_output := is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l102_c3_da0e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_cond;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_return_output := result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l181_c5_9aed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c5_9aed_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_cond;
     result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_return_output := result_u8_value_MUX_uxn_device_h_l181_c5_9aed_return_output;

     -- y_MUX[uxn_device_h_l145_c7_5fb2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l145_c7_5fb2_cond <= VAR_y_MUX_uxn_device_h_l145_c7_5fb2_cond;
     y_MUX_uxn_device_h_l145_c7_5fb2_iftrue <= VAR_y_MUX_uxn_device_h_l145_c7_5fb2_iftrue;
     y_MUX_uxn_device_h_l145_c7_5fb2_iffalse <= VAR_y_MUX_uxn_device_h_l145_c7_5fb2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l145_c7_5fb2_return_output := y_MUX_uxn_device_h_l145_c7_5fb2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l209_c3_db96] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_cond;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_return_output := result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_bfb8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_return_output := result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_return_output;

     -- BIN_OP_AND[uxn_device_h_l158_c5_53ee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l158_c5_53ee_left <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_left;
     BIN_OP_AND_uxn_device_h_l158_c5_53ee_right <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_return_output := BIN_OP_AND_uxn_device_h_l158_c5_53ee_return_output;

     -- flip_y_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_cond;
     flip_y_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_iftrue;
     flip_y_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_return_output := flip_y_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- flip_x_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_cond;
     flip_x_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_iftrue;
     flip_x_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_return_output := flip_x_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- ram_addr_MUX[uxn_device_h_l209_c3_db96] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l209_c3_db96_cond <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_cond;
     ram_addr_MUX_uxn_device_h_l209_c3_db96_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_iftrue;
     ram_addr_MUX_uxn_device_h_l209_c3_db96_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_return_output := ram_addr_MUX_uxn_device_h_l209_c3_db96_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_cond;
     ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iftrue;
     ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_return_output := ctrl_mode_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- color_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_color_MUX_uxn_device_h_l109_c7_e187_cond;
     color_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_color_MUX_uxn_device_h_l109_c7_e187_iftrue;
     color_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_color_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l109_c7_e187_return_output := color_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_da0e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_3e72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l221_c3_bfb8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_cond;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_return_output := result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_5fb2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_5fb2_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_return_output := auto_advance_MUX_uxn_device_h_l145_c7_5fb2_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_left := VAR_BIN_OP_AND_uxn_device_h_l158_c5_53ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_3e72_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_5fb2_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_color_MUX_uxn_device_h_l109_c7_e187_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_flip_x_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_flip_y_MUX_uxn_device_h_l114_c7_2337_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_layer_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_iftrue := VAR_ram_addr_MUX_uxn_device_h_l196_c3_8f67_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_iftrue := VAR_ram_addr_MUX_uxn_device_h_l209_c3_db96_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_5eea_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l195_c7_5eea_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c5_9aed_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_d18b_iftrue := VAR_x_MUX_uxn_device_h_l175_c3_3f62_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_6dc2_iffalse := VAR_y_MUX_uxn_device_h_l145_c7_5fb2_return_output;
     -- BIN_OP_OR[uxn_device_h_l159_c5_00db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l159_c5_00db_left <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_left;
     BIN_OP_OR_uxn_device_h_l159_c5_00db_right <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_return_output := BIN_OP_OR_uxn_device_h_l159_c5_00db_return_output;

     -- layer_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_layer_MUX_uxn_device_h_l109_c7_e187_cond;
     layer_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_layer_MUX_uxn_device_h_l109_c7_e187_iftrue;
     layer_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_layer_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l109_c7_e187_return_output := layer_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_cond;
     ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iftrue;
     ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_return_output := ctrl_mode_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l95_c2_c85f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_c85f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_da0e_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_da0e_return_output);

     -- result_u8_value_MUX[uxn_device_h_l180_c4_d6ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_cond;
     result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_return_output := result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_return_output;

     -- auto_advance_MUX[uxn_device_h_l138_c7_6dc2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l138_c7_6dc2_cond <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_cond;
     auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iftrue;
     auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_return_output := auto_advance_MUX_uxn_device_h_l138_c7_6dc2_return_output;

     -- flip_x_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_cond;
     flip_x_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_iftrue;
     flip_x_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_return_output := flip_x_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- x_MUX[uxn_device_h_l174_c7_d18b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l174_c7_d18b_cond <= VAR_x_MUX_uxn_device_h_l174_c7_d18b_cond;
     x_MUX_uxn_device_h_l174_c7_d18b_iftrue <= VAR_x_MUX_uxn_device_h_l174_c7_d18b_iftrue;
     x_MUX_uxn_device_h_l174_c7_d18b_iffalse <= VAR_x_MUX_uxn_device_h_l174_c7_d18b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l174_c7_d18b_return_output := x_MUX_uxn_device_h_l174_c7_d18b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_83ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_return_output;

     -- ram_addr_MUX[uxn_device_h_l208_c7_c979] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l208_c7_c979_cond <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_cond;
     ram_addr_MUX_uxn_device_h_l208_c7_c979_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_iftrue;
     ram_addr_MUX_uxn_device_h_l208_c7_c979_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_return_output := ram_addr_MUX_uxn_device_h_l208_c7_c979_return_output;

     -- flip_y_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_cond;
     flip_y_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_iftrue;
     flip_y_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_return_output := flip_y_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- y_MUX[uxn_device_h_l138_c7_6dc2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c7_6dc2_cond <= VAR_y_MUX_uxn_device_h_l138_c7_6dc2_cond;
     y_MUX_uxn_device_h_l138_c7_6dc2_iftrue <= VAR_y_MUX_uxn_device_h_l138_c7_6dc2_iftrue;
     y_MUX_uxn_device_h_l138_c7_6dc2_iffalse <= VAR_y_MUX_uxn_device_h_l138_c7_6dc2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c7_6dc2_return_output := y_MUX_uxn_device_h_l138_c7_6dc2_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e[uxn_device_h_l208_c7_c979] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l208_c7_c979_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_db96_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_db96_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_db96_return_output);

     -- color_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_color_MUX_uxn_device_h_l95_c2_c85f_cond;
     color_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_color_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     color_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_color_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l95_c2_c85f_return_output := color_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e[uxn_device_h_l220_c7_767e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l220_c7_767e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_bfb8_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_bfb8_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_bfb8_return_output);

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_left := VAR_BIN_OP_OR_uxn_device_h_l159_c5_00db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_83ea_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_iffalse := VAR_auto_advance_MUX_uxn_device_h_l138_c7_6dc2_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_flip_x_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_flip_y_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_layer_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_iffalse := VAR_ram_addr_MUX_uxn_device_h_l208_c7_c979_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_c85f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l95_c2_c85f_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_c979_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l208_c7_c979_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_767e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_cc8e_uxn_device_h_l220_c7_767e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l180_c4_d6ff_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_7d97_iffalse := VAR_x_MUX_uxn_device_h_l174_c7_d18b_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_83ea_iffalse := VAR_y_MUX_uxn_device_h_l138_c7_6dc2_return_output;
     -- x_MUX[uxn_device_h_l150_c7_7d97] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l150_c7_7d97_cond <= VAR_x_MUX_uxn_device_h_l150_c7_7d97_cond;
     x_MUX_uxn_device_h_l150_c7_7d97_iftrue <= VAR_x_MUX_uxn_device_h_l150_c7_7d97_iftrue;
     x_MUX_uxn_device_h_l150_c7_7d97_iffalse <= VAR_x_MUX_uxn_device_h_l150_c7_7d97_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l150_c7_7d97_return_output := x_MUX_uxn_device_h_l150_c7_7d97_return_output;

     -- y_MUX[uxn_device_h_l132_c7_83ea] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l132_c7_83ea_cond <= VAR_y_MUX_uxn_device_h_l132_c7_83ea_cond;
     y_MUX_uxn_device_h_l132_c7_83ea_iftrue <= VAR_y_MUX_uxn_device_h_l132_c7_83ea_iftrue;
     y_MUX_uxn_device_h_l132_c7_83ea_iffalse <= VAR_y_MUX_uxn_device_h_l132_c7_83ea_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l132_c7_83ea_return_output := y_MUX_uxn_device_h_l132_c7_83ea_return_output;

     -- BIN_OP_OR[uxn_device_h_l160_c5_3e8c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l160_c5_3e8c_left <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_left;
     BIN_OP_OR_uxn_device_h_l160_c5_3e8c_right <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_return_output := BIN_OP_OR_uxn_device_h_l160_c5_3e8c_return_output;

     -- result_u8_value_MUX[uxn_device_h_l175_c3_3f62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l175_c3_3f62_cond <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_cond;
     result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iftrue;
     result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_return_output := result_u8_value_MUX_uxn_device_h_l175_c3_3f62_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_6dc2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_cond;
     ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_return_output := ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- flip_x_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_cond;
     flip_x_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     flip_x_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_return_output := flip_x_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- flip_y_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_cond;
     flip_y_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     flip_y_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_return_output := flip_y_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- layer_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_layer_MUX_uxn_device_h_l95_c2_c85f_cond;
     layer_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_layer_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     layer_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_layer_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l95_c2_c85f_return_output := layer_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- ram_addr_MUX[uxn_device_h_l195_c7_5eea] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l195_c7_5eea_cond <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_cond;
     ram_addr_MUX_uxn_device_h_l195_c7_5eea_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_iftrue;
     ram_addr_MUX_uxn_device_h_l195_c7_5eea_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_return_output := ram_addr_MUX_uxn_device_h_l195_c7_5eea_return_output;

     -- auto_advance_MUX[uxn_device_h_l132_c7_83ea] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l132_c7_83ea_cond <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_cond;
     auto_advance_MUX_uxn_device_h_l132_c7_83ea_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_iftrue;
     auto_advance_MUX_uxn_device_h_l132_c7_83ea_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_return_output := auto_advance_MUX_uxn_device_h_l132_c7_83ea_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_left := VAR_BIN_OP_OR_uxn_device_h_l160_c5_3e8c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_6dc2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_iffalse := VAR_auto_advance_MUX_uxn_device_h_l132_c7_83ea_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_c85f_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l95_c2_c85f_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l95_c2_c85f_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l195_c7_5eea_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_5fb2_iffalse := VAR_x_MUX_uxn_device_h_l150_c7_7d97_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_3e72_iffalse := VAR_y_MUX_uxn_device_h_l132_c7_83ea_return_output;
     -- ram_addr_MUX[uxn_device_h_l174_c7_d18b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l174_c7_d18b_cond <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_cond;
     ram_addr_MUX_uxn_device_h_l174_c7_d18b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_iftrue;
     ram_addr_MUX_uxn_device_h_l174_c7_d18b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_return_output := ram_addr_MUX_uxn_device_h_l174_c7_d18b_return_output;

     -- BIN_OP_OR[uxn_device_h_l161_c5_311b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l161_c5_311b_left <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_left;
     BIN_OP_OR_uxn_device_h_l161_c5_311b_right <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output := BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_5fb2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8105[uxn_device_h_l174_c7_d18b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8105_uxn_device_h_l174_c7_d18b_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_8105(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_3f62_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_3f62_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_3f62_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_3f62_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_3f62_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_3f62_return_output);

     -- auto_advance_MUX[uxn_device_h_l125_c7_3e72] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_3e72_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_3e72_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_3e72_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_return_output := auto_advance_MUX_uxn_device_h_l125_c7_3e72_return_output;

     -- x_MUX[uxn_device_h_l145_c7_5fb2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l145_c7_5fb2_cond <= VAR_x_MUX_uxn_device_h_l145_c7_5fb2_cond;
     x_MUX_uxn_device_h_l145_c7_5fb2_iftrue <= VAR_x_MUX_uxn_device_h_l145_c7_5fb2_iftrue;
     x_MUX_uxn_device_h_l145_c7_5fb2_iffalse <= VAR_x_MUX_uxn_device_h_l145_c7_5fb2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l145_c7_5fb2_return_output := x_MUX_uxn_device_h_l145_c7_5fb2_return_output;

     -- y_MUX[uxn_device_h_l125_c7_3e72] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_3e72_cond <= VAR_y_MUX_uxn_device_h_l125_c7_3e72_cond;
     y_MUX_uxn_device_h_l125_c7_3e72_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_3e72_iftrue;
     y_MUX_uxn_device_h_l125_c7_3e72_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_3e72_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_3e72_return_output := y_MUX_uxn_device_h_l125_c7_3e72_return_output;

     -- Submodule level 7
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_311b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_5fb2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_3e72_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse := VAR_ram_addr_MUX_uxn_device_h_l174_c7_d18b_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_d18b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8105_uxn_device_h_l174_c7_d18b_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_6dc2_iffalse := VAR_x_MUX_uxn_device_h_l145_c7_5fb2_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_2337_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_3e72_return_output;
     -- auto_advance_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_return_output := auto_advance_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- ram_addr_MUX[uxn_device_h_l150_c7_7d97] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l150_c7_7d97_cond <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_cond;
     ram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue;
     ram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output := ram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output;

     -- result_vram_address_MUX[uxn_device_h_l156_c4_625a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l156_c4_625a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_cond;
     result_vram_address_MUX_uxn_device_h_l156_c4_625a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_iftrue;
     result_vram_address_MUX_uxn_device_h_l156_c4_625a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_return_output := result_vram_address_MUX_uxn_device_h_l156_c4_625a_return_output;

     -- y_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_y_MUX_uxn_device_h_l114_c7_2337_cond;
     y_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_2337_iftrue;
     y_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_2337_return_output := y_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_7d97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_return_output;

     -- vram_addr_MUX[uxn_device_h_l156_c4_625a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l156_c4_625a_cond <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_cond;
     vram_addr_MUX_uxn_device_h_l156_c4_625a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_iftrue;
     vram_addr_MUX_uxn_device_h_l156_c4_625a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_return_output := vram_addr_MUX_uxn_device_h_l156_c4_625a_return_output;

     -- x_MUX[uxn_device_h_l138_c7_6dc2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l138_c7_6dc2_cond <= VAR_x_MUX_uxn_device_h_l138_c7_6dc2_cond;
     x_MUX_uxn_device_h_l138_c7_6dc2_iftrue <= VAR_x_MUX_uxn_device_h_l138_c7_6dc2_iftrue;
     x_MUX_uxn_device_h_l138_c7_6dc2_iffalse <= VAR_x_MUX_uxn_device_h_l138_c7_6dc2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l138_c7_6dc2_return_output := x_MUX_uxn_device_h_l138_c7_6dc2_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_7d97_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l156_c4_625a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_iftrue := VAR_vram_addr_MUX_uxn_device_h_l156_c4_625a_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_83ea_iffalse := VAR_x_MUX_uxn_device_h_l138_c7_6dc2_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_2337_return_output;
     -- y_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_y_MUX_uxn_device_h_l109_c7_e187_cond;
     y_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_y_MUX_uxn_device_h_l109_c7_e187_iftrue;
     y_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_y_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l109_c7_e187_return_output := y_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_d18b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c3_9123] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c3_9123_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_cond;
     result_vram_address_MUX_uxn_device_h_l151_c3_9123_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c3_9123_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_return_output := result_vram_address_MUX_uxn_device_h_l151_c3_9123_return_output;

     -- x_MUX[uxn_device_h_l132_c7_83ea] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l132_c7_83ea_cond <= VAR_x_MUX_uxn_device_h_l132_c7_83ea_cond;
     x_MUX_uxn_device_h_l132_c7_83ea_iftrue <= VAR_x_MUX_uxn_device_h_l132_c7_83ea_iftrue;
     x_MUX_uxn_device_h_l132_c7_83ea_iffalse <= VAR_x_MUX_uxn_device_h_l132_c7_83ea_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l132_c7_83ea_return_output := x_MUX_uxn_device_h_l132_c7_83ea_return_output;

     -- auto_advance_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_cond;
     auto_advance_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_iftrue;
     auto_advance_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_return_output := auto_advance_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- ram_addr_MUX[uxn_device_h_l145_c7_5fb2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond;
     ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue;
     ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output := ram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output;

     -- vram_addr_MUX[uxn_device_h_l151_c3_9123] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l151_c3_9123_cond <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_cond;
     vram_addr_MUX_uxn_device_h_l151_c3_9123_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_iftrue;
     vram_addr_MUX_uxn_device_h_l151_c3_9123_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_return_output := vram_addr_MUX_uxn_device_h_l151_c3_9123_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_d18b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue := VAR_vram_addr_MUX_uxn_device_h_l151_c3_9123_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_3e72_iffalse := VAR_x_MUX_uxn_device_h_l132_c7_83ea_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_y_MUX_uxn_device_h_l109_c7_e187_return_output;
     -- auto_advance_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_cond;
     auto_advance_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     auto_advance_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_return_output := auto_advance_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- x_MUX[uxn_device_h_l125_c7_3e72] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l125_c7_3e72_cond <= VAR_x_MUX_uxn_device_h_l125_c7_3e72_cond;
     x_MUX_uxn_device_h_l125_c7_3e72_iftrue <= VAR_x_MUX_uxn_device_h_l125_c7_3e72_iftrue;
     x_MUX_uxn_device_h_l125_c7_3e72_iffalse <= VAR_x_MUX_uxn_device_h_l125_c7_3e72_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l125_c7_3e72_return_output := x_MUX_uxn_device_h_l125_c7_3e72_return_output;

     -- ram_addr_MUX[uxn_device_h_l138_c7_6dc2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond;
     ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue;
     ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output := ram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_5eea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_return_output;

     -- vram_addr_MUX[uxn_device_h_l150_c7_7d97] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l150_c7_7d97_cond <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_cond;
     vram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_iftrue;
     vram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output := vram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b54[uxn_device_h_l150_c7_7d97] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b54_uxn_device_h_l150_c7_7d97_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_1b54(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_9123_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_9123_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_9123_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_9123_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_9123_return_output);

     -- y_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_y_MUX_uxn_device_h_l95_c2_c85f_cond;
     y_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_y_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     y_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_y_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l95_c2_c85f_return_output := y_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_5eea_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse := VAR_ram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_7d97_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_1b54_uxn_device_h_l150_c7_7d97_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse := VAR_vram_addr_MUX_uxn_device_h_l150_c7_7d97_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_2337_iffalse := VAR_x_MUX_uxn_device_h_l125_c7_3e72_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l95_c2_c85f_return_output;
     -- ram_addr_MUX[uxn_device_h_l132_c7_83ea] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l132_c7_83ea_cond <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_cond;
     ram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue;
     ram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output := ram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output;

     -- x_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_x_MUX_uxn_device_h_l114_c7_2337_cond;
     x_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_x_MUX_uxn_device_h_l114_c7_2337_iftrue;
     x_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_x_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l114_c7_2337_return_output := x_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_c979] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_5fb2] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output := vram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_c979_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse := VAR_ram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_5fb2_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_x_MUX_uxn_device_h_l114_c7_2337_return_output;
     -- x_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_x_MUX_uxn_device_h_l109_c7_e187_cond;
     x_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_x_MUX_uxn_device_h_l109_c7_e187_iftrue;
     x_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_x_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l109_c7_e187_return_output := x_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- vram_addr_MUX[uxn_device_h_l138_c7_6dc2] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_cond;
     vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iftrue;
     vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output := vram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_767e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_return_output;

     -- ram_addr_MUX[uxn_device_h_l125_c7_3e72] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l125_c7_3e72_cond <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_cond;
     ram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue;
     ram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output := ram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_767e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse := VAR_ram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse := VAR_vram_addr_MUX_uxn_device_h_l138_c7_6dc2_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_x_MUX_uxn_device_h_l109_c7_e187_return_output;
     -- x_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_x_MUX_uxn_device_h_l95_c2_c85f_cond;
     x_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_x_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     x_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_x_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l95_c2_c85f_return_output := x_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- ram_addr_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_cond;
     ram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue;
     ram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_return_output := ram_addr_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_2f5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_return_output;

     -- vram_addr_MUX[uxn_device_h_l132_c7_83ea] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l132_c7_83ea_cond <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_cond;
     vram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_iftrue;
     vram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output := vram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output;

     -- Submodule level 13
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_2f5a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_ram_addr_MUX_uxn_device_h_l114_c7_2337_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse := VAR_vram_addr_MUX_uxn_device_h_l132_c7_83ea_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l95_c2_c85f_return_output;
     -- vram_addr_MUX[uxn_device_h_l125_c7_3e72] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l125_c7_3e72_cond <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_cond;
     vram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_iftrue;
     vram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output := vram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output;

     -- ram_addr_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_cond;
     ram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue;
     ram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_return_output := ram_addr_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_6fdd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_return_output;

     -- Submodule level 14
     VAR_screen_blit_uxn_device_h_l231_c46_0413_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_6fdd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_ram_addr_MUX_uxn_device_h_l109_c7_e187_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse := VAR_vram_addr_MUX_uxn_device_h_l125_c7_3e72_return_output;
     -- vram_addr_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_return_output := vram_addr_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- screen_blit[uxn_device_h_l231_c46_0413] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l231_c46_0413_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l231_c46_0413_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l231_c46_0413_phase <= VAR_screen_blit_uxn_device_h_l231_c46_0413_phase;
     screen_blit_uxn_device_h_l231_c46_0413_ctrl <= VAR_screen_blit_uxn_device_h_l231_c46_0413_ctrl;
     screen_blit_uxn_device_h_l231_c46_0413_auto_advance <= VAR_screen_blit_uxn_device_h_l231_c46_0413_auto_advance;
     screen_blit_uxn_device_h_l231_c46_0413_x <= VAR_screen_blit_uxn_device_h_l231_c46_0413_x;
     screen_blit_uxn_device_h_l231_c46_0413_y <= VAR_screen_blit_uxn_device_h_l231_c46_0413_y;
     screen_blit_uxn_device_h_l231_c46_0413_ram_addr <= VAR_screen_blit_uxn_device_h_l231_c46_0413_ram_addr;
     screen_blit_uxn_device_h_l231_c46_0413_previous_ram_read <= VAR_screen_blit_uxn_device_h_l231_c46_0413_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output := screen_blit_uxn_device_h_l231_c46_0413_return_output;

     -- ram_addr_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_cond;
     ram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     ram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output := ram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- Submodule level 15
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_2337_return_output;
     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l237_c22_185f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_185f_return_output := VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l234_c27_1cbe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_1cbe_return_output := VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output.is_vram_write;

     -- CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d[uxn_device_h_l235_c26_09c3] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_09c3_return_output := VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l239_c25_56dd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_56dd_return_output := VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output.is_blit_done;

     -- vram_addr_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_cond;
     vram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_iftrue;
     vram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_return_output := vram_addr_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l236_c30_b578] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_b578_return_output := VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d[uxn_device_h_l238_c25_b1e8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_b1e8_return_output := VAR_screen_blit_uxn_device_h_l231_c46_0413_return_output.ram_address;

     -- Submodule level 16
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_vram_addr_MUX_uxn_device_h_l109_c7_e187_return_output;
     -- vram_addr_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_cond;
     vram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     vram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output := vram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6[uxn_device_h_l230_c3_d854] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_d854_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l233_c4_9cdf,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_1cbe_return_output,
     VAR_CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_09c3_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_b578_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_185f_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_b1e8_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_56dd_return_output);

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l230_c3_d854_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_d854_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l95_c2_c85f_return_output;
     -- result_MUX[uxn_device_h_l230_c3_d854] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l230_c3_d854_cond <= VAR_result_MUX_uxn_device_h_l230_c3_d854_cond;
     result_MUX_uxn_device_h_l230_c3_d854_iftrue <= VAR_result_MUX_uxn_device_h_l230_c3_d854_iftrue;
     result_MUX_uxn_device_h_l230_c3_d854_iffalse <= VAR_result_MUX_uxn_device_h_l230_c3_d854_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l230_c3_d854_return_output := result_MUX_uxn_device_h_l230_c3_d854_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l220_c7_767e_iffalse := VAR_result_MUX_uxn_device_h_l230_c3_d854_return_output;
     -- result_MUX[uxn_device_h_l220_c7_767e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l220_c7_767e_cond <= VAR_result_MUX_uxn_device_h_l220_c7_767e_cond;
     result_MUX_uxn_device_h_l220_c7_767e_iftrue <= VAR_result_MUX_uxn_device_h_l220_c7_767e_iftrue;
     result_MUX_uxn_device_h_l220_c7_767e_iffalse <= VAR_result_MUX_uxn_device_h_l220_c7_767e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l220_c7_767e_return_output := result_MUX_uxn_device_h_l220_c7_767e_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l208_c7_c979_iffalse := VAR_result_MUX_uxn_device_h_l220_c7_767e_return_output;
     -- result_MUX[uxn_device_h_l208_c7_c979] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l208_c7_c979_cond <= VAR_result_MUX_uxn_device_h_l208_c7_c979_cond;
     result_MUX_uxn_device_h_l208_c7_c979_iftrue <= VAR_result_MUX_uxn_device_h_l208_c7_c979_iftrue;
     result_MUX_uxn_device_h_l208_c7_c979_iffalse <= VAR_result_MUX_uxn_device_h_l208_c7_c979_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l208_c7_c979_return_output := result_MUX_uxn_device_h_l208_c7_c979_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l195_c7_5eea_iffalse := VAR_result_MUX_uxn_device_h_l208_c7_c979_return_output;
     -- result_MUX[uxn_device_h_l195_c7_5eea] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l195_c7_5eea_cond <= VAR_result_MUX_uxn_device_h_l195_c7_5eea_cond;
     result_MUX_uxn_device_h_l195_c7_5eea_iftrue <= VAR_result_MUX_uxn_device_h_l195_c7_5eea_iftrue;
     result_MUX_uxn_device_h_l195_c7_5eea_iffalse <= VAR_result_MUX_uxn_device_h_l195_c7_5eea_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l195_c7_5eea_return_output := result_MUX_uxn_device_h_l195_c7_5eea_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l174_c7_d18b_iffalse := VAR_result_MUX_uxn_device_h_l195_c7_5eea_return_output;
     -- result_MUX[uxn_device_h_l174_c7_d18b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c7_d18b_cond <= VAR_result_MUX_uxn_device_h_l174_c7_d18b_cond;
     result_MUX_uxn_device_h_l174_c7_d18b_iftrue <= VAR_result_MUX_uxn_device_h_l174_c7_d18b_iftrue;
     result_MUX_uxn_device_h_l174_c7_d18b_iffalse <= VAR_result_MUX_uxn_device_h_l174_c7_d18b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c7_d18b_return_output := result_MUX_uxn_device_h_l174_c7_d18b_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l150_c7_7d97_iffalse := VAR_result_MUX_uxn_device_h_l174_c7_d18b_return_output;
     -- result_MUX[uxn_device_h_l150_c7_7d97] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l150_c7_7d97_cond <= VAR_result_MUX_uxn_device_h_l150_c7_7d97_cond;
     result_MUX_uxn_device_h_l150_c7_7d97_iftrue <= VAR_result_MUX_uxn_device_h_l150_c7_7d97_iftrue;
     result_MUX_uxn_device_h_l150_c7_7d97_iffalse <= VAR_result_MUX_uxn_device_h_l150_c7_7d97_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l150_c7_7d97_return_output := result_MUX_uxn_device_h_l150_c7_7d97_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l145_c7_5fb2_iffalse := VAR_result_MUX_uxn_device_h_l150_c7_7d97_return_output;
     -- result_MUX[uxn_device_h_l145_c7_5fb2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l145_c7_5fb2_cond <= VAR_result_MUX_uxn_device_h_l145_c7_5fb2_cond;
     result_MUX_uxn_device_h_l145_c7_5fb2_iftrue <= VAR_result_MUX_uxn_device_h_l145_c7_5fb2_iftrue;
     result_MUX_uxn_device_h_l145_c7_5fb2_iffalse <= VAR_result_MUX_uxn_device_h_l145_c7_5fb2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l145_c7_5fb2_return_output := result_MUX_uxn_device_h_l145_c7_5fb2_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l138_c7_6dc2_iffalse := VAR_result_MUX_uxn_device_h_l145_c7_5fb2_return_output;
     -- result_MUX[uxn_device_h_l138_c7_6dc2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l138_c7_6dc2_cond <= VAR_result_MUX_uxn_device_h_l138_c7_6dc2_cond;
     result_MUX_uxn_device_h_l138_c7_6dc2_iftrue <= VAR_result_MUX_uxn_device_h_l138_c7_6dc2_iftrue;
     result_MUX_uxn_device_h_l138_c7_6dc2_iffalse <= VAR_result_MUX_uxn_device_h_l138_c7_6dc2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l138_c7_6dc2_return_output := result_MUX_uxn_device_h_l138_c7_6dc2_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l132_c7_83ea_iffalse := VAR_result_MUX_uxn_device_h_l138_c7_6dc2_return_output;
     -- result_MUX[uxn_device_h_l132_c7_83ea] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l132_c7_83ea_cond <= VAR_result_MUX_uxn_device_h_l132_c7_83ea_cond;
     result_MUX_uxn_device_h_l132_c7_83ea_iftrue <= VAR_result_MUX_uxn_device_h_l132_c7_83ea_iftrue;
     result_MUX_uxn_device_h_l132_c7_83ea_iffalse <= VAR_result_MUX_uxn_device_h_l132_c7_83ea_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l132_c7_83ea_return_output := result_MUX_uxn_device_h_l132_c7_83ea_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l125_c7_3e72_iffalse := VAR_result_MUX_uxn_device_h_l132_c7_83ea_return_output;
     -- result_MUX[uxn_device_h_l125_c7_3e72] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l125_c7_3e72_cond <= VAR_result_MUX_uxn_device_h_l125_c7_3e72_cond;
     result_MUX_uxn_device_h_l125_c7_3e72_iftrue <= VAR_result_MUX_uxn_device_h_l125_c7_3e72_iftrue;
     result_MUX_uxn_device_h_l125_c7_3e72_iffalse <= VAR_result_MUX_uxn_device_h_l125_c7_3e72_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l125_c7_3e72_return_output := result_MUX_uxn_device_h_l125_c7_3e72_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l114_c7_2337_iffalse := VAR_result_MUX_uxn_device_h_l125_c7_3e72_return_output;
     -- result_MUX[uxn_device_h_l114_c7_2337] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l114_c7_2337_cond <= VAR_result_MUX_uxn_device_h_l114_c7_2337_cond;
     result_MUX_uxn_device_h_l114_c7_2337_iftrue <= VAR_result_MUX_uxn_device_h_l114_c7_2337_iftrue;
     result_MUX_uxn_device_h_l114_c7_2337_iffalse <= VAR_result_MUX_uxn_device_h_l114_c7_2337_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l114_c7_2337_return_output := result_MUX_uxn_device_h_l114_c7_2337_return_output;

     -- Submodule level 28
     VAR_result_MUX_uxn_device_h_l109_c7_e187_iffalse := VAR_result_MUX_uxn_device_h_l114_c7_2337_return_output;
     -- result_MUX[uxn_device_h_l109_c7_e187] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l109_c7_e187_cond <= VAR_result_MUX_uxn_device_h_l109_c7_e187_cond;
     result_MUX_uxn_device_h_l109_c7_e187_iftrue <= VAR_result_MUX_uxn_device_h_l109_c7_e187_iftrue;
     result_MUX_uxn_device_h_l109_c7_e187_iffalse <= VAR_result_MUX_uxn_device_h_l109_c7_e187_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l109_c7_e187_return_output := result_MUX_uxn_device_h_l109_c7_e187_return_output;

     -- Submodule level 29
     VAR_result_MUX_uxn_device_h_l95_c2_c85f_iffalse := VAR_result_MUX_uxn_device_h_l109_c7_e187_return_output;
     -- result_MUX[uxn_device_h_l95_c2_c85f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l95_c2_c85f_cond <= VAR_result_MUX_uxn_device_h_l95_c2_c85f_cond;
     result_MUX_uxn_device_h_l95_c2_c85f_iftrue <= VAR_result_MUX_uxn_device_h_l95_c2_c85f_iftrue;
     result_MUX_uxn_device_h_l95_c2_c85f_iffalse <= VAR_result_MUX_uxn_device_h_l95_c2_c85f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l95_c2_c85f_return_output := result_MUX_uxn_device_h_l95_c2_c85f_return_output;

     -- Submodule level 30
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l95_c2_c85f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l95_c2_c85f_return_output;
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
