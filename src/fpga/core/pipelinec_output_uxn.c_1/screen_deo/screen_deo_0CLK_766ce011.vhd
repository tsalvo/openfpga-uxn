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
-- BIN_OP_EQ[uxn_device_h_l95_c6_c8c0]
signal BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_039c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l95_c2_050f]
signal ctrl_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l95_c2_050f]
signal ram_addr_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l95_c2_050f]
signal x_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l95_c2_050f]
signal flip_x_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l95_c2_050f]
signal ctrl_mode_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l95_c2_050f]
signal result_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c2_050f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_050f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_050f_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l95_c2_050f]
signal color_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l95_c2_050f]
signal y_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l95_c2_050f]
signal layer_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l95_c2_050f]
signal is_pixel_port_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l95_c2_050f]
signal is_drawing_port_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l95_c2_050f]
signal vram_addr_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(31 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l95_c2_050f]
signal is_sprite_port_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l95_c2_050f]
signal auto_advance_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l95_c2_050f]
signal flip_y_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l96_c19_cf98]
signal BIN_OP_EQ_uxn_device_h_l96_c19_cf98_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_cf98_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_cf98_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l96_c19_5f4b]
signal MUX_uxn_device_h_l96_c19_5f4b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_5f4b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_5f4b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_5f4b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l97_c20_cd85]
signal BIN_OP_EQ_uxn_device_h_l97_c20_cd85_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_cd85_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_cd85_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l97_c20_de49]
signal MUX_uxn_device_h_l97_c20_de49_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_de49_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_de49_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_de49_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c21_aa5a]
signal BIN_OP_OR_uxn_device_h_l98_c21_aa5a_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_aa5a_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l102_c3_f456]
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_f456]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l103_c32_1487]
signal MUX_uxn_device_h_l103_c32_1487_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l103_c32_1487_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_1487_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l103_c32_1487_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c11_bf79]
signal BIN_OP_EQ_uxn_device_h_l109_c11_bf79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_bf79_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_7218]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l109_c7_039c]
signal ctrl_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l109_c7_039c]
signal ram_addr_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l109_c7_039c]
signal x_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l109_c7_039c]
signal flip_x_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l109_c7_039c]
signal ctrl_mode_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l109_c7_039c]
signal result_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l109_c7_039c_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_039c_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l109_c7_039c_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l109_c7_039c]
signal color_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l109_c7_039c]
signal y_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l109_c7_039c]
signal layer_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l109_c7_039c]
signal vram_addr_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l109_c7_039c]
signal auto_advance_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l109_c7_039c]
signal flip_y_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l110_c3_f563]
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_4a14]
signal BIN_OP_EQ_uxn_device_h_l114_c11_4a14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_4a14_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_cc40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l114_c7_7218]
signal ctrl_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l114_c7_7218]
signal ram_addr_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l114_c7_7218]
signal x_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l114_c7_7218]
signal flip_x_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l114_c7_7218]
signal ctrl_mode_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l114_c7_7218]
signal result_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l114_c7_7218_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_7218_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_7218_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l114_c7_7218]
signal color_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l114_c7_7218]
signal y_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l114_c7_7218]
signal layer_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_7218]
signal vram_addr_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_7218]
signal auto_advance_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(7 downto 0);

-- flip_y_MUX[uxn_device_h_l114_c7_7218]
signal flip_y_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l115_c3_0815]
signal ctrl_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l115_c3_0815]
signal flip_x_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l115_c3_0815]
signal ctrl_mode_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_0815]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l115_c3_0815]
signal color_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l115_c3_0815]
signal layer_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l115_c3_0815]
signal flip_y_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);

-- CONST_SR_7[uxn_device_h_l118_c26_0c15]
signal CONST_SR_7_uxn_device_h_l118_c26_0c15_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l118_c26_0c15_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l119_c22_f592]
signal CONST_SR_6_uxn_device_h_l119_c22_f592_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l119_c22_f592_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l120_c23_f84b]
signal CONST_SR_5_uxn_device_h_l120_c23_f84b_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l120_c23_f84b_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l121_c23_c198]
signal CONST_SR_4_uxn_device_h_l121_c23_c198_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l121_c23_c198_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_3883]
signal BIN_OP_EQ_uxn_device_h_l125_c11_3883_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_3883_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_0215]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l125_c7_cc40]
signal ram_addr_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l125_c7_cc40]
signal x_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l125_c7_cc40]
signal result_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l125_c7_cc40_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_cc40_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l125_c7_cc40_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l125_c7_cc40]
signal y_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l125_c7_cc40]
signal vram_addr_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_cc40]
signal auto_advance_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l126_c3_de80]
signal x_MUX_uxn_device_h_l126_c3_de80_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l126_c3_de80_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_de80_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l126_c3_de80_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_de80]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c11_2a2f]
signal BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_cdc0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l132_c7_0215]
signal ram_addr_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l132_c7_0215]
signal x_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l132_c7_0215]
signal result_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l132_c7_0215_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_0215_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l132_c7_0215_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l132_c7_0215]
signal y_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l132_c7_0215]
signal vram_addr_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l132_c7_0215]
signal auto_advance_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l133_c3_bd75]
signal x_MUX_uxn_device_h_l133_c3_bd75_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l133_c3_bd75_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_bd75_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l133_c3_bd75_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c3_bd75]
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l134_c4_b2ea]
signal BIN_OP_OR_uxn_device_h_l134_c4_b2ea_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_b2ea_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l134_c4_b2ea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c11_f0b6]
signal BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_c12c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l138_c7_cdc0]
signal ram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l138_c7_cdc0]
signal x_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l138_c7_cdc0]
signal result_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l138_c7_cdc0_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_cdc0_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l138_c7_cdc0_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l138_c7_cdc0]
signal y_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l138_c7_cdc0]
signal vram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l138_c7_cdc0]
signal auto_advance_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l139_c3_d215]
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l139_c3_d215]
signal y_MUX_uxn_device_h_l139_c3_d215_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l139_c3_d215_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_d215_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c3_d215_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_5fc2]
signal BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_bada]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l145_c7_c12c]
signal ram_addr_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l145_c7_c12c]
signal x_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l145_c7_c12c]
signal result_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l145_c7_c12c_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_c12c_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l145_c7_c12c_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l145_c7_c12c]
signal y_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(15 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_c12c]
signal vram_addr_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_c12c]
signal auto_advance_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l146_c3_1bac]
signal y_MUX_uxn_device_h_l146_c3_1bac_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l146_c3_1bac_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_1bac_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l146_c3_1bac_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l147_c4_a6bd]
signal BIN_OP_OR_uxn_device_h_l147_c4_a6bd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_a6bd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l147_c4_a6bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l150_c11_b6a3]
signal BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_429f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l150_c7_bada]
signal ram_addr_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l150_c7_bada]
signal x_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l150_c7_bada]
signal result_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l150_c7_bada_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_bada_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l150_c7_bada_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l150_c7_bada]
signal vram_addr_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l150_c7_bada]
signal auto_advance_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c3_7e95]
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c3_7e95]
signal result_vram_address_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l151_c3_7e95]
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l151_c3_7e95]
signal result_u8_value_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c3_7e95]
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l151_c3_7e95]
signal vram_addr_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(31 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c3_7e95]
signal auto_advance_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l154_c32_4a75]
signal BIN_OP_AND_uxn_device_h_l154_c32_4a75_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_4a75_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l154_c32_4a75_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l156_c4_bf44]
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l156_c4_bf44]
signal result_vram_address_MUX_uxn_device_h_l156_c4_bf44_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c4_bf44_return_output : unsigned(31 downto 0);

-- vram_addr_MUX[uxn_device_h_l156_c4_bf44]
signal vram_addr_MUX_uxn_device_h_l156_c4_bf44_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_bf44_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_bf44_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l156_c4_bf44_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_6471]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l157_c18_7783]
signal BIN_OP_PLUS_uxn_device_h_l157_c18_7783_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_7783_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l157_c18_7783_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l158_c5_f54b]
signal BIN_OP_AND_uxn_device_h_l158_c5_f54b_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_f54b_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l158_c5_f54b_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l159_c19_4915]
signal MUX_uxn_device_h_l159_c19_4915_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l159_c19_4915_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_4915_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l159_c19_4915_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l159_c5_2fd0]
signal BIN_OP_OR_uxn_device_h_l159_c5_2fd0_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_2fd0_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l159_c5_2fd0_return_output : unsigned(31 downto 0);

-- MUX[uxn_device_h_l160_c19_a62c]
signal MUX_uxn_device_h_l160_c19_a62c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l160_c19_a62c_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_a62c_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l160_c19_a62c_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l160_c5_ec4d]
signal BIN_OP_OR_uxn_device_h_l160_c5_ec4d_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_ec4d_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l160_c5_ec4d_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l161_c5_dc3b]
signal BIN_OP_OR_uxn_device_h_l161_c5_dc3b_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_dc3b_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_d93f]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l165_c28_bdee]
signal BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_return_output : unsigned(64 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c8_48e8]
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c8_48e8]
signal auto_advance_MUX_uxn_device_h_l169_c8_48e8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_48e8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_48e8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c8_48e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c11_c7ab]
signal BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_52b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l174_c7_429f]
signal ram_addr_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_429f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_429f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_429f_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l174_c7_429f]
signal x_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l174_c7_429f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_429f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c7_429f_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l174_c7_429f]
signal result_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c7_429f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_429f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_429f_return_output : device_out_result_t;

-- x_MUX[uxn_device_h_l175_c3_b4e7]
signal x_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l175_c3_b4e7]
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l175_c3_b4e7]
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_b4e7]
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l175_c3_b4e7]
signal result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(31 downto 0);

-- result_u8_value_MUX[uxn_device_h_l175_c3_b4e7]
signal result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l175_c3_b4e7]
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l180_c9_fef4]
signal UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l180_c4_7c84]
signal x_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l180_c4_7c84]
signal result_u8_value_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l180_c4_7c84]
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l180_c4_7c84]
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_7c84]
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l181_c9_07fc]
signal BIN_OP_AND_uxn_device_h_l181_c9_07fc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_07fc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l181_c9_07fc_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l181_c5_5b0e]
signal x_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l181_c5_5b0e]
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l181_c5_5b0e]
signal result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_5b0e]
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l182_c6_9e1b]
signal BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l185_c34_5d31]
signal CONST_SR_8_uxn_device_h_l185_c34_5d31_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l185_c34_5d31_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l191_c8_c5a7]
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c11_97a2]
signal BIN_OP_EQ_uxn_device_h_l195_c11_97a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_97a2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_8bbf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l195_c7_52b0]
signal ram_addr_MUX_uxn_device_h_l195_c7_52b0_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_52b0_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_52b0_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l195_c7_52b0_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l195_c7_52b0]
signal result_MUX_uxn_device_h_l195_c7_52b0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l195_c7_52b0_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_52b0_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_52b0_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l196_c3_5b74]
signal ram_addr_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l196_c3_5b74]
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l196_c3_5b74]
signal result_u8_value_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_5b74]
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l197_c8_ecd5]
signal BIN_OP_AND_uxn_device_h_l197_c8_ecd5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_ecd5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l197_c8_ecd5_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l197_c4_5367]
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l197_c4_5367]
signal result_u8_value_MUX_uxn_device_h_l197_c4_5367_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_5367_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_5367_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l197_c4_5367_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_5367]
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l203_c8_035f]
signal ram_addr_MUX_uxn_device_h_l203_c8_035f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_035f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_035f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l203_c8_035f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l208_c11_3cf0]
signal BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_20c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l208_c7_8bbf]
signal ram_addr_MUX_uxn_device_h_l208_c7_8bbf_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l208_c7_8bbf_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l208_c7_8bbf]
signal result_MUX_uxn_device_h_l208_c7_8bbf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l208_c7_8bbf_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_8bbf_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l208_c7_8bbf_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l209_c3_c9c2]
signal ram_addr_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l209_c3_c9c2]
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l209_c3_c9c2]
signal result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_c9c2]
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l210_c9_e745]
signal BIN_OP_AND_uxn_device_h_l210_c9_e745_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_e745_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l210_c9_e745_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l210_c4_dcd4]
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l210_c4_dcd4]
signal result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_dcd4]
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_device_h_l213_c33_1d93]
signal CONST_SR_8_uxn_device_h_l213_c33_1d93_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l213_c33_1d93_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l216_c8_05ae]
signal ram_addr_MUX_uxn_device_h_l216_c8_05ae_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_05ae_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_05ae_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l216_c8_05ae_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l217_c4_0acb]
signal BIN_OP_OR_uxn_device_h_l217_c4_0acb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_0acb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c4_0acb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l220_c11_9634]
signal BIN_OP_EQ_uxn_device_h_l220_c11_9634_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_9634_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_a728]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l220_c7_20c2]
signal result_MUX_uxn_device_h_l220_c7_20c2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l220_c7_20c2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_20c2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l220_c7_20c2_return_output : device_out_result_t;

-- result_device_ram_address_MUX[uxn_device_h_l221_c3_fcfc]
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l221_c3_fcfc]
signal result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_fcfc]
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l222_c9_aac5]
signal BIN_OP_AND_uxn_device_h_l222_c9_aac5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_aac5_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l222_c9_aac5_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l222_c4_6d4d]
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l222_c4_6d4d]
signal result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_6d4d]
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_5953]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l230_c3_b016]
signal result_MUX_uxn_device_h_l230_c3_b016_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l230_c3_b016_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_b016_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l230_c3_b016_return_output : device_out_result_t;

-- BIN_OP_MINUS[uxn_device_h_l231_c58_1784]
signal BIN_OP_MINUS_uxn_device_h_l231_c58_1784_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_1784_right : unsigned(3 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l231_c58_1784_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l231_c46_6df4]
signal screen_blit_uxn_device_h_l231_c46_6df4_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l231_c46_6df4_return_output : screen_blit_result_t;

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output : unsigned(15 downto 0);

-- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f
signal CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_x : unsigned(7 downto 0);
signal CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_ad0b( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.vram_address := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_2d2f( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_write := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.device_ram_address := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;

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
-- BIN_OP_EQ_uxn_device_h_l95_c6_c8c0
BIN_OP_EQ_uxn_device_h_l95_c6_c8c0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_left,
BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_right,
BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_return_output);

-- ctrl_MUX_uxn_device_h_l95_c2_050f
ctrl_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l95_c2_050f_cond,
ctrl_MUX_uxn_device_h_l95_c2_050f_iftrue,
ctrl_MUX_uxn_device_h_l95_c2_050f_iffalse,
ctrl_MUX_uxn_device_h_l95_c2_050f_return_output);

-- ram_addr_MUX_uxn_device_h_l95_c2_050f
ram_addr_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l95_c2_050f_cond,
ram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue,
ram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse,
ram_addr_MUX_uxn_device_h_l95_c2_050f_return_output);

-- x_MUX_uxn_device_h_l95_c2_050f
x_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l95_c2_050f_cond,
x_MUX_uxn_device_h_l95_c2_050f_iftrue,
x_MUX_uxn_device_h_l95_c2_050f_iffalse,
x_MUX_uxn_device_h_l95_c2_050f_return_output);

-- flip_x_MUX_uxn_device_h_l95_c2_050f
flip_x_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l95_c2_050f_cond,
flip_x_MUX_uxn_device_h_l95_c2_050f_iftrue,
flip_x_MUX_uxn_device_h_l95_c2_050f_iffalse,
flip_x_MUX_uxn_device_h_l95_c2_050f_return_output);

-- ctrl_mode_MUX_uxn_device_h_l95_c2_050f
ctrl_mode_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l95_c2_050f_cond,
ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iftrue,
ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iffalse,
ctrl_mode_MUX_uxn_device_h_l95_c2_050f_return_output);

-- result_MUX_uxn_device_h_l95_c2_050f
result_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l95_c2_050f_cond,
result_MUX_uxn_device_h_l95_c2_050f_iftrue,
result_MUX_uxn_device_h_l95_c2_050f_iffalse,
result_MUX_uxn_device_h_l95_c2_050f_return_output);

-- color_MUX_uxn_device_h_l95_c2_050f
color_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l95_c2_050f_cond,
color_MUX_uxn_device_h_l95_c2_050f_iftrue,
color_MUX_uxn_device_h_l95_c2_050f_iffalse,
color_MUX_uxn_device_h_l95_c2_050f_return_output);

-- y_MUX_uxn_device_h_l95_c2_050f
y_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l95_c2_050f_cond,
y_MUX_uxn_device_h_l95_c2_050f_iftrue,
y_MUX_uxn_device_h_l95_c2_050f_iffalse,
y_MUX_uxn_device_h_l95_c2_050f_return_output);

-- layer_MUX_uxn_device_h_l95_c2_050f
layer_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l95_c2_050f_cond,
layer_MUX_uxn_device_h_l95_c2_050f_iftrue,
layer_MUX_uxn_device_h_l95_c2_050f_iffalse,
layer_MUX_uxn_device_h_l95_c2_050f_return_output);

-- is_pixel_port_MUX_uxn_device_h_l95_c2_050f
is_pixel_port_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l95_c2_050f_cond,
is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iftrue,
is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iffalse,
is_pixel_port_MUX_uxn_device_h_l95_c2_050f_return_output);

-- is_drawing_port_MUX_uxn_device_h_l95_c2_050f
is_drawing_port_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l95_c2_050f_cond,
is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iftrue,
is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iffalse,
is_drawing_port_MUX_uxn_device_h_l95_c2_050f_return_output);

-- vram_addr_MUX_uxn_device_h_l95_c2_050f
vram_addr_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l95_c2_050f_cond,
vram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue,
vram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse,
vram_addr_MUX_uxn_device_h_l95_c2_050f_return_output);

-- is_sprite_port_MUX_uxn_device_h_l95_c2_050f
is_sprite_port_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l95_c2_050f_cond,
is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iftrue,
is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iffalse,
is_sprite_port_MUX_uxn_device_h_l95_c2_050f_return_output);

-- auto_advance_MUX_uxn_device_h_l95_c2_050f
auto_advance_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l95_c2_050f_cond,
auto_advance_MUX_uxn_device_h_l95_c2_050f_iftrue,
auto_advance_MUX_uxn_device_h_l95_c2_050f_iffalse,
auto_advance_MUX_uxn_device_h_l95_c2_050f_return_output);

-- flip_y_MUX_uxn_device_h_l95_c2_050f
flip_y_MUX_uxn_device_h_l95_c2_050f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l95_c2_050f_cond,
flip_y_MUX_uxn_device_h_l95_c2_050f_iftrue,
flip_y_MUX_uxn_device_h_l95_c2_050f_iffalse,
flip_y_MUX_uxn_device_h_l95_c2_050f_return_output);

-- BIN_OP_EQ_uxn_device_h_l96_c19_cf98
BIN_OP_EQ_uxn_device_h_l96_c19_cf98 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l96_c19_cf98_left,
BIN_OP_EQ_uxn_device_h_l96_c19_cf98_right,
BIN_OP_EQ_uxn_device_h_l96_c19_cf98_return_output);

-- MUX_uxn_device_h_l96_c19_5f4b
MUX_uxn_device_h_l96_c19_5f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c19_5f4b_cond,
MUX_uxn_device_h_l96_c19_5f4b_iftrue,
MUX_uxn_device_h_l96_c19_5f4b_iffalse,
MUX_uxn_device_h_l96_c19_5f4b_return_output);

-- BIN_OP_EQ_uxn_device_h_l97_c20_cd85
BIN_OP_EQ_uxn_device_h_l97_c20_cd85 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l97_c20_cd85_left,
BIN_OP_EQ_uxn_device_h_l97_c20_cd85_right,
BIN_OP_EQ_uxn_device_h_l97_c20_cd85_return_output);

-- MUX_uxn_device_h_l97_c20_de49
MUX_uxn_device_h_l97_c20_de49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l97_c20_de49_cond,
MUX_uxn_device_h_l97_c20_de49_iftrue,
MUX_uxn_device_h_l97_c20_de49_iffalse,
MUX_uxn_device_h_l97_c20_de49_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c21_aa5a
BIN_OP_OR_uxn_device_h_l98_c21_aa5a : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c21_aa5a_left,
BIN_OP_OR_uxn_device_h_l98_c21_aa5a_right,
BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l102_c3_f456
result_is_deo_done_MUX_uxn_device_h_l102_c3_f456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_cond,
result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iftrue,
result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iffalse,
result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_f456
result_device_ram_address_MUX_uxn_device_h_l102_c3_f456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_return_output);

-- MUX_uxn_device_h_l103_c32_1487
MUX_uxn_device_h_l103_c32_1487 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l103_c32_1487_cond,
MUX_uxn_device_h_l103_c32_1487_iftrue,
MUX_uxn_device_h_l103_c32_1487_iffalse,
MUX_uxn_device_h_l103_c32_1487_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c11_bf79
BIN_OP_EQ_uxn_device_h_l109_c11_bf79 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c11_bf79_left,
BIN_OP_EQ_uxn_device_h_l109_c11_bf79_right,
BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_return_output);

-- ctrl_MUX_uxn_device_h_l109_c7_039c
ctrl_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l109_c7_039c_cond,
ctrl_MUX_uxn_device_h_l109_c7_039c_iftrue,
ctrl_MUX_uxn_device_h_l109_c7_039c_iffalse,
ctrl_MUX_uxn_device_h_l109_c7_039c_return_output);

-- ram_addr_MUX_uxn_device_h_l109_c7_039c
ram_addr_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l109_c7_039c_cond,
ram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue,
ram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse,
ram_addr_MUX_uxn_device_h_l109_c7_039c_return_output);

-- x_MUX_uxn_device_h_l109_c7_039c
x_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l109_c7_039c_cond,
x_MUX_uxn_device_h_l109_c7_039c_iftrue,
x_MUX_uxn_device_h_l109_c7_039c_iffalse,
x_MUX_uxn_device_h_l109_c7_039c_return_output);

-- flip_x_MUX_uxn_device_h_l109_c7_039c
flip_x_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l109_c7_039c_cond,
flip_x_MUX_uxn_device_h_l109_c7_039c_iftrue,
flip_x_MUX_uxn_device_h_l109_c7_039c_iffalse,
flip_x_MUX_uxn_device_h_l109_c7_039c_return_output);

-- ctrl_mode_MUX_uxn_device_h_l109_c7_039c
ctrl_mode_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l109_c7_039c_cond,
ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iftrue,
ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iffalse,
ctrl_mode_MUX_uxn_device_h_l109_c7_039c_return_output);

-- result_MUX_uxn_device_h_l109_c7_039c
result_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l109_c7_039c_cond,
result_MUX_uxn_device_h_l109_c7_039c_iftrue,
result_MUX_uxn_device_h_l109_c7_039c_iffalse,
result_MUX_uxn_device_h_l109_c7_039c_return_output);

-- color_MUX_uxn_device_h_l109_c7_039c
color_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l109_c7_039c_cond,
color_MUX_uxn_device_h_l109_c7_039c_iftrue,
color_MUX_uxn_device_h_l109_c7_039c_iffalse,
color_MUX_uxn_device_h_l109_c7_039c_return_output);

-- y_MUX_uxn_device_h_l109_c7_039c
y_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l109_c7_039c_cond,
y_MUX_uxn_device_h_l109_c7_039c_iftrue,
y_MUX_uxn_device_h_l109_c7_039c_iffalse,
y_MUX_uxn_device_h_l109_c7_039c_return_output);

-- layer_MUX_uxn_device_h_l109_c7_039c
layer_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l109_c7_039c_cond,
layer_MUX_uxn_device_h_l109_c7_039c_iftrue,
layer_MUX_uxn_device_h_l109_c7_039c_iffalse,
layer_MUX_uxn_device_h_l109_c7_039c_return_output);

-- vram_addr_MUX_uxn_device_h_l109_c7_039c
vram_addr_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l109_c7_039c_cond,
vram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue,
vram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse,
vram_addr_MUX_uxn_device_h_l109_c7_039c_return_output);

-- auto_advance_MUX_uxn_device_h_l109_c7_039c
auto_advance_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l109_c7_039c_cond,
auto_advance_MUX_uxn_device_h_l109_c7_039c_iftrue,
auto_advance_MUX_uxn_device_h_l109_c7_039c_iffalse,
auto_advance_MUX_uxn_device_h_l109_c7_039c_return_output);

-- flip_y_MUX_uxn_device_h_l109_c7_039c
flip_y_MUX_uxn_device_h_l109_c7_039c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l109_c7_039c_cond,
flip_y_MUX_uxn_device_h_l109_c7_039c_iftrue,
flip_y_MUX_uxn_device_h_l109_c7_039c_iffalse,
flip_y_MUX_uxn_device_h_l109_c7_039c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l110_c3_f563
result_device_ram_address_MUX_uxn_device_h_l110_c3_f563 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_cond,
result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iftrue,
result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iffalse,
result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_4a14
BIN_OP_EQ_uxn_device_h_l114_c11_4a14 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_4a14_left,
BIN_OP_EQ_uxn_device_h_l114_c11_4a14_right,
BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_return_output);

-- ctrl_MUX_uxn_device_h_l114_c7_7218
ctrl_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l114_c7_7218_cond,
ctrl_MUX_uxn_device_h_l114_c7_7218_iftrue,
ctrl_MUX_uxn_device_h_l114_c7_7218_iffalse,
ctrl_MUX_uxn_device_h_l114_c7_7218_return_output);

-- ram_addr_MUX_uxn_device_h_l114_c7_7218
ram_addr_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l114_c7_7218_cond,
ram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue,
ram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse,
ram_addr_MUX_uxn_device_h_l114_c7_7218_return_output);

-- x_MUX_uxn_device_h_l114_c7_7218
x_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l114_c7_7218_cond,
x_MUX_uxn_device_h_l114_c7_7218_iftrue,
x_MUX_uxn_device_h_l114_c7_7218_iffalse,
x_MUX_uxn_device_h_l114_c7_7218_return_output);

-- flip_x_MUX_uxn_device_h_l114_c7_7218
flip_x_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l114_c7_7218_cond,
flip_x_MUX_uxn_device_h_l114_c7_7218_iftrue,
flip_x_MUX_uxn_device_h_l114_c7_7218_iffalse,
flip_x_MUX_uxn_device_h_l114_c7_7218_return_output);

-- ctrl_mode_MUX_uxn_device_h_l114_c7_7218
ctrl_mode_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l114_c7_7218_cond,
ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iftrue,
ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iffalse,
ctrl_mode_MUX_uxn_device_h_l114_c7_7218_return_output);

-- result_MUX_uxn_device_h_l114_c7_7218
result_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l114_c7_7218_cond,
result_MUX_uxn_device_h_l114_c7_7218_iftrue,
result_MUX_uxn_device_h_l114_c7_7218_iffalse,
result_MUX_uxn_device_h_l114_c7_7218_return_output);

-- color_MUX_uxn_device_h_l114_c7_7218
color_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l114_c7_7218_cond,
color_MUX_uxn_device_h_l114_c7_7218_iftrue,
color_MUX_uxn_device_h_l114_c7_7218_iffalse,
color_MUX_uxn_device_h_l114_c7_7218_return_output);

-- y_MUX_uxn_device_h_l114_c7_7218
y_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_7218_cond,
y_MUX_uxn_device_h_l114_c7_7218_iftrue,
y_MUX_uxn_device_h_l114_c7_7218_iffalse,
y_MUX_uxn_device_h_l114_c7_7218_return_output);

-- layer_MUX_uxn_device_h_l114_c7_7218
layer_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l114_c7_7218_cond,
layer_MUX_uxn_device_h_l114_c7_7218_iftrue,
layer_MUX_uxn_device_h_l114_c7_7218_iffalse,
layer_MUX_uxn_device_h_l114_c7_7218_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_7218
vram_addr_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_7218_cond,
vram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_7218_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_7218
auto_advance_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_7218_cond,
auto_advance_MUX_uxn_device_h_l114_c7_7218_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_7218_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_7218_return_output);

-- flip_y_MUX_uxn_device_h_l114_c7_7218
flip_y_MUX_uxn_device_h_l114_c7_7218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l114_c7_7218_cond,
flip_y_MUX_uxn_device_h_l114_c7_7218_iftrue,
flip_y_MUX_uxn_device_h_l114_c7_7218_iffalse,
flip_y_MUX_uxn_device_h_l114_c7_7218_return_output);

-- ctrl_MUX_uxn_device_h_l115_c3_0815
ctrl_MUX_uxn_device_h_l115_c3_0815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l115_c3_0815_cond,
ctrl_MUX_uxn_device_h_l115_c3_0815_iftrue,
ctrl_MUX_uxn_device_h_l115_c3_0815_iffalse,
ctrl_MUX_uxn_device_h_l115_c3_0815_return_output);

-- flip_x_MUX_uxn_device_h_l115_c3_0815
flip_x_MUX_uxn_device_h_l115_c3_0815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l115_c3_0815_cond,
flip_x_MUX_uxn_device_h_l115_c3_0815_iftrue,
flip_x_MUX_uxn_device_h_l115_c3_0815_iffalse,
flip_x_MUX_uxn_device_h_l115_c3_0815_return_output);

-- ctrl_mode_MUX_uxn_device_h_l115_c3_0815
ctrl_mode_MUX_uxn_device_h_l115_c3_0815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l115_c3_0815_cond,
ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iftrue,
ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iffalse,
ctrl_mode_MUX_uxn_device_h_l115_c3_0815_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_0815
result_device_ram_address_MUX_uxn_device_h_l115_c3_0815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_return_output);

-- color_MUX_uxn_device_h_l115_c3_0815
color_MUX_uxn_device_h_l115_c3_0815 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l115_c3_0815_cond,
color_MUX_uxn_device_h_l115_c3_0815_iftrue,
color_MUX_uxn_device_h_l115_c3_0815_iffalse,
color_MUX_uxn_device_h_l115_c3_0815_return_output);

-- layer_MUX_uxn_device_h_l115_c3_0815
layer_MUX_uxn_device_h_l115_c3_0815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l115_c3_0815_cond,
layer_MUX_uxn_device_h_l115_c3_0815_iftrue,
layer_MUX_uxn_device_h_l115_c3_0815_iffalse,
layer_MUX_uxn_device_h_l115_c3_0815_return_output);

-- flip_y_MUX_uxn_device_h_l115_c3_0815
flip_y_MUX_uxn_device_h_l115_c3_0815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l115_c3_0815_cond,
flip_y_MUX_uxn_device_h_l115_c3_0815_iftrue,
flip_y_MUX_uxn_device_h_l115_c3_0815_iffalse,
flip_y_MUX_uxn_device_h_l115_c3_0815_return_output);

-- CONST_SR_7_uxn_device_h_l118_c26_0c15
CONST_SR_7_uxn_device_h_l118_c26_0c15 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l118_c26_0c15_x,
CONST_SR_7_uxn_device_h_l118_c26_0c15_return_output);

-- CONST_SR_6_uxn_device_h_l119_c22_f592
CONST_SR_6_uxn_device_h_l119_c22_f592 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l119_c22_f592_x,
CONST_SR_6_uxn_device_h_l119_c22_f592_return_output);

-- CONST_SR_5_uxn_device_h_l120_c23_f84b
CONST_SR_5_uxn_device_h_l120_c23_f84b : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l120_c23_f84b_x,
CONST_SR_5_uxn_device_h_l120_c23_f84b_return_output);

-- CONST_SR_4_uxn_device_h_l121_c23_c198
CONST_SR_4_uxn_device_h_l121_c23_c198 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l121_c23_c198_x,
CONST_SR_4_uxn_device_h_l121_c23_c198_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_3883
BIN_OP_EQ_uxn_device_h_l125_c11_3883 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_3883_left,
BIN_OP_EQ_uxn_device_h_l125_c11_3883_right,
BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_return_output);

-- ram_addr_MUX_uxn_device_h_l125_c7_cc40
ram_addr_MUX_uxn_device_h_l125_c7_cc40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l125_c7_cc40_cond,
ram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue,
ram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse,
ram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output);

-- x_MUX_uxn_device_h_l125_c7_cc40
x_MUX_uxn_device_h_l125_c7_cc40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l125_c7_cc40_cond,
x_MUX_uxn_device_h_l125_c7_cc40_iftrue,
x_MUX_uxn_device_h_l125_c7_cc40_iffalse,
x_MUX_uxn_device_h_l125_c7_cc40_return_output);

-- result_MUX_uxn_device_h_l125_c7_cc40
result_MUX_uxn_device_h_l125_c7_cc40 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l125_c7_cc40_cond,
result_MUX_uxn_device_h_l125_c7_cc40_iftrue,
result_MUX_uxn_device_h_l125_c7_cc40_iffalse,
result_MUX_uxn_device_h_l125_c7_cc40_return_output);

-- y_MUX_uxn_device_h_l125_c7_cc40
y_MUX_uxn_device_h_l125_c7_cc40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_cc40_cond,
y_MUX_uxn_device_h_l125_c7_cc40_iftrue,
y_MUX_uxn_device_h_l125_c7_cc40_iffalse,
y_MUX_uxn_device_h_l125_c7_cc40_return_output);

-- vram_addr_MUX_uxn_device_h_l125_c7_cc40
vram_addr_MUX_uxn_device_h_l125_c7_cc40 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l125_c7_cc40_cond,
vram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue,
vram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse,
vram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_cc40
auto_advance_MUX_uxn_device_h_l125_c7_cc40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_cc40_cond,
auto_advance_MUX_uxn_device_h_l125_c7_cc40_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_cc40_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_cc40_return_output);

-- x_MUX_uxn_device_h_l126_c3_de80
x_MUX_uxn_device_h_l126_c3_de80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l126_c3_de80_cond,
x_MUX_uxn_device_h_l126_c3_de80_iftrue,
x_MUX_uxn_device_h_l126_c3_de80_iffalse,
x_MUX_uxn_device_h_l126_c3_de80_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_de80
result_device_ram_address_MUX_uxn_device_h_l126_c3_de80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c11_2a2f
BIN_OP_EQ_uxn_device_h_l132_c11_2a2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_left,
BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_right,
BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_return_output);

-- ram_addr_MUX_uxn_device_h_l132_c7_0215
ram_addr_MUX_uxn_device_h_l132_c7_0215 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l132_c7_0215_cond,
ram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue,
ram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse,
ram_addr_MUX_uxn_device_h_l132_c7_0215_return_output);

-- x_MUX_uxn_device_h_l132_c7_0215
x_MUX_uxn_device_h_l132_c7_0215 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l132_c7_0215_cond,
x_MUX_uxn_device_h_l132_c7_0215_iftrue,
x_MUX_uxn_device_h_l132_c7_0215_iffalse,
x_MUX_uxn_device_h_l132_c7_0215_return_output);

-- result_MUX_uxn_device_h_l132_c7_0215
result_MUX_uxn_device_h_l132_c7_0215 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l132_c7_0215_cond,
result_MUX_uxn_device_h_l132_c7_0215_iftrue,
result_MUX_uxn_device_h_l132_c7_0215_iffalse,
result_MUX_uxn_device_h_l132_c7_0215_return_output);

-- y_MUX_uxn_device_h_l132_c7_0215
y_MUX_uxn_device_h_l132_c7_0215 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l132_c7_0215_cond,
y_MUX_uxn_device_h_l132_c7_0215_iftrue,
y_MUX_uxn_device_h_l132_c7_0215_iffalse,
y_MUX_uxn_device_h_l132_c7_0215_return_output);

-- vram_addr_MUX_uxn_device_h_l132_c7_0215
vram_addr_MUX_uxn_device_h_l132_c7_0215 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l132_c7_0215_cond,
vram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue,
vram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse,
vram_addr_MUX_uxn_device_h_l132_c7_0215_return_output);

-- auto_advance_MUX_uxn_device_h_l132_c7_0215
auto_advance_MUX_uxn_device_h_l132_c7_0215 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l132_c7_0215_cond,
auto_advance_MUX_uxn_device_h_l132_c7_0215_iftrue,
auto_advance_MUX_uxn_device_h_l132_c7_0215_iffalse,
auto_advance_MUX_uxn_device_h_l132_c7_0215_return_output);

-- x_MUX_uxn_device_h_l133_c3_bd75
x_MUX_uxn_device_h_l133_c3_bd75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l133_c3_bd75_cond,
x_MUX_uxn_device_h_l133_c3_bd75_iftrue,
x_MUX_uxn_device_h_l133_c3_bd75_iffalse,
x_MUX_uxn_device_h_l133_c3_bd75_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75
result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_return_output);

-- BIN_OP_OR_uxn_device_h_l134_c4_b2ea
BIN_OP_OR_uxn_device_h_l134_c4_b2ea : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l134_c4_b2ea_left,
BIN_OP_OR_uxn_device_h_l134_c4_b2ea_right,
BIN_OP_OR_uxn_device_h_l134_c4_b2ea_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c11_f0b6
BIN_OP_EQ_uxn_device_h_l138_c11_f0b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_left,
BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_right,
BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_return_output);

-- ram_addr_MUX_uxn_device_h_l138_c7_cdc0
ram_addr_MUX_uxn_device_h_l138_c7_cdc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond,
ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue,
ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse,
ram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output);

-- x_MUX_uxn_device_h_l138_c7_cdc0
x_MUX_uxn_device_h_l138_c7_cdc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l138_c7_cdc0_cond,
x_MUX_uxn_device_h_l138_c7_cdc0_iftrue,
x_MUX_uxn_device_h_l138_c7_cdc0_iffalse,
x_MUX_uxn_device_h_l138_c7_cdc0_return_output);

-- result_MUX_uxn_device_h_l138_c7_cdc0
result_MUX_uxn_device_h_l138_c7_cdc0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l138_c7_cdc0_cond,
result_MUX_uxn_device_h_l138_c7_cdc0_iftrue,
result_MUX_uxn_device_h_l138_c7_cdc0_iffalse,
result_MUX_uxn_device_h_l138_c7_cdc0_return_output);

-- y_MUX_uxn_device_h_l138_c7_cdc0
y_MUX_uxn_device_h_l138_c7_cdc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c7_cdc0_cond,
y_MUX_uxn_device_h_l138_c7_cdc0_iftrue,
y_MUX_uxn_device_h_l138_c7_cdc0_iffalse,
y_MUX_uxn_device_h_l138_c7_cdc0_return_output);

-- vram_addr_MUX_uxn_device_h_l138_c7_cdc0
vram_addr_MUX_uxn_device_h_l138_c7_cdc0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond,
vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue,
vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse,
vram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output);

-- auto_advance_MUX_uxn_device_h_l138_c7_cdc0
auto_advance_MUX_uxn_device_h_l138_c7_cdc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l138_c7_cdc0_cond,
auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iftrue,
auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iffalse,
auto_advance_MUX_uxn_device_h_l138_c7_cdc0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l139_c3_d215
result_device_ram_address_MUX_uxn_device_h_l139_c3_d215 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_cond,
result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iftrue,
result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iffalse,
result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_return_output);

-- y_MUX_uxn_device_h_l139_c3_d215
y_MUX_uxn_device_h_l139_c3_d215 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l139_c3_d215_cond,
y_MUX_uxn_device_h_l139_c3_d215_iftrue,
y_MUX_uxn_device_h_l139_c3_d215_iffalse,
y_MUX_uxn_device_h_l139_c3_d215_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_5fc2
BIN_OP_EQ_uxn_device_h_l145_c11_5fc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_left,
BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_right,
BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_return_output);

-- ram_addr_MUX_uxn_device_h_l145_c7_c12c
ram_addr_MUX_uxn_device_h_l145_c7_c12c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l145_c7_c12c_cond,
ram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue,
ram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse,
ram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output);

-- x_MUX_uxn_device_h_l145_c7_c12c
x_MUX_uxn_device_h_l145_c7_c12c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l145_c7_c12c_cond,
x_MUX_uxn_device_h_l145_c7_c12c_iftrue,
x_MUX_uxn_device_h_l145_c7_c12c_iffalse,
x_MUX_uxn_device_h_l145_c7_c12c_return_output);

-- result_MUX_uxn_device_h_l145_c7_c12c
result_MUX_uxn_device_h_l145_c7_c12c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l145_c7_c12c_cond,
result_MUX_uxn_device_h_l145_c7_c12c_iftrue,
result_MUX_uxn_device_h_l145_c7_c12c_iffalse,
result_MUX_uxn_device_h_l145_c7_c12c_return_output);

-- y_MUX_uxn_device_h_l145_c7_c12c
y_MUX_uxn_device_h_l145_c7_c12c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l145_c7_c12c_cond,
y_MUX_uxn_device_h_l145_c7_c12c_iftrue,
y_MUX_uxn_device_h_l145_c7_c12c_iffalse,
y_MUX_uxn_device_h_l145_c7_c12c_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_c12c
vram_addr_MUX_uxn_device_h_l145_c7_c12c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_c12c_cond,
vram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_c12c
auto_advance_MUX_uxn_device_h_l145_c7_c12c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_c12c_cond,
auto_advance_MUX_uxn_device_h_l145_c7_c12c_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_c12c_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_c12c_return_output);

-- y_MUX_uxn_device_h_l146_c3_1bac
y_MUX_uxn_device_h_l146_c3_1bac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l146_c3_1bac_cond,
y_MUX_uxn_device_h_l146_c3_1bac_iftrue,
y_MUX_uxn_device_h_l146_c3_1bac_iffalse,
y_MUX_uxn_device_h_l146_c3_1bac_return_output);

-- BIN_OP_OR_uxn_device_h_l147_c4_a6bd
BIN_OP_OR_uxn_device_h_l147_c4_a6bd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l147_c4_a6bd_left,
BIN_OP_OR_uxn_device_h_l147_c4_a6bd_right,
BIN_OP_OR_uxn_device_h_l147_c4_a6bd_return_output);

-- BIN_OP_EQ_uxn_device_h_l150_c11_b6a3
BIN_OP_EQ_uxn_device_h_l150_c11_b6a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_left,
BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_right,
BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_return_output);

-- ram_addr_MUX_uxn_device_h_l150_c7_bada
ram_addr_MUX_uxn_device_h_l150_c7_bada : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l150_c7_bada_cond,
ram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue,
ram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse,
ram_addr_MUX_uxn_device_h_l150_c7_bada_return_output);

-- x_MUX_uxn_device_h_l150_c7_bada
x_MUX_uxn_device_h_l150_c7_bada : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l150_c7_bada_cond,
x_MUX_uxn_device_h_l150_c7_bada_iftrue,
x_MUX_uxn_device_h_l150_c7_bada_iffalse,
x_MUX_uxn_device_h_l150_c7_bada_return_output);

-- result_MUX_uxn_device_h_l150_c7_bada
result_MUX_uxn_device_h_l150_c7_bada : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l150_c7_bada_cond,
result_MUX_uxn_device_h_l150_c7_bada_iftrue,
result_MUX_uxn_device_h_l150_c7_bada_iffalse,
result_MUX_uxn_device_h_l150_c7_bada_return_output);

-- vram_addr_MUX_uxn_device_h_l150_c7_bada
vram_addr_MUX_uxn_device_h_l150_c7_bada : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l150_c7_bada_cond,
vram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue,
vram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse,
vram_addr_MUX_uxn_device_h_l150_c7_bada_return_output);

-- auto_advance_MUX_uxn_device_h_l150_c7_bada
auto_advance_MUX_uxn_device_h_l150_c7_bada : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l150_c7_bada_cond,
auto_advance_MUX_uxn_device_h_l150_c7_bada_iftrue,
auto_advance_MUX_uxn_device_h_l150_c7_bada_iffalse,
auto_advance_MUX_uxn_device_h_l150_c7_bada_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95
result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c3_7e95
result_vram_address_MUX_uxn_device_h_l151_c3_7e95 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c3_7e95_cond,
result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c3_7e95_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95
result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_cond,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_return_output);

-- result_u8_value_MUX_uxn_device_h_l151_c3_7e95
result_u8_value_MUX_uxn_device_h_l151_c3_7e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l151_c3_7e95_cond,
result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iftrue,
result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iffalse,
result_u8_value_MUX_uxn_device_h_l151_c3_7e95_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95
result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_return_output);

-- vram_addr_MUX_uxn_device_h_l151_c3_7e95
vram_addr_MUX_uxn_device_h_l151_c3_7e95 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l151_c3_7e95_cond,
vram_addr_MUX_uxn_device_h_l151_c3_7e95_iftrue,
vram_addr_MUX_uxn_device_h_l151_c3_7e95_iffalse,
vram_addr_MUX_uxn_device_h_l151_c3_7e95_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c3_7e95
auto_advance_MUX_uxn_device_h_l151_c3_7e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c3_7e95_cond,
auto_advance_MUX_uxn_device_h_l151_c3_7e95_iftrue,
auto_advance_MUX_uxn_device_h_l151_c3_7e95_iffalse,
auto_advance_MUX_uxn_device_h_l151_c3_7e95_return_output);

-- BIN_OP_AND_uxn_device_h_l154_c32_4a75
BIN_OP_AND_uxn_device_h_l154_c32_4a75 : entity work.BIN_OP_AND_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l154_c32_4a75_left,
BIN_OP_AND_uxn_device_h_l154_c32_4a75_right,
BIN_OP_AND_uxn_device_h_l154_c32_4a75_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44
result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_cond,
result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iftrue,
result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iffalse,
result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_return_output);

-- result_vram_address_MUX_uxn_device_h_l156_c4_bf44
result_vram_address_MUX_uxn_device_h_l156_c4_bf44 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l156_c4_bf44_cond,
result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iftrue,
result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iffalse,
result_vram_address_MUX_uxn_device_h_l156_c4_bf44_return_output);

-- vram_addr_MUX_uxn_device_h_l156_c4_bf44
vram_addr_MUX_uxn_device_h_l156_c4_bf44 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l156_c4_bf44_cond,
vram_addr_MUX_uxn_device_h_l156_c4_bf44_iftrue,
vram_addr_MUX_uxn_device_h_l156_c4_bf44_iffalse,
vram_addr_MUX_uxn_device_h_l156_c4_bf44_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_return_output);

-- BIN_OP_PLUS_uxn_device_h_l157_c18_7783
BIN_OP_PLUS_uxn_device_h_l157_c18_7783 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l157_c18_7783_left,
BIN_OP_PLUS_uxn_device_h_l157_c18_7783_right,
BIN_OP_PLUS_uxn_device_h_l157_c18_7783_return_output);

-- BIN_OP_AND_uxn_device_h_l158_c5_f54b
BIN_OP_AND_uxn_device_h_l158_c5_f54b : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l158_c5_f54b_left,
BIN_OP_AND_uxn_device_h_l158_c5_f54b_right,
BIN_OP_AND_uxn_device_h_l158_c5_f54b_return_output);

-- MUX_uxn_device_h_l159_c19_4915
MUX_uxn_device_h_l159_c19_4915 : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l159_c19_4915_cond,
MUX_uxn_device_h_l159_c19_4915_iftrue,
MUX_uxn_device_h_l159_c19_4915_iffalse,
MUX_uxn_device_h_l159_c19_4915_return_output);

-- BIN_OP_OR_uxn_device_h_l159_c5_2fd0
BIN_OP_OR_uxn_device_h_l159_c5_2fd0 : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l159_c5_2fd0_left,
BIN_OP_OR_uxn_device_h_l159_c5_2fd0_right,
BIN_OP_OR_uxn_device_h_l159_c5_2fd0_return_output);

-- MUX_uxn_device_h_l160_c19_a62c
MUX_uxn_device_h_l160_c19_a62c : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l160_c19_a62c_cond,
MUX_uxn_device_h_l160_c19_a62c_iftrue,
MUX_uxn_device_h_l160_c19_a62c_iffalse,
MUX_uxn_device_h_l160_c19_a62c_return_output);

-- BIN_OP_OR_uxn_device_h_l160_c5_ec4d
BIN_OP_OR_uxn_device_h_l160_c5_ec4d : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l160_c5_ec4d_left,
BIN_OP_OR_uxn_device_h_l160_c5_ec4d_right,
BIN_OP_OR_uxn_device_h_l160_c5_ec4d_return_output);

-- BIN_OP_OR_uxn_device_h_l161_c5_dc3b
BIN_OP_OR_uxn_device_h_l161_c5_dc3b : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l161_c5_dc3b_left,
BIN_OP_OR_uxn_device_h_l161_c5_dc3b_right,
BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l165_c28_bdee
BIN_OP_PLUS_uxn_device_h_l165_c28_bdee : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_left,
BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_right,
BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8
result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c8_48e8
auto_advance_MUX_uxn_device_h_l169_c8_48e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c8_48e8_cond,
auto_advance_MUX_uxn_device_h_l169_c8_48e8_iftrue,
auto_advance_MUX_uxn_device_h_l169_c8_48e8_iffalse,
auto_advance_MUX_uxn_device_h_l169_c8_48e8_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c11_c7ab
BIN_OP_EQ_uxn_device_h_l174_c11_c7ab : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_left,
BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_right,
BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_return_output);

-- ram_addr_MUX_uxn_device_h_l174_c7_429f
ram_addr_MUX_uxn_device_h_l174_c7_429f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l174_c7_429f_cond,
ram_addr_MUX_uxn_device_h_l174_c7_429f_iftrue,
ram_addr_MUX_uxn_device_h_l174_c7_429f_iffalse,
ram_addr_MUX_uxn_device_h_l174_c7_429f_return_output);

-- x_MUX_uxn_device_h_l174_c7_429f
x_MUX_uxn_device_h_l174_c7_429f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l174_c7_429f_cond,
x_MUX_uxn_device_h_l174_c7_429f_iftrue,
x_MUX_uxn_device_h_l174_c7_429f_iffalse,
x_MUX_uxn_device_h_l174_c7_429f_return_output);

-- result_MUX_uxn_device_h_l174_c7_429f
result_MUX_uxn_device_h_l174_c7_429f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c7_429f_cond,
result_MUX_uxn_device_h_l174_c7_429f_iftrue,
result_MUX_uxn_device_h_l174_c7_429f_iffalse,
result_MUX_uxn_device_h_l174_c7_429f_return_output);

-- x_MUX_uxn_device_h_l175_c3_b4e7
x_MUX_uxn_device_h_l175_c3_b4e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l175_c3_b4e7_cond,
x_MUX_uxn_device_h_l175_c3_b4e7_iftrue,
x_MUX_uxn_device_h_l175_c3_b4e7_iffalse,
x_MUX_uxn_device_h_l175_c3_b4e7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7
result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_cond,
result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7
result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_cond,
result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output);

-- result_vram_address_MUX_uxn_device_h_l175_c3_b4e7
result_vram_address_MUX_uxn_device_h_l175_c3_b4e7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_cond,
result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue,
result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse,
result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output);

-- result_u8_value_MUX_uxn_device_h_l175_c3_b4e7
result_u8_value_MUX_uxn_device_h_l175_c3_b4e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_cond,
result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iftrue,
result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iffalse,
result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7
result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_cond,
result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output);

-- UNARY_OP_NOT_uxn_device_h_l180_c9_fef4
UNARY_OP_NOT_uxn_device_h_l180_c9_fef4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_expr,
UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output);

-- x_MUX_uxn_device_h_l180_c4_7c84
x_MUX_uxn_device_h_l180_c4_7c84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l180_c4_7c84_cond,
x_MUX_uxn_device_h_l180_c4_7c84_iftrue,
x_MUX_uxn_device_h_l180_c4_7c84_iffalse,
x_MUX_uxn_device_h_l180_c4_7c84_return_output);

-- result_u8_value_MUX_uxn_device_h_l180_c4_7c84
result_u8_value_MUX_uxn_device_h_l180_c4_7c84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l180_c4_7c84_cond,
result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iftrue,
result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iffalse,
result_u8_value_MUX_uxn_device_h_l180_c4_7c84_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84
result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_cond,
result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iftrue,
result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iffalse,
result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84
result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_cond,
result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iftrue,
result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iffalse,
result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_cond,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_return_output);

-- BIN_OP_AND_uxn_device_h_l181_c9_07fc
BIN_OP_AND_uxn_device_h_l181_c9_07fc : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l181_c9_07fc_left,
BIN_OP_AND_uxn_device_h_l181_c9_07fc_right,
BIN_OP_AND_uxn_device_h_l181_c9_07fc_return_output);

-- x_MUX_uxn_device_h_l181_c5_5b0e
x_MUX_uxn_device_h_l181_c5_5b0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c5_5b0e_cond,
x_MUX_uxn_device_h_l181_c5_5b0e_iftrue,
x_MUX_uxn_device_h_l181_c5_5b0e_iffalse,
x_MUX_uxn_device_h_l181_c5_5b0e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e
result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_cond,
result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_return_output);

-- result_u8_value_MUX_uxn_device_h_l181_c5_5b0e
result_u8_value_MUX_uxn_device_h_l181_c5_5b0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_cond,
result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iftrue,
result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iffalse,
result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b
BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_left,
BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_right,
BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_return_output);

-- CONST_SR_8_uxn_device_h_l185_c34_5d31
CONST_SR_8_uxn_device_h_l185_c34_5d31 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l185_c34_5d31_x,
CONST_SR_8_uxn_device_h_l185_c34_5d31_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7
result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_cond,
result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c11_97a2
BIN_OP_EQ_uxn_device_h_l195_c11_97a2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c11_97a2_left,
BIN_OP_EQ_uxn_device_h_l195_c11_97a2_right,
BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_return_output);

-- ram_addr_MUX_uxn_device_h_l195_c7_52b0
ram_addr_MUX_uxn_device_h_l195_c7_52b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l195_c7_52b0_cond,
ram_addr_MUX_uxn_device_h_l195_c7_52b0_iftrue,
ram_addr_MUX_uxn_device_h_l195_c7_52b0_iffalse,
ram_addr_MUX_uxn_device_h_l195_c7_52b0_return_output);

-- result_MUX_uxn_device_h_l195_c7_52b0
result_MUX_uxn_device_h_l195_c7_52b0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l195_c7_52b0_cond,
result_MUX_uxn_device_h_l195_c7_52b0_iftrue,
result_MUX_uxn_device_h_l195_c7_52b0_iffalse,
result_MUX_uxn_device_h_l195_c7_52b0_return_output);

-- ram_addr_MUX_uxn_device_h_l196_c3_5b74
ram_addr_MUX_uxn_device_h_l196_c3_5b74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l196_c3_5b74_cond,
ram_addr_MUX_uxn_device_h_l196_c3_5b74_iftrue,
ram_addr_MUX_uxn_device_h_l196_c3_5b74_iffalse,
ram_addr_MUX_uxn_device_h_l196_c3_5b74_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74
result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_cond,
result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iftrue,
result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iffalse,
result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_return_output);

-- result_u8_value_MUX_uxn_device_h_l196_c3_5b74
result_u8_value_MUX_uxn_device_h_l196_c3_5b74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l196_c3_5b74_cond,
result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iftrue,
result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iffalse,
result_u8_value_MUX_uxn_device_h_l196_c3_5b74_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_cond,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_return_output);

-- BIN_OP_AND_uxn_device_h_l197_c8_ecd5
BIN_OP_AND_uxn_device_h_l197_c8_ecd5 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l197_c8_ecd5_left,
BIN_OP_AND_uxn_device_h_l197_c8_ecd5_right,
BIN_OP_AND_uxn_device_h_l197_c8_ecd5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l197_c4_5367
result_device_ram_address_MUX_uxn_device_h_l197_c4_5367 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_cond,
result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iftrue,
result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iffalse,
result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_return_output);

-- result_u8_value_MUX_uxn_device_h_l197_c4_5367
result_u8_value_MUX_uxn_device_h_l197_c4_5367 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l197_c4_5367_cond,
result_u8_value_MUX_uxn_device_h_l197_c4_5367_iftrue,
result_u8_value_MUX_uxn_device_h_l197_c4_5367_iffalse,
result_u8_value_MUX_uxn_device_h_l197_c4_5367_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_cond,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_return_output);

-- ram_addr_MUX_uxn_device_h_l203_c8_035f
ram_addr_MUX_uxn_device_h_l203_c8_035f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l203_c8_035f_cond,
ram_addr_MUX_uxn_device_h_l203_c8_035f_iftrue,
ram_addr_MUX_uxn_device_h_l203_c8_035f_iffalse,
ram_addr_MUX_uxn_device_h_l203_c8_035f_return_output);

-- BIN_OP_EQ_uxn_device_h_l208_c11_3cf0
BIN_OP_EQ_uxn_device_h_l208_c11_3cf0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_left,
BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_right,
BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_return_output);

-- ram_addr_MUX_uxn_device_h_l208_c7_8bbf
ram_addr_MUX_uxn_device_h_l208_c7_8bbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l208_c7_8bbf_cond,
ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iftrue,
ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iffalse,
ram_addr_MUX_uxn_device_h_l208_c7_8bbf_return_output);

-- result_MUX_uxn_device_h_l208_c7_8bbf
result_MUX_uxn_device_h_l208_c7_8bbf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l208_c7_8bbf_cond,
result_MUX_uxn_device_h_l208_c7_8bbf_iftrue,
result_MUX_uxn_device_h_l208_c7_8bbf_iffalse,
result_MUX_uxn_device_h_l208_c7_8bbf_return_output);

-- ram_addr_MUX_uxn_device_h_l209_c3_c9c2
ram_addr_MUX_uxn_device_h_l209_c3_c9c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l209_c3_c9c2_cond,
ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iftrue,
ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iffalse,
ram_addr_MUX_uxn_device_h_l209_c3_c9c2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2
result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_cond,
result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_return_output);

-- result_u8_value_MUX_uxn_device_h_l209_c3_c9c2
result_u8_value_MUX_uxn_device_h_l209_c3_c9c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_cond,
result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iftrue,
result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iffalse,
result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_cond,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_return_output);

-- BIN_OP_AND_uxn_device_h_l210_c9_e745
BIN_OP_AND_uxn_device_h_l210_c9_e745 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l210_c9_e745_left,
BIN_OP_AND_uxn_device_h_l210_c9_e745_right,
BIN_OP_AND_uxn_device_h_l210_c9_e745_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4
result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_cond,
result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_return_output);

-- result_u8_value_MUX_uxn_device_h_l210_c4_dcd4
result_u8_value_MUX_uxn_device_h_l210_c4_dcd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_cond,
result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iftrue,
result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iffalse,
result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_cond,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_return_output);

-- CONST_SR_8_uxn_device_h_l213_c33_1d93
CONST_SR_8_uxn_device_h_l213_c33_1d93 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l213_c33_1d93_x,
CONST_SR_8_uxn_device_h_l213_c33_1d93_return_output);

-- ram_addr_MUX_uxn_device_h_l216_c8_05ae
ram_addr_MUX_uxn_device_h_l216_c8_05ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l216_c8_05ae_cond,
ram_addr_MUX_uxn_device_h_l216_c8_05ae_iftrue,
ram_addr_MUX_uxn_device_h_l216_c8_05ae_iffalse,
ram_addr_MUX_uxn_device_h_l216_c8_05ae_return_output);

-- BIN_OP_OR_uxn_device_h_l217_c4_0acb
BIN_OP_OR_uxn_device_h_l217_c4_0acb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l217_c4_0acb_left,
BIN_OP_OR_uxn_device_h_l217_c4_0acb_right,
BIN_OP_OR_uxn_device_h_l217_c4_0acb_return_output);

-- BIN_OP_EQ_uxn_device_h_l220_c11_9634
BIN_OP_EQ_uxn_device_h_l220_c11_9634 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l220_c11_9634_left,
BIN_OP_EQ_uxn_device_h_l220_c11_9634_right,
BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_return_output);

-- result_MUX_uxn_device_h_l220_c7_20c2
result_MUX_uxn_device_h_l220_c7_20c2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l220_c7_20c2_cond,
result_MUX_uxn_device_h_l220_c7_20c2_iftrue,
result_MUX_uxn_device_h_l220_c7_20c2_iffalse,
result_MUX_uxn_device_h_l220_c7_20c2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc
result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_cond,
result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_return_output);

-- result_u8_value_MUX_uxn_device_h_l221_c3_fcfc
result_u8_value_MUX_uxn_device_h_l221_c3_fcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_cond,
result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iftrue,
result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iffalse,
result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_cond,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_return_output);

-- BIN_OP_AND_uxn_device_h_l222_c9_aac5
BIN_OP_AND_uxn_device_h_l222_c9_aac5 : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l222_c9_aac5_left,
BIN_OP_AND_uxn_device_h_l222_c9_aac5_right,
BIN_OP_AND_uxn_device_h_l222_c9_aac5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d
result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_cond,
result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_return_output);

-- result_u8_value_MUX_uxn_device_h_l222_c4_6d4d
result_u8_value_MUX_uxn_device_h_l222_c4_6d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_cond,
result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iftrue,
result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iffalse,
result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_return_output);

-- result_MUX_uxn_device_h_l230_c3_b016
result_MUX_uxn_device_h_l230_c3_b016 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l230_c3_b016_cond,
result_MUX_uxn_device_h_l230_c3_b016_iftrue,
result_MUX_uxn_device_h_l230_c3_b016_iffalse,
result_MUX_uxn_device_h_l230_c3_b016_return_output);

-- BIN_OP_MINUS_uxn_device_h_l231_c58_1784
BIN_OP_MINUS_uxn_device_h_l231_c58_1784 : entity work.BIN_OP_MINUS_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l231_c58_1784_left,
BIN_OP_MINUS_uxn_device_h_l231_c58_1784_right,
BIN_OP_MINUS_uxn_device_h_l231_c58_1784_return_output);

-- screen_blit_uxn_device_h_l231_c46_6df4
screen_blit_uxn_device_h_l231_c46_6df4 : entity work.screen_blit_0CLK_b1675d32 port map (
clk,
screen_blit_uxn_device_h_l231_c46_6df4_CLOCK_ENABLE,
screen_blit_uxn_device_h_l231_c46_6df4_phase,
screen_blit_uxn_device_h_l231_c46_6df4_ctrl,
screen_blit_uxn_device_h_l231_c46_6df4_auto_advance,
screen_blit_uxn_device_h_l231_c46_6df4_x,
screen_blit_uxn_device_h_l231_c46_6df4_y,
screen_blit_uxn_device_h_l231_c46_6df4_ram_addr,
screen_blit_uxn_device_h_l231_c46_6df4_previous_ram_read,
screen_blit_uxn_device_h_l231_c46_6df4_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_x,
CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output);

-- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_x,
CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output);



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
 BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_return_output,
 ctrl_MUX_uxn_device_h_l95_c2_050f_return_output,
 ram_addr_MUX_uxn_device_h_l95_c2_050f_return_output,
 x_MUX_uxn_device_h_l95_c2_050f_return_output,
 flip_x_MUX_uxn_device_h_l95_c2_050f_return_output,
 ctrl_mode_MUX_uxn_device_h_l95_c2_050f_return_output,
 result_MUX_uxn_device_h_l95_c2_050f_return_output,
 color_MUX_uxn_device_h_l95_c2_050f_return_output,
 y_MUX_uxn_device_h_l95_c2_050f_return_output,
 layer_MUX_uxn_device_h_l95_c2_050f_return_output,
 is_pixel_port_MUX_uxn_device_h_l95_c2_050f_return_output,
 is_drawing_port_MUX_uxn_device_h_l95_c2_050f_return_output,
 vram_addr_MUX_uxn_device_h_l95_c2_050f_return_output,
 is_sprite_port_MUX_uxn_device_h_l95_c2_050f_return_output,
 auto_advance_MUX_uxn_device_h_l95_c2_050f_return_output,
 flip_y_MUX_uxn_device_h_l95_c2_050f_return_output,
 BIN_OP_EQ_uxn_device_h_l96_c19_cf98_return_output,
 MUX_uxn_device_h_l96_c19_5f4b_return_output,
 BIN_OP_EQ_uxn_device_h_l97_c20_cd85_return_output,
 MUX_uxn_device_h_l97_c20_de49_return_output,
 BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_return_output,
 MUX_uxn_device_h_l103_c32_1487_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_return_output,
 ctrl_MUX_uxn_device_h_l109_c7_039c_return_output,
 ram_addr_MUX_uxn_device_h_l109_c7_039c_return_output,
 x_MUX_uxn_device_h_l109_c7_039c_return_output,
 flip_x_MUX_uxn_device_h_l109_c7_039c_return_output,
 ctrl_mode_MUX_uxn_device_h_l109_c7_039c_return_output,
 result_MUX_uxn_device_h_l109_c7_039c_return_output,
 color_MUX_uxn_device_h_l109_c7_039c_return_output,
 y_MUX_uxn_device_h_l109_c7_039c_return_output,
 layer_MUX_uxn_device_h_l109_c7_039c_return_output,
 vram_addr_MUX_uxn_device_h_l109_c7_039c_return_output,
 auto_advance_MUX_uxn_device_h_l109_c7_039c_return_output,
 flip_y_MUX_uxn_device_h_l109_c7_039c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_return_output,
 ctrl_MUX_uxn_device_h_l114_c7_7218_return_output,
 ram_addr_MUX_uxn_device_h_l114_c7_7218_return_output,
 x_MUX_uxn_device_h_l114_c7_7218_return_output,
 flip_x_MUX_uxn_device_h_l114_c7_7218_return_output,
 ctrl_mode_MUX_uxn_device_h_l114_c7_7218_return_output,
 result_MUX_uxn_device_h_l114_c7_7218_return_output,
 color_MUX_uxn_device_h_l114_c7_7218_return_output,
 y_MUX_uxn_device_h_l114_c7_7218_return_output,
 layer_MUX_uxn_device_h_l114_c7_7218_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_7218_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_7218_return_output,
 flip_y_MUX_uxn_device_h_l114_c7_7218_return_output,
 ctrl_MUX_uxn_device_h_l115_c3_0815_return_output,
 flip_x_MUX_uxn_device_h_l115_c3_0815_return_output,
 ctrl_mode_MUX_uxn_device_h_l115_c3_0815_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_return_output,
 color_MUX_uxn_device_h_l115_c3_0815_return_output,
 layer_MUX_uxn_device_h_l115_c3_0815_return_output,
 flip_y_MUX_uxn_device_h_l115_c3_0815_return_output,
 CONST_SR_7_uxn_device_h_l118_c26_0c15_return_output,
 CONST_SR_6_uxn_device_h_l119_c22_f592_return_output,
 CONST_SR_5_uxn_device_h_l120_c23_f84b_return_output,
 CONST_SR_4_uxn_device_h_l121_c23_c198_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_return_output,
 ram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output,
 x_MUX_uxn_device_h_l125_c7_cc40_return_output,
 result_MUX_uxn_device_h_l125_c7_cc40_return_output,
 y_MUX_uxn_device_h_l125_c7_cc40_return_output,
 vram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_cc40_return_output,
 x_MUX_uxn_device_h_l126_c3_de80_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_return_output,
 ram_addr_MUX_uxn_device_h_l132_c7_0215_return_output,
 x_MUX_uxn_device_h_l132_c7_0215_return_output,
 result_MUX_uxn_device_h_l132_c7_0215_return_output,
 y_MUX_uxn_device_h_l132_c7_0215_return_output,
 vram_addr_MUX_uxn_device_h_l132_c7_0215_return_output,
 auto_advance_MUX_uxn_device_h_l132_c7_0215_return_output,
 x_MUX_uxn_device_h_l133_c3_bd75_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_return_output,
 BIN_OP_OR_uxn_device_h_l134_c4_b2ea_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_return_output,
 ram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output,
 x_MUX_uxn_device_h_l138_c7_cdc0_return_output,
 result_MUX_uxn_device_h_l138_c7_cdc0_return_output,
 y_MUX_uxn_device_h_l138_c7_cdc0_return_output,
 vram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output,
 auto_advance_MUX_uxn_device_h_l138_c7_cdc0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_return_output,
 y_MUX_uxn_device_h_l139_c3_d215_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_return_output,
 ram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output,
 x_MUX_uxn_device_h_l145_c7_c12c_return_output,
 result_MUX_uxn_device_h_l145_c7_c12c_return_output,
 y_MUX_uxn_device_h_l145_c7_c12c_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_c12c_return_output,
 y_MUX_uxn_device_h_l146_c3_1bac_return_output,
 BIN_OP_OR_uxn_device_h_l147_c4_a6bd_return_output,
 BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_return_output,
 ram_addr_MUX_uxn_device_h_l150_c7_bada_return_output,
 x_MUX_uxn_device_h_l150_c7_bada_return_output,
 result_MUX_uxn_device_h_l150_c7_bada_return_output,
 vram_addr_MUX_uxn_device_h_l150_c7_bada_return_output,
 auto_advance_MUX_uxn_device_h_l150_c7_bada_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c3_7e95_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_return_output,
 result_u8_value_MUX_uxn_device_h_l151_c3_7e95_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_return_output,
 vram_addr_MUX_uxn_device_h_l151_c3_7e95_return_output,
 auto_advance_MUX_uxn_device_h_l151_c3_7e95_return_output,
 BIN_OP_AND_uxn_device_h_l154_c32_4a75_return_output,
 result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_return_output,
 result_vram_address_MUX_uxn_device_h_l156_c4_bf44_return_output,
 vram_addr_MUX_uxn_device_h_l156_c4_bf44_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_return_output,
 BIN_OP_PLUS_uxn_device_h_l157_c18_7783_return_output,
 BIN_OP_AND_uxn_device_h_l158_c5_f54b_return_output,
 MUX_uxn_device_h_l159_c19_4915_return_output,
 BIN_OP_OR_uxn_device_h_l159_c5_2fd0_return_output,
 MUX_uxn_device_h_l160_c19_a62c_return_output,
 BIN_OP_OR_uxn_device_h_l160_c5_ec4d_return_output,
 BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_return_output,
 BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_return_output,
 auto_advance_MUX_uxn_device_h_l169_c8_48e8_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_return_output,
 ram_addr_MUX_uxn_device_h_l174_c7_429f_return_output,
 x_MUX_uxn_device_h_l174_c7_429f_return_output,
 result_MUX_uxn_device_h_l174_c7_429f_return_output,
 x_MUX_uxn_device_h_l175_c3_b4e7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output,
 result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output,
 result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output,
 UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output,
 x_MUX_uxn_device_h_l180_c4_7c84_return_output,
 result_u8_value_MUX_uxn_device_h_l180_c4_7c84_return_output,
 result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_return_output,
 result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_return_output,
 BIN_OP_AND_uxn_device_h_l181_c9_07fc_return_output,
 x_MUX_uxn_device_h_l181_c5_5b0e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_return_output,
 result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_return_output,
 BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_return_output,
 CONST_SR_8_uxn_device_h_l185_c34_5d31_return_output,
 result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_return_output,
 ram_addr_MUX_uxn_device_h_l195_c7_52b0_return_output,
 result_MUX_uxn_device_h_l195_c7_52b0_return_output,
 ram_addr_MUX_uxn_device_h_l196_c3_5b74_return_output,
 result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_return_output,
 result_u8_value_MUX_uxn_device_h_l196_c3_5b74_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_return_output,
 BIN_OP_AND_uxn_device_h_l197_c8_ecd5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_return_output,
 result_u8_value_MUX_uxn_device_h_l197_c4_5367_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_return_output,
 ram_addr_MUX_uxn_device_h_l203_c8_035f_return_output,
 BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_return_output,
 ram_addr_MUX_uxn_device_h_l208_c7_8bbf_return_output,
 result_MUX_uxn_device_h_l208_c7_8bbf_return_output,
 ram_addr_MUX_uxn_device_h_l209_c3_c9c2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_return_output,
 result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_return_output,
 BIN_OP_AND_uxn_device_h_l210_c9_e745_return_output,
 result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_return_output,
 result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_return_output,
 CONST_SR_8_uxn_device_h_l213_c33_1d93_return_output,
 ram_addr_MUX_uxn_device_h_l216_c8_05ae_return_output,
 BIN_OP_OR_uxn_device_h_l217_c4_0acb_return_output,
 BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_return_output,
 result_MUX_uxn_device_h_l220_c7_20c2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_return_output,
 result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_return_output,
 BIN_OP_AND_uxn_device_h_l222_c9_aac5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_return_output,
 result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_return_output,
 result_MUX_uxn_device_h_l230_c3_b016_return_output,
 BIN_OP_MINUS_uxn_device_h_l231_c58_1784_return_output,
 screen_blit_uxn_device_h_l231_c46_6df4_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output,
 CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c2_050f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l95_c2_050f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_050f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_039c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_050f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l101_c3_4843 : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_5f4b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_5f4b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_5f4b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_5f4b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_de49_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_de49_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_de49_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_de49_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_1487_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_1487_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_1487_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l103_c32_1487_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l109_c7_039c_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_039c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_039c_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_7218_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_406d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l114_c7_7218_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_7218_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_7218_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_cc40_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l122_c4_d125 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_13f9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_0c15_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l118_c26_0c15_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_becc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_f592_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l119_c22_f592_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_cf56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_f84b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l120_c23_f84b_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_0d1e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_c198_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l121_c23_c198_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_519d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_de80_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l125_c7_cc40_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_cc40_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_cc40_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_0215_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_de80_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_de80_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l126_c3_de80_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_c46e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_bd75_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l132_c7_0215_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_0215_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_0215_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_cdc0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_bd75_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_bd75_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l133_c3_bd75_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l135_c4_2ff7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l138_c7_cdc0_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_cdc0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_cdc0_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_c12c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_d215_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l142_c4_b92a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_d215_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_d215_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c3_d215_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l145_c7_c12c_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_c12c_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_bada_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_1bac_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_1bac_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_1bac_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l146_c3_1bac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_429f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l150_c7_bada_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ad0b_uxn_device_h_l150_c7_bada_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_bada_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_429f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_7e95_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l153_c4_cddb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_7c1f_return_output : unsigned(7 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l165_c5_b3dc : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l157_c5_d81c : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4915_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4915_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4915_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l159_c19_4915_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_a62c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_a62c_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_a62c_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l160_c19_a62c_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_return_output : unsigned(64 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l171_c4_427a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_429f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_429f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c7_429f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2d2f_uxn_device_h_l174_c7_429f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_429f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_52b0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_429f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l178_c4_f95b : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l179_c4_1dc7 : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l181_c5_5b0e_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l182_c6_46fd : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l184_c6_82bc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_5d31_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l185_c34_5d31_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_8fbf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l192_c4_b4ba : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l195_c7_52b0_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l195_c7_52b0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_52b0_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_8bbf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_52b0_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l197_c4_5367_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l199_c5_073d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_298b_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l208_c7_8bbf_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l208_c7_8bbf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_8bbf_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_20c2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l208_c7_8bbf_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c4_dcd4_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l212_c5_39c8 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_1d93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l213_c33_1d93_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_5baa_return_output : unsigned(7 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l220_c7_20c2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l220_c7_20c2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_20c2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_b016_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l220_c7_20c2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l222_c4_6d4d_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l224_c5_ae70 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_ca87_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l230_c3_b016_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_b016_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_b016_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_b016_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l230_c3_b016_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l233_c4_84bb : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_21c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_edec_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_8cda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_36bd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_ccd5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_8442_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l242_c4_6f21 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l127_l140_l204_l217_l147_l134_DUPLICATE_c16e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_4b5f_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_5756_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_c6f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_d2a7_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be3a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_x : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output : unsigned(7 downto 0);
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
     VAR_result_device_ram_address_uxn_device_h_l111_c4_406d := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_406d;
     VAR_result_vram_address_uxn_device_h_l178_c4_f95b := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue := VAR_result_vram_address_uxn_device_h_l178_c4_f95b;
     VAR_MUX_uxn_device_h_l159_c19_4915_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l242_c4_6f21 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_right := to_unsigned(8, 4);
     VAR_result_device_ram_address_uxn_device_h_l224_c5_ae70 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iftrue := VAR_result_device_ram_address_uxn_device_h_l224_c5_ae70;
     VAR_result_device_ram_address_uxn_device_h_l199_c5_073d := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iftrue := VAR_result_device_ram_address_uxn_device_h_l199_c5_073d;
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l96_c19_5f4b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l153_c4_cddb := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue := VAR_result_device_ram_address_uxn_device_h_l153_c4_cddb;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l171_c4_427a := resize(to_unsigned(44, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iftrue := VAR_result_device_ram_address_uxn_device_h_l171_c4_427a;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_right := unsigned'(X"f0000000");
     VAR_result_device_ram_address_uxn_device_h_l129_c4_c46e := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_c46e;
     VAR_MUX_uxn_device_h_l160_c19_a62c_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l160_c19_a62c_iftrue := to_unsigned(2097152, 22);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l233_c4_84bb := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_right := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_right := to_unsigned(400, 32);
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l212_c5_39c8 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iftrue := VAR_result_device_ram_address_uxn_device_h_l212_c5_39c8;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_right := to_unsigned(3, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l122_c4_d125 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iftrue := VAR_result_device_ram_address_uxn_device_h_l122_c4_d125;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l97_c20_de49_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue := to_unsigned(0, 1);
     VAR_result_u8_value_uxn_device_h_l179_c4_1dc7 := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_1dc7;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iffalse := VAR_result_u8_value_uxn_device_h_l179_c4_1dc7;
     VAR_result_device_ram_address_uxn_device_h_l184_c6_82bc := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iftrue := VAR_result_device_ram_address_uxn_device_h_l184_c6_82bc;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l192_c4_b4ba := resize(to_unsigned(45, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iftrue := VAR_result_device_ram_address_uxn_device_h_l192_c4_b4ba;
     VAR_MUX_uxn_device_h_l103_c32_1487_iftrue := resize(to_unsigned(46, 6), 8);
     VAR_vram_addr_uxn_device_h_l101_c3_4843 := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue := VAR_vram_addr_uxn_device_h_l101_c3_4843;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_right := to_unsigned(400, 32);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l103_c32_1487_iffalse := resize(to_unsigned(47, 6), 8);
     VAR_MUX_uxn_device_h_l97_c20_de49_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l159_c19_4915_iftrue := to_unsigned(1048576, 21);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_right := to_unsigned(262143, 18);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l96_c19_5f4b_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l142_c4_b92a := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iftrue := VAR_result_device_ram_address_uxn_device_h_l142_c4_b92a;
     VAR_result_device_ram_address_uxn_device_h_l135_c4_2ff7 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iftrue := VAR_result_device_ram_address_uxn_device_h_l135_c4_2ff7;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_left := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_left := auto_advance;
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_left := color;
     VAR_color_MUX_uxn_device_h_l109_c7_039c_iftrue := color;
     VAR_color_MUX_uxn_device_h_l114_c7_7218_iffalse := color;
     VAR_color_MUX_uxn_device_h_l115_c3_0815_iffalse := color;
     VAR_color_MUX_uxn_device_h_l95_c2_050f_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_ctrl := ctrl;
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_expr := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iftrue := ctrl_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_cond := ctrl_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_cond := ctrl_mode;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l160_c19_a62c_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l159_c19_4915_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_iftrue := flip_y;
     VAR_color_MUX_uxn_device_h_l115_c3_0815_cond := is_drawing_port;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_cond := is_drawing_port;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_cond := is_drawing_port;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_cond := is_drawing_port;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_cond := is_drawing_port;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iffalse := is_drawing_port;
     VAR_layer_MUX_uxn_device_h_l115_c3_0815_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_cond := is_drawing_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l126_c3_de80_cond := is_drawing_port;
     VAR_x_MUX_uxn_device_h_l133_c3_bd75_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l139_c3_d215_cond := is_drawing_port;
     VAR_y_MUX_uxn_device_h_l146_c3_1bac_cond := is_drawing_port;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iffalse := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_cond := is_pixel_port;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_cond := is_pixel_port;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l175_c3_b4e7_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_cond := is_sprite_port;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iffalse := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_cond := is_sprite_port;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_cond := is_sprite_port;
     VAR_result_MUX_uxn_device_h_l230_c3_b016_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_cond := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_cond := is_sprite_port;
     VAR_layer_MUX_uxn_device_h_l109_c7_039c_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l114_c7_7218_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l115_c3_0815_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l95_c2_050f_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l121_c23_c198_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l120_c23_f84b_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l119_c22_f592_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l118_c26_0c15_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_iftrue := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_iftrue := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_ram_addr := ram_addr;
     VAR_result_MUX_uxn_device_h_l145_c7_c12c_iftrue := result;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_iffalse := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_left := x;
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_x := x;
     VAR_x_MUX_uxn_device_h_l109_c7_039c_iftrue := x;
     VAR_x_MUX_uxn_device_h_l114_c7_7218_iftrue := x;
     VAR_x_MUX_uxn_device_h_l126_c3_de80_iffalse := x;
     VAR_x_MUX_uxn_device_h_l133_c3_bd75_iffalse := x;
     VAR_x_MUX_uxn_device_h_l138_c7_cdc0_iftrue := x;
     VAR_x_MUX_uxn_device_h_l145_c7_c12c_iftrue := x;
     VAR_x_MUX_uxn_device_h_l150_c7_bada_iftrue := x;
     VAR_x_MUX_uxn_device_h_l174_c7_429f_iffalse := x;
     VAR_x_MUX_uxn_device_h_l175_c3_b4e7_iffalse := x;
     VAR_x_MUX_uxn_device_h_l180_c4_7c84_iffalse := x;
     VAR_x_MUX_uxn_device_h_l181_c5_5b0e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l95_c2_050f_iftrue := x;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_left := y;
     VAR_CONST_SR_8_uxn_device_h_l213_c33_1d93_x := y;
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_y := y;
     VAR_y_MUX_uxn_device_h_l109_c7_039c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_7218_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_cc40_iftrue := y;
     VAR_y_MUX_uxn_device_h_l132_c7_0215_iftrue := y;
     VAR_y_MUX_uxn_device_h_l139_c3_d215_iffalse := y;
     VAR_y_MUX_uxn_device_h_l145_c7_c12c_iffalse := y;
     VAR_y_MUX_uxn_device_h_l146_c3_1bac_iffalse := y;
     VAR_y_MUX_uxn_device_h_l95_c2_050f_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l220_c11_9634] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l220_c11_9634_left <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_left;
     BIN_OP_EQ_uxn_device_h_l220_c11_9634_right <= VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output := BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output := result.u8_value;

     -- MUX[uxn_device_h_l159_c19_4915] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l159_c19_4915_cond <= VAR_MUX_uxn_device_h_l159_c19_4915_cond;
     MUX_uxn_device_h_l159_c19_4915_iftrue <= VAR_MUX_uxn_device_h_l159_c19_4915_iftrue;
     MUX_uxn_device_h_l159_c19_4915_iffalse <= VAR_MUX_uxn_device_h_l159_c19_4915_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l159_c19_4915_return_output := MUX_uxn_device_h_l159_c19_4915_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l150_c11_b6a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_left <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_left;
     BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_right <= VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output := BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be3a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be3a_return_output := result.is_deo_done;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_4b5f LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_4b5f_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l95_c6_c8c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_left;
     BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output := BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l200_c23_298b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_298b_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l138_c11_f0b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_left;
     BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output := BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c11_bf79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c11_bf79_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_left;
     BIN_OP_EQ_uxn_device_h_l109_c11_bf79_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output := BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;

     -- CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f LATENCY=0
     -- Inputs
     CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_x <= VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_x;
     -- Outputs
     VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output := CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output;

     -- BIN_OP_AND[uxn_device_h_l154_c32_4a75] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l154_c32_4a75_left <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_left;
     BIN_OP_AND_uxn_device_h_l154_c32_4a75_right <= VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_return_output := BIN_OP_AND_uxn_device_h_l154_c32_4a75_return_output;

     -- auto_advance_MUX[uxn_device_h_l169_c8_48e8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c8_48e8_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_cond;
     auto_advance_MUX_uxn_device_h_l169_c8_48e8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c8_48e8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_return_output := auto_advance_MUX_uxn_device_h_l169_c8_48e8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c11_c7ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_left;
     BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output := BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output;

     -- BIN_OP_EQ[uxn_device_h_l97_c20_cd85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l97_c20_cd85_left <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_left;
     BIN_OP_EQ_uxn_device_h_l97_c20_cd85_right <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_return_output := BIN_OP_EQ_uxn_device_h_l97_c20_cd85_return_output;

     -- CONST_SR_5[uxn_device_h_l120_c23_f84b] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l120_c23_f84b_x <= VAR_CONST_SR_5_uxn_device_h_l120_c23_f84b_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l120_c23_f84b_return_output := CONST_SR_5_uxn_device_h_l120_c23_f84b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l96_c19_cf98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l96_c19_cf98_left <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_left;
     BIN_OP_EQ_uxn_device_h_l96_c19_cf98_right <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_return_output := BIN_OP_EQ_uxn_device_h_l96_c19_cf98_return_output;

     -- CONST_SR_7[uxn_device_h_l118_c26_0c15] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l118_c26_0c15_x <= VAR_CONST_SR_7_uxn_device_h_l118_c26_0c15_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l118_c26_0c15_return_output := CONST_SR_7_uxn_device_h_l118_c26_0c15_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c11_3883] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_3883_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_3883_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;

     -- MUX[uxn_device_h_l160_c19_a62c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l160_c19_a62c_cond <= VAR_MUX_uxn_device_h_l160_c19_a62c_cond;
     MUX_uxn_device_h_l160_c19_a62c_iftrue <= VAR_MUX_uxn_device_h_l160_c19_a62c_iftrue;
     MUX_uxn_device_h_l160_c19_a62c_iffalse <= VAR_MUX_uxn_device_h_l160_c19_a62c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l160_c19_a62c_return_output := MUX_uxn_device_h_l160_c19_a62c_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_d2a7 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_d2a7_return_output := result.vram_address;

     -- result_is_vram_write_MUX[uxn_device_h_l156_c4_bf44] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_cond;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_return_output := result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l225_c23_ca87] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_ca87_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_device_h_l151_c3_7e95] LATENCY=0
     VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_7e95_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_5fc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321[uxn_device_h_l230_c3_b016] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_b016_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d321(
     result,
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l242_c4_6f21,
     to_unsigned(1, 1));

     -- UNARY_OP_NOT[uxn_device_h_l180_c9_fef4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output := UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output;

     -- CONST_SR_4[uxn_device_h_l121_c23_c198] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l121_c23_c198_x <= VAR_CONST_SR_4_uxn_device_h_l121_c23_c198_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l121_c23_c198_return_output := CONST_SR_4_uxn_device_h_l121_c23_c198_return_output;

     -- BIN_OP_AND[uxn_device_h_l197_c8_ecd5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l197_c8_ecd5_left <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_left;
     BIN_OP_AND_uxn_device_h_l197_c8_ecd5_right <= VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_return_output := BIN_OP_AND_uxn_device_h_l197_c8_ecd5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l208_c11_3cf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_left <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_left;
     BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_right <= VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output := BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l231_c58_1784] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l231_c58_1784_left <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_left;
     BIN_OP_MINUS_uxn_device_h_l231_c58_1784_right <= VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_return_output := BIN_OP_MINUS_uxn_device_h_l231_c58_1784_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_5756 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_5756_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- CAST_TO_uint4_t[uxn_device_h_l117_c12_13f9] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_13f9_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l127_l140_l204_l217_l147_l134_DUPLICATE_c16e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l127_l140_l204_l217_l147_l134_DUPLICATE_c16e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_c6f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_c6f0_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_4a14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_4a14_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_4a14_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;

     -- CONST_SR_8[uxn_device_h_l213_c33_1d93] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l213_c33_1d93_x <= VAR_CONST_SR_8_uxn_device_h_l213_c33_1d93_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l213_c33_1d93_return_output := CONST_SR_8_uxn_device_h_l213_c33_1d93_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l182_c6_9e1b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_left;
     BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_return_output := BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l132_c11_2a2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_left;
     BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output := BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;

     -- BIN_OP_AND[uxn_device_h_l181_c9_07fc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l181_c9_07fc_left <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_left;
     BIN_OP_AND_uxn_device_h_l181_c9_07fc_right <= VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_return_output := BIN_OP_AND_uxn_device_h_l181_c9_07fc_return_output;

     -- ctrl_MUX[uxn_device_h_l115_c3_0815] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l115_c3_0815_cond <= VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_cond;
     ctrl_MUX_uxn_device_h_l115_c3_0815_iftrue <= VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_iftrue;
     ctrl_MUX_uxn_device_h_l115_c3_0815_iffalse <= VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_return_output := ctrl_MUX_uxn_device_h_l115_c3_0815_return_output;

     -- CONST_SR_6[uxn_device_h_l119_c22_f592] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l119_c22_f592_x <= VAR_CONST_SR_6_uxn_device_h_l119_c22_f592_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l119_c22_f592_return_output := CONST_SR_6_uxn_device_h_l119_c22_f592_return_output;

     -- BIN_OP_EQ[uxn_device_h_l195_c11_97a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c11_97a2_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_left;
     BIN_OP_EQ_uxn_device_h_l195_c11_97a2_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output := BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_device_h_l181_c5_5b0e_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l181_c9_07fc_return_output, 1);
     VAR_MUX_uxn_device_h_l197_c4_5367_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l197_c8_ecd5_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c11_bf79_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_7218_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_4a14_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_cc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_3883_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_0215_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_0215_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_0215_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_2a2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_cdc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_cdc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_cdc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c11_f0b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;
     VAR_result_MUX_uxn_device_h_l145_c7_c12c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_c12c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_c12c_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_5fc2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_bada_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_bada_cond := VAR_BIN_OP_EQ_uxn_device_h_l150_c11_b6a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_429f_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_429f_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_c7ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_52b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_97a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_8bbf_cond := VAR_BIN_OP_EQ_uxn_device_h_l208_c11_3cf0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_20c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l220_c11_9634_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_050f_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_c8c0_return_output;
     VAR_MUX_uxn_device_h_l96_c19_5f4b_cond := VAR_BIN_OP_EQ_uxn_device_h_l96_c19_cf98_return_output;
     VAR_MUX_uxn_device_h_l97_c20_de49_cond := VAR_BIN_OP_EQ_uxn_device_h_l97_c20_cd85_return_output;
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_phase := VAR_BIN_OP_MINUS_uxn_device_h_l231_c58_1784_return_output;
     VAR_x_uxn_device_h_l182_c6_46fd := resize(VAR_BIN_OP_PLUS_uxn_device_h_l182_c6_9e1b_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l127_l140_l204_l217_l147_l134_DUPLICATE_c16e_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l127_l140_l204_l217_l147_l134_DUPLICATE_c16e_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l127_l140_l204_l217_l147_l134_DUPLICATE_c16e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l127_l140_l204_l217_l147_l134_DUPLICATE_c16e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_4b5f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_4b5f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_5756_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l157_l165_DUPLICATE_5756_return_output;
     VAR_color_MUX_uxn_device_h_l115_c3_0815_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l117_c12_13f9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l200_c23_298b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l225_c23_ca87_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be3a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l180_l175_DUPLICATE_be3a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l209_l210_l222_l181_l221_l175_l197_l196_l180_DUPLICATE_cb89_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_c6f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l151_l175_DUPLICATE_c6f0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_d2a7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l151_l175_DUPLICATE_d2a7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l209_l210_l110_l133_l115_l181_l222_l191_l102_l221_l197_l196_l180_l139_l126_l169_DUPLICATE_96a2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l151_l209_l210_l222_l221_l175_l197_l196_DUPLICATE_30d2_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_left := VAR_CONST_SR_1_uint8_t_uxn_device_h_l210_l222_DUPLICATE_ec3f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_right := VAR_MUX_uxn_device_h_l159_c19_4915_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_right := VAR_MUX_uxn_device_h_l160_c19_a62c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_7c84_cond := VAR_UNARY_OP_NOT_uxn_device_h_l180_c9_fef4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c8_48e8_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_iftrue := VAR_ctrl_MUX_uxn_device_h_l115_c3_0815_return_output;
     VAR_result_MUX_uxn_device_h_l230_c3_b016_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d321_uxn_device_h_l230_c3_b016_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l156_c4_bf44_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iffalse := VAR_result_vram_write_layer_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l151_c3_7e95_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_cond := VAR_MUX_uxn_device_h_l181_c5_5b0e_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_cond := VAR_MUX_uxn_device_h_l181_c5_5b0e_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_cond := VAR_MUX_uxn_device_h_l181_c5_5b0e_interm_cond;
     VAR_x_MUX_uxn_device_h_l181_c5_5b0e_cond := VAR_MUX_uxn_device_h_l181_c5_5b0e_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_cond := VAR_MUX_uxn_device_h_l197_c4_5367_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_cond := VAR_MUX_uxn_device_h_l197_c4_5367_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_cond := VAR_MUX_uxn_device_h_l197_c4_5367_interm_cond;
     VAR_CONST_SR_8_uxn_device_h_l185_c34_5d31_x := VAR_x_uxn_device_h_l182_c6_46fd;
     VAR_x_MUX_uxn_device_h_l181_c5_5b0e_iftrue := VAR_x_uxn_device_h_l182_c6_46fd;
     -- BIN_OP_OR[uxn_device_h_l147_c4_a6bd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l147_c4_a6bd_left <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_left;
     BIN_OP_OR_uxn_device_h_l147_c4_a6bd_right <= VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_return_output := BIN_OP_OR_uxn_device_h_l147_c4_a6bd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l181_c5_5b0e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_cond;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_return_output := result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l139_c3_d215] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_cond;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_return_output := result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l165_c28_d93f] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l175_c3_b4e7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_cond;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output := result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output;

     -- ctrl_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_cond;
     ctrl_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_iftrue;
     ctrl_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_return_output := ctrl_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l169_c8_48e8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l181_c5_5b0e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_return_output;

     -- x_MUX[uxn_device_h_l181_c5_5b0e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c5_5b0e_cond <= VAR_x_MUX_uxn_device_h_l181_c5_5b0e_cond;
     x_MUX_uxn_device_h_l181_c5_5b0e_iftrue <= VAR_x_MUX_uxn_device_h_l181_c5_5b0e_iftrue;
     x_MUX_uxn_device_h_l181_c5_5b0e_iffalse <= VAR_x_MUX_uxn_device_h_l181_c5_5b0e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c5_5b0e_return_output := x_MUX_uxn_device_h_l181_c5_5b0e_return_output;

     -- color_MUX[uxn_device_h_l115_c3_0815] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l115_c3_0815_cond <= VAR_color_MUX_uxn_device_h_l115_c3_0815_cond;
     color_MUX_uxn_device_h_l115_c3_0815_iftrue <= VAR_color_MUX_uxn_device_h_l115_c3_0815_iftrue;
     color_MUX_uxn_device_h_l115_c3_0815_iffalse <= VAR_color_MUX_uxn_device_h_l115_c3_0815_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l115_c3_0815_return_output := color_MUX_uxn_device_h_l115_c3_0815_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c3_bd75] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l119_c12_cf56] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_cf56_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l119_c22_f592_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_de80] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l180_c4_7c84] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_cond;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_return_output := result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l213_c23_5baa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_5baa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l213_c33_1d93_return_output);

     -- result_vram_write_layer_MUX[uxn_device_h_l151_c3_7e95] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_cond;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_return_output := result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_return_output;

     -- BIN_OP_AND[uxn_device_h_l222_c9_aac5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l222_c9_aac5_left <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_left;
     BIN_OP_AND_uxn_device_h_l222_c9_aac5_right <= VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_return_output := BIN_OP_AND_uxn_device_h_l222_c9_aac5_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output := CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c3_7e95] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c3_7e95_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_cond;
     auto_advance_MUX_uxn_device_h_l151_c3_7e95_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c3_7e95_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_return_output := auto_advance_MUX_uxn_device_h_l151_c3_7e95_return_output;

     -- MUX[uxn_device_h_l97_c20_de49] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l97_c20_de49_cond <= VAR_MUX_uxn_device_h_l97_c20_de49_cond;
     MUX_uxn_device_h_l97_c20_de49_iftrue <= VAR_MUX_uxn_device_h_l97_c20_de49_iftrue;
     MUX_uxn_device_h_l97_c20_de49_iffalse <= VAR_MUX_uxn_device_h_l97_c20_de49_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l97_c20_de49_return_output := MUX_uxn_device_h_l97_c20_de49_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c3_7e95] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_return_output;

     -- result_u8_value_MUX[uxn_device_h_l197_c4_5367] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l197_c4_5367_cond <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_cond;
     result_u8_value_MUX_uxn_device_h_l197_c4_5367_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_iftrue;
     result_u8_value_MUX_uxn_device_h_l197_c4_5367_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_return_output := result_u8_value_MUX_uxn_device_h_l197_c4_5367_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l197_c4_5367] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_cond;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_return_output := result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l191_c8_c5a7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_cond;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_return_output := result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l154_c22_7c1f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_7c1f_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_BIN_OP_AND_uxn_device_h_l154_c32_4a75_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_0815] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_return_output;

     -- result_vram_address_MUX[uxn_device_h_l175_c3_b4e7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_cond;
     result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue;
     result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output := result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l120_c13_0d1e] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_0d1e_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l120_c23_f84b_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l118_c16_becc] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_becc_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l118_c26_0c15_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l121_c13_519d] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_519d_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l121_c23_c198_return_output);

     -- BIN_OP_OR[uxn_device_h_l134_c4_b2ea] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l134_c4_b2ea_left <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_left;
     BIN_OP_OR_uxn_device_h_l134_c4_b2ea_right <= VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_return_output := BIN_OP_OR_uxn_device_h_l134_c4_b2ea_return_output;

     -- BIN_OP_OR[uxn_device_h_l217_c4_0acb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l217_c4_0acb_left <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_left;
     BIN_OP_OR_uxn_device_h_l217_c4_0acb_right <= VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_return_output := BIN_OP_OR_uxn_device_h_l217_c4_0acb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l110_c3_f563] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_cond;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_return_output := result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_return_output;

     -- BIN_OP_AND[uxn_device_h_l210_c9_e745] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l210_c9_e745_left <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_left;
     BIN_OP_AND_uxn_device_h_l210_c9_e745_right <= VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_return_output := BIN_OP_AND_uxn_device_h_l210_c9_e745_return_output;

     -- CONST_SR_8[uxn_device_h_l185_c34_5d31] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l185_c34_5d31_x <= VAR_CONST_SR_8_uxn_device_h_l185_c34_5d31_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l185_c34_5d31_return_output := CONST_SR_8_uxn_device_h_l185_c34_5d31_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l157_c18_6471] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- MUX[uxn_device_h_l96_c19_5f4b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c19_5f4b_cond <= VAR_MUX_uxn_device_h_l96_c19_5f4b_cond;
     MUX_uxn_device_h_l96_c19_5f4b_iftrue <= VAR_MUX_uxn_device_h_l96_c19_5f4b_iftrue;
     MUX_uxn_device_h_l96_c19_5f4b_iffalse <= VAR_MUX_uxn_device_h_l96_c19_5f4b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c19_5f4b_return_output := MUX_uxn_device_h_l96_c19_5f4b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l197_c4_5367] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_return_output := result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l210_c4_dcd4_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l210_c9_e745_return_output, 1);
     VAR_MUX_uxn_device_h_l222_c4_6d4d_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l222_c9_aac5_return_output, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l157_c18_6471_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l165_c28_d93f_return_output;
     VAR_x_MUX_uxn_device_h_l133_c3_bd75_iftrue := VAR_BIN_OP_OR_uxn_device_h_l134_c4_b2ea_return_output;
     VAR_y_MUX_uxn_device_h_l146_c3_1bac_iftrue := VAR_BIN_OP_OR_uxn_device_h_l147_c4_a6bd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_iftrue := VAR_BIN_OP_OR_uxn_device_h_l217_c4_0acb_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l118_c16_becc_return_output;
     VAR_layer_MUX_uxn_device_h_l115_c3_0815_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_cf56_return_output;
     VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l120_c13_0d1e_return_output;
     VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l121_c13_519d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l154_c22_7c1f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l213_c23_5baa_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output;
     VAR_x_MUX_uxn_device_h_l126_c3_de80_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output;
     VAR_y_MUX_uxn_device_h_l139_c3_d215_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l141_l205_l128_DUPLICATE_a17c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_left := VAR_MUX_uxn_device_h_l96_c19_5f4b_return_output;
     VAR_MUX_uxn_device_h_l103_c32_1487_cond := VAR_MUX_uxn_device_h_l96_c19_5f4b_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iftrue := VAR_MUX_uxn_device_h_l96_c19_5f4b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_right := VAR_MUX_uxn_device_h_l97_c20_de49_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iftrue := VAR_MUX_uxn_device_h_l97_c20_de49_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_iftrue := VAR_auto_advance_MUX_uxn_device_h_l151_c3_7e95_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_7218_iftrue := VAR_color_MUX_uxn_device_h_l115_c3_0815_return_output;
     VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_ctrl_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c8_48e8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l181_c5_5b0e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l191_c8_c5a7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l197_c4_5367_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l180_c4_7c84_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l181_c5_5b0e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l197_c4_5367_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l197_c4_5367_return_output;
     VAR_x_MUX_uxn_device_h_l180_c4_7c84_iftrue := VAR_x_MUX_uxn_device_h_l181_c5_5b0e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_cond := VAR_MUX_uxn_device_h_l210_c4_dcd4_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_cond := VAR_MUX_uxn_device_h_l210_c4_dcd4_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_cond := VAR_MUX_uxn_device_h_l210_c4_dcd4_interm_cond;
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_cond := VAR_MUX_uxn_device_h_l222_c4_6d4d_interm_cond;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_cond := VAR_MUX_uxn_device_h_l222_c4_6d4d_interm_cond;
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_cond := VAR_MUX_uxn_device_h_l222_c4_6d4d_interm_cond;
     -- is_sprite_port_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_cond;
     is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iftrue;
     is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_return_output := is_sprite_port_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l138_c7_cdc0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_cdc0_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c3_d215_return_output);

     -- result_u8_value_MUX[uxn_device_h_l151_c3_7e95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l151_c3_7e95_cond <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_cond;
     result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iftrue;
     result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_return_output := result_u8_value_MUX_uxn_device_h_l151_c3_7e95_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l185_c24_8fbf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_8fbf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l185_c34_5d31_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l222_c4_6d4d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_cond;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_return_output := result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_return_output;

     -- y_MUX[uxn_device_h_l146_c3_1bac] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l146_c3_1bac_cond <= VAR_y_MUX_uxn_device_h_l146_c3_1bac_cond;
     y_MUX_uxn_device_h_l146_c3_1bac_iftrue <= VAR_y_MUX_uxn_device_h_l146_c3_1bac_iftrue;
     y_MUX_uxn_device_h_l146_c3_1bac_iffalse <= VAR_y_MUX_uxn_device_h_l146_c3_1bac_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l146_c3_1bac_return_output := y_MUX_uxn_device_h_l146_c3_1bac_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l196_c3_5b74] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_cond;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_return_output := result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_return_output;

     -- MUX[uxn_device_h_l103_c32_1487] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l103_c32_1487_cond <= VAR_MUX_uxn_device_h_l103_c32_1487_cond;
     MUX_uxn_device_h_l103_c32_1487_iftrue <= VAR_MUX_uxn_device_h_l103_c32_1487_iftrue;
     MUX_uxn_device_h_l103_c32_1487_iffalse <= VAR_MUX_uxn_device_h_l103_c32_1487_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l103_c32_1487_return_output := MUX_uxn_device_h_l103_c32_1487_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l132_c7_0215] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_0215_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bd75_return_output);

     -- result_u8_value_MUX[uxn_device_h_l196_c3_5b74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l196_c3_5b74_cond <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_cond;
     result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iftrue;
     result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_return_output := result_u8_value_MUX_uxn_device_h_l196_c3_5b74_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l196_c3_5b74] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_return_output := result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l109_c7_039c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_039c_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l110_c3_f563_return_output);

     -- BIN_OP_PLUS[uxn_device_h_l165_c28_bdee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_left <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_left;
     BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_right <= VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_return_output := BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_return_output;

     -- result_u8_value_MUX[uxn_device_h_l222_c4_6d4d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_cond;
     result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iftrue;
     result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_return_output := result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_return_output;

     -- ram_addr_MUX[uxn_device_h_l203_c8_035f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l203_c8_035f_cond <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_cond;
     ram_addr_MUX_uxn_device_h_l203_c8_035f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_iftrue;
     ram_addr_MUX_uxn_device_h_l203_c8_035f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_return_output := ram_addr_MUX_uxn_device_h_l203_c8_035f_return_output;

     -- layer_MUX[uxn_device_h_l115_c3_0815] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l115_c3_0815_cond <= VAR_layer_MUX_uxn_device_h_l115_c3_0815_cond;
     layer_MUX_uxn_device_h_l115_c3_0815_iftrue <= VAR_layer_MUX_uxn_device_h_l115_c3_0815_iftrue;
     layer_MUX_uxn_device_h_l115_c3_0815_iffalse <= VAR_layer_MUX_uxn_device_h_l115_c3_0815_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l115_c3_0815_return_output := layer_MUX_uxn_device_h_l115_c3_0815_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l210_c4_dcd4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_cond;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_return_output := result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_return_output;

     -- auto_advance_MUX[uxn_device_h_l150_c7_bada] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l150_c7_bada_cond <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_cond;
     auto_advance_MUX_uxn_device_h_l150_c7_bada_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_iftrue;
     auto_advance_MUX_uxn_device_h_l150_c7_bada_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_return_output := auto_advance_MUX_uxn_device_h_l150_c7_bada_return_output;

     -- color_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_color_MUX_uxn_device_h_l114_c7_7218_cond;
     color_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_color_MUX_uxn_device_h_l114_c7_7218_iftrue;
     color_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_color_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l114_c7_7218_return_output := color_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- x_MUX[uxn_device_h_l180_c4_7c84] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l180_c4_7c84_cond <= VAR_x_MUX_uxn_device_h_l180_c4_7c84_cond;
     x_MUX_uxn_device_h_l180_c4_7c84_iftrue <= VAR_x_MUX_uxn_device_h_l180_c4_7c84_iftrue;
     x_MUX_uxn_device_h_l180_c4_7c84_iffalse <= VAR_x_MUX_uxn_device_h_l180_c4_7c84_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l180_c4_7c84_return_output := x_MUX_uxn_device_h_l180_c4_7c84_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l125_c7_cc40] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_cc40_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_de80_return_output);

     -- y_MUX[uxn_device_h_l139_c3_d215] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l139_c3_d215_cond <= VAR_y_MUX_uxn_device_h_l139_c3_d215_cond;
     y_MUX_uxn_device_h_l139_c3_d215_iftrue <= VAR_y_MUX_uxn_device_h_l139_c3_d215_iftrue;
     y_MUX_uxn_device_h_l139_c3_d215_iffalse <= VAR_y_MUX_uxn_device_h_l139_c3_d215_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l139_c3_d215_return_output := y_MUX_uxn_device_h_l139_c3_d215_return_output;

     -- BIN_OP_OR[uxn_device_h_l98_c21_aa5a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c21_aa5a_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_left;
     BIN_OP_OR_uxn_device_h_l98_c21_aa5a_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output := BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c3_7e95] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l210_c4_dcd4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_return_output := result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l157_c18_7783] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l157_c18_7783_left <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_left;
     BIN_OP_PLUS_uxn_device_h_l157_c18_7783_right <= VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_return_output := BIN_OP_PLUS_uxn_device_h_l157_c18_7783_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l114_c7_7218] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_7218_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_0815_return_output);

     -- x_MUX[uxn_device_h_l133_c3_bd75] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l133_c3_bd75_cond <= VAR_x_MUX_uxn_device_h_l133_c3_bd75_cond;
     x_MUX_uxn_device_h_l133_c3_bd75_iftrue <= VAR_x_MUX_uxn_device_h_l133_c3_bd75_iftrue;
     x_MUX_uxn_device_h_l133_c3_bd75_iffalse <= VAR_x_MUX_uxn_device_h_l133_c3_bd75_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l133_c3_bd75_return_output := x_MUX_uxn_device_h_l133_c3_bd75_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_cond;
     is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iftrue;
     is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_return_output := is_pixel_port_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l175_c3_b4e7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_cond;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_return_output := result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_return_output;

     -- x_MUX[uxn_device_h_l126_c3_de80] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l126_c3_de80_cond <= VAR_x_MUX_uxn_device_h_l126_c3_de80_cond;
     x_MUX_uxn_device_h_l126_c3_de80_iftrue <= VAR_x_MUX_uxn_device_h_l126_c3_de80_iftrue;
     x_MUX_uxn_device_h_l126_c3_de80_iffalse <= VAR_x_MUX_uxn_device_h_l126_c3_de80_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l126_c3_de80_return_output := x_MUX_uxn_device_h_l126_c3_de80_return_output;

     -- flip_x_MUX[uxn_device_h_l115_c3_0815] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l115_c3_0815_cond <= VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_cond;
     flip_x_MUX_uxn_device_h_l115_c3_0815_iftrue <= VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_iftrue;
     flip_x_MUX_uxn_device_h_l115_c3_0815_iffalse <= VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_return_output := flip_x_MUX_uxn_device_h_l115_c3_0815_return_output;

     -- ctrl_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_cond;
     ctrl_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_iftrue;
     ctrl_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_return_output := ctrl_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- ram_addr_MUX[uxn_device_h_l216_c8_05ae] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l216_c8_05ae_cond <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_cond;
     ram_addr_MUX_uxn_device_h_l216_c8_05ae_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_iftrue;
     ram_addr_MUX_uxn_device_h_l216_c8_05ae_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_return_output := ram_addr_MUX_uxn_device_h_l216_c8_05ae_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l180_c4_7c84] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_return_output := result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- flip_y_MUX[uxn_device_h_l115_c3_0815] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l115_c3_0815_cond <= VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_cond;
     flip_y_MUX_uxn_device_h_l115_c3_0815_iftrue <= VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_iftrue;
     flip_y_MUX_uxn_device_h_l115_c3_0815_iffalse <= VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_return_output := flip_y_MUX_uxn_device_h_l115_c3_0815_return_output;

     -- result_u8_value_MUX[uxn_device_h_l210_c4_dcd4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_cond <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_cond;
     result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iftrue;
     result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_return_output := result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l180_c4_7c84] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_cond;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_return_output := result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l115_c3_0815] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l115_c3_0815_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_cond;
     ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iftrue;
     ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_return_output := ctrl_mode_MUX_uxn_device_h_l115_c3_0815_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l222_c4_6d4d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_return_output;

     -- Submodule level 3
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_aa5a_return_output;
     VAR_vram_addr_uxn_device_h_l157_c5_d81c := resize(VAR_BIN_OP_PLUS_uxn_device_h_l157_c18_7783_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l165_c5_b3dc := resize(VAR_BIN_OP_PLUS_uxn_device_h_l165_c28_bdee_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l185_c24_8fbf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iftrue := VAR_MUX_uxn_device_h_l103_c32_1487_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l150_c7_bada_return_output;
     VAR_color_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_color_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_ctrl_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iftrue := VAR_ctrl_mode_MUX_uxn_device_h_l115_c3_0815_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_iftrue := VAR_flip_x_MUX_uxn_device_h_l115_c3_0815_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_iftrue := VAR_flip_y_MUX_uxn_device_h_l115_c3_0815_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_050f_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_7218_iftrue := VAR_layer_MUX_uxn_device_h_l115_c3_0815_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_iffalse := VAR_ram_addr_MUX_uxn_device_h_l203_c8_035f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l216_c8_05ae_return_output;
     VAR_result_MUX_uxn_device_h_l109_c7_039c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l109_c7_039c_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_7218_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_7218_return_output;
     VAR_result_MUX_uxn_device_h_l125_c7_cc40_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l125_c7_cc40_return_output;
     VAR_result_MUX_uxn_device_h_l132_c7_0215_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l132_c7_0215_return_output;
     VAR_result_MUX_uxn_device_h_l138_c7_cdc0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l138_c7_cdc0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l180_c4_7c84_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l210_c4_dcd4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l222_c4_6d4d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l180_c4_7c84_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l210_c4_dcd4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l222_c4_6d4d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l210_c4_dcd4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l222_c4_6d4d_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_cc40_iftrue := VAR_x_MUX_uxn_device_h_l126_c3_de80_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_0215_iftrue := VAR_x_MUX_uxn_device_h_l133_c3_bd75_return_output;
     VAR_x_MUX_uxn_device_h_l175_c3_b4e7_iftrue := VAR_x_MUX_uxn_device_h_l180_c4_7c84_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_cdc0_iftrue := VAR_y_MUX_uxn_device_h_l139_c3_d215_return_output;
     VAR_y_MUX_uxn_device_h_l145_c7_c12c_iftrue := VAR_y_MUX_uxn_device_h_l146_c3_1bac_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iffalse := VAR_result_vram_address_uxn_device_h_l165_c5_b3dc;
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_left := VAR_vram_addr_uxn_device_h_l157_c5_d81c;
     -- result_device_ram_address_MUX[uxn_device_h_l175_c3_b4e7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_cond;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output := result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output;

     -- x_MUX[uxn_device_h_l175_c3_b4e7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l175_c3_b4e7_cond <= VAR_x_MUX_uxn_device_h_l175_c3_b4e7_cond;
     x_MUX_uxn_device_h_l175_c3_b4e7_iftrue <= VAR_x_MUX_uxn_device_h_l175_c3_b4e7_iftrue;
     x_MUX_uxn_device_h_l175_c3_b4e7_iffalse <= VAR_x_MUX_uxn_device_h_l175_c3_b4e7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l175_c3_b4e7_return_output := x_MUX_uxn_device_h_l175_c3_b4e7_return_output;

     -- y_MUX[uxn_device_h_l145_c7_c12c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l145_c7_c12c_cond <= VAR_y_MUX_uxn_device_h_l145_c7_c12c_cond;
     y_MUX_uxn_device_h_l145_c7_c12c_iftrue <= VAR_y_MUX_uxn_device_h_l145_c7_c12c_iftrue;
     y_MUX_uxn_device_h_l145_c7_c12c_iffalse <= VAR_y_MUX_uxn_device_h_l145_c7_c12c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l145_c7_c12c_return_output := y_MUX_uxn_device_h_l145_c7_c12c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_f456] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_return_output;

     -- color_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_color_MUX_uxn_device_h_l109_c7_039c_cond;
     color_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_color_MUX_uxn_device_h_l109_c7_039c_iftrue;
     color_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_color_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l109_c7_039c_return_output := color_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l221_c3_fcfc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_cond;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_return_output := result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_return_output;

     -- flip_x_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_cond;
     flip_x_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_iftrue;
     flip_x_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_return_output := flip_x_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- ram_addr_MUX[uxn_device_h_l196_c3_5b74] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l196_c3_5b74_cond <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_cond;
     ram_addr_MUX_uxn_device_h_l196_c3_5b74_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_iftrue;
     ram_addr_MUX_uxn_device_h_l196_c3_5b74_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_return_output := ram_addr_MUX_uxn_device_h_l196_c3_5b74_return_output;

     -- layer_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_layer_MUX_uxn_device_h_l114_c7_7218_cond;
     layer_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_layer_MUX_uxn_device_h_l114_c7_7218_iftrue;
     layer_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_layer_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l114_c7_7218_return_output := layer_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- BIN_OP_AND[uxn_device_h_l158_c5_f54b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l158_c5_f54b_left <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_left;
     BIN_OP_AND_uxn_device_h_l158_c5_f54b_right <= VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_return_output := BIN_OP_AND_uxn_device_h_l158_c5_f54b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l221_c3_fcfc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_return_output := result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_cc40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3[uxn_device_h_l195_c7_52b0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l195_c7_52b0_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l196_c3_5b74_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l196_c3_5b74_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l196_c3_5b74_return_output);

     -- auto_advance_MUX[uxn_device_h_l145_c7_c12c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_c12c_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_c12c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_c12c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_return_output := auto_advance_MUX_uxn_device_h_l145_c7_c12c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l209_c3_c9c2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_cond;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_return_output := result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l102_c3_f456] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_cond;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_return_output := result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_return_output;

     -- result_u8_value_MUX[uxn_device_h_l209_c3_c9c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_cond <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_cond;
     result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iftrue;
     result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_return_output := result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_return_output;

     -- ram_addr_MUX[uxn_device_h_l209_c3_c9c2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l209_c3_c9c2_cond <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_cond;
     ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iftrue;
     ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_return_output := ram_addr_MUX_uxn_device_h_l209_c3_c9c2_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_cond;
     is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iftrue;
     is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_return_output := is_drawing_port_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- ctrl_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_cond;
     ctrl_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_iftrue;
     ctrl_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_return_output := ctrl_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- flip_y_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_cond;
     flip_y_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_iftrue;
     flip_y_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_return_output := flip_y_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- result_u8_value_MUX[uxn_device_h_l221_c3_fcfc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_cond <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_cond;
     result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iftrue;
     result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_return_output := result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_cond;
     ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iftrue;
     ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_return_output := ctrl_mode_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l209_c3_c9c2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_return_output := result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l181_c5_5b0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_cond;
     result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iftrue;
     result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_return_output := result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l175_c3_b4e7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_left := VAR_BIN_OP_AND_uxn_device_h_l158_c5_f54b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_cc40_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_c12c_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_color_MUX_uxn_device_h_l109_c7_039c_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_flip_x_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_flip_y_MUX_uxn_device_h_l114_c7_7218_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_layer_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_layer_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_iftrue := VAR_ram_addr_MUX_uxn_device_h_l196_c3_5b74_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iftrue := VAR_ram_addr_MUX_uxn_device_h_l209_c3_c9c2_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_52b0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l195_c7_52b0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l181_c5_5b0e_return_output;
     VAR_x_MUX_uxn_device_h_l174_c7_429f_iftrue := VAR_x_MUX_uxn_device_h_l175_c3_b4e7_return_output;
     VAR_y_MUX_uxn_device_h_l138_c7_cdc0_iffalse := VAR_y_MUX_uxn_device_h_l145_c7_c12c_return_output;
     -- BIN_OP_OR[uxn_device_h_l159_c5_2fd0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l159_c5_2fd0_left <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_left;
     BIN_OP_OR_uxn_device_h_l159_c5_2fd0_right <= VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_return_output := BIN_OP_OR_uxn_device_h_l159_c5_2fd0_return_output;

     -- x_MUX[uxn_device_h_l174_c7_429f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l174_c7_429f_cond <= VAR_x_MUX_uxn_device_h_l174_c7_429f_cond;
     x_MUX_uxn_device_h_l174_c7_429f_iftrue <= VAR_x_MUX_uxn_device_h_l174_c7_429f_iftrue;
     x_MUX_uxn_device_h_l174_c7_429f_iffalse <= VAR_x_MUX_uxn_device_h_l174_c7_429f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l174_c7_429f_return_output := x_MUX_uxn_device_h_l174_c7_429f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3[uxn_device_h_l208_c7_8bbf] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l208_c7_8bbf_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l209_c3_c9c2_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l209_c3_c9c2_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l209_c3_c9c2_return_output);

     -- auto_advance_MUX[uxn_device_h_l138_c7_cdc0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l138_c7_cdc0_cond <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_cond;
     auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iftrue;
     auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_return_output := auto_advance_MUX_uxn_device_h_l138_c7_cdc0_return_output;

     -- result_u8_value_MUX[uxn_device_h_l180_c4_7c84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l180_c4_7c84_cond <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_cond;
     result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iftrue;
     result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_return_output := result_u8_value_MUX_uxn_device_h_l180_c4_7c84_return_output;

     -- ram_addr_MUX[uxn_device_h_l208_c7_8bbf] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l208_c7_8bbf_cond <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_cond;
     ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iftrue;
     ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_return_output := ram_addr_MUX_uxn_device_h_l208_c7_8bbf_return_output;

     -- color_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_color_MUX_uxn_device_h_l95_c2_050f_cond;
     color_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_color_MUX_uxn_device_h_l95_c2_050f_iftrue;
     color_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_color_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l95_c2_050f_return_output := color_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- flip_y_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_cond;
     flip_y_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_iftrue;
     flip_y_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_return_output := flip_y_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0[uxn_device_h_l95_c2_050f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l95_c2_050f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_34f0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_f456_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_f456_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3[uxn_device_h_l220_c7_20c2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l220_c7_20c2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l221_c3_fcfc_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l221_c3_fcfc_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l221_c3_fcfc_return_output);

     -- flip_x_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_cond;
     flip_x_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_iftrue;
     flip_x_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_return_output := flip_x_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- y_MUX[uxn_device_h_l138_c7_cdc0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c7_cdc0_cond <= VAR_y_MUX_uxn_device_h_l138_c7_cdc0_cond;
     y_MUX_uxn_device_h_l138_c7_cdc0_iftrue <= VAR_y_MUX_uxn_device_h_l138_c7_cdc0_iftrue;
     y_MUX_uxn_device_h_l138_c7_cdc0_iffalse <= VAR_y_MUX_uxn_device_h_l138_c7_cdc0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c7_cdc0_return_output := y_MUX_uxn_device_h_l138_c7_cdc0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_0215] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_return_output;

     -- layer_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_layer_MUX_uxn_device_h_l109_c7_039c_cond;
     layer_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_layer_MUX_uxn_device_h_l109_c7_039c_iftrue;
     layer_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_layer_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l109_c7_039c_return_output := layer_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_cond;
     ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iftrue;
     ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_return_output := ctrl_mode_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_left := VAR_BIN_OP_OR_uxn_device_h_l159_c5_2fd0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_0215_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_iffalse := VAR_auto_advance_MUX_uxn_device_h_l138_c7_cdc0_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_flip_x_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_flip_y_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_layer_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_iffalse := VAR_ram_addr_MUX_uxn_device_h_l208_c7_8bbf_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_050f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_34f0_uxn_device_h_l95_c2_050f_return_output;
     VAR_result_MUX_uxn_device_h_l208_c7_8bbf_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l208_c7_8bbf_return_output;
     VAR_result_MUX_uxn_device_h_l220_c7_20c2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_c1e3_uxn_device_h_l220_c7_20c2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l180_c4_7c84_return_output;
     VAR_x_MUX_uxn_device_h_l150_c7_bada_iffalse := VAR_x_MUX_uxn_device_h_l174_c7_429f_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_0215_iffalse := VAR_y_MUX_uxn_device_h_l138_c7_cdc0_return_output;
     -- layer_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_layer_MUX_uxn_device_h_l95_c2_050f_cond;
     layer_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_layer_MUX_uxn_device_h_l95_c2_050f_iftrue;
     layer_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_layer_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l95_c2_050f_return_output := layer_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- flip_y_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_cond;
     flip_y_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_iftrue;
     flip_y_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_return_output := flip_y_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- result_u8_value_MUX[uxn_device_h_l175_c3_b4e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_cond;
     result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iftrue;
     result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_return_output := result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_cond;
     ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iftrue;
     ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_return_output := ctrl_mode_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- flip_x_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_cond;
     flip_x_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_iftrue;
     flip_x_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_return_output := flip_x_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- BIN_OP_OR[uxn_device_h_l160_c5_ec4d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l160_c5_ec4d_left <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_left;
     BIN_OP_OR_uxn_device_h_l160_c5_ec4d_right <= VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_return_output := BIN_OP_OR_uxn_device_h_l160_c5_ec4d_return_output;

     -- auto_advance_MUX[uxn_device_h_l132_c7_0215] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l132_c7_0215_cond <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_cond;
     auto_advance_MUX_uxn_device_h_l132_c7_0215_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_iftrue;
     auto_advance_MUX_uxn_device_h_l132_c7_0215_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_return_output := auto_advance_MUX_uxn_device_h_l132_c7_0215_return_output;

     -- x_MUX[uxn_device_h_l150_c7_bada] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l150_c7_bada_cond <= VAR_x_MUX_uxn_device_h_l150_c7_bada_cond;
     x_MUX_uxn_device_h_l150_c7_bada_iftrue <= VAR_x_MUX_uxn_device_h_l150_c7_bada_iftrue;
     x_MUX_uxn_device_h_l150_c7_bada_iffalse <= VAR_x_MUX_uxn_device_h_l150_c7_bada_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l150_c7_bada_return_output := x_MUX_uxn_device_h_l150_c7_bada_return_output;

     -- y_MUX[uxn_device_h_l132_c7_0215] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l132_c7_0215_cond <= VAR_y_MUX_uxn_device_h_l132_c7_0215_cond;
     y_MUX_uxn_device_h_l132_c7_0215_iftrue <= VAR_y_MUX_uxn_device_h_l132_c7_0215_iftrue;
     y_MUX_uxn_device_h_l132_c7_0215_iffalse <= VAR_y_MUX_uxn_device_h_l132_c7_0215_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l132_c7_0215_return_output := y_MUX_uxn_device_h_l132_c7_0215_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l138_c7_cdc0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_return_output;

     -- ram_addr_MUX[uxn_device_h_l195_c7_52b0] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l195_c7_52b0_cond <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_cond;
     ram_addr_MUX_uxn_device_h_l195_c7_52b0_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_iftrue;
     ram_addr_MUX_uxn_device_h_l195_c7_52b0_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_return_output := ram_addr_MUX_uxn_device_h_l195_c7_52b0_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_left := VAR_BIN_OP_OR_uxn_device_h_l160_c5_ec4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l138_c7_cdc0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_iffalse := VAR_auto_advance_MUX_uxn_device_h_l132_c7_0215_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_050f_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l95_c2_050f_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l95_c2_050f_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_iffalse := VAR_ram_addr_MUX_uxn_device_h_l195_c7_52b0_return_output;
     VAR_x_MUX_uxn_device_h_l145_c7_c12c_iffalse := VAR_x_MUX_uxn_device_h_l150_c7_bada_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_cc40_iffalse := VAR_y_MUX_uxn_device_h_l132_c7_0215_return_output;
     -- auto_advance_MUX[uxn_device_h_l125_c7_cc40] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_cc40_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_cc40_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_cc40_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_return_output := auto_advance_MUX_uxn_device_h_l125_c7_cc40_return_output;

     -- y_MUX[uxn_device_h_l125_c7_cc40] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_cc40_cond <= VAR_y_MUX_uxn_device_h_l125_c7_cc40_cond;
     y_MUX_uxn_device_h_l125_c7_cc40_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_cc40_iftrue;
     y_MUX_uxn_device_h_l125_c7_cc40_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_cc40_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_cc40_return_output := y_MUX_uxn_device_h_l125_c7_cc40_return_output;

     -- ram_addr_MUX[uxn_device_h_l174_c7_429f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l174_c7_429f_cond <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_cond;
     ram_addr_MUX_uxn_device_h_l174_c7_429f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_iftrue;
     ram_addr_MUX_uxn_device_h_l174_c7_429f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_return_output := ram_addr_MUX_uxn_device_h_l174_c7_429f_return_output;

     -- x_MUX[uxn_device_h_l145_c7_c12c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l145_c7_c12c_cond <= VAR_x_MUX_uxn_device_h_l145_c7_c12c_cond;
     x_MUX_uxn_device_h_l145_c7_c12c_iftrue <= VAR_x_MUX_uxn_device_h_l145_c7_c12c_iftrue;
     x_MUX_uxn_device_h_l145_c7_c12c_iffalse <= VAR_x_MUX_uxn_device_h_l145_c7_c12c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l145_c7_c12c_return_output := x_MUX_uxn_device_h_l145_c7_c12c_return_output;

     -- BIN_OP_OR[uxn_device_h_l161_c5_dc3b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l161_c5_dc3b_left <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_left;
     BIN_OP_OR_uxn_device_h_l161_c5_dc3b_right <= VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output := BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_c12c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2d2f[uxn_device_h_l174_c7_429f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2d2f_uxn_device_h_l174_c7_429f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_2d2f(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l175_c3_b4e7_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l175_c3_b4e7_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l175_c3_b4e7_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l175_c3_b4e7_return_output);

     -- Submodule level 7
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_iftrue := VAR_BIN_OP_OR_uxn_device_h_l161_c5_dc3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c12c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_cc40_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse := VAR_ram_addr_MUX_uxn_device_h_l174_c7_429f_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_429f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_2d2f_uxn_device_h_l174_c7_429f_return_output;
     VAR_x_MUX_uxn_device_h_l138_c7_cdc0_iffalse := VAR_x_MUX_uxn_device_h_l145_c7_c12c_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_7218_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_cc40_return_output;
     -- auto_advance_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_return_output := auto_advance_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- x_MUX[uxn_device_h_l138_c7_cdc0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l138_c7_cdc0_cond <= VAR_x_MUX_uxn_device_h_l138_c7_cdc0_cond;
     x_MUX_uxn_device_h_l138_c7_cdc0_iftrue <= VAR_x_MUX_uxn_device_h_l138_c7_cdc0_iftrue;
     x_MUX_uxn_device_h_l138_c7_cdc0_iffalse <= VAR_x_MUX_uxn_device_h_l138_c7_cdc0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l138_c7_cdc0_return_output := x_MUX_uxn_device_h_l138_c7_cdc0_return_output;

     -- ram_addr_MUX[uxn_device_h_l150_c7_bada] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l150_c7_bada_cond <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_cond;
     ram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue;
     ram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_return_output := ram_addr_MUX_uxn_device_h_l150_c7_bada_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l150_c7_bada] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_return_output;

     -- y_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_y_MUX_uxn_device_h_l114_c7_7218_cond;
     y_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_7218_iftrue;
     y_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_7218_return_output := y_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- result_vram_address_MUX[uxn_device_h_l156_c4_bf44] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l156_c4_bf44_cond <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_cond;
     result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iftrue;
     result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_return_output := result_vram_address_MUX_uxn_device_h_l156_c4_bf44_return_output;

     -- vram_addr_MUX[uxn_device_h_l156_c4_bf44] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l156_c4_bf44_cond <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_cond;
     vram_addr_MUX_uxn_device_h_l156_c4_bf44_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_iftrue;
     vram_addr_MUX_uxn_device_h_l156_c4_bf44_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_return_output := vram_addr_MUX_uxn_device_h_l156_c4_bf44_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l150_c7_bada_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l150_c7_bada_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l156_c4_bf44_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_iftrue := VAR_vram_addr_MUX_uxn_device_h_l156_c4_bf44_return_output;
     VAR_x_MUX_uxn_device_h_l132_c7_0215_iffalse := VAR_x_MUX_uxn_device_h_l138_c7_cdc0_return_output;
     VAR_y_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_7218_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_429f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c3_7e95] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c3_7e95_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_cond;
     result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_return_output := result_vram_address_MUX_uxn_device_h_l151_c3_7e95_return_output;

     -- y_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_y_MUX_uxn_device_h_l109_c7_039c_cond;
     y_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_y_MUX_uxn_device_h_l109_c7_039c_iftrue;
     y_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_y_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l109_c7_039c_return_output := y_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- vram_addr_MUX[uxn_device_h_l151_c3_7e95] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l151_c3_7e95_cond <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_cond;
     vram_addr_MUX_uxn_device_h_l151_c3_7e95_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_iftrue;
     vram_addr_MUX_uxn_device_h_l151_c3_7e95_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_return_output := vram_addr_MUX_uxn_device_h_l151_c3_7e95_return_output;

     -- x_MUX[uxn_device_h_l132_c7_0215] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l132_c7_0215_cond <= VAR_x_MUX_uxn_device_h_l132_c7_0215_cond;
     x_MUX_uxn_device_h_l132_c7_0215_iftrue <= VAR_x_MUX_uxn_device_h_l132_c7_0215_iftrue;
     x_MUX_uxn_device_h_l132_c7_0215_iffalse <= VAR_x_MUX_uxn_device_h_l132_c7_0215_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l132_c7_0215_return_output := x_MUX_uxn_device_h_l132_c7_0215_return_output;

     -- ram_addr_MUX[uxn_device_h_l145_c7_c12c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l145_c7_c12c_cond <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_cond;
     ram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue;
     ram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output := ram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output;

     -- auto_advance_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_cond;
     auto_advance_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_iftrue;
     auto_advance_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_return_output := auto_advance_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_429f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse := VAR_ram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue := VAR_vram_addr_MUX_uxn_device_h_l151_c3_7e95_return_output;
     VAR_x_MUX_uxn_device_h_l125_c7_cc40_iffalse := VAR_x_MUX_uxn_device_h_l132_c7_0215_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_y_MUX_uxn_device_h_l109_c7_039c_return_output;
     -- y_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_y_MUX_uxn_device_h_l95_c2_050f_cond;
     y_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_y_MUX_uxn_device_h_l95_c2_050f_iftrue;
     y_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_y_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l95_c2_050f_return_output := y_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- ram_addr_MUX[uxn_device_h_l138_c7_cdc0] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond;
     ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue;
     ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output := ram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l195_c7_52b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_return_output;

     -- x_MUX[uxn_device_h_l125_c7_cc40] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l125_c7_cc40_cond <= VAR_x_MUX_uxn_device_h_l125_c7_cc40_cond;
     x_MUX_uxn_device_h_l125_c7_cc40_iftrue <= VAR_x_MUX_uxn_device_h_l125_c7_cc40_iftrue;
     x_MUX_uxn_device_h_l125_c7_cc40_iffalse <= VAR_x_MUX_uxn_device_h_l125_c7_cc40_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l125_c7_cc40_return_output := x_MUX_uxn_device_h_l125_c7_cc40_return_output;

     -- auto_advance_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_cond;
     auto_advance_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_iftrue;
     auto_advance_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_return_output := auto_advance_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ad0b[uxn_device_h_l150_c7_bada] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ad0b_uxn_device_h_l150_c7_bada_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ad0b(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c3_7e95_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l151_c3_7e95_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l151_c3_7e95_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l151_c3_7e95_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c3_7e95_return_output);

     -- vram_addr_MUX[uxn_device_h_l150_c7_bada] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l150_c7_bada_cond <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_cond;
     vram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_iftrue;
     vram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_return_output := vram_addr_MUX_uxn_device_h_l150_c7_bada_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l195_c7_52b0_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse := VAR_ram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output;
     VAR_result_MUX_uxn_device_h_l150_c7_bada_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ad0b_uxn_device_h_l150_c7_bada_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse := VAR_vram_addr_MUX_uxn_device_h_l150_c7_bada_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_7218_iffalse := VAR_x_MUX_uxn_device_h_l125_c7_cc40_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l95_c2_050f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l208_c7_8bbf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_return_output;

     -- x_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_x_MUX_uxn_device_h_l114_c7_7218_cond;
     x_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_x_MUX_uxn_device_h_l114_c7_7218_iftrue;
     x_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_x_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l114_c7_7218_return_output := x_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_c12c] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_c12c_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output := vram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output;

     -- ram_addr_MUX[uxn_device_h_l132_c7_0215] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l132_c7_0215_cond <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_cond;
     ram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue;
     ram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_return_output := ram_addr_MUX_uxn_device_h_l132_c7_0215_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l208_c7_8bbf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse := VAR_ram_addr_MUX_uxn_device_h_l132_c7_0215_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_c12c_return_output;
     VAR_x_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_x_MUX_uxn_device_h_l114_c7_7218_return_output;
     -- vram_addr_MUX[uxn_device_h_l138_c7_cdc0] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_cond;
     vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iftrue;
     vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output := vram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output;

     -- ram_addr_MUX[uxn_device_h_l125_c7_cc40] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l125_c7_cc40_cond <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_cond;
     ram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue;
     ram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output := ram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l220_c7_20c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_return_output;

     -- x_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_x_MUX_uxn_device_h_l109_c7_039c_cond;
     x_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_x_MUX_uxn_device_h_l109_c7_039c_iftrue;
     x_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_x_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l109_c7_039c_return_output := x_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l220_c7_20c2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse := VAR_ram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse := VAR_vram_addr_MUX_uxn_device_h_l138_c7_cdc0_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_x_MUX_uxn_device_h_l109_c7_039c_return_output;
     -- x_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_x_MUX_uxn_device_h_l95_c2_050f_cond;
     x_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_x_MUX_uxn_device_h_l95_c2_050f_iftrue;
     x_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_x_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l95_c2_050f_return_output := x_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l229_c1_a728] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_return_output;

     -- vram_addr_MUX[uxn_device_h_l132_c7_0215] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l132_c7_0215_cond <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_cond;
     vram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_iftrue;
     vram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_return_output := vram_addr_MUX_uxn_device_h_l132_c7_0215_return_output;

     -- ram_addr_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_cond;
     ram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue;
     ram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_return_output := ram_addr_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- Submodule level 13
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l229_c1_a728_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l114_c7_7218_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse := VAR_vram_addr_MUX_uxn_device_h_l132_c7_0215_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l95_c2_050f_return_output;
     -- vram_addr_MUX[uxn_device_h_l125_c7_cc40] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l125_c7_cc40_cond <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_cond;
     vram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_iftrue;
     vram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output := vram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l230_c1_5953] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_return_output;

     -- ram_addr_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_cond;
     ram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue;
     ram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_return_output := ram_addr_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- Submodule level 14
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l230_c1_5953_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_ram_addr_MUX_uxn_device_h_l109_c7_039c_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse := VAR_vram_addr_MUX_uxn_device_h_l125_c7_cc40_return_output;
     -- ram_addr_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_cond;
     ram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue;
     ram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_return_output := ram_addr_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_return_output := vram_addr_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- screen_blit[uxn_device_h_l231_c46_6df4] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l231_c46_6df4_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l231_c46_6df4_phase <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_phase;
     screen_blit_uxn_device_h_l231_c46_6df4_ctrl <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_ctrl;
     screen_blit_uxn_device_h_l231_c46_6df4_auto_advance <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_auto_advance;
     screen_blit_uxn_device_h_l231_c46_6df4_x <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_x;
     screen_blit_uxn_device_h_l231_c46_6df4_y <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_y;
     screen_blit_uxn_device_h_l231_c46_6df4_ram_addr <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_ram_addr;
     screen_blit_uxn_device_h_l231_c46_6df4_previous_ram_read <= VAR_screen_blit_uxn_device_h_l231_c46_6df4_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output := screen_blit_uxn_device_h_l231_c46_6df4_return_output;

     -- Submodule level 15
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_7218_return_output;
     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l237_c22_36bd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_36bd_return_output := VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l236_c30_8cda] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_8cda_return_output := VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output.vram_write_layer;

     -- vram_addr_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_cond;
     vram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_iftrue;
     vram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_return_output := vram_addr_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d[uxn_device_h_l238_c25_ccd5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_ccd5_return_output := VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output.ram_address;

     -- CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d[uxn_device_h_l235_c26_edec] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_edec_return_output := VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l234_c27_21c6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_21c6_return_output := VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l239_c25_8442] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_8442_return_output := VAR_screen_blit_uxn_device_h_l231_c46_6df4_return_output.is_blit_done;

     -- Submodule level 16
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_vram_addr_MUX_uxn_device_h_l109_c7_039c_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6[uxn_device_h_l230_c3_b016] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_b016_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6(
     to_unsigned(0, 1),
     VAR_result_device_ram_address_uxn_device_h_l233_c4_84bb,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l234_c27_21c6_return_output,
     VAR_CONST_REF_RD_uint32_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l235_c26_edec_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l236_c30_8cda_return_output,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l237_c22_36bd_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l238_c25_ccd5_return_output,
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l239_c25_8442_return_output);

     -- vram_addr_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_cond;
     vram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_iftrue;
     vram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_return_output := vram_addr_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l230_c3_b016_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b7b6_uxn_device_h_l230_c3_b016_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l95_c2_050f_return_output;
     -- result_MUX[uxn_device_h_l230_c3_b016] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l230_c3_b016_cond <= VAR_result_MUX_uxn_device_h_l230_c3_b016_cond;
     result_MUX_uxn_device_h_l230_c3_b016_iftrue <= VAR_result_MUX_uxn_device_h_l230_c3_b016_iftrue;
     result_MUX_uxn_device_h_l230_c3_b016_iffalse <= VAR_result_MUX_uxn_device_h_l230_c3_b016_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l230_c3_b016_return_output := result_MUX_uxn_device_h_l230_c3_b016_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l220_c7_20c2_iffalse := VAR_result_MUX_uxn_device_h_l230_c3_b016_return_output;
     -- result_MUX[uxn_device_h_l220_c7_20c2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l220_c7_20c2_cond <= VAR_result_MUX_uxn_device_h_l220_c7_20c2_cond;
     result_MUX_uxn_device_h_l220_c7_20c2_iftrue <= VAR_result_MUX_uxn_device_h_l220_c7_20c2_iftrue;
     result_MUX_uxn_device_h_l220_c7_20c2_iffalse <= VAR_result_MUX_uxn_device_h_l220_c7_20c2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l220_c7_20c2_return_output := result_MUX_uxn_device_h_l220_c7_20c2_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l208_c7_8bbf_iffalse := VAR_result_MUX_uxn_device_h_l220_c7_20c2_return_output;
     -- result_MUX[uxn_device_h_l208_c7_8bbf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l208_c7_8bbf_cond <= VAR_result_MUX_uxn_device_h_l208_c7_8bbf_cond;
     result_MUX_uxn_device_h_l208_c7_8bbf_iftrue <= VAR_result_MUX_uxn_device_h_l208_c7_8bbf_iftrue;
     result_MUX_uxn_device_h_l208_c7_8bbf_iffalse <= VAR_result_MUX_uxn_device_h_l208_c7_8bbf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l208_c7_8bbf_return_output := result_MUX_uxn_device_h_l208_c7_8bbf_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l195_c7_52b0_iffalse := VAR_result_MUX_uxn_device_h_l208_c7_8bbf_return_output;
     -- result_MUX[uxn_device_h_l195_c7_52b0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l195_c7_52b0_cond <= VAR_result_MUX_uxn_device_h_l195_c7_52b0_cond;
     result_MUX_uxn_device_h_l195_c7_52b0_iftrue <= VAR_result_MUX_uxn_device_h_l195_c7_52b0_iftrue;
     result_MUX_uxn_device_h_l195_c7_52b0_iffalse <= VAR_result_MUX_uxn_device_h_l195_c7_52b0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l195_c7_52b0_return_output := result_MUX_uxn_device_h_l195_c7_52b0_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l174_c7_429f_iffalse := VAR_result_MUX_uxn_device_h_l195_c7_52b0_return_output;
     -- result_MUX[uxn_device_h_l174_c7_429f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c7_429f_cond <= VAR_result_MUX_uxn_device_h_l174_c7_429f_cond;
     result_MUX_uxn_device_h_l174_c7_429f_iftrue <= VAR_result_MUX_uxn_device_h_l174_c7_429f_iftrue;
     result_MUX_uxn_device_h_l174_c7_429f_iffalse <= VAR_result_MUX_uxn_device_h_l174_c7_429f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c7_429f_return_output := result_MUX_uxn_device_h_l174_c7_429f_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l150_c7_bada_iffalse := VAR_result_MUX_uxn_device_h_l174_c7_429f_return_output;
     -- result_MUX[uxn_device_h_l150_c7_bada] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l150_c7_bada_cond <= VAR_result_MUX_uxn_device_h_l150_c7_bada_cond;
     result_MUX_uxn_device_h_l150_c7_bada_iftrue <= VAR_result_MUX_uxn_device_h_l150_c7_bada_iftrue;
     result_MUX_uxn_device_h_l150_c7_bada_iffalse <= VAR_result_MUX_uxn_device_h_l150_c7_bada_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l150_c7_bada_return_output := result_MUX_uxn_device_h_l150_c7_bada_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l145_c7_c12c_iffalse := VAR_result_MUX_uxn_device_h_l150_c7_bada_return_output;
     -- result_MUX[uxn_device_h_l145_c7_c12c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l145_c7_c12c_cond <= VAR_result_MUX_uxn_device_h_l145_c7_c12c_cond;
     result_MUX_uxn_device_h_l145_c7_c12c_iftrue <= VAR_result_MUX_uxn_device_h_l145_c7_c12c_iftrue;
     result_MUX_uxn_device_h_l145_c7_c12c_iffalse <= VAR_result_MUX_uxn_device_h_l145_c7_c12c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l145_c7_c12c_return_output := result_MUX_uxn_device_h_l145_c7_c12c_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l138_c7_cdc0_iffalse := VAR_result_MUX_uxn_device_h_l145_c7_c12c_return_output;
     -- result_MUX[uxn_device_h_l138_c7_cdc0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l138_c7_cdc0_cond <= VAR_result_MUX_uxn_device_h_l138_c7_cdc0_cond;
     result_MUX_uxn_device_h_l138_c7_cdc0_iftrue <= VAR_result_MUX_uxn_device_h_l138_c7_cdc0_iftrue;
     result_MUX_uxn_device_h_l138_c7_cdc0_iffalse <= VAR_result_MUX_uxn_device_h_l138_c7_cdc0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l138_c7_cdc0_return_output := result_MUX_uxn_device_h_l138_c7_cdc0_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_device_h_l132_c7_0215_iffalse := VAR_result_MUX_uxn_device_h_l138_c7_cdc0_return_output;
     -- result_MUX[uxn_device_h_l132_c7_0215] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l132_c7_0215_cond <= VAR_result_MUX_uxn_device_h_l132_c7_0215_cond;
     result_MUX_uxn_device_h_l132_c7_0215_iftrue <= VAR_result_MUX_uxn_device_h_l132_c7_0215_iftrue;
     result_MUX_uxn_device_h_l132_c7_0215_iffalse <= VAR_result_MUX_uxn_device_h_l132_c7_0215_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l132_c7_0215_return_output := result_MUX_uxn_device_h_l132_c7_0215_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_device_h_l125_c7_cc40_iffalse := VAR_result_MUX_uxn_device_h_l132_c7_0215_return_output;
     -- result_MUX[uxn_device_h_l125_c7_cc40] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l125_c7_cc40_cond <= VAR_result_MUX_uxn_device_h_l125_c7_cc40_cond;
     result_MUX_uxn_device_h_l125_c7_cc40_iftrue <= VAR_result_MUX_uxn_device_h_l125_c7_cc40_iftrue;
     result_MUX_uxn_device_h_l125_c7_cc40_iffalse <= VAR_result_MUX_uxn_device_h_l125_c7_cc40_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l125_c7_cc40_return_output := result_MUX_uxn_device_h_l125_c7_cc40_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_device_h_l114_c7_7218_iffalse := VAR_result_MUX_uxn_device_h_l125_c7_cc40_return_output;
     -- result_MUX[uxn_device_h_l114_c7_7218] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l114_c7_7218_cond <= VAR_result_MUX_uxn_device_h_l114_c7_7218_cond;
     result_MUX_uxn_device_h_l114_c7_7218_iftrue <= VAR_result_MUX_uxn_device_h_l114_c7_7218_iftrue;
     result_MUX_uxn_device_h_l114_c7_7218_iffalse <= VAR_result_MUX_uxn_device_h_l114_c7_7218_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l114_c7_7218_return_output := result_MUX_uxn_device_h_l114_c7_7218_return_output;

     -- Submodule level 28
     VAR_result_MUX_uxn_device_h_l109_c7_039c_iffalse := VAR_result_MUX_uxn_device_h_l114_c7_7218_return_output;
     -- result_MUX[uxn_device_h_l109_c7_039c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l109_c7_039c_cond <= VAR_result_MUX_uxn_device_h_l109_c7_039c_cond;
     result_MUX_uxn_device_h_l109_c7_039c_iftrue <= VAR_result_MUX_uxn_device_h_l109_c7_039c_iftrue;
     result_MUX_uxn_device_h_l109_c7_039c_iffalse <= VAR_result_MUX_uxn_device_h_l109_c7_039c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l109_c7_039c_return_output := result_MUX_uxn_device_h_l109_c7_039c_return_output;

     -- Submodule level 29
     VAR_result_MUX_uxn_device_h_l95_c2_050f_iffalse := VAR_result_MUX_uxn_device_h_l109_c7_039c_return_output;
     -- result_MUX[uxn_device_h_l95_c2_050f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l95_c2_050f_cond <= VAR_result_MUX_uxn_device_h_l95_c2_050f_cond;
     result_MUX_uxn_device_h_l95_c2_050f_iftrue <= VAR_result_MUX_uxn_device_h_l95_c2_050f_iftrue;
     result_MUX_uxn_device_h_l95_c2_050f_iffalse <= VAR_result_MUX_uxn_device_h_l95_c2_050f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l95_c2_050f_return_output := result_MUX_uxn_device_h_l95_c2_050f_return_output;

     -- Submodule level 30
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l95_c2_050f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l95_c2_050f_return_output;
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
