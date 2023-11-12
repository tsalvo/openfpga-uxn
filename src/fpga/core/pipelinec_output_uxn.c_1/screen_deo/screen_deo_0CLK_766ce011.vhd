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
-- BIN_OP_EQ[uxn_device_h_l95_c6_b027]
signal BIN_OP_EQ_uxn_device_h_l95_c6_b027_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_b027_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_88ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l95_c2_6132]
signal ctrl_mode_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l95_c2_6132]
signal flip_x_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l95_c2_6132]
signal vram_addr_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l95_c2_6132]
signal auto_advance_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l95_c2_6132]
signal ram_addr_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l95_c2_6132]
signal color_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(3 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l95_c2_6132]
signal is_drawing_port_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l95_c2_6132]
signal flip_y_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l95_c2_6132]
signal is_sprite_port_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l95_c2_6132]
signal x_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l95_c2_6132]
signal layer_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l95_c2_6132]
signal is_pixel_port_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l95_c2_6132]
signal y_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l95_c2_6132]
signal result_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c2_6132_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_6132_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_6132_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l95_c2_6132]
signal ctrl_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l96_c19_f214]
signal BIN_OP_EQ_uxn_device_h_l96_c19_f214_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_f214_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_f214_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l96_c19_f911]
signal MUX_uxn_device_h_l96_c19_f911_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_f911_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_f911_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_f911_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l97_c20_b02c]
signal BIN_OP_EQ_uxn_device_h_l97_c20_b02c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_b02c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_b02c_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l97_c20_b97a]
signal MUX_uxn_device_h_l97_c20_b97a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_b97a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_b97a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_b97a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c21_1471]
signal BIN_OP_OR_uxn_device_h_l98_c21_1471_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_1471_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l102_c3_3723]
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_3723]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l103_c32_69ce]
signal MUX_uxn_device_h_l103_c32_69ce_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l103_c32_69ce_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_69ce_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_69ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c11_ac6f]
signal BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_30f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l109_c7_88ae]
signal ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l109_c7_88ae]
signal flip_x_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l109_c7_88ae]
signal vram_addr_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l109_c7_88ae]
signal auto_advance_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l109_c7_88ae]
signal ram_addr_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l109_c7_88ae]
signal color_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(3 downto 0);

-- flip_y_MUX[uxn_device_h_l109_c7_88ae]
signal flip_y_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l109_c7_88ae]
signal x_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l109_c7_88ae]
signal layer_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l109_c7_88ae]
signal y_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l109_c7_88ae]
signal result_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l109_c7_88ae_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_88ae_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_88ae_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l109_c7_88ae]
signal ctrl_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l110_c3_f4cb]
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_b377]
signal BIN_OP_EQ_uxn_device_h_l114_c11_b377_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_b377_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_aea3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l114_c7_30f0]
signal ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l114_c7_30f0]
signal flip_x_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_30f0]
signal vram_addr_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_30f0]
signal auto_advance_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l114_c7_30f0]
signal ram_addr_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l114_c7_30f0]
signal color_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(3 downto 0);

-- flip_y_MUX[uxn_device_h_l114_c7_30f0]
signal flip_y_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l114_c7_30f0]
signal x_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l114_c7_30f0]
signal layer_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l114_c7_30f0]
signal y_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l114_c7_30f0]
signal result_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l114_c7_30f0_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_30f0_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_30f0_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l114_c7_30f0]
signal ctrl_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l115_c3_03f4]
signal ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l115_c3_03f4]
signal flip_x_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l115_c3_03f4]
signal color_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(3 downto 0);

-- flip_y_MUX[uxn_device_h_l115_c3_03f4]
signal flip_y_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l115_c3_03f4]
signal layer_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_03f4]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l115_c3_03f4]
signal ctrl_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(7 downto 0);

-- CONST_SR_7[uxn_device_h_l118_c26_600f]
signal CONST_SR_7_uxn_device_h_l118_c26_600f_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l118_c26_600f_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l119_c22_065c]
signal CONST_SR_6_uxn_device_h_l119_c22_065c_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l119_c22_065c_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l120_c23_60bc]
signal CONST_SR_5_uxn_device_h_l120_c23_60bc_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l120_c23_60bc_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l121_c23_451f]
signal CONST_SR_4_uxn_device_h_l121_c23_451f_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l121_c23_451f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_b91a]
signal BIN_OP_EQ_uxn_device_h_l125_c11_b91a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_b91a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_865e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l125_c7_aea3]
signal vram_addr_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_aea3]
signal auto_advance_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l125_c7_aea3]
signal ram_addr_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l125_c7_aea3]
signal x_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l125_c7_aea3]
signal y_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l125_c7_aea3]
signal result_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l125_c7_aea3_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_aea3_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_aea3_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l126_c3_678e]
signal x_MUX_uxn_device_h_l126_c3_678e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l126_c3_678e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_678e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_678e_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_678e]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c11_c9ff]
signal BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_3af4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l132_c7_865e]
signal vram_addr_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l132_c7_865e]
signal auto_advance_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l132_c7_865e]
signal ram_addr_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l132_c7_865e]
signal x_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l132_c7_865e]
signal y_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l132_c7_865e]
signal result_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l132_c7_865e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_865e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_865e_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l133_c3_0a71]
signal x_MUX_uxn_device_h_l133_c3_0a71_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l133_c3_0a71_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_0a71_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_0a71_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c3_0a71]
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l134_c4_ffd4]
signal BIN_OP_OR_uxn_device_h_l134_c4_ffd4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_ffd4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_ffd4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c11_1fa7]
signal BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_af89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l138_c7_3af4]
signal vram_addr_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l138_c7_3af4]
signal auto_advance_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l138_c7_3af4]
signal ram_addr_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l138_c7_3af4]
signal x_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l138_c7_3af4]
signal y_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l138_c7_3af4]
signal result_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l138_c7_3af4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_3af4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_3af4_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l139_c3_f781]
signal y_MUX_uxn_device_h_l139_c3_f781_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l139_c3_f781_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_f781_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_f781_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l139_c3_f781]
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_5133]
signal BIN_OP_EQ_uxn_device_h_l145_c11_5133_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_5133_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_ba7b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_af89]
signal vram_addr_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_af89]
signal auto_advance_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l145_c7_af89]
signal ram_addr_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l145_c7_af89]
signal x_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l145_c7_af89]
signal y_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l145_c7_af89]
signal result_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l145_c7_af89_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_af89_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_af89_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l146_c3_25c6]
signal y_MUX_uxn_device_h_l146_c3_25c6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l146_c3_25c6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_25c6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_25c6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l147_c4_7e82]
signal BIN_OP_OR_uxn_device_h_l147_c4_7e82_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_7e82_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_7e82_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c11_de6c]
signal BIN_OP_EQ_uxn_device_h_l150_c11_de6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_de6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_df1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l150_c7_ba7b]
signal vram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l150_c7_ba7b]
signal auto_advance_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l150_c7_ba7b]
signal ram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l150_c7_ba7b]
signal x_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l150_c7_ba7b]
signal result_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l150_c7_ba7b_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_ba7b_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_ba7b_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l151_c3_a7b7]
signal vram_addr_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c3_a7b7]
signal auto_advance_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c3_a7b7]
signal result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l151_c3_a7b7]
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c3_a7b7]
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c3_a7b7]
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l151_c3_a7b7]
signal result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l154_c32_9436]
signal BIN_OP_AND_uxn_device_h_l154_c32_9436_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_9436_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_9436_return_output : unsigned(3 downto 0);

-- vram_addr_MUX[uxn_device_h_l156_c4_556d]
signal vram_addr_MUX_uxn_device_h_l156_c4_556d_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_556d_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_556d_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_556d_return_output : unsigned(31 downto 0);

-- result_vram_address_MUX[uxn_device_h_l156_c4_556d]
signal result_vram_address_MUX_uxn_device_h_l156_c4_556d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_556d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_556d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_556d_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l156_c4_556d]
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_a992]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c18_62a3]
signal BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l158_c5_c880]
signal BIN_OP_AND_uxn_device_h_l158_c5_c880_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_c880_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_c880_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l159_c19_a521]
signal MUX_uxn_device_h_l159_c19_a521_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c19_a521_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_a521_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_a521_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l159_c5_1fd4]
signal BIN_OP_OR_uxn_device_h_l159_c5_1fd4_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_1fd4_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_1fd4_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l160_c19_057b]
signal MUX_uxn_device_h_l160_c19_057b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l160_c19_057b_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_057b_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_057b_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l160_c5_9ecf]
signal BIN_OP_OR_uxn_device_h_l160_c5_9ecf_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_9ecf_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_9ecf_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l161_c5_f5b1]
signal BIN_OP_OR_uxn_device_h_l161_c5_f5b1_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_f5b1_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_80f9]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l165_c28_65f4]
signal BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_return_output : unsigned(64 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c8_0477]
signal auto_advance_MUX_uxn_device_h_l169_c8_0477_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_0477_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_0477_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_0477_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c8_0477]
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c11_230f]
signal BIN_OP_EQ_uxn_device_h_l174_c11_230f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_230f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_59ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l174_c7_df1c]
signal ram_addr_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_df1c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_df1c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_df1c_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l174_c7_df1c]
signal x_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l174_c7_df1c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_df1c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_df1c_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l174_c7_df1c]
signal result_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c7_df1c_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_df1c_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_df1c_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l175_c3_a316]
signal x_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_a316]
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l175_c3_a316]
signal result_vram_address_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l175_c3_a316]
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l175_c3_a316]
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l175_c3_a316]
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l175_c3_a316]
signal result_u8_value_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l180_c9_f0a9]
signal UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l180_c4_b7d1]
signal x_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_b7d1]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l180_c4_b7d1]
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c4_b7d1]
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c4_b7d1]
signal result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c9_4f0c]
signal BIN_OP_AND_uxn_device_h_l181_c9_4f0c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_4f0c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_4f0c_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l181_c5_1538]
signal x_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_1538]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c5_1538]
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c5_1538]
signal result_u8_value_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l182_c6_4a1c]
signal BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l185_c34_85be]
signal CONST_SR_8_uxn_device_h_l185_c34_85be_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l185_c34_85be_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l191_c8_4a3a]
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c11_c136]
signal BIN_OP_EQ_uxn_device_h_l195_c11_c136_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_c136_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_82d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l195_c7_59ab]
signal ram_addr_MUX_uxn_device_h_l195_c7_59ab_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_59ab_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_59ab_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_59ab_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l195_c7_59ab]
signal result_MUX_uxn_device_h_l195_c7_59ab_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l195_c7_59ab_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_59ab_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_59ab_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l196_c3_8e24]
signal ram_addr_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_8e24]
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l196_c3_8e24]
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l196_c3_8e24]
signal result_u8_value_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l197_c8_b8c8]
signal BIN_OP_AND_uxn_device_h_l197_c8_b8c8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_b8c8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_b8c8_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_e4e1]
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l197_c4_e4e1]
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l197_c4_e4e1]
signal result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l203_c8_d8cb]
signal ram_addr_MUX_uxn_device_h_l203_c8_d8cb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_d8cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l208_c11_faae]
signal BIN_OP_EQ_uxn_device_h_l208_c11_faae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_faae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_d1d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l208_c7_82d6]
signal ram_addr_MUX_uxn_device_h_l208_c7_82d6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_82d6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_82d6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_82d6_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l208_c7_82d6]
signal result_MUX_uxn_device_h_l208_c7_82d6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l208_c7_82d6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_82d6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_82d6_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l209_c3_f254]
signal ram_addr_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_f254]
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l209_c3_f254]
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l209_c3_f254]
signal result_u8_value_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l210_c9_0a41]
signal BIN_OP_AND_uxn_device_h_l210_c9_0a41_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_0a41_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_0a41_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_4388]
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l210_c4_4388]
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l210_c4_4388]
signal result_u8_value_MUX_uxn_device_h_l210_c4_4388_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_4388_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_4388_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_4388_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l213_c33_5a05]
signal CONST_SR_8_uxn_device_h_l213_c33_5a05_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l213_c33_5a05_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l216_c8_d199]
signal ram_addr_MUX_uxn_device_h_l216_c8_d199_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_d199_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_d199_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_d199_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l217_c4_b425]
signal BIN_OP_OR_uxn_device_h_l217_c4_b425_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_b425_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_b425_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l220_c11_2880]
signal BIN_OP_EQ_uxn_device_h_l220_c11_2880_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_2880_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_4a5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l220_c7_d1d5]
signal result_MUX_uxn_device_h_l220_c7_d1d5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l220_c7_d1d5_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_d1d5_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_d1d5_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_e0d7]
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l221_c3_e0d7]
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l221_c3_e0d7]
signal result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l222_c9_02bb]
signal BIN_OP_AND_uxn_device_h_l222_c9_02bb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_02bb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_02bb_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_799a]
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l222_c4_799a]
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l222_c4_799a]
signal result_u8_value_MUX_uxn_device_h_l222_c4_799a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_799a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_799a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_799a_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_e2b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l230_c3_0ce8]
signal result_MUX_uxn_device_h_l230_c3_0ce8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l230_c3_0ce8_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_0ce8_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_0ce8_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l231_c58_f012]
signal BIN_OP_MINUS_uxn_device_h_l231_c58_f012_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_f012_right : unsigned(3 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_f012_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l231_c46_3ca9]
signal screen_blit_uxn_device_h_l231_c46_3ca9_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_3ca9_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f
signal CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output : unsigned(7 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_34f0( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_3;
      base.device_ram_address := ref_toks_4;

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_20bc( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_3;
      base.is_vram_write := ref_toks_4;
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_9aa1( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_write := ref_toks_1;
      base.vram_address := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
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
-- BIN_OP_EQ_uxn_device_h_l95_c6_b027
BIN_OP_EQ_uxn_device_h_l95_c6_b027 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c6_b027_left,
BIN_OP_EQ_uxn_device_h_l95_c6_b027_right,
BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- ctrl_mode_MUX_uxn_device_h_l95_c2_6132
ctrl_mode_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l95_c2_6132_cond,
ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iftrue,
ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iffalse,
ctrl_mode_MUX_uxn_device_h_l95_c2_6132_return_output);

-- flip_x_MUX_uxn_device_h_l95_c2_6132
flip_x_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l95_c2_6132_cond,
flip_x_MUX_uxn_device_h_l95_c2_6132_iftrue,
flip_x_MUX_uxn_device_h_l95_c2_6132_iffalse,
flip_x_MUX_uxn_device_h_l95_c2_6132_return_output);

-- vram_addr_MUX_uxn_device_h_l95_c2_6132
vram_addr_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l95_c2_6132_cond,
vram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue,
vram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse,
vram_addr_MUX_uxn_device_h_l95_c2_6132_return_output);

-- auto_advance_MUX_uxn_device_h_l95_c2_6132
auto_advance_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l95_c2_6132_cond,
auto_advance_MUX_uxn_device_h_l95_c2_6132_iftrue,
auto_advance_MUX_uxn_device_h_l95_c2_6132_iffalse,
auto_advance_MUX_uxn_device_h_l95_c2_6132_return_output);

-- ram_addr_MUX_uxn_device_h_l95_c2_6132
ram_addr_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l95_c2_6132_cond,
ram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue,
ram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse,
ram_addr_MUX_uxn_device_h_l95_c2_6132_return_output);

-- color_MUX_uxn_device_h_l95_c2_6132
color_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l95_c2_6132_cond,
color_MUX_uxn_device_h_l95_c2_6132_iftrue,
color_MUX_uxn_device_h_l95_c2_6132_iffalse,
color_MUX_uxn_device_h_l95_c2_6132_return_output);

-- is_drawing_port_MUX_uxn_device_h_l95_c2_6132
is_drawing_port_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l95_c2_6132_cond,
is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iftrue,
is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iffalse,
is_drawing_port_MUX_uxn_device_h_l95_c2_6132_return_output);

-- flip_y_MUX_uxn_device_h_l95_c2_6132
flip_y_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l95_c2_6132_cond,
flip_y_MUX_uxn_device_h_l95_c2_6132_iftrue,
flip_y_MUX_uxn_device_h_l95_c2_6132_iffalse,
flip_y_MUX_uxn_device_h_l95_c2_6132_return_output);

-- is_sprite_port_MUX_uxn_device_h_l95_c2_6132
is_sprite_port_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l95_c2_6132_cond,
is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iftrue,
is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iffalse,
is_sprite_port_MUX_uxn_device_h_l95_c2_6132_return_output);

-- x_MUX_uxn_device_h_l95_c2_6132
x_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l95_c2_6132_cond,
x_MUX_uxn_device_h_l95_c2_6132_iftrue,
x_MUX_uxn_device_h_l95_c2_6132_iffalse,
x_MUX_uxn_device_h_l95_c2_6132_return_output);

-- layer_MUX_uxn_device_h_l95_c2_6132
layer_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l95_c2_6132_cond,
layer_MUX_uxn_device_h_l95_c2_6132_iftrue,
layer_MUX_uxn_device_h_l95_c2_6132_iffalse,
layer_MUX_uxn_device_h_l95_c2_6132_return_output);

-- is_pixel_port_MUX_uxn_device_h_l95_c2_6132
is_pixel_port_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l95_c2_6132_cond,
is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iftrue,
is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iffalse,
is_pixel_port_MUX_uxn_device_h_l95_c2_6132_return_output);

-- y_MUX_uxn_device_h_l95_c2_6132
y_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l95_c2_6132_cond,
y_MUX_uxn_device_h_l95_c2_6132_iftrue,
y_MUX_uxn_device_h_l95_c2_6132_iffalse,
y_MUX_uxn_device_h_l95_c2_6132_return_output);

-- result_MUX_uxn_device_h_l95_c2_6132
result_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l95_c2_6132_cond,
result_MUX_uxn_device_h_l95_c2_6132_iftrue,
result_MUX_uxn_device_h_l95_c2_6132_iffalse,
result_MUX_uxn_device_h_l95_c2_6132_return_output);

-- ctrl_MUX_uxn_device_h_l95_c2_6132
ctrl_MUX_uxn_device_h_l95_c2_6132 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l95_c2_6132_cond,
ctrl_MUX_uxn_device_h_l95_c2_6132_iftrue,
ctrl_MUX_uxn_device_h_l95_c2_6132_iffalse,
ctrl_MUX_uxn_device_h_l95_c2_6132_return_output);

-- BIN_OP_EQ_uxn_device_h_l96_c19_f214
BIN_OP_EQ_uxn_device_h_l96_c19_f214 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l96_c19_f214_left,
BIN_OP_EQ_uxn_device_h_l96_c19_f214_right,
BIN_OP_EQ_uxn_device_h_l96_c19_f214_return_output);

-- MUX_uxn_device_h_l96_c19_f911
MUX_uxn_device_h_l96_c19_f911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c19_f911_cond,
MUX_uxn_device_h_l96_c19_f911_iftrue,
MUX_uxn_device_h_l96_c19_f911_iffalse,
MUX_uxn_device_h_l96_c19_f911_return_output);

-- BIN_OP_EQ_uxn_device_h_l97_c20_b02c
BIN_OP_EQ_uxn_device_h_l97_c20_b02c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l97_c20_b02c_left,
BIN_OP_EQ_uxn_device_h_l97_c20_b02c_right,
BIN_OP_EQ_uxn_device_h_l97_c20_b02c_return_output);

-- MUX_uxn_device_h_l97_c20_b97a
MUX_uxn_device_h_l97_c20_b97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l97_c20_b97a_cond,
MUX_uxn_device_h_l97_c20_b97a_iftrue,
MUX_uxn_device_h_l97_c20_b97a_iffalse,
MUX_uxn_device_h_l97_c20_b97a_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c21_1471
BIN_OP_OR_uxn_device_h_l98_c21_1471 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c21_1471_left,
BIN_OP_OR_uxn_device_h_l98_c21_1471_right,
BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l102_c3_3723
result_is_deo_done_MUX_uxn_device_h_l102_c3_3723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_cond,
result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iftrue,
result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iffalse,
result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_3723
result_device_ram_address_MUX_uxn_device_h_l102_c3_3723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_return_output);

-- MUX_uxn_device_h_l103_c32_69ce
MUX_uxn_device_h_l103_c32_69ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l103_c32_69ce_cond,
MUX_uxn_device_h_l103_c32_69ce_iftrue,
MUX_uxn_device_h_l103_c32_69ce_iffalse,
MUX_uxn_device_h_l103_c32_69ce_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c11_ac6f
BIN_OP_EQ_uxn_device_h_l109_c11_ac6f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_left,
BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_right,
BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- ctrl_mode_MUX_uxn_device_h_l109_c7_88ae
ctrl_mode_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_cond,
ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iftrue,
ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iffalse,
ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- flip_x_MUX_uxn_device_h_l109_c7_88ae
flip_x_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l109_c7_88ae_cond,
flip_x_MUX_uxn_device_h_l109_c7_88ae_iftrue,
flip_x_MUX_uxn_device_h_l109_c7_88ae_iffalse,
flip_x_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- vram_addr_MUX_uxn_device_h_l109_c7_88ae
vram_addr_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l109_c7_88ae_cond,
vram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue,
vram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse,
vram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- auto_advance_MUX_uxn_device_h_l109_c7_88ae
auto_advance_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l109_c7_88ae_cond,
auto_advance_MUX_uxn_device_h_l109_c7_88ae_iftrue,
auto_advance_MUX_uxn_device_h_l109_c7_88ae_iffalse,
auto_advance_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- ram_addr_MUX_uxn_device_h_l109_c7_88ae
ram_addr_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l109_c7_88ae_cond,
ram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue,
ram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse,
ram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- color_MUX_uxn_device_h_l109_c7_88ae
color_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l109_c7_88ae_cond,
color_MUX_uxn_device_h_l109_c7_88ae_iftrue,
color_MUX_uxn_device_h_l109_c7_88ae_iffalse,
color_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- flip_y_MUX_uxn_device_h_l109_c7_88ae
flip_y_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l109_c7_88ae_cond,
flip_y_MUX_uxn_device_h_l109_c7_88ae_iftrue,
flip_y_MUX_uxn_device_h_l109_c7_88ae_iffalse,
flip_y_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- x_MUX_uxn_device_h_l109_c7_88ae
x_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l109_c7_88ae_cond,
x_MUX_uxn_device_h_l109_c7_88ae_iftrue,
x_MUX_uxn_device_h_l109_c7_88ae_iffalse,
x_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- layer_MUX_uxn_device_h_l109_c7_88ae
layer_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l109_c7_88ae_cond,
layer_MUX_uxn_device_h_l109_c7_88ae_iftrue,
layer_MUX_uxn_device_h_l109_c7_88ae_iffalse,
layer_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- y_MUX_uxn_device_h_l109_c7_88ae
y_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l109_c7_88ae_cond,
y_MUX_uxn_device_h_l109_c7_88ae_iftrue,
y_MUX_uxn_device_h_l109_c7_88ae_iffalse,
y_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- result_MUX_uxn_device_h_l109_c7_88ae
result_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l109_c7_88ae_cond,
result_MUX_uxn_device_h_l109_c7_88ae_iftrue,
result_MUX_uxn_device_h_l109_c7_88ae_iffalse,
result_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- ctrl_MUX_uxn_device_h_l109_c7_88ae
ctrl_MUX_uxn_device_h_l109_c7_88ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l109_c7_88ae_cond,
ctrl_MUX_uxn_device_h_l109_c7_88ae_iftrue,
ctrl_MUX_uxn_device_h_l109_c7_88ae_iffalse,
ctrl_MUX_uxn_device_h_l109_c7_88ae_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb
result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_cond,
result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_b377
BIN_OP_EQ_uxn_device_h_l114_c11_b377 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_b377_left,
BIN_OP_EQ_uxn_device_h_l114_c11_b377_right,
BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_return_output);

-- ctrl_mode_MUX_uxn_device_h_l114_c7_30f0
ctrl_mode_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_cond,
ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iftrue,
ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iffalse,
ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- flip_x_MUX_uxn_device_h_l114_c7_30f0
flip_x_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l114_c7_30f0_cond,
flip_x_MUX_uxn_device_h_l114_c7_30f0_iftrue,
flip_x_MUX_uxn_device_h_l114_c7_30f0_iffalse,
flip_x_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_30f0
vram_addr_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_30f0_cond,
vram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_30f0
auto_advance_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_30f0_cond,
auto_advance_MUX_uxn_device_h_l114_c7_30f0_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_30f0_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- ram_addr_MUX_uxn_device_h_l114_c7_30f0
ram_addr_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l114_c7_30f0_cond,
ram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue,
ram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse,
ram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- color_MUX_uxn_device_h_l114_c7_30f0
color_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l114_c7_30f0_cond,
color_MUX_uxn_device_h_l114_c7_30f0_iftrue,
color_MUX_uxn_device_h_l114_c7_30f0_iffalse,
color_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- flip_y_MUX_uxn_device_h_l114_c7_30f0
flip_y_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l114_c7_30f0_cond,
flip_y_MUX_uxn_device_h_l114_c7_30f0_iftrue,
flip_y_MUX_uxn_device_h_l114_c7_30f0_iffalse,
flip_y_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- x_MUX_uxn_device_h_l114_c7_30f0
x_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l114_c7_30f0_cond,
x_MUX_uxn_device_h_l114_c7_30f0_iftrue,
x_MUX_uxn_device_h_l114_c7_30f0_iffalse,
x_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- layer_MUX_uxn_device_h_l114_c7_30f0
layer_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l114_c7_30f0_cond,
layer_MUX_uxn_device_h_l114_c7_30f0_iftrue,
layer_MUX_uxn_device_h_l114_c7_30f0_iffalse,
layer_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- y_MUX_uxn_device_h_l114_c7_30f0
y_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_30f0_cond,
y_MUX_uxn_device_h_l114_c7_30f0_iftrue,
y_MUX_uxn_device_h_l114_c7_30f0_iffalse,
y_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- result_MUX_uxn_device_h_l114_c7_30f0
result_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l114_c7_30f0_cond,
result_MUX_uxn_device_h_l114_c7_30f0_iftrue,
result_MUX_uxn_device_h_l114_c7_30f0_iffalse,
result_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- ctrl_MUX_uxn_device_h_l114_c7_30f0
ctrl_MUX_uxn_device_h_l114_c7_30f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l114_c7_30f0_cond,
ctrl_MUX_uxn_device_h_l114_c7_30f0_iftrue,
ctrl_MUX_uxn_device_h_l114_c7_30f0_iffalse,
ctrl_MUX_uxn_device_h_l114_c7_30f0_return_output);

-- ctrl_mode_MUX_uxn_device_h_l115_c3_03f4
ctrl_mode_MUX_uxn_device_h_l115_c3_03f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_cond,
ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iftrue,
ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iffalse,
ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_return_output);

-- flip_x_MUX_uxn_device_h_l115_c3_03f4
flip_x_MUX_uxn_device_h_l115_c3_03f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l115_c3_03f4_cond,
flip_x_MUX_uxn_device_h_l115_c3_03f4_iftrue,
flip_x_MUX_uxn_device_h_l115_c3_03f4_iffalse,
flip_x_MUX_uxn_device_h_l115_c3_03f4_return_output);

-- color_MUX_uxn_device_h_l115_c3_03f4
color_MUX_uxn_device_h_l115_c3_03f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l115_c3_03f4_cond,
color_MUX_uxn_device_h_l115_c3_03f4_iftrue,
color_MUX_uxn_device_h_l115_c3_03f4_iffalse,
color_MUX_uxn_device_h_l115_c3_03f4_return_output);

-- flip_y_MUX_uxn_device_h_l115_c3_03f4
flip_y_MUX_uxn_device_h_l115_c3_03f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l115_c3_03f4_cond,
flip_y_MUX_uxn_device_h_l115_c3_03f4_iftrue,
flip_y_MUX_uxn_device_h_l115_c3_03f4_iffalse,
flip_y_MUX_uxn_device_h_l115_c3_03f4_return_output);

-- layer_MUX_uxn_device_h_l115_c3_03f4
layer_MUX_uxn_device_h_l115_c3_03f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l115_c3_03f4_cond,
layer_MUX_uxn_device_h_l115_c3_03f4_iftrue,
layer_MUX_uxn_device_h_l115_c3_03f4_iffalse,
layer_MUX_uxn_device_h_l115_c3_03f4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4
result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_return_output);

-- ctrl_MUX_uxn_device_h_l115_c3_03f4
ctrl_MUX_uxn_device_h_l115_c3_03f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l115_c3_03f4_cond,
ctrl_MUX_uxn_device_h_l115_c3_03f4_iftrue,
ctrl_MUX_uxn_device_h_l115_c3_03f4_iffalse,
ctrl_MUX_uxn_device_h_l115_c3_03f4_return_output);

-- CONST_SR_7_uxn_device_h_l118_c26_600f
CONST_SR_7_uxn_device_h_l118_c26_600f : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l118_c26_600f_x,
CONST_SR_7_uxn_device_h_l118_c26_600f_return_output);

-- CONST_SR_6_uxn_device_h_l119_c22_065c
CONST_SR_6_uxn_device_h_l119_c22_065c : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l119_c22_065c_x,
CONST_SR_6_uxn_device_h_l119_c22_065c_return_output);

-- CONST_SR_5_uxn_device_h_l120_c23_60bc
CONST_SR_5_uxn_device_h_l120_c23_60bc : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l120_c23_60bc_x,
CONST_SR_5_uxn_device_h_l120_c23_60bc_return_output);

-- CONST_SR_4_uxn_device_h_l121_c23_451f
CONST_SR_4_uxn_device_h_l121_c23_451f : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l121_c23_451f_x,
CONST_SR_4_uxn_device_h_l121_c23_451f_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_b91a
BIN_OP_EQ_uxn_device_h_l125_c11_b91a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_b91a_left,
BIN_OP_EQ_uxn_device_h_l125_c11_b91a_right,
BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_return_output);

-- vram_addr_MUX_uxn_device_h_l125_c7_aea3
vram_addr_MUX_uxn_device_h_l125_c7_aea3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l125_c7_aea3_cond,
vram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue,
vram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse,
vram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_aea3
auto_advance_MUX_uxn_device_h_l125_c7_aea3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_aea3_cond,
auto_advance_MUX_uxn_device_h_l125_c7_aea3_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_aea3_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_aea3_return_output);

-- ram_addr_MUX_uxn_device_h_l125_c7_aea3
ram_addr_MUX_uxn_device_h_l125_c7_aea3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l125_c7_aea3_cond,
ram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue,
ram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse,
ram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output);

-- x_MUX_uxn_device_h_l125_c7_aea3
x_MUX_uxn_device_h_l125_c7_aea3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l125_c7_aea3_cond,
x_MUX_uxn_device_h_l125_c7_aea3_iftrue,
x_MUX_uxn_device_h_l125_c7_aea3_iffalse,
x_MUX_uxn_device_h_l125_c7_aea3_return_output);

-- y_MUX_uxn_device_h_l125_c7_aea3
y_MUX_uxn_device_h_l125_c7_aea3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_aea3_cond,
y_MUX_uxn_device_h_l125_c7_aea3_iftrue,
y_MUX_uxn_device_h_l125_c7_aea3_iffalse,
y_MUX_uxn_device_h_l125_c7_aea3_return_output);

-- result_MUX_uxn_device_h_l125_c7_aea3
result_MUX_uxn_device_h_l125_c7_aea3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l125_c7_aea3_cond,
result_MUX_uxn_device_h_l125_c7_aea3_iftrue,
result_MUX_uxn_device_h_l125_c7_aea3_iffalse,
result_MUX_uxn_device_h_l125_c7_aea3_return_output);

-- x_MUX_uxn_device_h_l126_c3_678e
x_MUX_uxn_device_h_l126_c3_678e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l126_c3_678e_cond,
x_MUX_uxn_device_h_l126_c3_678e_iftrue,
x_MUX_uxn_device_h_l126_c3_678e_iffalse,
x_MUX_uxn_device_h_l126_c3_678e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_678e
result_device_ram_address_MUX_uxn_device_h_l126_c3_678e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c11_c9ff
BIN_OP_EQ_uxn_device_h_l132_c11_c9ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_left,
BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_right,
BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_return_output);

-- vram_addr_MUX_uxn_device_h_l132_c7_865e
vram_addr_MUX_uxn_device_h_l132_c7_865e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l132_c7_865e_cond,
vram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue,
vram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse,
vram_addr_MUX_uxn_device_h_l132_c7_865e_return_output);

-- auto_advance_MUX_uxn_device_h_l132_c7_865e
auto_advance_MUX_uxn_device_h_l132_c7_865e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l132_c7_865e_cond,
auto_advance_MUX_uxn_device_h_l132_c7_865e_iftrue,
auto_advance_MUX_uxn_device_h_l132_c7_865e_iffalse,
auto_advance_MUX_uxn_device_h_l132_c7_865e_return_output);

-- ram_addr_MUX_uxn_device_h_l132_c7_865e
ram_addr_MUX_uxn_device_h_l132_c7_865e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l132_c7_865e_cond,
ram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue,
ram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse,
ram_addr_MUX_uxn_device_h_l132_c7_865e_return_output);

-- x_MUX_uxn_device_h_l132_c7_865e
x_MUX_uxn_device_h_l132_c7_865e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l132_c7_865e_cond,
x_MUX_uxn_device_h_l132_c7_865e_iftrue,
x_MUX_uxn_device_h_l132_c7_865e_iffalse,
x_MUX_uxn_device_h_l132_c7_865e_return_output);

-- y_MUX_uxn_device_h_l132_c7_865e
y_MUX_uxn_device_h_l132_c7_865e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l132_c7_865e_cond,
y_MUX_uxn_device_h_l132_c7_865e_iftrue,
y_MUX_uxn_device_h_l132_c7_865e_iffalse,
y_MUX_uxn_device_h_l132_c7_865e_return_output);

-- result_MUX_uxn_device_h_l132_c7_865e
result_MUX_uxn_device_h_l132_c7_865e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l132_c7_865e_cond,
result_MUX_uxn_device_h_l132_c7_865e_iftrue,
result_MUX_uxn_device_h_l132_c7_865e_iffalse,
result_MUX_uxn_device_h_l132_c7_865e_return_output);

-- x_MUX_uxn_device_h_l133_c3_0a71
x_MUX_uxn_device_h_l133_c3_0a71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l133_c3_0a71_cond,
x_MUX_uxn_device_h_l133_c3_0a71_iftrue,
x_MUX_uxn_device_h_l133_c3_0a71_iffalse,
x_MUX_uxn_device_h_l133_c3_0a71_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71
result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_return_output);

-- BIN_OP_OR_uxn_device_h_l134_c4_ffd4
BIN_OP_OR_uxn_device_h_l134_c4_ffd4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l134_c4_ffd4_left,
BIN_OP_OR_uxn_device_h_l134_c4_ffd4_right,
BIN_OP_OR_uxn_device_h_l134_c4_ffd4_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c11_1fa7
BIN_OP_EQ_uxn_device_h_l138_c11_1fa7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_left,
BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_right,
BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_return_output);

-- vram_addr_MUX_uxn_device_h_l138_c7_3af4
vram_addr_MUX_uxn_device_h_l138_c7_3af4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l138_c7_3af4_cond,
vram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue,
vram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse,
vram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output);

-- auto_advance_MUX_uxn_device_h_l138_c7_3af4
auto_advance_MUX_uxn_device_h_l138_c7_3af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l138_c7_3af4_cond,
auto_advance_MUX_uxn_device_h_l138_c7_3af4_iftrue,
auto_advance_MUX_uxn_device_h_l138_c7_3af4_iffalse,
auto_advance_MUX_uxn_device_h_l138_c7_3af4_return_output);

-- ram_addr_MUX_uxn_device_h_l138_c7_3af4
ram_addr_MUX_uxn_device_h_l138_c7_3af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l138_c7_3af4_cond,
ram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue,
ram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse,
ram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output);

-- x_MUX_uxn_device_h_l138_c7_3af4
x_MUX_uxn_device_h_l138_c7_3af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l138_c7_3af4_cond,
x_MUX_uxn_device_h_l138_c7_3af4_iftrue,
x_MUX_uxn_device_h_l138_c7_3af4_iffalse,
x_MUX_uxn_device_h_l138_c7_3af4_return_output);

-- y_MUX_uxn_device_h_l138_c7_3af4
y_MUX_uxn_device_h_l138_c7_3af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c7_3af4_cond,
y_MUX_uxn_device_h_l138_c7_3af4_iftrue,
y_MUX_uxn_device_h_l138_c7_3af4_iffalse,
y_MUX_uxn_device_h_l138_c7_3af4_return_output);

-- result_MUX_uxn_device_h_l138_c7_3af4
result_MUX_uxn_device_h_l138_c7_3af4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l138_c7_3af4_cond,
result_MUX_uxn_device_h_l138_c7_3af4_iftrue,
result_MUX_uxn_device_h_l138_c7_3af4_iffalse,
result_MUX_uxn_device_h_l138_c7_3af4_return_output);

-- y_MUX_uxn_device_h_l139_c3_f781
y_MUX_uxn_device_h_l139_c3_f781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l139_c3_f781_cond,
y_MUX_uxn_device_h_l139_c3_f781_iftrue,
y_MUX_uxn_device_h_l139_c3_f781_iffalse,
y_MUX_uxn_device_h_l139_c3_f781_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l139_c3_f781
result_device_ram_address_MUX_uxn_device_h_l139_c3_f781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_cond,
result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iftrue,
result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iffalse,
result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_5133
BIN_OP_EQ_uxn_device_h_l145_c11_5133 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_5133_left,
BIN_OP_EQ_uxn_device_h_l145_c11_5133_right,
BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_af89
vram_addr_MUX_uxn_device_h_l145_c7_af89 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_af89_cond,
vram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_af89_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_af89
auto_advance_MUX_uxn_device_h_l145_c7_af89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_af89_cond,
auto_advance_MUX_uxn_device_h_l145_c7_af89_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_af89_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_af89_return_output);

-- ram_addr_MUX_uxn_device_h_l145_c7_af89
ram_addr_MUX_uxn_device_h_l145_c7_af89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l145_c7_af89_cond,
ram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue,
ram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse,
ram_addr_MUX_uxn_device_h_l145_c7_af89_return_output);

-- x_MUX_uxn_device_h_l145_c7_af89
x_MUX_uxn_device_h_l145_c7_af89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l145_c7_af89_cond,
x_MUX_uxn_device_h_l145_c7_af89_iftrue,
x_MUX_uxn_device_h_l145_c7_af89_iffalse,
x_MUX_uxn_device_h_l145_c7_af89_return_output);

-- y_MUX_uxn_device_h_l145_c7_af89
y_MUX_uxn_device_h_l145_c7_af89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l145_c7_af89_cond,
y_MUX_uxn_device_h_l145_c7_af89_iftrue,
y_MUX_uxn_device_h_l145_c7_af89_iffalse,
y_MUX_uxn_device_h_l145_c7_af89_return_output);

-- result_MUX_uxn_device_h_l145_c7_af89
result_MUX_uxn_device_h_l145_c7_af89 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l145_c7_af89_cond,
result_MUX_uxn_device_h_l145_c7_af89_iftrue,
result_MUX_uxn_device_h_l145_c7_af89_iffalse,
result_MUX_uxn_device_h_l145_c7_af89_return_output);

-- y_MUX_uxn_device_h_l146_c3_25c6
y_MUX_uxn_device_h_l146_c3_25c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l146_c3_25c6_cond,
y_MUX_uxn_device_h_l146_c3_25c6_iftrue,
y_MUX_uxn_device_h_l146_c3_25c6_iffalse,
y_MUX_uxn_device_h_l146_c3_25c6_return_output);

-- BIN_OP_OR_uxn_device_h_l147_c4_7e82
BIN_OP_OR_uxn_device_h_l147_c4_7e82 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l147_c4_7e82_left,
BIN_OP_OR_uxn_device_h_l147_c4_7e82_right,
BIN_OP_OR_uxn_device_h_l147_c4_7e82_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c11_de6c
BIN_OP_EQ_uxn_device_h_l150_c11_de6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c11_de6c_left,
BIN_OP_EQ_uxn_device_h_l150_c11_de6c_right,
BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_return_output);

-- vram_addr_MUX_uxn_device_h_l150_c7_ba7b
vram_addr_MUX_uxn_device_h_l150_c7_ba7b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond,
vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue,
vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse,
vram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output);

-- auto_advance_MUX_uxn_device_h_l150_c7_ba7b
auto_advance_MUX_uxn_device_h_l150_c7_ba7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l150_c7_ba7b_cond,
auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iftrue,
auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iffalse,
auto_advance_MUX_uxn_device_h_l150_c7_ba7b_return_output);

-- ram_addr_MUX_uxn_device_h_l150_c7_ba7b
ram_addr_MUX_uxn_device_h_l150_c7_ba7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond,
ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue,
ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse,
ram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output);

-- x_MUX_uxn_device_h_l150_c7_ba7b
x_MUX_uxn_device_h_l150_c7_ba7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l150_c7_ba7b_cond,
x_MUX_uxn_device_h_l150_c7_ba7b_iftrue,
x_MUX_uxn_device_h_l150_c7_ba7b_iffalse,
x_MUX_uxn_device_h_l150_c7_ba7b_return_output);

-- result_MUX_uxn_device_h_l150_c7_ba7b
result_MUX_uxn_device_h_l150_c7_ba7b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l150_c7_ba7b_cond,
result_MUX_uxn_device_h_l150_c7_ba7b_iftrue,
result_MUX_uxn_device_h_l150_c7_ba7b_iffalse,
result_MUX_uxn_device_h_l150_c7_ba7b_return_output);

-- vram_addr_MUX_uxn_device_h_l151_c3_a7b7
vram_addr_MUX_uxn_device_h_l151_c3_a7b7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l151_c3_a7b7_cond,
vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iftrue,
vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iffalse,
vram_addr_MUX_uxn_device_h_l151_c3_a7b7_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c3_a7b7
auto_advance_MUX_uxn_device_h_l151_c3_a7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c3_a7b7_cond,
auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iftrue,
auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iffalse,
auto_advance_MUX_uxn_device_h_l151_c3_a7b7_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c3_a7b7
result_vram_address_MUX_uxn_device_h_l151_c3_a7b7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_cond,
result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7
result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_cond,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7
result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7
result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_return_output);

-- result_u8_value_MUX_uxn_device_h_l151_c3_a7b7
result_u8_value_MUX_uxn_device_h_l151_c3_a7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_cond,
result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iftrue,
result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iffalse,
result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_return_output);

-- BIN_OP_AND_uxn_device_h_l154_c32_9436
BIN_OP_AND_uxn_device_h_l154_c32_9436 : entity work.BIN_OP_AND_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l154_c32_9436_left,
BIN_OP_AND_uxn_device_h_l154_c32_9436_right,
BIN_OP_AND_uxn_device_h_l154_c32_9436_return_output);

-- vram_addr_MUX_uxn_device_h_l156_c4_556d
vram_addr_MUX_uxn_device_h_l156_c4_556d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l156_c4_556d_cond,
vram_addr_MUX_uxn_device_h_l156_c4_556d_iftrue,
vram_addr_MUX_uxn_device_h_l156_c4_556d_iffalse,
vram_addr_MUX_uxn_device_h_l156_c4_556d_return_output);

-- result_vram_address_MUX_uxn_device_h_l156_c4_556d
result_vram_address_MUX_uxn_device_h_l156_c4_556d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l156_c4_556d_cond,
result_vram_address_MUX_uxn_device_h_l156_c4_556d_iftrue,
result_vram_address_MUX_uxn_device_h_l156_c4_556d_iffalse,
result_vram_address_MUX_uxn_device_h_l156_c4_556d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l156_c4_556d
result_is_vram_write_MUX_uxn_device_h_l156_c4_556d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_cond,
result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c18_62a3
BIN_OP_PLUS_uxn_device_h_l157_c18_62a3 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_left,
BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_right,
BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_return_output);

-- BIN_OP_AND_uxn_device_h_l158_c5_c880
BIN_OP_AND_uxn_device_h_l158_c5_c880 : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l158_c5_c880_left,
BIN_OP_AND_uxn_device_h_l158_c5_c880_right,
BIN_OP_AND_uxn_device_h_l158_c5_c880_return_output);

-- MUX_uxn_device_h_l159_c19_a521
MUX_uxn_device_h_l159_c19_a521 : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l159_c19_a521_cond,
MUX_uxn_device_h_l159_c19_a521_iftrue,
MUX_uxn_device_h_l159_c19_a521_iffalse,
MUX_uxn_device_h_l159_c19_a521_return_output);

-- BIN_OP_OR_uxn_device_h_l159_c5_1fd4
BIN_OP_OR_uxn_device_h_l159_c5_1fd4 : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l159_c5_1fd4_left,
BIN_OP_OR_uxn_device_h_l159_c5_1fd4_right,
BIN_OP_OR_uxn_device_h_l159_c5_1fd4_return_output);

-- MUX_uxn_device_h_l160_c19_057b
MUX_uxn_device_h_l160_c19_057b : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l160_c19_057b_cond,
MUX_uxn_device_h_l160_c19_057b_iftrue,
MUX_uxn_device_h_l160_c19_057b_iffalse,
MUX_uxn_device_h_l160_c19_057b_return_output);

-- BIN_OP_OR_uxn_device_h_l160_c5_9ecf
BIN_OP_OR_uxn_device_h_l160_c5_9ecf : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l160_c5_9ecf_left,
BIN_OP_OR_uxn_device_h_l160_c5_9ecf_right,
BIN_OP_OR_uxn_device_h_l160_c5_9ecf_return_output);

-- BIN_OP_OR_uxn_device_h_l161_c5_f5b1
BIN_OP_OR_uxn_device_h_l161_c5_f5b1 : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l161_c5_f5b1_left,
BIN_OP_OR_uxn_device_h_l161_c5_f5b1_right,
BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_return_output);

-- BIN_OP_PLUS_uxn_device_h_l165_c28_65f4
BIN_OP_PLUS_uxn_device_h_l165_c28_65f4 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_left,
BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_right,
BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c8_0477
auto_advance_MUX_uxn_device_h_l169_c8_0477 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c8_0477_cond,
auto_advance_MUX_uxn_device_h_l169_c8_0477_iftrue,
auto_advance_MUX_uxn_device_h_l169_c8_0477_iffalse,
auto_advance_MUX_uxn_device_h_l169_c8_0477_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c8_0477
result_device_ram_address_MUX_uxn_device_h_l169_c8_0477 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c11_230f
BIN_OP_EQ_uxn_device_h_l174_c11_230f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c11_230f_left,
BIN_OP_EQ_uxn_device_h_l174_c11_230f_right,
BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_return_output);

-- ram_addr_MUX_uxn_device_h_l174_c7_df1c
ram_addr_MUX_uxn_device_h_l174_c7_df1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l174_c7_df1c_cond,
ram_addr_MUX_uxn_device_h_l174_c7_df1c_iftrue,
ram_addr_MUX_uxn_device_h_l174_c7_df1c_iffalse,
ram_addr_MUX_uxn_device_h_l174_c7_df1c_return_output);

-- x_MUX_uxn_device_h_l174_c7_df1c
x_MUX_uxn_device_h_l174_c7_df1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l174_c7_df1c_cond,
x_MUX_uxn_device_h_l174_c7_df1c_iftrue,
x_MUX_uxn_device_h_l174_c7_df1c_iffalse,
x_MUX_uxn_device_h_l174_c7_df1c_return_output);

-- result_MUX_uxn_device_h_l174_c7_df1c
result_MUX_uxn_device_h_l174_c7_df1c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c7_df1c_cond,
result_MUX_uxn_device_h_l174_c7_df1c_iftrue,
result_MUX_uxn_device_h_l174_c7_df1c_iffalse,
result_MUX_uxn_device_h_l174_c7_df1c_return_output);

-- x_MUX_uxn_device_h_l175_c3_a316
x_MUX_uxn_device_h_l175_c3_a316 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l175_c3_a316_cond,
x_MUX_uxn_device_h_l175_c3_a316_iftrue,
x_MUX_uxn_device_h_l175_c3_a316_iffalse,
x_MUX_uxn_device_h_l175_c3_a316_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_cond,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_return_output);

-- result_vram_address_MUX_uxn_device_h_l175_c3_a316
result_vram_address_MUX_uxn_device_h_l175_c3_a316 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l175_c3_a316_cond,
result_vram_address_MUX_uxn_device_h_l175_c3_a316_iftrue,
result_vram_address_MUX_uxn_device_h_l175_c3_a316_iffalse,
result_vram_address_MUX_uxn_device_h_l175_c3_a316_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l175_c3_a316
result_device_ram_address_MUX_uxn_device_h_l175_c3_a316 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_cond,
result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iftrue,
result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iffalse,
result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l175_c3_a316
result_is_deo_done_MUX_uxn_device_h_l175_c3_a316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_cond,
result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iftrue,
result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iffalse,
result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l175_c3_a316
result_is_vram_write_MUX_uxn_device_h_l175_c3_a316 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_cond,
result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iftrue,
result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iffalse,
result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_return_output);

-- result_u8_value_MUX_uxn_device_h_l175_c3_a316
result_u8_value_MUX_uxn_device_h_l175_c3_a316 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l175_c3_a316_cond,
result_u8_value_MUX_uxn_device_h_l175_c3_a316_iftrue,
result_u8_value_MUX_uxn_device_h_l175_c3_a316_iffalse,
result_u8_value_MUX_uxn_device_h_l175_c3_a316_return_output);

-- UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9
UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_expr,
UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output);

-- x_MUX_uxn_device_h_l180_c4_b7d1
x_MUX_uxn_device_h_l180_c4_b7d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l180_c4_b7d1_cond,
x_MUX_uxn_device_h_l180_c4_b7d1_iftrue,
x_MUX_uxn_device_h_l180_c4_b7d1_iffalse,
x_MUX_uxn_device_h_l180_c4_b7d1_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1
result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_cond,
result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1
result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c4_b7d1
result_u8_value_MUX_uxn_device_h_l180_c4_b7d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_cond,
result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c9_4f0c
BIN_OP_AND_uxn_device_h_l181_c9_4f0c : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c9_4f0c_left,
BIN_OP_AND_uxn_device_h_l181_c9_4f0c_right,
BIN_OP_AND_uxn_device_h_l181_c9_4f0c_return_output);

-- x_MUX_uxn_device_h_l181_c5_1538
x_MUX_uxn_device_h_l181_c5_1538 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c5_1538_cond,
x_MUX_uxn_device_h_l181_c5_1538_iftrue,
x_MUX_uxn_device_h_l181_c5_1538_iffalse,
x_MUX_uxn_device_h_l181_c5_1538_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c5_1538
result_device_ram_address_MUX_uxn_device_h_l181_c5_1538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c5_1538
result_u8_value_MUX_uxn_device_h_l181_c5_1538 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c5_1538_cond,
result_u8_value_MUX_uxn_device_h_l181_c5_1538_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c5_1538_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c5_1538_return_output);

-- BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c
BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_left,
BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_right,
BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_return_output);

-- CONST_SR_8_uxn_device_h_l185_c34_85be
CONST_SR_8_uxn_device_h_l185_c34_85be : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l185_c34_85be_x,
CONST_SR_8_uxn_device_h_l185_c34_85be_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a
result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_cond,
result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c11_c136
BIN_OP_EQ_uxn_device_h_l195_c11_c136 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c11_c136_left,
BIN_OP_EQ_uxn_device_h_l195_c11_c136_right,
BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_return_output);

-- ram_addr_MUX_uxn_device_h_l195_c7_59ab
ram_addr_MUX_uxn_device_h_l195_c7_59ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l195_c7_59ab_cond,
ram_addr_MUX_uxn_device_h_l195_c7_59ab_iftrue,
ram_addr_MUX_uxn_device_h_l195_c7_59ab_iffalse,
ram_addr_MUX_uxn_device_h_l195_c7_59ab_return_output);

-- result_MUX_uxn_device_h_l195_c7_59ab
result_MUX_uxn_device_h_l195_c7_59ab : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l195_c7_59ab_cond,
result_MUX_uxn_device_h_l195_c7_59ab_iftrue,
result_MUX_uxn_device_h_l195_c7_59ab_iffalse,
result_MUX_uxn_device_h_l195_c7_59ab_return_output);

-- ram_addr_MUX_uxn_device_h_l196_c3_8e24
ram_addr_MUX_uxn_device_h_l196_c3_8e24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l196_c3_8e24_cond,
ram_addr_MUX_uxn_device_h_l196_c3_8e24_iftrue,
ram_addr_MUX_uxn_device_h_l196_c3_8e24_iffalse,
ram_addr_MUX_uxn_device_h_l196_c3_8e24_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_cond,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24
result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_cond,
result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iftrue,
result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iffalse,
result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_return_output);

-- result_u8_value_MUX_uxn_device_h_l196_c3_8e24
result_u8_value_MUX_uxn_device_h_l196_c3_8e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l196_c3_8e24_cond,
result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iftrue,
result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iffalse,
result_u8_value_MUX_uxn_device_h_l196_c3_8e24_return_output);

-- BIN_OP_AND_uxn_device_h_l197_c8_b8c8
BIN_OP_AND_uxn_device_h_l197_c8_b8c8 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l197_c8_b8c8_left,
BIN_OP_AND_uxn_device_h_l197_c8_b8c8_right,
BIN_OP_AND_uxn_device_h_l197_c8_b8c8_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_cond,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1
result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_cond,
result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_return_output);

-- result_u8_value_MUX_uxn_device_h_l197_c4_e4e1
result_u8_value_MUX_uxn_device_h_l197_c4_e4e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_cond,
result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iftrue,
result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iffalse,
result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_return_output);

-- ram_addr_MUX_uxn_device_h_l203_c8_d8cb
ram_addr_MUX_uxn_device_h_l203_c8_d8cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l203_c8_d8cb_cond,
ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iftrue,
ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iffalse,
ram_addr_MUX_uxn_device_h_l203_c8_d8cb_return_output);

-- BIN_OP_EQ_uxn_device_h_l208_c11_faae
BIN_OP_EQ_uxn_device_h_l208_c11_faae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l208_c11_faae_left,
BIN_OP_EQ_uxn_device_h_l208_c11_faae_right,
BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_return_output);

-- ram_addr_MUX_uxn_device_h_l208_c7_82d6
ram_addr_MUX_uxn_device_h_l208_c7_82d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l208_c7_82d6_cond,
ram_addr_MUX_uxn_device_h_l208_c7_82d6_iftrue,
ram_addr_MUX_uxn_device_h_l208_c7_82d6_iffalse,
ram_addr_MUX_uxn_device_h_l208_c7_82d6_return_output);

-- result_MUX_uxn_device_h_l208_c7_82d6
result_MUX_uxn_device_h_l208_c7_82d6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l208_c7_82d6_cond,
result_MUX_uxn_device_h_l208_c7_82d6_iftrue,
result_MUX_uxn_device_h_l208_c7_82d6_iffalse,
result_MUX_uxn_device_h_l208_c7_82d6_return_output);

-- ram_addr_MUX_uxn_device_h_l209_c3_f254
ram_addr_MUX_uxn_device_h_l209_c3_f254 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l209_c3_f254_cond,
ram_addr_MUX_uxn_device_h_l209_c3_f254_iftrue,
ram_addr_MUX_uxn_device_h_l209_c3_f254_iffalse,
ram_addr_MUX_uxn_device_h_l209_c3_f254_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_cond,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l209_c3_f254
result_device_ram_address_MUX_uxn_device_h_l209_c3_f254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_cond,
result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iftrue,
result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iffalse,
result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_return_output);

-- result_u8_value_MUX_uxn_device_h_l209_c3_f254
result_u8_value_MUX_uxn_device_h_l209_c3_f254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l209_c3_f254_cond,
result_u8_value_MUX_uxn_device_h_l209_c3_f254_iftrue,
result_u8_value_MUX_uxn_device_h_l209_c3_f254_iffalse,
result_u8_value_MUX_uxn_device_h_l209_c3_f254_return_output);

-- BIN_OP_AND_uxn_device_h_l210_c9_0a41
BIN_OP_AND_uxn_device_h_l210_c9_0a41 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l210_c9_0a41_left,
BIN_OP_AND_uxn_device_h_l210_c9_0a41_right,
BIN_OP_AND_uxn_device_h_l210_c9_0a41_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_cond,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l210_c4_4388
result_device_ram_address_MUX_uxn_device_h_l210_c4_4388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_cond,
result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iftrue,
result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iffalse,
result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_return_output);

-- result_u8_value_MUX_uxn_device_h_l210_c4_4388
result_u8_value_MUX_uxn_device_h_l210_c4_4388 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l210_c4_4388_cond,
result_u8_value_MUX_uxn_device_h_l210_c4_4388_iftrue,
result_u8_value_MUX_uxn_device_h_l210_c4_4388_iffalse,
result_u8_value_MUX_uxn_device_h_l210_c4_4388_return_output);

-- CONST_SR_8_uxn_device_h_l213_c33_5a05
CONST_SR_8_uxn_device_h_l213_c33_5a05 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l213_c33_5a05_x,
CONST_SR_8_uxn_device_h_l213_c33_5a05_return_output);

-- ram_addr_MUX_uxn_device_h_l216_c8_d199
ram_addr_MUX_uxn_device_h_l216_c8_d199 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l216_c8_d199_cond,
ram_addr_MUX_uxn_device_h_l216_c8_d199_iftrue,
ram_addr_MUX_uxn_device_h_l216_c8_d199_iffalse,
ram_addr_MUX_uxn_device_h_l216_c8_d199_return_output);

-- BIN_OP_OR_uxn_device_h_l217_c4_b425
BIN_OP_OR_uxn_device_h_l217_c4_b425 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l217_c4_b425_left,
BIN_OP_OR_uxn_device_h_l217_c4_b425_right,
BIN_OP_OR_uxn_device_h_l217_c4_b425_return_output);

-- BIN_OP_EQ_uxn_device_h_l220_c11_2880
BIN_OP_EQ_uxn_device_h_l220_c11_2880 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l220_c11_2880_left,
BIN_OP_EQ_uxn_device_h_l220_c11_2880_right,
BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_return_output);

-- result_MUX_uxn_device_h_l220_c7_d1d5
result_MUX_uxn_device_h_l220_c7_d1d5 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l220_c7_d1d5_cond,
result_MUX_uxn_device_h_l220_c7_d1d5_iftrue,
result_MUX_uxn_device_h_l220_c7_d1d5_iffalse,
result_MUX_uxn_device_h_l220_c7_d1d5_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7
result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_cond,
result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_return_output);

-- result_u8_value_MUX_uxn_device_h_l221_c3_e0d7
result_u8_value_MUX_uxn_device_h_l221_c3_e0d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_cond,
result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iftrue,
result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iffalse,
result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_return_output);

-- BIN_OP_AND_uxn_device_h_l222_c9_02bb
BIN_OP_AND_uxn_device_h_l222_c9_02bb : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l222_c9_02bb_left,
BIN_OP_AND_uxn_device_h_l222_c9_02bb_right,
BIN_OP_AND_uxn_device_h_l222_c9_02bb_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_cond,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l222_c4_799a
result_device_ram_address_MUX_uxn_device_h_l222_c4_799a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_cond,
result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_return_output);

-- result_u8_value_MUX_uxn_device_h_l222_c4_799a
result_u8_value_MUX_uxn_device_h_l222_c4_799a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l222_c4_799a_cond,
result_u8_value_MUX_uxn_device_h_l222_c4_799a_iftrue,
result_u8_value_MUX_uxn_device_h_l222_c4_799a_iffalse,
result_u8_value_MUX_uxn_device_h_l222_c4_799a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_return_output);

-- result_MUX_uxn_device_h_l230_c3_0ce8
result_MUX_uxn_device_h_l230_c3_0ce8 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l230_c3_0ce8_cond,
result_MUX_uxn_device_h_l230_c3_0ce8_iftrue,
result_MUX_uxn_device_h_l230_c3_0ce8_iffalse,
result_MUX_uxn_device_h_l230_c3_0ce8_return_output);

-- BIN_OP_MINUS_uxn_device_h_l231_c58_f012
BIN_OP_MINUS_uxn_device_h_l231_c58_f012 : entity work.BIN_OP_MINUS_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l231_c58_f012_left,
BIN_OP_MINUS_uxn_device_h_l231_c58_f012_right,
BIN_OP_MINUS_uxn_device_h_l231_c58_f012_return_output);

-- screen_blit_uxn_device_h_l231_c46_3ca9
screen_blit_uxn_device_h_l231_c46_3ca9 : entity work.screen_blit_0CLK_b1675d32 port map (
clk,
screen_blit_uxn_device_h_l231_c46_3ca9_CLOCK_ENABLE,
screen_blit_uxn_device_h_l231_c46_3ca9_phase,
screen_blit_uxn_device_h_l231_c46_3ca9_ctrl,
screen_blit_uxn_device_h_l231_c46_3ca9_auto_advance,
screen_blit_uxn_device_h_l231_c46_3ca9_x,
screen_blit_uxn_device_h_l231_c46_3ca9_y,
screen_blit_uxn_device_h_l231_c46_3ca9_ram_addr,
screen_blit_uxn_device_h_l231_c46_3ca9_previous_ram_read,
screen_blit_uxn_device_h_l231_c46_3ca9_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_x,
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_x,
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output);



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
 BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_return_output,
 ctrl_mode_MUX_uxn_device_h_l95_c2_6132_return_output,
 flip_x_MUX_uxn_device_h_l95_c2_6132_return_output,
 vram_addr_MUX_uxn_device_h_l95_c2_6132_return_output,
 auto_advance_MUX_uxn_device_h_l95_c2_6132_return_output,
 ram_addr_MUX_uxn_device_h_l95_c2_6132_return_output,
 color_MUX_uxn_device_h_l95_c2_6132_return_output,
 is_drawing_port_MUX_uxn_device_h_l95_c2_6132_return_output,
 flip_y_MUX_uxn_device_h_l95_c2_6132_return_output,
 is_sprite_port_MUX_uxn_device_h_l95_c2_6132_return_output,
 x_MUX_uxn_device_h_l95_c2_6132_return_output,
 layer_MUX_uxn_device_h_l95_c2_6132_return_output,
 is_pixel_port_MUX_uxn_device_h_l95_c2_6132_return_output,
 y_MUX_uxn_device_h_l95_c2_6132_return_output,
 result_MUX_uxn_device_h_l95_c2_6132_return_output,
 ctrl_MUX_uxn_device_h_l95_c2_6132_return_output,
 BIN_OP_EQ_uxn_device_h_l96_c19_f214_return_output,
 MUX_uxn_device_h_l96_c19_f911_return_output,
 BIN_OP_EQ_uxn_device_h_l97_c20_b02c_return_output,
 MUX_uxn_device_h_l97_c20_b97a_return_output,
 BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output,
 result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_return_output,
 MUX_uxn_device_h_l103_c32_69ce_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_return_output,
 ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_return_output,
 flip_x_MUX_uxn_device_h_l109_c7_88ae_return_output,
 vram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output,
 auto_advance_MUX_uxn_device_h_l109_c7_88ae_return_output,
 ram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output,
 color_MUX_uxn_device_h_l109_c7_88ae_return_output,
 flip_y_MUX_uxn_device_h_l109_c7_88ae_return_output,
 x_MUX_uxn_device_h_l109_c7_88ae_return_output,
 layer_MUX_uxn_device_h_l109_c7_88ae_return_output,
 y_MUX_uxn_device_h_l109_c7_88ae_return_output,
 result_MUX_uxn_device_h_l109_c7_88ae_return_output,
 ctrl_MUX_uxn_device_h_l109_c7_88ae_return_output,
 result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_return_output,
 ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_return_output,
 flip_x_MUX_uxn_device_h_l114_c7_30f0_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_30f0_return_output,
 ram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output,
 color_MUX_uxn_device_h_l114_c7_30f0_return_output,
 flip_y_MUX_uxn_device_h_l114_c7_30f0_return_output,
 x_MUX_uxn_device_h_l114_c7_30f0_return_output,
 layer_MUX_uxn_device_h_l114_c7_30f0_return_output,
 y_MUX_uxn_device_h_l114_c7_30f0_return_output,
 result_MUX_uxn_device_h_l114_c7_30f0_return_output,
 ctrl_MUX_uxn_device_h_l114_c7_30f0_return_output,
 ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_return_output,
 flip_x_MUX_uxn_device_h_l115_c3_03f4_return_output,
 color_MUX_uxn_device_h_l115_c3_03f4_return_output,
 flip_y_MUX_uxn_device_h_l115_c3_03f4_return_output,
 layer_MUX_uxn_device_h_l115_c3_03f4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_return_output,
 ctrl_MUX_uxn_device_h_l115_c3_03f4_return_output,
 CONST_SR_7_uxn_device_h_l118_c26_600f_return_output,
 CONST_SR_6_uxn_device_h_l119_c22_065c_return_output,
 CONST_SR_5_uxn_device_h_l120_c23_60bc_return_output,
 CONST_SR_4_uxn_device_h_l121_c23_451f_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_return_output,
 vram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_aea3_return_output,
 ram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output,
 x_MUX_uxn_device_h_l125_c7_aea3_return_output,
 y_MUX_uxn_device_h_l125_c7_aea3_return_output,
 result_MUX_uxn_device_h_l125_c7_aea3_return_output,
 x_MUX_uxn_device_h_l126_c3_678e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_return_output,
 vram_addr_MUX_uxn_device_h_l132_c7_865e_return_output,
 auto_advance_MUX_uxn_device_h_l132_c7_865e_return_output,
 ram_addr_MUX_uxn_device_h_l132_c7_865e_return_output,
 x_MUX_uxn_device_h_l132_c7_865e_return_output,
 y_MUX_uxn_device_h_l132_c7_865e_return_output,
 result_MUX_uxn_device_h_l132_c7_865e_return_output,
 x_MUX_uxn_device_h_l133_c3_0a71_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_return_output,
 BIN_OP_OR_uxn_device_h_l134_c4_ffd4_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_return_output,
 vram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output,
 auto_advance_MUX_uxn_device_h_l138_c7_3af4_return_output,
 ram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output,
 x_MUX_uxn_device_h_l138_c7_3af4_return_output,
 y_MUX_uxn_device_h_l138_c7_3af4_return_output,
 result_MUX_uxn_device_h_l138_c7_3af4_return_output,
 y_MUX_uxn_device_h_l139_c3_f781_return_output,
 result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_af89_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_af89_return_output,
 ram_addr_MUX_uxn_device_h_l145_c7_af89_return_output,
 x_MUX_uxn_device_h_l145_c7_af89_return_output,
 y_MUX_uxn_device_h_l145_c7_af89_return_output,
 result_MUX_uxn_device_h_l145_c7_af89_return_output,
 y_MUX_uxn_device_h_l146_c3_25c6_return_output,
 BIN_OP_OR_uxn_device_h_l147_c4_7e82_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_return_output,
 vram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output,
 auto_advance_MUX_uxn_device_h_l150_c7_ba7b_return_output,
 ram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output,
 x_MUX_uxn_device_h_l150_c7_ba7b_return_output,
 result_MUX_uxn_device_h_l150_c7_ba7b_return_output,
 vram_addr_MUX_uxn_device_h_l151_c3_a7b7_return_output,
 auto_advance_MUX_uxn_device_h_l151_c3_a7b7_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_return_output,
 result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_return_output,
 BIN_OP_AND_uxn_device_h_l154_c32_9436_return_output,
 vram_addr_MUX_uxn_device_h_l156_c4_556d_return_output,
 result_vram_address_MUX_uxn_device_h_l156_c4_556d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_return_output,
 BIN_OP_AND_uxn_device_h_l158_c5_c880_return_output,
 MUX_uxn_device_h_l159_c19_a521_return_output,
 BIN_OP_OR_uxn_device_h_l159_c5_1fd4_return_output,
 MUX_uxn_device_h_l160_c19_057b_return_output,
 BIN_OP_OR_uxn_device_h_l160_c5_9ecf_return_output,
 BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_return_output,
 BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_return_output,
 auto_advance_MUX_uxn_device_h_l169_c8_0477_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_return_output,
 ram_addr_MUX_uxn_device_h_l174_c7_df1c_return_output,
 x_MUX_uxn_device_h_l174_c7_df1c_return_output,
 result_MUX_uxn_device_h_l174_c7_df1c_return_output,
 x_MUX_uxn_device_h_l175_c3_a316_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_return_output,
 result_vram_address_MUX_uxn_device_h_l175_c3_a316_return_output,
 result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_return_output,
 result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_return_output,
 result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_return_output,
 result_u8_value_MUX_uxn_device_h_l175_c3_a316_return_output,
 UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output,
 x_MUX_uxn_device_h_l180_c4_b7d1_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_return_output,
 BIN_OP_AND_uxn_device_h_l181_c9_4f0c_return_output,
 x_MUX_uxn_device_h_l181_c5_1538_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c5_1538_return_output,
 BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_return_output,
 CONST_SR_8_uxn_device_h_l185_c34_85be_return_output,
 result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_return_output,
 ram_addr_MUX_uxn_device_h_l195_c7_59ab_return_output,
 result_MUX_uxn_device_h_l195_c7_59ab_return_output,
 ram_addr_MUX_uxn_device_h_l196_c3_8e24_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_return_output,
 result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_return_output,
 result_u8_value_MUX_uxn_device_h_l196_c3_8e24_return_output,
 BIN_OP_AND_uxn_device_h_l197_c8_b8c8_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_return_output,
 result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_return_output,
 ram_addr_MUX_uxn_device_h_l203_c8_d8cb_return_output,
 BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_return_output,
 ram_addr_MUX_uxn_device_h_l208_c7_82d6_return_output,
 result_MUX_uxn_device_h_l208_c7_82d6_return_output,
 ram_addr_MUX_uxn_device_h_l209_c3_f254_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_return_output,
 result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_return_output,
 result_u8_value_MUX_uxn_device_h_l209_c3_f254_return_output,
 BIN_OP_AND_uxn_device_h_l210_c9_0a41_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_return_output,
 result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_return_output,
 result_u8_value_MUX_uxn_device_h_l210_c4_4388_return_output,
 CONST_SR_8_uxn_device_h_l213_c33_5a05_return_output,
 ram_addr_MUX_uxn_device_h_l216_c8_d199_return_output,
 BIN_OP_OR_uxn_device_h_l217_c4_b425_return_output,
 BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_return_output,
 result_MUX_uxn_device_h_l220_c7_d1d5_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_return_output,
 result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_return_output,
 BIN_OP_AND_uxn_device_h_l222_c9_02bb_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_return_output,
 result_u8_value_MUX_uxn_device_h_l222_c4_799a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_return_output,
 result_MUX_uxn_device_h_l230_c3_0ce8_return_output,
 BIN_OP_MINUS_uxn_device_h_l231_c58_f012_return_output,
 screen_blit_uxn_device_h_l231_c46_3ca9_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l101_c3_35d8 : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c2_6132_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l95_c2_6132_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_6132_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_88ae_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_6132_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_f911_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_f911_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_f911_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_f911_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_b97a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_b97a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_b97a_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_b97a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_69ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_69ce_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_69ce_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_69ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l109_c7_88ae_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_88ae_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_88ae_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_30f0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_415d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_aea3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l114_c7_30f0_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_30f0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_30f0_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_aea3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l122_c4_680a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_50f4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_600f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_600f_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_c7a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_065c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_065c_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_d838_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_60bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_60bc_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_c7a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_451f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_451f_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_4347_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_678e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_aea3_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_aea3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_865e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l125_c7_aea3_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_aea3_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_aea3_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_865e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_678e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_678e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_678e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_c456 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0a71_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_865e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_865e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_3af4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l132_c7_865e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_865e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_865e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_3af4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_865e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0a71_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0a71_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_0a71_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l135_c4_5b46 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_3af4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_f781_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_3af4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_af89_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l138_c7_3af4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_3af4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_3af4_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_af89_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_3af4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_f781_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_f781_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_f781_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l142_c4_620f : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_ba7b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_af89_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_25c6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_af89_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l145_c7_af89_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_af89_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_ba7b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_af89_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_25c6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_25c6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_25c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iffalse : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_ba7b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_ba7b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_df1c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l150_c7_ba7b_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_20bc_uxn_device_h_l150_c7_ba7b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_ba7b_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_df1c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_ba7b_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_a7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l153_c4_a590 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_fcb5_return_output : unsigned(7 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l165_c5_f528 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l157_c5_a5ae : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_a521_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_a521_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_a521_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_a521_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_057b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_057b_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_057b_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_057b_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_return_output : unsigned(64 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l171_c4_5786 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_df1c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_df1c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c7_df1c_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_9aa1_uxn_device_h_l174_c7_df1c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_df1c_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_59ab_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_df1c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l178_c4_07a9 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l179_c4_668c : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l181_c5_1538_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l182_c6_3ecd : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l184_c6_704a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_85be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_85be_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_2e72_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l192_c4_9eba : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l195_c7_59ab_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_59ab_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_59ab_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_82d6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_59ab_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l197_c4_e4e1_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l199_c5_40ed : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_589f_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l208_c7_82d6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_82d6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_82d6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_d1d5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_82d6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c4_4388_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l212_c5_3c5e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_5a05_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_5a05_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_80b9_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l220_c7_d1d5_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_d1d5_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_d1d5_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_0ce8_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_d1d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c4_799a_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_return_output : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l224_c5_b59d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_514b_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l230_c3_0ce8_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_0ce8_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_0ce8_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_0ce8_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_0ce8_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l233_c4_7b51 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_04be_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_812e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_e780_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_92d0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_6b2b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_17d8_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l242_c4_d734 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l147_l127_l140_l217_l204_DUPLICATE_3196_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_1511_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_c2a0_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_b963_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_ca90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_6bfd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output : unsigned(7 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iftrue := to_unsigned(0, 1);
     VAR_vram_addr_uxn_device_h_l101_c3_35d8 := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue := VAR_vram_addr_uxn_device_h_l101_c3_35d8;
     VAR_result_device_ram_address_uxn_device_h_l184_c6_704a := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iftrue := VAR_result_device_ram_address_uxn_device_h_l184_c6_704a;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l242_c4_d734 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_right := to_unsigned(8, 4);
     VAR_result_device_ram_address_uxn_device_h_l212_c5_3c5e := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iftrue := VAR_result_device_ram_address_uxn_device_h_l212_c5_3c5e;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_right := to_unsigned(3, 2);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_right := to_unsigned(400, 32);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_right := to_unsigned(9, 4);
     VAR_result_device_ram_address_uxn_device_h_l233_c4_7b51 := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l97_c20_b97a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_right := unsigned'(X"f0000000");
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_right := to_unsigned(1, 1);
     VAR_result_vram_address_uxn_device_h_l178_c4_07a9 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_iftrue := VAR_result_vram_address_uxn_device_h_l178_c4_07a9;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_right := to_unsigned(262143, 18);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l103_c32_69ce_iffalse := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_uxn_device_h_l171_c4_5786 := resize(to_unsigned(44, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iftrue := VAR_result_device_ram_address_uxn_device_h_l171_c4_5786;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iffalse := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l179_c4_668c := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_668c;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_668c;
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_right := to_unsigned(3, 2);
     VAR_result_device_ram_address_uxn_device_h_l135_c4_5b46 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iftrue := VAR_result_device_ram_address_uxn_device_h_l135_c4_5b46;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_c456 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_c456;
     VAR_result_device_ram_address_uxn_device_h_l122_c4_680a := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iftrue := VAR_result_device_ram_address_uxn_device_h_l122_c4_680a;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_right := to_unsigned(400, 32);
     VAR_result_device_ram_address_uxn_device_h_l199_c5_40ed := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iftrue := VAR_result_device_ram_address_uxn_device_h_l199_c5_40ed;
     VAR_MUX_uxn_device_h_l96_c19_f911_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l160_c19_057b_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_MUX_uxn_device_h_l103_c32_69ce_iftrue := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_uxn_device_h_l153_c4_a590 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue := VAR_result_device_ram_address_uxn_device_h_l153_c4_a590;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l159_c19_a521_iftrue := to_unsigned(1048576, 21);
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l192_c4_9eba := resize(to_unsigned(45, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iftrue := VAR_result_device_ram_address_uxn_device_h_l192_c4_9eba;
     VAR_result_device_ram_address_uxn_device_h_l111_c4_415d := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_415d;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_right := to_unsigned(11, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l97_c20_b97a_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l159_c19_a521_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l160_c19_057b_iftrue := to_unsigned(2097152, 22);
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l224_c5_b59d := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iftrue := VAR_result_device_ram_address_uxn_device_h_l224_c5_b59d;
     VAR_MUX_uxn_device_h_l96_c19_f911_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_right := to_unsigned(6, 3);
     VAR_result_device_ram_address_uxn_device_h_l142_c4_620f := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iftrue := VAR_result_device_ram_address_uxn_device_h_l142_c4_620f;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_right := to_unsigned(10, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_left := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_left := color;
     VAR_color_MUX_uxn_device_h_l109_c7_88ae_iftrue := color;
     VAR_color_MUX_uxn_device_h_l114_c7_30f0_iffalse := color;
     VAR_color_MUX_uxn_device_h_l115_c3_03f4_iffalse := color;
     VAR_color_MUX_uxn_device_h_l95_c2_6132_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_ctrl := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iftrue := ctrl_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_cond := ctrl_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_cond := ctrl_mode;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l160_c19_057b_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l159_c19_a521_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_iftrue := flip_y;
     VAR_color_MUX_uxn_device_h_l115_c3_03f4_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l115_c3_03f4_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l126_c3_678e_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l133_c3_0a71_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l139_c3_f781_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l146_c3_25c6_cond := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_cond := is_pixel_port;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l175_c3_a316_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_cond := is_sprite_port;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_cond := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l230_c3_0ce8_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l109_c7_88ae_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l114_c7_30f0_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l115_c3_03f4_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l95_c2_6132_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l121_c23_451f_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l120_c23_60bc_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l119_c22_065c_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l118_c26_600f_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l145_c7_af89_iftrue := result;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_iffalse := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_left := x;
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_x := x;
     VAR_x_MUX_uxn_device_h_l109_c7_88ae_iftrue := x;
     VAR_x_MUX_uxn_device_h_l114_c7_30f0_iftrue := x;
     VAR_x_MUX_uxn_device_h_l126_c3_678e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l133_c3_0a71_iffalse := x;
     VAR_x_MUX_uxn_device_h_l138_c7_3af4_iftrue := x;
     VAR_x_MUX_uxn_device_h_l145_c7_af89_iftrue := x;
     VAR_x_MUX_uxn_device_h_l150_c7_ba7b_iftrue := x;
     VAR_x_MUX_uxn_device_h_l174_c7_df1c_iffalse := x;
     VAR_x_MUX_uxn_device_h_l175_c3_a316_iffalse := x;
     VAR_x_MUX_uxn_device_h_l180_c4_b7d1_iffalse := x;
     VAR_x_MUX_uxn_device_h_l181_c5_1538_iffalse := x;
     VAR_x_MUX_uxn_device_h_l95_c2_6132_iftrue := x;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_left := y;
     VAR_CONST_SR_8_uxn_device_h_l213_c33_5a05_x := y;
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_y := y;
     VAR_y_MUX_uxn_device_h_l109_c7_88ae_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_30f0_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_aea3_iftrue := y;
     VAR_y_MUX_uxn_device_h_l132_c7_865e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l139_c3_f781_iffalse := y;
     VAR_y_MUX_uxn_device_h_l145_c7_af89_iffalse := y;
     VAR_y_MUX_uxn_device_h_l146_c3_25c6_iffalse := y;
     VAR_y_MUX_uxn_device_h_l95_c2_6132_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l96_c19_f214] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l96_c19_f214_left <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_left;
     BIN_OP_EQ_uxn_device_h_l96_c19_f214_right <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_return_output := BIN_OP_EQ_uxn_device_h_l96_c19_f214_return_output;

     -- CONST_SR_6[uxn_device_h_l119_c22_065c] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l119_c22_065c_x <= VAR_CONST_SR_6_uxn_device_h_l119_c22_065c_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l119_c22_065c_return_output := CONST_SR_6_uxn_device_h_l119_c22_065c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l97_c20_b02c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l97_c20_b02c_left <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_left;
     BIN_OP_EQ_uxn_device_h_l97_c20_b02c_right <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_return_output := BIN_OP_EQ_uxn_device_h_l97_c20_b02c_return_output;

     -- BIN_OP_AND[uxn_device_h_l154_c32_9436] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l154_c32_9436_left <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_left;
     BIN_OP_AND_uxn_device_h_l154_c32_9436_right <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_return_output := BIN_OP_AND_uxn_device_h_l154_c32_9436_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c11_230f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c11_230f_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_left;
     BIN_OP_EQ_uxn_device_h_l174_c11_230f_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output := BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output;

     -- CONST_SR_4[uxn_device_h_l121_c23_451f] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l121_c23_451f_x <= VAR_CONST_SR_4_uxn_device_h_l121_c23_451f_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l121_c23_451f_return_output := CONST_SR_4_uxn_device_h_l121_c23_451f_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l225_c23_514b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_514b_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_5133] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_5133_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_5133_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;

     -- BIN_OP_EQ[uxn_device_h_l95_c6_b027] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c6_b027_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_left;
     BIN_OP_EQ_uxn_device_h_l95_c6_b027_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output := BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;

     -- MUX[uxn_device_h_l159_c19_a521] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l159_c19_a521_cond <= VAR_MUX_uxn_device_h_l159_c19_a521_cond;
     MUX_uxn_device_h_l159_c19_a521_iftrue <= VAR_MUX_uxn_device_h_l159_c19_a521_iftrue;
     MUX_uxn_device_h_l159_c19_a521_iffalse <= VAR_MUX_uxn_device_h_l159_c19_a521_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l159_c19_a521_return_output := MUX_uxn_device_h_l159_c19_a521_return_output;

     -- BIN_OP_EQ[uxn_device_h_l150_c11_de6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c11_de6c_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_left;
     BIN_OP_EQ_uxn_device_h_l150_c11_de6c_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output := BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output;

     -- MUX[uxn_device_h_l160_c19_057b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l160_c19_057b_cond <= VAR_MUX_uxn_device_h_l160_c19_057b_cond;
     MUX_uxn_device_h_l160_c19_057b_iftrue <= VAR_MUX_uxn_device_h_l160_c19_057b_iftrue;
     MUX_uxn_device_h_l160_c19_057b_iffalse <= VAR_MUX_uxn_device_h_l160_c19_057b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l160_c19_057b_return_output := MUX_uxn_device_h_l160_c19_057b_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output := result.u8_value;

     -- result_is_vram_write_MUX[uxn_device_h_l156_c4_556d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_cond;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_return_output := result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l180_c9_f0a9] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output := UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_6bfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_6bfd_return_output := result.is_deo_done;

     -- ctrl_MUX[uxn_device_h_l115_c3_03f4] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l115_c3_03f4_cond <= VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_cond;
     ctrl_MUX_uxn_device_h_l115_c3_03f4_iftrue <= VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_iftrue;
     ctrl_MUX_uxn_device_h_l115_c3_03f4_iffalse <= VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_return_output := ctrl_MUX_uxn_device_h_l115_c3_03f4_return_output;

     -- CONST_SR_5[uxn_device_h_l120_c23_60bc] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l120_c23_60bc_x <= VAR_CONST_SR_5_uxn_device_h_l120_c23_60bc_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l120_c23_60bc_return_output := CONST_SR_5_uxn_device_h_l120_c23_60bc_return_output;

     -- CONST_SR_8[uxn_device_h_l213_c33_5a05] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l213_c33_5a05_x <= VAR_CONST_SR_8_uxn_device_h_l213_c33_5a05_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l213_c33_5a05_return_output := CONST_SR_8_uxn_device_h_l213_c33_5a05_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l231_c58_f012] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l231_c58_f012_left <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_left;
     BIN_OP_MINUS_uxn_device_h_l231_c58_f012_right <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_return_output := BIN_OP_MINUS_uxn_device_h_l231_c58_f012_return_output;

     -- BIN_OP_EQ[uxn_device_h_l195_c11_c136] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c11_c136_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_left;
     BIN_OP_EQ_uxn_device_h_l195_c11_c136_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output := BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c11_ac6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_left;
     BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output := BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_1511 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_1511_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l147_l127_l140_l217_l204_DUPLICATE_3196 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l147_l127_l140_l217_l204_DUPLICATE_3196_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- auto_advance_MUX[uxn_device_h_l169_c8_0477] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c8_0477_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_cond;
     auto_advance_MUX_uxn_device_h_l169_c8_0477_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c8_0477_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_return_output := auto_advance_MUX_uxn_device_h_l169_c8_0477_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_c2a0 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_c2a0_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l220_c11_2880] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l220_c11_2880_left <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_left;
     BIN_OP_EQ_uxn_device_h_l220_c11_2880_right <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output := BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output;

     -- BIN_OP_EQ[uxn_device_h_l138_c11_1fa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_left;
     BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output := BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l117_c12_50f4] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_50f4_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l151_c3_a7b7] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_a7b7_return_output := result.vram_write_layer;

     -- CAST_TO_uint8_t[uxn_device_h_l200_c23_589f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_589f_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l230_c3_0ce8] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_0ce8_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l242_c4_d734,
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_device_h_l125_c11_b91a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_b91a_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_b91a_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_b963 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_b963_return_output := result.vram_address;

     -- BIN_OP_PLUS[uxn_device_h_l182_c6_4a1c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_left;
     BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_return_output := BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l132_c11_c9ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_left;
     BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output := BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_b377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_b377_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_b377_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;

     -- BIN_OP_EQ[uxn_device_h_l208_c11_faae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l208_c11_faae_left <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_left;
     BIN_OP_EQ_uxn_device_h_l208_c11_faae_right <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output := BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output;

     -- BIN_OP_AND[uxn_device_h_l181_c9_4f0c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c9_4f0c_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_left;
     BIN_OP_AND_uxn_device_h_l181_c9_4f0c_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_return_output := BIN_OP_AND_uxn_device_h_l181_c9_4f0c_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_ca90 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_ca90_return_output := result.is_vram_write;

     -- BIN_OP_AND[uxn_device_h_l197_c8_b8c8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l197_c8_b8c8_left <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_left;
     BIN_OP_AND_uxn_device_h_l197_c8_b8c8_right <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_return_output := BIN_OP_AND_uxn_device_h_l197_c8_b8c8_return_output;

     -- CONST_SR_7[uxn_device_h_l118_c26_600f] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l118_c26_600f_x <= VAR_CONST_SR_7_uxn_device_h_l118_c26_600f_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l118_c26_600f_return_output := CONST_SR_7_uxn_device_h_l118_c26_600f_return_output;

     -- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output := CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l181_c5_1538_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l181_c9_4f0c_return_output, 1);
     VAR_MUX_uxn_device_h_l197_c4_e4e1_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l197_c8_b8c8_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_ac6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_30f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_b377_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_b91a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_865e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_865e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_865e_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c9ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_3af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_3af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_3af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_1fa7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;
     VAR_result_MUX_uxn_device_h_l145_c7_af89_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_af89_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_af89_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5133_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_ba7b_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_de6c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_df1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_df1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_230f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_59ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_c136_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_82d6_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_faae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_d1d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_2880_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_6132_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_b027_return_output;
     VAR_MUX_uxn_device_h_l96_c19_f911_cond := VAR_BIN_OP_EQ_uxn_device_h_l96_c19_f214_return_output;
     VAR_MUX_uxn_device_h_l97_c20_b97a_cond := VAR_BIN_OP_EQ_uxn_device_h_l97_c20_b02c_return_output;
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_phase := VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_f012_return_output;
     VAR_x_uxn_device_h_l182_c6_3ecd := resize(VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_4a1c_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l147_l127_l140_l217_l204_DUPLICATE_3196_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l147_l127_l140_l217_l204_DUPLICATE_3196_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l147_l127_l140_l217_l204_DUPLICATE_3196_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l134_l147_l127_l140_l217_l204_DUPLICATE_3196_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_1511_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_1511_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_c2a0_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_c2a0_return_output;
     VAR_color_MUX_uxn_device_h_l115_c3_03f4_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_50f4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_589f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_514b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_6bfd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_6bfd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_0edc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_ca90_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_ca90_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_b963_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_b963_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_56fa_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_821b_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_4d6f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_right := VAR_MUX_uxn_device_h_l159_c19_a521_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_right := VAR_MUX_uxn_device_h_l160_c19_057b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_b7d1_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_f0a9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c8_0477_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_iftrue := VAR_ctrl_MUX_uxn_device_h_l115_c3_03f4_return_output;
     VAR_result_MUX_uxn_device_h_l230_c3_0ce8_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_0ce8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_556d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_a7b7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_cond := VAR_MUX_uxn_device_h_l181_c5_1538_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_cond := VAR_MUX_uxn_device_h_l181_c5_1538_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_cond := VAR_MUX_uxn_device_h_l181_c5_1538_interm_cond;
     VAR_x_MUX_uxn_device_h_l181_c5_1538_cond := VAR_MUX_uxn_device_h_l181_c5_1538_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_cond := VAR_MUX_uxn_device_h_l197_c4_e4e1_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_cond := VAR_MUX_uxn_device_h_l197_c4_e4e1_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_cond := VAR_MUX_uxn_device_h_l197_c4_e4e1_interm_cond;
     VAR_CONST_SR_8_uxn_device_h_l185_c34_85be_x := VAR_x_uxn_device_h_l182_c6_3ecd;
     VAR_x_MUX_uxn_device_h_l181_c5_1538_iftrue := VAR_x_uxn_device_h_l182_c6_3ecd;
     -- result_device_ram_address_MUX[uxn_device_h_l169_c8_0477] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c3_a7b7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c3_a7b7_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_cond;
     auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_return_output := auto_advance_MUX_uxn_device_h_l151_c3_a7b7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l197_c4_e4e1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_cond;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_return_output := result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l213_c23_80b9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_80b9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l213_c33_5a05_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_1538] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- ctrl_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_cond;
     ctrl_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     ctrl_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_return_output := ctrl_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l180_c4_b7d1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_cond;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_return_output := result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l191_c8_4a3a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_cond;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_return_output := result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_678e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l175_c3_a316] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l175_c3_a316_cond <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_cond;
     result_vram_address_MUX_uxn_device_h_l175_c3_a316_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_iftrue;
     result_vram_address_MUX_uxn_device_h_l175_c3_a316_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_return_output := result_vram_address_MUX_uxn_device_h_l175_c3_a316_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l175_c3_a316] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_cond;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_return_output := result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_a992] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_return_output;

     -- BIN_OP_OR[uxn_device_h_l134_c4_ffd4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l134_c4_ffd4_left <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_left;
     BIN_OP_OR_uxn_device_h_l134_c4_ffd4_right <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_return_output := BIN_OP_OR_uxn_device_h_l134_c4_ffd4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l139_c3_f781] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_cond;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_return_output := result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_e4e1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_return_output := result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l121_c13_4347] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_4347_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l121_c23_451f_return_output);

     -- MUX[uxn_device_h_l96_c19_f911] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c19_f911_cond <= VAR_MUX_uxn_device_h_l96_c19_f911_cond;
     MUX_uxn_device_h_l96_c19_f911_iftrue <= VAR_MUX_uxn_device_h_l96_c19_f911_iftrue;
     MUX_uxn_device_h_l96_c19_f911_iffalse <= VAR_MUX_uxn_device_h_l96_c19_f911_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c19_f911_return_output := MUX_uxn_device_h_l96_c19_f911_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_03f4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_return_output;

     -- BIN_OP_AND[uxn_device_h_l222_c9_02bb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l222_c9_02bb_left <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_left;
     BIN_OP_AND_uxn_device_h_l222_c9_02bb_right <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_return_output := BIN_OP_AND_uxn_device_h_l222_c9_02bb_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l151_c3_a7b7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_cond;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_return_output := result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_80f9] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_return_output;

     -- BIN_OP_AND[uxn_device_h_l210_c9_0a41] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l210_c9_0a41_left <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_left;
     BIN_OP_AND_uxn_device_h_l210_c9_0a41_right <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_return_output := BIN_OP_AND_uxn_device_h_l210_c9_0a41_return_output;

     -- BIN_OP_OR[uxn_device_h_l217_c4_b425] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l217_c4_b425_left <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_left;
     BIN_OP_OR_uxn_device_h_l217_c4_b425_right <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_return_output := BIN_OP_OR_uxn_device_h_l217_c4_b425_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l120_c13_c7a4] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_c7a4_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l120_c23_60bc_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l133_c3_0a71] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_return_output;

     -- result_u8_value_MUX[uxn_device_h_l197_c4_e4e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_cond;
     result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iftrue;
     result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_return_output := result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_return_output;

     -- MUX[uxn_device_h_l97_c20_b97a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l97_c20_b97a_cond <= VAR_MUX_uxn_device_h_l97_c20_b97a_cond;
     MUX_uxn_device_h_l97_c20_b97a_iftrue <= VAR_MUX_uxn_device_h_l97_c20_b97a_iftrue;
     MUX_uxn_device_h_l97_c20_b97a_iffalse <= VAR_MUX_uxn_device_h_l97_c20_b97a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l97_c20_b97a_return_output := MUX_uxn_device_h_l97_c20_b97a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l181_c5_1538] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_return_output;

     -- color_MUX[uxn_device_h_l115_c3_03f4] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l115_c3_03f4_cond <= VAR_color_MUX_uxn_device_h_l115_c3_03f4_cond;
     color_MUX_uxn_device_h_l115_c3_03f4_iftrue <= VAR_color_MUX_uxn_device_h_l115_c3_03f4_iftrue;
     color_MUX_uxn_device_h_l115_c3_03f4_iffalse <= VAR_color_MUX_uxn_device_h_l115_c3_03f4_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l115_c3_03f4_return_output := color_MUX_uxn_device_h_l115_c3_03f4_return_output;

     -- x_MUX[uxn_device_h_l181_c5_1538] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c5_1538_cond <= VAR_x_MUX_uxn_device_h_l181_c5_1538_cond;
     x_MUX_uxn_device_h_l181_c5_1538_iftrue <= VAR_x_MUX_uxn_device_h_l181_c5_1538_iftrue;
     x_MUX_uxn_device_h_l181_c5_1538_iffalse <= VAR_x_MUX_uxn_device_h_l181_c5_1538_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c5_1538_return_output := x_MUX_uxn_device_h_l181_c5_1538_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l118_c16_c7a3] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_c7a3_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l118_c26_600f_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l119_c12_d838] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_d838_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l119_c22_065c_return_output);

     -- CONST_SR_8[uxn_device_h_l185_c34_85be] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l185_c34_85be_x <= VAR_CONST_SR_8_uxn_device_h_l185_c34_85be_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l185_c34_85be_return_output := CONST_SR_8_uxn_device_h_l185_c34_85be_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l110_c3_f4cb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_cond;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_return_output := result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output := CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c3_a7b7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_return_output;

     -- BIN_OP_OR[uxn_device_h_l147_c4_7e82] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l147_c4_7e82_left <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_left;
     BIN_OP_OR_uxn_device_h_l147_c4_7e82_right <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_return_output := BIN_OP_OR_uxn_device_h_l147_c4_7e82_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l154_c22_fcb5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_fcb5_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_9436_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l210_c4_4388_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l210_c9_0a41_return_output, 1);
     VAR_MUX_uxn_device_h_l222_c4_799a_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l222_c9_02bb_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_a992_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_80f9_return_output;
     VAR_x_MUX_uxn_device_h_l133_c3_0a71_iftrue := VAR_BIN_OP_OR_uxn_device_h_l134_c4_ffd4_return_output;
     VAR_y_MUX_uxn_device_h_l146_c3_25c6_iftrue := VAR_BIN_OP_OR_uxn_device_h_l147_c4_7e82_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_iftrue := VAR_BIN_OP_OR_uxn_device_h_l217_c4_b425_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_c7a3_return_output;
     VAR_layer_MUX_uxn_device_h_l115_c3_03f4_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_d838_return_output;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_c7a4_return_output;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_4347_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_fcb5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_80b9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output;
     VAR_x_MUX_uxn_device_h_l126_c3_678e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output;
     VAR_y_MUX_uxn_device_h_l139_c3_f781_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_3140_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_left := VAR_MUX_uxn_device_h_l96_c19_f911_return_output;
     VAR_MUX_uxn_device_h_l103_c32_69ce_cond := VAR_MUX_uxn_device_h_l96_c19_f911_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iftrue := VAR_MUX_uxn_device_h_l96_c19_f911_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_right := VAR_MUX_uxn_device_h_l97_c20_b97a_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iftrue := VAR_MUX_uxn_device_h_l97_c20_b97a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iftrue := VAR_auto_advance_MUX_uxn_device_h_l151_c3_a7b7_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_30f0_iftrue := VAR_color_MUX_uxn_device_h_l115_c3_03f4_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_ctrl_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_0477_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_1538_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_4a3a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_e4e1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_b7d1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_1538_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_e4e1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l197_c4_e4e1_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_b7d1_iftrue := VAR_x_MUX_uxn_device_h_l181_c5_1538_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_cond := VAR_MUX_uxn_device_h_l210_c4_4388_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_cond := VAR_MUX_uxn_device_h_l210_c4_4388_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_cond := VAR_MUX_uxn_device_h_l210_c4_4388_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_cond := VAR_MUX_uxn_device_h_l222_c4_799a_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_cond := VAR_MUX_uxn_device_h_l222_c4_799a_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_cond := VAR_MUX_uxn_device_h_l222_c4_799a_interm_cond;
     -- auto_advance_MUX[uxn_device_h_l150_c7_ba7b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l150_c7_ba7b_cond <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_cond;
     auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iftrue;
     auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_return_output := auto_advance_MUX_uxn_device_h_l150_c7_ba7b_return_output;

     -- y_MUX[uxn_device_h_l146_c3_25c6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l146_c3_25c6_cond <= VAR_y_MUX_uxn_device_h_l146_c3_25c6_cond;
     y_MUX_uxn_device_h_l146_c3_25c6_iftrue <= VAR_y_MUX_uxn_device_h_l146_c3_25c6_iftrue;
     y_MUX_uxn_device_h_l146_c3_25c6_iffalse <= VAR_y_MUX_uxn_device_h_l146_c3_25c6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l146_c3_25c6_return_output := y_MUX_uxn_device_h_l146_c3_25c6_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_8e24] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_return_output := result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c3_a7b7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output;

     -- x_MUX[uxn_device_h_l180_c4_b7d1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l180_c4_b7d1_cond <= VAR_x_MUX_uxn_device_h_l180_c4_b7d1_cond;
     x_MUX_uxn_device_h_l180_c4_b7d1_iftrue <= VAR_x_MUX_uxn_device_h_l180_c4_b7d1_iftrue;
     x_MUX_uxn_device_h_l180_c4_b7d1_iffalse <= VAR_x_MUX_uxn_device_h_l180_c4_b7d1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l180_c4_b7d1_return_output := x_MUX_uxn_device_h_l180_c4_b7d1_return_output;

     -- result_u8_value_MUX[uxn_device_h_l196_c3_8e24] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l196_c3_8e24_cond <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_cond;
     result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iftrue;
     result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_return_output := result_u8_value_MUX_uxn_device_h_l196_c3_8e24_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_b7d1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_return_output;

     -- ctrl_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_cond;
     ctrl_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     ctrl_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_return_output := ctrl_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- y_MUX[uxn_device_h_l139_c3_f781] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l139_c3_f781_cond <= VAR_y_MUX_uxn_device_h_l139_c3_f781_cond;
     y_MUX_uxn_device_h_l139_c3_f781_iftrue <= VAR_y_MUX_uxn_device_h_l139_c3_f781_iftrue;
     y_MUX_uxn_device_h_l139_c3_f781_iffalse <= VAR_y_MUX_uxn_device_h_l139_c3_f781_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l139_c3_f781_return_output := y_MUX_uxn_device_h_l139_c3_f781_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l222_c4_799a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_cond;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_return_output := result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_cond;
     is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iftrue;
     is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_return_output := is_sprite_port_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l157_c18_62a3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_left;
     BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_return_output := BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l109_c7_88ae] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_88ae_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f4cb_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l114_c7_30f0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_30f0_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_03f4_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l175_c3_a316] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_cond;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_return_output := result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l138_c7_3af4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_3af4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_f781_return_output);

     -- x_MUX[uxn_device_h_l133_c3_0a71] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l133_c3_0a71_cond <= VAR_x_MUX_uxn_device_h_l133_c3_0a71_cond;
     x_MUX_uxn_device_h_l133_c3_0a71_iftrue <= VAR_x_MUX_uxn_device_h_l133_c3_0a71_iftrue;
     x_MUX_uxn_device_h_l133_c3_0a71_iffalse <= VAR_x_MUX_uxn_device_h_l133_c3_0a71_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l133_c3_0a71_return_output := x_MUX_uxn_device_h_l133_c3_0a71_return_output;

     -- x_MUX[uxn_device_h_l126_c3_678e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l126_c3_678e_cond <= VAR_x_MUX_uxn_device_h_l126_c3_678e_cond;
     x_MUX_uxn_device_h_l126_c3_678e_iftrue <= VAR_x_MUX_uxn_device_h_l126_c3_678e_iftrue;
     x_MUX_uxn_device_h_l126_c3_678e_iffalse <= VAR_x_MUX_uxn_device_h_l126_c3_678e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l126_c3_678e_return_output := x_MUX_uxn_device_h_l126_c3_678e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_4388] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_return_output := result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_return_output;

     -- result_u8_value_MUX[uxn_device_h_l210_c4_4388] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l210_c4_4388_cond <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_cond;
     result_u8_value_MUX_uxn_device_h_l210_c4_4388_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_iftrue;
     result_u8_value_MUX_uxn_device_h_l210_c4_4388_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_return_output := result_u8_value_MUX_uxn_device_h_l210_c4_4388_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l210_c4_4388] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_cond;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_return_output := result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- result_u8_value_MUX[uxn_device_h_l151_c3_a7b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_cond;
     result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iftrue;
     result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_return_output := result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l185_c24_2e72] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_2e72_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l185_c34_85be_return_output);

     -- color_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_color_MUX_uxn_device_h_l114_c7_30f0_cond;
     color_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_color_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     color_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_color_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l114_c7_30f0_return_output := color_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- ram_addr_MUX[uxn_device_h_l203_c8_d8cb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l203_c8_d8cb_cond <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_cond;
     ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iftrue;
     ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_return_output := ram_addr_MUX_uxn_device_h_l203_c8_d8cb_return_output;

     -- BIN_OP_OR[uxn_device_h_l98_c21_1471] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c21_1471_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_left;
     BIN_OP_OR_uxn_device_h_l98_c21_1471_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output := BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c4_b7d1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_799a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_return_output := result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_return_output;

     -- ram_addr_MUX[uxn_device_h_l216_c8_d199] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l216_c8_d199_cond <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_cond;
     ram_addr_MUX_uxn_device_h_l216_c8_d199_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_iftrue;
     ram_addr_MUX_uxn_device_h_l216_c8_d199_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_return_output := ram_addr_MUX_uxn_device_h_l216_c8_d199_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l115_c3_03f4] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_cond;
     ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iftrue;
     ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_return_output := ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l132_c7_865e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_865e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_0a71_return_output);

     -- layer_MUX[uxn_device_h_l115_c3_03f4] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l115_c3_03f4_cond <= VAR_layer_MUX_uxn_device_h_l115_c3_03f4_cond;
     layer_MUX_uxn_device_h_l115_c3_03f4_iftrue <= VAR_layer_MUX_uxn_device_h_l115_c3_03f4_iftrue;
     layer_MUX_uxn_device_h_l115_c3_03f4_iffalse <= VAR_layer_MUX_uxn_device_h_l115_c3_03f4_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l115_c3_03f4_return_output := layer_MUX_uxn_device_h_l115_c3_03f4_return_output;

     -- flip_x_MUX[uxn_device_h_l115_c3_03f4] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l115_c3_03f4_cond <= VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_cond;
     flip_x_MUX_uxn_device_h_l115_c3_03f4_iftrue <= VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_iftrue;
     flip_x_MUX_uxn_device_h_l115_c3_03f4_iffalse <= VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_return_output := flip_x_MUX_uxn_device_h_l115_c3_03f4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l165_c28_65f4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_left <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_left;
     BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_right <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_return_output := BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_cond;
     is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iftrue;
     is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_return_output := is_pixel_port_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- MUX[uxn_device_h_l103_c32_69ce] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l103_c32_69ce_cond <= VAR_MUX_uxn_device_h_l103_c32_69ce_cond;
     MUX_uxn_device_h_l103_c32_69ce_iftrue <= VAR_MUX_uxn_device_h_l103_c32_69ce_iftrue;
     MUX_uxn_device_h_l103_c32_69ce_iffalse <= VAR_MUX_uxn_device_h_l103_c32_69ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l103_c32_69ce_return_output := MUX_uxn_device_h_l103_c32_69ce_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l125_c7_aea3] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_aea3_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_678e_return_output);

     -- result_u8_value_MUX[uxn_device_h_l222_c4_799a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l222_c4_799a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_cond;
     result_u8_value_MUX_uxn_device_h_l222_c4_799a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_iftrue;
     result_u8_value_MUX_uxn_device_h_l222_c4_799a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_return_output := result_u8_value_MUX_uxn_device_h_l222_c4_799a_return_output;

     -- flip_y_MUX[uxn_device_h_l115_c3_03f4] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l115_c3_03f4_cond <= VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_cond;
     flip_y_MUX_uxn_device_h_l115_c3_03f4_iftrue <= VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_iftrue;
     flip_y_MUX_uxn_device_h_l115_c3_03f4_iffalse <= VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_return_output := flip_y_MUX_uxn_device_h_l115_c3_03f4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l196_c3_8e24] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_cond;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_return_output := result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_return_output;

     -- Submodule level 3
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iftrue := VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_1471_return_output;
     VAR_vram_addr_uxn_device_h_l157_c5_a5ae := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_62a3_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l165_c5_f528 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_65f4_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_2e72_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iftrue := VAR_MUX_uxn_device_h_l103_c32_69ce_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_iffalse := VAR_auto_advance_MUX_uxn_device_h_l150_c7_ba7b_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_color_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_ctrl_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_03f4_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_iftrue := VAR_flip_x_MUX_uxn_device_h_l115_c3_03f4_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_iftrue := VAR_flip_y_MUX_uxn_device_h_l115_c3_03f4_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_6132_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_30f0_iftrue := VAR_layer_MUX_uxn_device_h_l115_c3_03f4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_iffalse := VAR_ram_addr_MUX_uxn_device_h_l203_c8_d8cb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_iffalse := VAR_ram_addr_MUX_uxn_device_h_l216_c8_d199_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_88ae_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_88ae_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_30f0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_30f0_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_aea3_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_aea3_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_865e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_865e_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_3af4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_3af4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_b7d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_4388_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_799a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_b7d1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_4388_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_799a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l210_c4_4388_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l222_c4_799a_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_aea3_iftrue := VAR_x_MUX_uxn_device_h_l126_c3_678e_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_865e_iftrue := VAR_x_MUX_uxn_device_h_l133_c3_0a71_return_output;
     VAR_x_MUX_uxn_device_h_l175_c3_a316_iftrue := VAR_x_MUX_uxn_device_h_l180_c4_b7d1_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_3af4_iftrue := VAR_y_MUX_uxn_device_h_l139_c3_f781_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_af89_iftrue := VAR_y_MUX_uxn_device_h_l146_c3_25c6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_iffalse := VAR_result_vram_address_uxn_device_h_l165_c5_f528;
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_left := VAR_vram_addr_uxn_device_h_l157_c5_a5ae;
     -- result_device_ram_address_MUX[uxn_device_h_l221_c3_e0d7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_cond;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_return_output := result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l175_c3_a316] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_cond;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_return_output := result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l209_c3_f254] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_cond;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_return_output := result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l102_c3_3723] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_cond;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_return_output := result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_return_output;

     -- ram_addr_MUX[uxn_device_h_l209_c3_f254] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l209_c3_f254_cond <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_cond;
     ram_addr_MUX_uxn_device_h_l209_c3_f254_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_iftrue;
     ram_addr_MUX_uxn_device_h_l209_c3_f254_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_return_output := ram_addr_MUX_uxn_device_h_l209_c3_f254_return_output;

     -- ctrl_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_cond;
     ctrl_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_iftrue;
     ctrl_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_return_output := ctrl_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- BIN_OP_AND[uxn_device_h_l158_c5_c880] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l158_c5_c880_left <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_left;
     BIN_OP_AND_uxn_device_h_l158_c5_c880_right <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_return_output := BIN_OP_AND_uxn_device_h_l158_c5_c880_return_output;

     -- result_u8_value_MUX[uxn_device_h_l221_c3_e0d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_cond;
     result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iftrue;
     result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_return_output := result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_return_output;

     -- color_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_color_MUX_uxn_device_h_l109_c7_88ae_cond;
     color_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_color_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     color_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_color_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l109_c7_88ae_return_output := color_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_cond;
     is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iftrue;
     is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_return_output := is_drawing_port_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_f254] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_return_output := result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_return_output;

     -- y_MUX[uxn_device_h_l145_c7_af89] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l145_c7_af89_cond <= VAR_y_MUX_uxn_device_h_l145_c7_af89_cond;
     y_MUX_uxn_device_h_l145_c7_af89_iftrue <= VAR_y_MUX_uxn_device_h_l145_c7_af89_iftrue;
     y_MUX_uxn_device_h_l145_c7_af89_iffalse <= VAR_y_MUX_uxn_device_h_l145_c7_af89_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l145_c7_af89_return_output := y_MUX_uxn_device_h_l145_c7_af89_return_output;

     -- x_MUX[uxn_device_h_l175_c3_a316] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l175_c3_a316_cond <= VAR_x_MUX_uxn_device_h_l175_c3_a316_cond;
     x_MUX_uxn_device_h_l175_c3_a316_iftrue <= VAR_x_MUX_uxn_device_h_l175_c3_a316_iftrue;
     x_MUX_uxn_device_h_l175_c3_a316_iffalse <= VAR_x_MUX_uxn_device_h_l175_c3_a316_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l175_c3_a316_return_output := x_MUX_uxn_device_h_l175_c3_a316_return_output;

     -- flip_y_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_cond;
     flip_y_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     flip_y_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_return_output := flip_y_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- layer_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_layer_MUX_uxn_device_h_l114_c7_30f0_cond;
     layer_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_layer_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     layer_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_layer_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l114_c7_30f0_return_output := layer_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- result_u8_value_MUX[uxn_device_h_l209_c3_f254] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l209_c3_f254_cond <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_cond;
     result_u8_value_MUX_uxn_device_h_l209_c3_f254_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_iftrue;
     result_u8_value_MUX_uxn_device_h_l209_c3_f254_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_return_output := result_u8_value_MUX_uxn_device_h_l209_c3_f254_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l195_c7_59ab] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_59ab_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_8e24_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_8e24_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_8e24_return_output);

     -- flip_x_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_cond;
     flip_x_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     flip_x_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_return_output := flip_x_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_aea3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_af89] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_af89_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_af89_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_af89_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_return_output := auto_advance_MUX_uxn_device_h_l145_c7_af89_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_e0d7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_return_output;

     -- ram_addr_MUX[uxn_device_h_l196_c3_8e24] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l196_c3_8e24_cond <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_cond;
     ram_addr_MUX_uxn_device_h_l196_c3_8e24_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_iftrue;
     ram_addr_MUX_uxn_device_h_l196_c3_8e24_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_return_output := ram_addr_MUX_uxn_device_h_l196_c3_8e24_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_a316] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_return_output := result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_3723] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_return_output;

     -- result_u8_value_MUX[uxn_device_h_l181_c5_1538] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c5_1538_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_cond;
     result_u8_value_MUX_uxn_device_h_l181_c5_1538_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c5_1538_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_return_output := result_u8_value_MUX_uxn_device_h_l181_c5_1538_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_cond;
     ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_return_output := ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_left := VAR_BIN_OP_AND_uxn_device_h_l158_c5_c880_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_aea3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_af89_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_color_MUX_uxn_device_h_l109_c7_88ae_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_flip_x_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_flip_y_MUX_uxn_device_h_l114_c7_30f0_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_layer_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_iftrue := VAR_ram_addr_MUX_uxn_device_h_l196_c3_8e24_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_iftrue := VAR_ram_addr_MUX_uxn_device_h_l209_c3_f254_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_59ab_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l195_c7_59ab_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c5_1538_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_df1c_iftrue := VAR_x_MUX_uxn_device_h_l175_c3_a316_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_3af4_iffalse := VAR_y_MUX_uxn_device_h_l145_c7_af89_return_output;
     -- layer_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_layer_MUX_uxn_device_h_l109_c7_88ae_cond;
     layer_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_layer_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     layer_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_layer_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l109_c7_88ae_return_output := layer_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_865e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l180_c4_b7d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_cond;
     result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_return_output := result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_return_output;

     -- y_MUX[uxn_device_h_l138_c7_3af4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c7_3af4_cond <= VAR_y_MUX_uxn_device_h_l138_c7_3af4_cond;
     y_MUX_uxn_device_h_l138_c7_3af4_iftrue <= VAR_y_MUX_uxn_device_h_l138_c7_3af4_iftrue;
     y_MUX_uxn_device_h_l138_c7_3af4_iffalse <= VAR_y_MUX_uxn_device_h_l138_c7_3af4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c7_3af4_return_output := y_MUX_uxn_device_h_l138_c7_3af4_return_output;

     -- ram_addr_MUX[uxn_device_h_l208_c7_82d6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l208_c7_82d6_cond <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_cond;
     ram_addr_MUX_uxn_device_h_l208_c7_82d6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_iftrue;
     ram_addr_MUX_uxn_device_h_l208_c7_82d6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_return_output := ram_addr_MUX_uxn_device_h_l208_c7_82d6_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l95_c2_6132] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l95_c2_6132_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_3723_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_3723_return_output);

     -- color_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_color_MUX_uxn_device_h_l95_c2_6132_cond;
     color_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_color_MUX_uxn_device_h_l95_c2_6132_iftrue;
     color_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_color_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l95_c2_6132_return_output := color_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- flip_x_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_cond;
     flip_x_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     flip_x_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_return_output := flip_x_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- x_MUX[uxn_device_h_l174_c7_df1c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l174_c7_df1c_cond <= VAR_x_MUX_uxn_device_h_l174_c7_df1c_cond;
     x_MUX_uxn_device_h_l174_c7_df1c_iftrue <= VAR_x_MUX_uxn_device_h_l174_c7_df1c_iftrue;
     x_MUX_uxn_device_h_l174_c7_df1c_iffalse <= VAR_x_MUX_uxn_device_h_l174_c7_df1c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l174_c7_df1c_return_output := x_MUX_uxn_device_h_l174_c7_df1c_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_cond;
     ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_return_output := ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l220_c7_d1d5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_d1d5_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_e0d7_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_e0d7_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_e0d7_return_output);

     -- flip_y_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_cond;
     flip_y_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     flip_y_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_return_output := flip_y_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79[uxn_device_h_l208_c7_82d6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_82d6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ec79(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_f254_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_f254_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_f254_return_output);

     -- auto_advance_MUX[uxn_device_h_l138_c7_3af4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l138_c7_3af4_cond <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_cond;
     auto_advance_MUX_uxn_device_h_l138_c7_3af4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_iftrue;
     auto_advance_MUX_uxn_device_h_l138_c7_3af4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_return_output := auto_advance_MUX_uxn_device_h_l138_c7_3af4_return_output;

     -- BIN_OP_OR[uxn_device_h_l159_c5_1fd4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l159_c5_1fd4_left <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_left;
     BIN_OP_OR_uxn_device_h_l159_c5_1fd4_right <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_return_output := BIN_OP_OR_uxn_device_h_l159_c5_1fd4_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_left := VAR_BIN_OP_OR_uxn_device_h_l159_c5_1fd4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_865e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l138_c7_3af4_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_flip_x_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_flip_y_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_layer_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_iffalse := VAR_ram_addr_MUX_uxn_device_h_l208_c7_82d6_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_6132_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l95_c2_6132_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_82d6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l208_c7_82d6_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_d1d5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ec79_uxn_device_h_l220_c7_d1d5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l180_c4_b7d1_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_ba7b_iffalse := VAR_x_MUX_uxn_device_h_l174_c7_df1c_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_865e_iffalse := VAR_y_MUX_uxn_device_h_l138_c7_3af4_return_output;
     -- ctrl_mode_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_cond;
     ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iftrue;
     ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_return_output := ctrl_mode_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- y_MUX[uxn_device_h_l132_c7_865e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l132_c7_865e_cond <= VAR_y_MUX_uxn_device_h_l132_c7_865e_cond;
     y_MUX_uxn_device_h_l132_c7_865e_iftrue <= VAR_y_MUX_uxn_device_h_l132_c7_865e_iftrue;
     y_MUX_uxn_device_h_l132_c7_865e_iffalse <= VAR_y_MUX_uxn_device_h_l132_c7_865e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l132_c7_865e_return_output := y_MUX_uxn_device_h_l132_c7_865e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_3af4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_return_output;

     -- layer_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_layer_MUX_uxn_device_h_l95_c2_6132_cond;
     layer_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_layer_MUX_uxn_device_h_l95_c2_6132_iftrue;
     layer_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_layer_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l95_c2_6132_return_output := layer_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- auto_advance_MUX[uxn_device_h_l132_c7_865e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l132_c7_865e_cond <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_cond;
     auto_advance_MUX_uxn_device_h_l132_c7_865e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_iftrue;
     auto_advance_MUX_uxn_device_h_l132_c7_865e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_return_output := auto_advance_MUX_uxn_device_h_l132_c7_865e_return_output;

     -- ram_addr_MUX[uxn_device_h_l195_c7_59ab] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l195_c7_59ab_cond <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_cond;
     ram_addr_MUX_uxn_device_h_l195_c7_59ab_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_iftrue;
     ram_addr_MUX_uxn_device_h_l195_c7_59ab_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_return_output := ram_addr_MUX_uxn_device_h_l195_c7_59ab_return_output;

     -- flip_x_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_cond;
     flip_x_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_iftrue;
     flip_x_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_return_output := flip_x_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- result_u8_value_MUX[uxn_device_h_l175_c3_a316] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l175_c3_a316_cond <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_cond;
     result_u8_value_MUX_uxn_device_h_l175_c3_a316_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_iftrue;
     result_u8_value_MUX_uxn_device_h_l175_c3_a316_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_return_output := result_u8_value_MUX_uxn_device_h_l175_c3_a316_return_output;

     -- BIN_OP_OR[uxn_device_h_l160_c5_9ecf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l160_c5_9ecf_left <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_left;
     BIN_OP_OR_uxn_device_h_l160_c5_9ecf_right <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_return_output := BIN_OP_OR_uxn_device_h_l160_c5_9ecf_return_output;

     -- flip_y_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_cond;
     flip_y_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_iftrue;
     flip_y_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_return_output := flip_y_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- x_MUX[uxn_device_h_l150_c7_ba7b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l150_c7_ba7b_cond <= VAR_x_MUX_uxn_device_h_l150_c7_ba7b_cond;
     x_MUX_uxn_device_h_l150_c7_ba7b_iftrue <= VAR_x_MUX_uxn_device_h_l150_c7_ba7b_iftrue;
     x_MUX_uxn_device_h_l150_c7_ba7b_iffalse <= VAR_x_MUX_uxn_device_h_l150_c7_ba7b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l150_c7_ba7b_return_output := x_MUX_uxn_device_h_l150_c7_ba7b_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_left := VAR_BIN_OP_OR_uxn_device_h_l160_c5_9ecf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_3af4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_iffalse := VAR_auto_advance_MUX_uxn_device_h_l132_c7_865e_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_6132_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l95_c2_6132_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l95_c2_6132_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l195_c7_59ab_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_af89_iffalse := VAR_x_MUX_uxn_device_h_l150_c7_ba7b_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_aea3_iffalse := VAR_y_MUX_uxn_device_h_l132_c7_865e_return_output;
     -- ram_addr_MUX[uxn_device_h_l174_c7_df1c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l174_c7_df1c_cond <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_cond;
     ram_addr_MUX_uxn_device_h_l174_c7_df1c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_iftrue;
     ram_addr_MUX_uxn_device_h_l174_c7_df1c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_return_output := ram_addr_MUX_uxn_device_h_l174_c7_df1c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_af89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_return_output;

     -- x_MUX[uxn_device_h_l145_c7_af89] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l145_c7_af89_cond <= VAR_x_MUX_uxn_device_h_l145_c7_af89_cond;
     x_MUX_uxn_device_h_l145_c7_af89_iftrue <= VAR_x_MUX_uxn_device_h_l145_c7_af89_iftrue;
     x_MUX_uxn_device_h_l145_c7_af89_iffalse <= VAR_x_MUX_uxn_device_h_l145_c7_af89_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l145_c7_af89_return_output := x_MUX_uxn_device_h_l145_c7_af89_return_output;

     -- auto_advance_MUX[uxn_device_h_l125_c7_aea3] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_aea3_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_aea3_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_aea3_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_return_output := auto_advance_MUX_uxn_device_h_l125_c7_aea3_return_output;

     -- y_MUX[uxn_device_h_l125_c7_aea3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_aea3_cond <= VAR_y_MUX_uxn_device_h_l125_c7_aea3_cond;
     y_MUX_uxn_device_h_l125_c7_aea3_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_aea3_iftrue;
     y_MUX_uxn_device_h_l125_c7_aea3_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_aea3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_aea3_return_output := y_MUX_uxn_device_h_l125_c7_aea3_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_9aa1[uxn_device_h_l174_c7_df1c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_9aa1_uxn_device_h_l174_c7_df1c_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_9aa1(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_a316_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_a316_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_a316_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_a316_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_a316_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_a316_return_output);

     -- BIN_OP_OR[uxn_device_h_l161_c5_f5b1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l161_c5_f5b1_left <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_left;
     BIN_OP_OR_uxn_device_h_l161_c5_f5b1_right <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output := BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output;

     -- Submodule level 7
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_f5b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_af89_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_aea3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l174_c7_df1c_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_df1c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_9aa1_uxn_device_h_l174_c7_df1c_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_3af4_iffalse := VAR_x_MUX_uxn_device_h_l145_c7_af89_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_30f0_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_aea3_return_output;
     -- y_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_y_MUX_uxn_device_h_l114_c7_30f0_cond;
     y_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     y_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_30f0_return_output := y_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_ba7b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_return_output := auto_advance_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- ram_addr_MUX[uxn_device_h_l150_c7_ba7b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond;
     ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue;
     ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output := ram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l156_c4_556d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l156_c4_556d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_cond;
     result_vram_address_MUX_uxn_device_h_l156_c4_556d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_iftrue;
     result_vram_address_MUX_uxn_device_h_l156_c4_556d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_return_output := result_vram_address_MUX_uxn_device_h_l156_c4_556d_return_output;

     -- vram_addr_MUX[uxn_device_h_l156_c4_556d] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l156_c4_556d_cond <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_cond;
     vram_addr_MUX_uxn_device_h_l156_c4_556d_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_iftrue;
     vram_addr_MUX_uxn_device_h_l156_c4_556d_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_return_output := vram_addr_MUX_uxn_device_h_l156_c4_556d_return_output;

     -- x_MUX[uxn_device_h_l138_c7_3af4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l138_c7_3af4_cond <= VAR_x_MUX_uxn_device_h_l138_c7_3af4_cond;
     x_MUX_uxn_device_h_l138_c7_3af4_iftrue <= VAR_x_MUX_uxn_device_h_l138_c7_3af4_iftrue;
     x_MUX_uxn_device_h_l138_c7_3af4_iffalse <= VAR_x_MUX_uxn_device_h_l138_c7_3af4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l138_c7_3af4_return_output := x_MUX_uxn_device_h_l138_c7_3af4_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_ba7b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse := VAR_ram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l156_c4_556d_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iftrue := VAR_vram_addr_MUX_uxn_device_h_l156_c4_556d_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_865e_iffalse := VAR_x_MUX_uxn_device_h_l138_c7_3af4_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_30f0_return_output;
     -- y_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_y_MUX_uxn_device_h_l109_c7_88ae_cond;
     y_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_y_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     y_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_y_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l109_c7_88ae_return_output := y_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- ram_addr_MUX[uxn_device_h_l145_c7_af89] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l145_c7_af89_cond <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_cond;
     ram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue;
     ram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_return_output := ram_addr_MUX_uxn_device_h_l145_c7_af89_return_output;

     -- vram_addr_MUX[uxn_device_h_l151_c3_a7b7] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l151_c3_a7b7_cond <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_cond;
     vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iftrue;
     vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_return_output := vram_addr_MUX_uxn_device_h_l151_c3_a7b7_return_output;

     -- x_MUX[uxn_device_h_l132_c7_865e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l132_c7_865e_cond <= VAR_x_MUX_uxn_device_h_l132_c7_865e_cond;
     x_MUX_uxn_device_h_l132_c7_865e_iftrue <= VAR_x_MUX_uxn_device_h_l132_c7_865e_iftrue;
     x_MUX_uxn_device_h_l132_c7_865e_iffalse <= VAR_x_MUX_uxn_device_h_l132_c7_865e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l132_c7_865e_return_output := x_MUX_uxn_device_h_l132_c7_865e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_df1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c3_a7b7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_cond;
     result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output := result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output;

     -- auto_advance_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_cond;
     auto_advance_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     auto_advance_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_return_output := auto_advance_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_df1c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_auto_advance_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse := VAR_ram_addr_MUX_uxn_device_h_l145_c7_af89_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue := VAR_vram_addr_MUX_uxn_device_h_l151_c3_a7b7_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_aea3_iffalse := VAR_x_MUX_uxn_device_h_l132_c7_865e_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_y_MUX_uxn_device_h_l109_c7_88ae_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_20bc[uxn_device_h_l150_c7_ba7b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_20bc_uxn_device_h_l150_c7_ba7b_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_20bc(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_a7b7_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_a7b7_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_a7b7_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_a7b7_return_output);

     -- vram_addr_MUX[uxn_device_h_l150_c7_ba7b] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_cond;
     vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iftrue;
     vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output := vram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output;

     -- auto_advance_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_cond;
     auto_advance_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_iftrue;
     auto_advance_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_return_output := auto_advance_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- y_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_y_MUX_uxn_device_h_l95_c2_6132_cond;
     y_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_y_MUX_uxn_device_h_l95_c2_6132_iftrue;
     y_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_y_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l95_c2_6132_return_output := y_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_59ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_return_output;

     -- ram_addr_MUX[uxn_device_h_l138_c7_3af4] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l138_c7_3af4_cond <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_cond;
     ram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue;
     ram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output := ram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output;

     -- x_MUX[uxn_device_h_l125_c7_aea3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l125_c7_aea3_cond <= VAR_x_MUX_uxn_device_h_l125_c7_aea3_cond;
     x_MUX_uxn_device_h_l125_c7_aea3_iftrue <= VAR_x_MUX_uxn_device_h_l125_c7_aea3_iftrue;
     x_MUX_uxn_device_h_l125_c7_aea3_iffalse <= VAR_x_MUX_uxn_device_h_l125_c7_aea3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l125_c7_aea3_return_output := x_MUX_uxn_device_h_l125_c7_aea3_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_59ab_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_ba7b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_20bc_uxn_device_h_l150_c7_ba7b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse := VAR_vram_addr_MUX_uxn_device_h_l150_c7_ba7b_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_30f0_iffalse := VAR_x_MUX_uxn_device_h_l125_c7_aea3_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l95_c2_6132_return_output;
     -- x_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_x_MUX_uxn_device_h_l114_c7_30f0_cond;
     x_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_x_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     x_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_x_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l114_c7_30f0_return_output := x_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_82d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_return_output;

     -- ram_addr_MUX[uxn_device_h_l132_c7_865e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l132_c7_865e_cond <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_cond;
     ram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue;
     ram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_return_output := ram_addr_MUX_uxn_device_h_l132_c7_865e_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_af89] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_af89_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_return_output := vram_addr_MUX_uxn_device_h_l145_c7_af89_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_82d6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse := VAR_ram_addr_MUX_uxn_device_h_l132_c7_865e_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_af89_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_x_MUX_uxn_device_h_l114_c7_30f0_return_output;
     -- vram_addr_MUX[uxn_device_h_l138_c7_3af4] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l138_c7_3af4_cond <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_cond;
     vram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_iftrue;
     vram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output := vram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output;

     -- x_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_x_MUX_uxn_device_h_l109_c7_88ae_cond;
     x_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_x_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     x_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_x_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l109_c7_88ae_return_output := x_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- ram_addr_MUX[uxn_device_h_l125_c7_aea3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l125_c7_aea3_cond <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_cond;
     ram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue;
     ram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output := ram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_d1d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_d1d5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse := VAR_ram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse := VAR_vram_addr_MUX_uxn_device_h_l138_c7_3af4_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_x_MUX_uxn_device_h_l109_c7_88ae_return_output;
     -- ram_addr_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_cond;
     ram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     ram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output := ram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_4a5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_return_output;

     -- vram_addr_MUX[uxn_device_h_l132_c7_865e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l132_c7_865e_cond <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_cond;
     vram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_iftrue;
     vram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_return_output := vram_addr_MUX_uxn_device_h_l132_c7_865e_return_output;

     -- x_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_x_MUX_uxn_device_h_l95_c2_6132_cond;
     x_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_x_MUX_uxn_device_h_l95_c2_6132_iftrue;
     x_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_x_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l95_c2_6132_return_output := x_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- Submodule level 13
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_4a5d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_ram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse := VAR_vram_addr_MUX_uxn_device_h_l132_c7_865e_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l95_c2_6132_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_e2b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_return_output;

     -- vram_addr_MUX[uxn_device_h_l125_c7_aea3] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l125_c7_aea3_cond <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_cond;
     vram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_iftrue;
     vram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output := vram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output;

     -- ram_addr_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_cond;
     ram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     ram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output := ram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- Submodule level 14
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_e2b4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_ram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse := VAR_vram_addr_MUX_uxn_device_h_l125_c7_aea3_return_output;
     -- screen_blit[uxn_device_h_l231_c46_3ca9] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l231_c46_3ca9_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l231_c46_3ca9_phase <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_phase;
     screen_blit_uxn_device_h_l231_c46_3ca9_ctrl <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_ctrl;
     screen_blit_uxn_device_h_l231_c46_3ca9_auto_advance <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_auto_advance;
     screen_blit_uxn_device_h_l231_c46_3ca9_x <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_x;
     screen_blit_uxn_device_h_l231_c46_3ca9_y <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_y;
     screen_blit_uxn_device_h_l231_c46_3ca9_ram_addr <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_ram_addr;
     screen_blit_uxn_device_h_l231_c46_3ca9_previous_ram_read <= VAR_screen_blit_uxn_device_h_l231_c46_3ca9_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output := screen_blit_uxn_device_h_l231_c46_3ca9_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output := vram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- ram_addr_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_cond;
     ram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue;
     ram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_return_output := ram_addr_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- Submodule level 15
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_30f0_return_output;
     -- CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d[uxn_device_h_l238_c25_6b2b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_6b2b_return_output := VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output.ram_address;

     -- vram_addr_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_cond;
     vram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     vram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output := vram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l236_c30_e780] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_e780_return_output := VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output.vram_write_layer;

     -- CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d[uxn_device_h_l235_c26_812e] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_812e_return_output := VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l239_c25_17d8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_17d8_return_output := VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output.is_blit_done;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l237_c22_92d0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_92d0_return_output := VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l234_c27_04be] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_04be_return_output := VAR_screen_blit_uxn_device_h_l231_c46_3ca9_return_output.is_vram_write;

     -- Submodule level 16
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_vram_addr_MUX_uxn_device_h_l109_c7_88ae_return_output;
     -- vram_addr_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_cond;
     vram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_iftrue;
     vram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_return_output := vram_addr_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6[uxn_device_h_l230_c3_0ce8] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_0ce8_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l233_c4_7b51,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_04be_return_output,
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_812e_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_e780_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_92d0_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_6b2b_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_17d8_return_output);

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l230_c3_0ce8_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_0ce8_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l95_c2_6132_return_output;
     -- result_MUX[uxn_device_h_l230_c3_0ce8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l230_c3_0ce8_cond <= VAR_result_MUX_uxn_device_h_l230_c3_0ce8_cond;
     result_MUX_uxn_device_h_l230_c3_0ce8_iftrue <= VAR_result_MUX_uxn_device_h_l230_c3_0ce8_iftrue;
     result_MUX_uxn_device_h_l230_c3_0ce8_iffalse <= VAR_result_MUX_uxn_device_h_l230_c3_0ce8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l230_c3_0ce8_return_output := result_MUX_uxn_device_h_l230_c3_0ce8_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l220_c7_d1d5_iffalse := VAR_result_MUX_uxn_device_h_l230_c3_0ce8_return_output;
     -- result_MUX[uxn_device_h_l220_c7_d1d5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l220_c7_d1d5_cond <= VAR_result_MUX_uxn_device_h_l220_c7_d1d5_cond;
     result_MUX_uxn_device_h_l220_c7_d1d5_iftrue <= VAR_result_MUX_uxn_device_h_l220_c7_d1d5_iftrue;
     result_MUX_uxn_device_h_l220_c7_d1d5_iffalse <= VAR_result_MUX_uxn_device_h_l220_c7_d1d5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l220_c7_d1d5_return_output := result_MUX_uxn_device_h_l220_c7_d1d5_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l208_c7_82d6_iffalse := VAR_result_MUX_uxn_device_h_l220_c7_d1d5_return_output;
     -- result_MUX[uxn_device_h_l208_c7_82d6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l208_c7_82d6_cond <= VAR_result_MUX_uxn_device_h_l208_c7_82d6_cond;
     result_MUX_uxn_device_h_l208_c7_82d6_iftrue <= VAR_result_MUX_uxn_device_h_l208_c7_82d6_iftrue;
     result_MUX_uxn_device_h_l208_c7_82d6_iffalse <= VAR_result_MUX_uxn_device_h_l208_c7_82d6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l208_c7_82d6_return_output := result_MUX_uxn_device_h_l208_c7_82d6_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l195_c7_59ab_iffalse := VAR_result_MUX_uxn_device_h_l208_c7_82d6_return_output;
     -- result_MUX[uxn_device_h_l195_c7_59ab] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l195_c7_59ab_cond <= VAR_result_MUX_uxn_device_h_l195_c7_59ab_cond;
     result_MUX_uxn_device_h_l195_c7_59ab_iftrue <= VAR_result_MUX_uxn_device_h_l195_c7_59ab_iftrue;
     result_MUX_uxn_device_h_l195_c7_59ab_iffalse <= VAR_result_MUX_uxn_device_h_l195_c7_59ab_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l195_c7_59ab_return_output := result_MUX_uxn_device_h_l195_c7_59ab_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l174_c7_df1c_iffalse := VAR_result_MUX_uxn_device_h_l195_c7_59ab_return_output;
     -- result_MUX[uxn_device_h_l174_c7_df1c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c7_df1c_cond <= VAR_result_MUX_uxn_device_h_l174_c7_df1c_cond;
     result_MUX_uxn_device_h_l174_c7_df1c_iftrue <= VAR_result_MUX_uxn_device_h_l174_c7_df1c_iftrue;
     result_MUX_uxn_device_h_l174_c7_df1c_iffalse <= VAR_result_MUX_uxn_device_h_l174_c7_df1c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c7_df1c_return_output := result_MUX_uxn_device_h_l174_c7_df1c_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l150_c7_ba7b_iffalse := VAR_result_MUX_uxn_device_h_l174_c7_df1c_return_output;
     -- result_MUX[uxn_device_h_l150_c7_ba7b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l150_c7_ba7b_cond <= VAR_result_MUX_uxn_device_h_l150_c7_ba7b_cond;
     result_MUX_uxn_device_h_l150_c7_ba7b_iftrue <= VAR_result_MUX_uxn_device_h_l150_c7_ba7b_iftrue;
     result_MUX_uxn_device_h_l150_c7_ba7b_iffalse <= VAR_result_MUX_uxn_device_h_l150_c7_ba7b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l150_c7_ba7b_return_output := result_MUX_uxn_device_h_l150_c7_ba7b_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l145_c7_af89_iffalse := VAR_result_MUX_uxn_device_h_l150_c7_ba7b_return_output;
     -- result_MUX[uxn_device_h_l145_c7_af89] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l145_c7_af89_cond <= VAR_result_MUX_uxn_device_h_l145_c7_af89_cond;
     result_MUX_uxn_device_h_l145_c7_af89_iftrue <= VAR_result_MUX_uxn_device_h_l145_c7_af89_iftrue;
     result_MUX_uxn_device_h_l145_c7_af89_iffalse <= VAR_result_MUX_uxn_device_h_l145_c7_af89_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l145_c7_af89_return_output := result_MUX_uxn_device_h_l145_c7_af89_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l138_c7_3af4_iffalse := VAR_result_MUX_uxn_device_h_l145_c7_af89_return_output;
     -- result_MUX[uxn_device_h_l138_c7_3af4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l138_c7_3af4_cond <= VAR_result_MUX_uxn_device_h_l138_c7_3af4_cond;
     result_MUX_uxn_device_h_l138_c7_3af4_iftrue <= VAR_result_MUX_uxn_device_h_l138_c7_3af4_iftrue;
     result_MUX_uxn_device_h_l138_c7_3af4_iffalse <= VAR_result_MUX_uxn_device_h_l138_c7_3af4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l138_c7_3af4_return_output := result_MUX_uxn_device_h_l138_c7_3af4_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l132_c7_865e_iffalse := VAR_result_MUX_uxn_device_h_l138_c7_3af4_return_output;
     -- result_MUX[uxn_device_h_l132_c7_865e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l132_c7_865e_cond <= VAR_result_MUX_uxn_device_h_l132_c7_865e_cond;
     result_MUX_uxn_device_h_l132_c7_865e_iftrue <= VAR_result_MUX_uxn_device_h_l132_c7_865e_iftrue;
     result_MUX_uxn_device_h_l132_c7_865e_iffalse <= VAR_result_MUX_uxn_device_h_l132_c7_865e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l132_c7_865e_return_output := result_MUX_uxn_device_h_l132_c7_865e_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l125_c7_aea3_iffalse := VAR_result_MUX_uxn_device_h_l132_c7_865e_return_output;
     -- result_MUX[uxn_device_h_l125_c7_aea3] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l125_c7_aea3_cond <= VAR_result_MUX_uxn_device_h_l125_c7_aea3_cond;
     result_MUX_uxn_device_h_l125_c7_aea3_iftrue <= VAR_result_MUX_uxn_device_h_l125_c7_aea3_iftrue;
     result_MUX_uxn_device_h_l125_c7_aea3_iffalse <= VAR_result_MUX_uxn_device_h_l125_c7_aea3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l125_c7_aea3_return_output := result_MUX_uxn_device_h_l125_c7_aea3_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l114_c7_30f0_iffalse := VAR_result_MUX_uxn_device_h_l125_c7_aea3_return_output;
     -- result_MUX[uxn_device_h_l114_c7_30f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l114_c7_30f0_cond <= VAR_result_MUX_uxn_device_h_l114_c7_30f0_cond;
     result_MUX_uxn_device_h_l114_c7_30f0_iftrue <= VAR_result_MUX_uxn_device_h_l114_c7_30f0_iftrue;
     result_MUX_uxn_device_h_l114_c7_30f0_iffalse <= VAR_result_MUX_uxn_device_h_l114_c7_30f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l114_c7_30f0_return_output := result_MUX_uxn_device_h_l114_c7_30f0_return_output;

     -- Submodule level 28
     VAR_result_MUX_uxn_device_h_l109_c7_88ae_iffalse := VAR_result_MUX_uxn_device_h_l114_c7_30f0_return_output;
     -- result_MUX[uxn_device_h_l109_c7_88ae] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l109_c7_88ae_cond <= VAR_result_MUX_uxn_device_h_l109_c7_88ae_cond;
     result_MUX_uxn_device_h_l109_c7_88ae_iftrue <= VAR_result_MUX_uxn_device_h_l109_c7_88ae_iftrue;
     result_MUX_uxn_device_h_l109_c7_88ae_iffalse <= VAR_result_MUX_uxn_device_h_l109_c7_88ae_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l109_c7_88ae_return_output := result_MUX_uxn_device_h_l109_c7_88ae_return_output;

     -- Submodule level 29
     VAR_result_MUX_uxn_device_h_l95_c2_6132_iffalse := VAR_result_MUX_uxn_device_h_l109_c7_88ae_return_output;
     -- result_MUX[uxn_device_h_l95_c2_6132] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l95_c2_6132_cond <= VAR_result_MUX_uxn_device_h_l95_c2_6132_cond;
     result_MUX_uxn_device_h_l95_c2_6132_iftrue <= VAR_result_MUX_uxn_device_h_l95_c2_6132_iftrue;
     result_MUX_uxn_device_h_l95_c2_6132_iffalse <= VAR_result_MUX_uxn_device_h_l95_c2_6132_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l95_c2_6132_return_output := result_MUX_uxn_device_h_l95_c2_6132_return_output;

     -- Submodule level 30
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l95_c2_6132_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l95_c2_6132_return_output;
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
