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
-- Submodules: 202
entity screen_deo_0CLK_e53d69d5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_e53d69d5;
architecture arch of screen_deo_0CLK_e53d69d5 is
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
signal is_x_onscreen : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_y_onscreen : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
is_device_ram_16bit => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 24),
u16_value => to_unsigned(0, 16),
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
signal REG_COMB_is_x_onscreen : unsigned(0 downto 0);
signal REG_COMB_is_y_onscreen : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l95_c6_56f3]
signal BIN_OP_EQ_uxn_device_h_l95_c6_56f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_56f3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l110_c7_ff60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);

-- is_sprite_port_MUX[uxn_device_h_l95_c2_425e]
signal is_sprite_port_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal is_sprite_port_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l95_c2_425e]
signal flip_x_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l95_c2_425e]
signal result_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l95_c2_425e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_425e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l95_c2_425e_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l95_c2_425e]
signal ctrl_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l95_c2_425e]
signal auto_advance_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l95_c2_425e]
signal layer_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l95_c2_425e]
signal flip_y_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l95_c2_425e]
signal ram_addr_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(15 downto 0);

-- is_drawing_port_MUX[uxn_device_h_l95_c2_425e]
signal is_drawing_port_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal is_drawing_port_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- is_y_onscreen_MUX[uxn_device_h_l95_c2_425e]
signal is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l95_c2_425e]
signal vram_addr_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(23 downto 0);

-- is_pixel_port_MUX[uxn_device_h_l95_c2_425e]
signal is_pixel_port_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal is_pixel_port_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l95_c2_425e]
signal y_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l95_c2_425e]
signal x_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l95_c2_425e]
signal ctrl_mode_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l95_c2_425e]
signal color_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(3 downto 0);

-- is_x_onscreen_MUX[uxn_device_h_l95_c2_425e]
signal is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l96_c19_b027]
signal BIN_OP_EQ_uxn_device_h_l96_c19_b027_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_b027_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l96_c19_b027_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l96_c19_aa86]
signal MUX_uxn_device_h_l96_c19_aa86_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_aa86_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_aa86_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l96_c19_aa86_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l97_c20_ecbf]
signal BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l97_c20_1874]
signal MUX_uxn_device_h_l97_c20_1874_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_1874_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_1874_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l97_c20_1874_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l98_c21_e736]
signal BIN_OP_OR_uxn_device_h_l98_c21_e736_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_e736_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output : unsigned(0 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_device_h_l102_c3_5a38]
signal result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_5a38]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l102_c3_5a38]
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l110_c11_76eb]
signal BIN_OP_EQ_uxn_device_h_l110_c11_76eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l110_c11_76eb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_dff8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l110_c7_ff60]
signal flip_x_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l110_c7_ff60]
signal result_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l110_c7_ff60_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l110_c7_ff60_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l110_c7_ff60_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l110_c7_ff60]
signal ctrl_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l110_c7_ff60]
signal auto_advance_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l110_c7_ff60]
signal layer_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l110_c7_ff60]
signal flip_y_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l110_c7_ff60]
signal ram_addr_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(15 downto 0);

-- is_y_onscreen_MUX[uxn_device_h_l110_c7_ff60]
signal is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l110_c7_ff60]
signal vram_addr_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(23 downto 0);

-- y_MUX[uxn_device_h_l110_c7_ff60]
signal y_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l110_c7_ff60]
signal x_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l110_c7_ff60]
signal ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l110_c7_ff60]
signal color_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(3 downto 0);

-- is_x_onscreen_MUX[uxn_device_h_l110_c7_ff60]
signal is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_592b]
signal BIN_OP_EQ_uxn_device_h_l114_c11_592b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_592b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l123_c7_67de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l114_c7_dff8]
signal flip_x_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l114_c7_dff8]
signal result_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l114_c7_dff8_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_dff8_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l114_c7_dff8_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l114_c7_dff8]
signal ctrl_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_dff8]
signal auto_advance_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l114_c7_dff8]
signal layer_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l114_c7_dff8]
signal flip_y_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l114_c7_dff8]
signal ram_addr_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(15 downto 0);

-- is_y_onscreen_MUX[uxn_device_h_l114_c7_dff8]
signal is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_dff8]
signal vram_addr_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(23 downto 0);

-- y_MUX[uxn_device_h_l114_c7_dff8]
signal y_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l114_c7_dff8]
signal x_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l114_c7_dff8]
signal ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l114_c7_dff8]
signal color_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(3 downto 0);

-- is_x_onscreen_MUX[uxn_device_h_l114_c7_dff8]
signal is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_device_h_l115_c37_a200]
signal CONST_SR_8_uxn_device_h_l115_c37_a200_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l115_c37_a200_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l115_c10_5052]
signal MUX_uxn_device_h_l115_c10_5052_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l115_c10_5052_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l115_c10_5052_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l115_c10_5052_return_output : unsigned(7 downto 0);

-- CONST_SR_7[uxn_device_h_l117_c25_e94a]
signal CONST_SR_7_uxn_device_h_l117_c25_e94a_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l117_c25_e94a_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l118_c21_37b2]
signal CONST_SR_6_uxn_device_h_l118_c21_37b2_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l118_c21_37b2_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l119_c22_587c]
signal CONST_SR_5_uxn_device_h_l119_c22_587c_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l119_c22_587c_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l120_c22_930b]
signal CONST_SR_4_uxn_device_h_l120_c22_930b_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l120_c22_930b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l123_c11_4005]
signal BIN_OP_EQ_uxn_device_h_l123_c11_4005_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l123_c11_4005_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l129_c7_38ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l123_c7_67de]
signal result_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l123_c7_67de_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l123_c7_67de_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l123_c7_67de_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l123_c7_67de]
signal auto_advance_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l123_c7_67de]
signal ram_addr_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(15 downto 0);

-- is_y_onscreen_MUX[uxn_device_h_l123_c7_67de]
signal is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l123_c7_67de]
signal vram_addr_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(23 downto 0);

-- y_MUX[uxn_device_h_l123_c7_67de]
signal y_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l123_c7_67de]
signal x_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(15 downto 0);

-- is_x_onscreen_MUX[uxn_device_h_l123_c7_67de]
signal is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(0 downto 0);
signal is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l125_c19_80a6]
signal BIN_OP_LT_uxn_device_h_l125_c19_80a6_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_device_h_l125_c19_80a6_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_device_h_l125_c19_80a6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l125_c19_b545]
signal MUX_uxn_device_h_l125_c19_b545_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l125_c19_b545_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l125_c19_b545_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l125_c19_b545_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l129_c11_6177]
signal BIN_OP_EQ_uxn_device_h_l129_c11_6177_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l129_c11_6177_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c7_2b80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l129_c7_38ee]
signal result_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l129_c7_38ee_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l129_c7_38ee_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l129_c7_38ee_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l129_c7_38ee]
signal auto_advance_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l129_c7_38ee]
signal ram_addr_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(15 downto 0);

-- is_y_onscreen_MUX[uxn_device_h_l129_c7_38ee]
signal is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(0 downto 0);
signal is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l129_c7_38ee]
signal vram_addr_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(23 downto 0);

-- y_MUX[uxn_device_h_l129_c7_38ee]
signal y_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l129_c7_38ee]
signal x_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(15 downto 0);

-- BIN_OP_LT[uxn_device_h_l131_c19_b877]
signal BIN_OP_LT_uxn_device_h_l131_c19_b877_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_device_h_l131_c19_b877_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_device_h_l131_c19_b877_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l131_c19_52a1]
signal MUX_uxn_device_h_l131_c19_52a1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l131_c19_52a1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l131_c19_52a1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l131_c19_52a1_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l134_c3_79d6]
signal result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c3_79d6]
signal result_vram_address_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(23 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c3_79d6]
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c3_79d6]
signal result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l134_c3_79d6]
signal result_u8_value_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l134_c3_79d6]
signal vram_addr_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(23 downto 0);

-- y_MUX[uxn_device_h_l134_c3_79d6]
signal y_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l134_c3_79d6]
signal x_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l136_c32_113c]
signal BIN_OP_AND_uxn_device_h_l136_c32_113c_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l136_c32_113c_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l136_c32_113c_return_output : unsigned(3 downto 0);

-- result_vram_address_MUX[uxn_device_h_l138_c4_c69b]
signal result_vram_address_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(23 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l138_c4_c69b]
signal result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(0 downto 0);

-- vram_addr_MUX[uxn_device_h_l138_c4_c69b]
signal vram_addr_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(23 downto 0);
signal vram_addr_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(23 downto 0);

-- y_MUX[uxn_device_h_l138_c4_c69b]
signal y_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l138_c4_c69b]
signal x_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l139_c9_9514]
signal MUX_uxn_device_h_l139_c9_9514_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l139_c9_9514_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c9_9514_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l139_c9_9514_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l140_c9_876d]
signal MUX_uxn_device_h_l140_c9_876d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l140_c9_876d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l140_c9_876d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l140_c9_876d_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l141_c18_1ccb]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_left : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_right : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_return_output : unsigned(47 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l141_c18_375e]
signal BIN_OP_PLUS_uxn_device_h_l141_c18_375e_left : unsigned(47 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c18_375e_right : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l141_c18_375e_return_output : unsigned(48 downto 0);

-- BIN_OP_AND[uxn_device_h_l142_c5_11f7]
signal BIN_OP_AND_uxn_device_h_l142_c5_11f7_left : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_device_h_l142_c5_11f7_right : unsigned(23 downto 0);
signal BIN_OP_AND_uxn_device_h_l142_c5_11f7_return_output : unsigned(23 downto 0);

-- MUX[uxn_device_h_l143_c19_858b]
signal MUX_uxn_device_h_l143_c19_858b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l143_c19_858b_iftrue : unsigned(23 downto 0);
signal MUX_uxn_device_h_l143_c19_858b_iffalse : unsigned(23 downto 0);
signal MUX_uxn_device_h_l143_c19_858b_return_output : unsigned(23 downto 0);

-- BIN_OP_OR[uxn_device_h_l143_c5_8e5d]
signal BIN_OP_OR_uxn_device_h_l143_c5_8e5d_left : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l143_c5_8e5d_right : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l143_c5_8e5d_return_output : unsigned(23 downto 0);

-- MUX[uxn_device_h_l144_c19_4890]
signal MUX_uxn_device_h_l144_c19_4890_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l144_c19_4890_iftrue : unsigned(23 downto 0);
signal MUX_uxn_device_h_l144_c19_4890_iffalse : unsigned(23 downto 0);
signal MUX_uxn_device_h_l144_c19_4890_return_output : unsigned(23 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c5_e56d]
signal BIN_OP_OR_uxn_device_h_l144_c5_e56d_left : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c5_e56d_right : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c5_e56d_return_output : unsigned(23 downto 0);

-- BIN_OP_OR[uxn_device_h_l145_c5_7d73]
signal BIN_OP_OR_uxn_device_h_l145_c5_7d73_left : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l145_c5_7d73_right : unsigned(23 downto 0);
signal BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output : unsigned(23 downto 0);

-- BIN_OP_AND[uxn_device_h_l148_c15_64b4]
signal BIN_OP_AND_uxn_device_h_l148_c15_64b4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l148_c15_64b4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l148_c11_db74]
signal result_vram_address_MUX_uxn_device_h_l148_c11_db74_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l148_c11_db74_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l148_c11_db74_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l148_c11_db74_return_output : unsigned(23 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l148_c11_db74]
signal result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l149_c28_b65e]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_left : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_right : unsigned(23 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_return_output : unsigned(47 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l149_c28_6c56]
signal BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_left : unsigned(47 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_right : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_return_output : unsigned(48 downto 0);

-- BIN_OP_EQ[uxn_device_h_l154_c11_0abb]
signal BIN_OP_EQ_uxn_device_h_l154_c11_0abb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c11_0abb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_8f85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l154_c7_2b80]
signal result_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l154_c7_2b80_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l154_c7_2b80_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l154_c7_2b80_return_output : device_out_result_t;

-- auto_advance_MUX[uxn_device_h_l154_c7_2b80]
signal auto_advance_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l154_c7_2b80]
signal ram_addr_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l154_c7_2b80]
signal x_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(15 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_device_h_l159_c3_48cf]
signal result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l159_c3_48cf]
signal result_vram_address_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(23 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l159_c3_48cf]
signal result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l159_c3_48cf]
signal result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_device_h_l159_c3_48cf]
signal result_u16_value_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l159_c3_48cf]
signal result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l159_c3_48cf]
signal result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l159_c3_48cf]
signal x_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(15 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_device_h_l162_c4_bd89]
signal result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l162_c4_bd89]
signal result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_device_h_l162_c4_bd89]
signal result_u16_value_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l162_c4_bd89]
signal result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l162_c4_bd89]
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l162_c4_bd89]
signal x_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l166_c15_ac06]
signal BIN_OP_AND_uxn_device_h_l166_c15_ac06_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l166_c15_ac06_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l166_c15_ac06_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l166_c15_424e]
signal BIN_OP_NEQ_uxn_device_h_l166_c15_424e_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l166_c15_424e_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l166_c11_80de]
signal result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l166_c11_80de]
signal result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_device_h_l166_c11_80de]
signal result_u16_value_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l166_c11_80de]
signal x_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l167_c5_ef00]
signal BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c11_6928]
signal BIN_OP_EQ_uxn_device_h_l174_c11_6928_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_6928_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l194_c7_20b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l174_c7_8f85]
signal result_MUX_uxn_device_h_l174_c7_8f85_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c7_8f85_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_8f85_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l174_c7_8f85_return_output : device_out_result_t;

-- ram_addr_MUX[uxn_device_h_l174_c7_8f85]
signal ram_addr_MUX_uxn_device_h_l174_c7_8f85_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_8f85_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_8f85_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l174_c7_8f85_return_output : unsigned(15 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_device_h_l176_c3_31b7]
signal result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l176_c3_31b7]
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_device_h_l176_c3_31b7]
signal result_u16_value_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l176_c3_31b7]
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l176_c3_31b7]
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(0 downto 0);

-- CONST_SR_1[uxn_device_h_l178_c9_209f]
signal CONST_SR_1_uxn_device_h_l178_c9_209f_x : unsigned(7 downto 0);
signal CONST_SR_1_uxn_device_h_l178_c9_209f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l178_c9_f7c1]
signal BIN_OP_AND_uxn_device_h_l178_c9_f7c1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l178_c9_f7c1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l178_c9_f7c1_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_device_h_l178_c9_cd1d]
signal BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_device_h_l178_c4_dce8]
signal result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l178_c4_dce8]
signal result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_device_h_l178_c4_dce8]
signal result_u16_value_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l178_c4_dce8]
signal result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l178_c4_dce8]
signal result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_16bit_MUX[uxn_device_h_l188_c8_db2e]
signal result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l188_c8_db2e]
signal result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l188_c8_db2e]
signal result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l194_c11_3e97]
signal BIN_OP_EQ_uxn_device_h_l194_c11_3e97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l194_c11_3e97_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_9054]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l194_c7_20b4]
signal result_MUX_uxn_device_h_l194_c7_20b4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l194_c7_20b4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l194_c7_20b4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l194_c7_20b4_return_output : device_out_result_t;

-- result_is_device_ram_16bit_MUX[uxn_device_h_l195_c3_3b94]
signal result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_cond : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l195_c3_3b94]
signal result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l195_c3_3b94]
signal result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_7512]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l202_c3_ceee]
signal result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l202_c3_ceee]
signal result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_device_h_l202_c3_ceee]
signal result_u16_value_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l202_c3_ceee]
signal result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l202_c3_ceee]
signal result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l202_c3_ceee]
signal result_u8_value_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l202_c3_ceee]
signal result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l202_c3_ceee]
signal result_vram_address_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(23 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l203_c58_9801]
signal BIN_OP_MINUS_uxn_device_h_l203_c58_9801_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_9801_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l203_c58_9801_return_output : unsigned(7 downto 0);

-- screen_blit[uxn_device_h_l203_c46_a081]
signal screen_blit_uxn_device_h_l203_c46_a081_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_phase : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_ctrl : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_auto_advance : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_x : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_y : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_ram_addr : unsigned(15 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_previous_ram_read : unsigned(7 downto 0);
signal screen_blit_uxn_device_h_l203_c46_a081_return_output : screen_blit_result_t;

function CONST_REF_RD_device_out_result_t_device_out_result_t_e1b0( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_write := ref_toks_2;
      base.is_device_ram_16bit := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_deo_done := ref_toks_5;

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

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_92fc( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_16bit := ref_toks_1;
      base.device_ram_address := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint8_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint24_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(23 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,24)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_198a( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_16bit := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.vram_address := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_4c5d( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_device_ram_16bit := ref_toks_2;
      base.vram_address := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;
      base.is_deo_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_ddc9( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_16bit := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_5bff( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_16bit := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_deo_done := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_0984( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_deo_done := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.vram_address := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l95_c6_56f3
BIN_OP_EQ_uxn_device_h_l95_c6_56f3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l95_c6_56f3_left,
BIN_OP_EQ_uxn_device_h_l95_c6_56f3_right,
BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- is_sprite_port_MUX_uxn_device_h_l95_c2_425e
is_sprite_port_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_sprite_port_MUX_uxn_device_h_l95_c2_425e_cond,
is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iftrue,
is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iffalse,
is_sprite_port_MUX_uxn_device_h_l95_c2_425e_return_output);

-- flip_x_MUX_uxn_device_h_l95_c2_425e
flip_x_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l95_c2_425e_cond,
flip_x_MUX_uxn_device_h_l95_c2_425e_iftrue,
flip_x_MUX_uxn_device_h_l95_c2_425e_iffalse,
flip_x_MUX_uxn_device_h_l95_c2_425e_return_output);

-- result_MUX_uxn_device_h_l95_c2_425e
result_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l95_c2_425e_cond,
result_MUX_uxn_device_h_l95_c2_425e_iftrue,
result_MUX_uxn_device_h_l95_c2_425e_iffalse,
result_MUX_uxn_device_h_l95_c2_425e_return_output);

-- ctrl_MUX_uxn_device_h_l95_c2_425e
ctrl_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l95_c2_425e_cond,
ctrl_MUX_uxn_device_h_l95_c2_425e_iftrue,
ctrl_MUX_uxn_device_h_l95_c2_425e_iffalse,
ctrl_MUX_uxn_device_h_l95_c2_425e_return_output);

-- auto_advance_MUX_uxn_device_h_l95_c2_425e
auto_advance_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l95_c2_425e_cond,
auto_advance_MUX_uxn_device_h_l95_c2_425e_iftrue,
auto_advance_MUX_uxn_device_h_l95_c2_425e_iffalse,
auto_advance_MUX_uxn_device_h_l95_c2_425e_return_output);

-- layer_MUX_uxn_device_h_l95_c2_425e
layer_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l95_c2_425e_cond,
layer_MUX_uxn_device_h_l95_c2_425e_iftrue,
layer_MUX_uxn_device_h_l95_c2_425e_iffalse,
layer_MUX_uxn_device_h_l95_c2_425e_return_output);

-- flip_y_MUX_uxn_device_h_l95_c2_425e
flip_y_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l95_c2_425e_cond,
flip_y_MUX_uxn_device_h_l95_c2_425e_iftrue,
flip_y_MUX_uxn_device_h_l95_c2_425e_iffalse,
flip_y_MUX_uxn_device_h_l95_c2_425e_return_output);

-- ram_addr_MUX_uxn_device_h_l95_c2_425e
ram_addr_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l95_c2_425e_cond,
ram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue,
ram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse,
ram_addr_MUX_uxn_device_h_l95_c2_425e_return_output);

-- is_drawing_port_MUX_uxn_device_h_l95_c2_425e
is_drawing_port_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_drawing_port_MUX_uxn_device_h_l95_c2_425e_cond,
is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iftrue,
is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iffalse,
is_drawing_port_MUX_uxn_device_h_l95_c2_425e_return_output);

-- is_y_onscreen_MUX_uxn_device_h_l95_c2_425e
is_y_onscreen_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_cond,
is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue,
is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse,
is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output);

-- vram_addr_MUX_uxn_device_h_l95_c2_425e
vram_addr_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l95_c2_425e_cond,
vram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue,
vram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse,
vram_addr_MUX_uxn_device_h_l95_c2_425e_return_output);

-- is_pixel_port_MUX_uxn_device_h_l95_c2_425e
is_pixel_port_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_pixel_port_MUX_uxn_device_h_l95_c2_425e_cond,
is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iftrue,
is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iffalse,
is_pixel_port_MUX_uxn_device_h_l95_c2_425e_return_output);

-- y_MUX_uxn_device_h_l95_c2_425e
y_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l95_c2_425e_cond,
y_MUX_uxn_device_h_l95_c2_425e_iftrue,
y_MUX_uxn_device_h_l95_c2_425e_iffalse,
y_MUX_uxn_device_h_l95_c2_425e_return_output);

-- x_MUX_uxn_device_h_l95_c2_425e
x_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l95_c2_425e_cond,
x_MUX_uxn_device_h_l95_c2_425e_iftrue,
x_MUX_uxn_device_h_l95_c2_425e_iffalse,
x_MUX_uxn_device_h_l95_c2_425e_return_output);

-- ctrl_mode_MUX_uxn_device_h_l95_c2_425e
ctrl_mode_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l95_c2_425e_cond,
ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iftrue,
ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iffalse,
ctrl_mode_MUX_uxn_device_h_l95_c2_425e_return_output);

-- color_MUX_uxn_device_h_l95_c2_425e
color_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l95_c2_425e_cond,
color_MUX_uxn_device_h_l95_c2_425e_iftrue,
color_MUX_uxn_device_h_l95_c2_425e_iffalse,
color_MUX_uxn_device_h_l95_c2_425e_return_output);

-- is_x_onscreen_MUX_uxn_device_h_l95_c2_425e
is_x_onscreen_MUX_uxn_device_h_l95_c2_425e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_cond,
is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue,
is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse,
is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output);

-- BIN_OP_EQ_uxn_device_h_l96_c19_b027
BIN_OP_EQ_uxn_device_h_l96_c19_b027 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l96_c19_b027_left,
BIN_OP_EQ_uxn_device_h_l96_c19_b027_right,
BIN_OP_EQ_uxn_device_h_l96_c19_b027_return_output);

-- MUX_uxn_device_h_l96_c19_aa86
MUX_uxn_device_h_l96_c19_aa86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l96_c19_aa86_cond,
MUX_uxn_device_h_l96_c19_aa86_iftrue,
MUX_uxn_device_h_l96_c19_aa86_iffalse,
MUX_uxn_device_h_l96_c19_aa86_return_output);

-- BIN_OP_EQ_uxn_device_h_l97_c20_ecbf
BIN_OP_EQ_uxn_device_h_l97_c20_ecbf : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_left,
BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_right,
BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_return_output);

-- MUX_uxn_device_h_l97_c20_1874
MUX_uxn_device_h_l97_c20_1874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l97_c20_1874_cond,
MUX_uxn_device_h_l97_c20_1874_iftrue,
MUX_uxn_device_h_l97_c20_1874_iffalse,
MUX_uxn_device_h_l97_c20_1874_return_output);

-- BIN_OP_OR_uxn_device_h_l98_c21_e736
BIN_OP_OR_uxn_device_h_l98_c21_e736 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l98_c21_e736_left,
BIN_OP_OR_uxn_device_h_l98_c21_e736_right,
BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output);

-- result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38
result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_cond,
result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iftrue,
result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iffalse,
result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38
result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38
result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_cond,
result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iftrue,
result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iffalse,
result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_return_output);

-- BIN_OP_EQ_uxn_device_h_l110_c11_76eb
BIN_OP_EQ_uxn_device_h_l110_c11_76eb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l110_c11_76eb_left,
BIN_OP_EQ_uxn_device_h_l110_c11_76eb_right,
BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- flip_x_MUX_uxn_device_h_l110_c7_ff60
flip_x_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l110_c7_ff60_cond,
flip_x_MUX_uxn_device_h_l110_c7_ff60_iftrue,
flip_x_MUX_uxn_device_h_l110_c7_ff60_iffalse,
flip_x_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- result_MUX_uxn_device_h_l110_c7_ff60
result_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l110_c7_ff60_cond,
result_MUX_uxn_device_h_l110_c7_ff60_iftrue,
result_MUX_uxn_device_h_l110_c7_ff60_iffalse,
result_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- ctrl_MUX_uxn_device_h_l110_c7_ff60
ctrl_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l110_c7_ff60_cond,
ctrl_MUX_uxn_device_h_l110_c7_ff60_iftrue,
ctrl_MUX_uxn_device_h_l110_c7_ff60_iffalse,
ctrl_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- auto_advance_MUX_uxn_device_h_l110_c7_ff60
auto_advance_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l110_c7_ff60_cond,
auto_advance_MUX_uxn_device_h_l110_c7_ff60_iftrue,
auto_advance_MUX_uxn_device_h_l110_c7_ff60_iffalse,
auto_advance_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- layer_MUX_uxn_device_h_l110_c7_ff60
layer_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l110_c7_ff60_cond,
layer_MUX_uxn_device_h_l110_c7_ff60_iftrue,
layer_MUX_uxn_device_h_l110_c7_ff60_iffalse,
layer_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- flip_y_MUX_uxn_device_h_l110_c7_ff60
flip_y_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l110_c7_ff60_cond,
flip_y_MUX_uxn_device_h_l110_c7_ff60_iftrue,
flip_y_MUX_uxn_device_h_l110_c7_ff60_iffalse,
flip_y_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- ram_addr_MUX_uxn_device_h_l110_c7_ff60
ram_addr_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l110_c7_ff60_cond,
ram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue,
ram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse,
ram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60
is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond,
is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue,
is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse,
is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- vram_addr_MUX_uxn_device_h_l110_c7_ff60
vram_addr_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l110_c7_ff60_cond,
vram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue,
vram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse,
vram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- y_MUX_uxn_device_h_l110_c7_ff60
y_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l110_c7_ff60_cond,
y_MUX_uxn_device_h_l110_c7_ff60_iftrue,
y_MUX_uxn_device_h_l110_c7_ff60_iffalse,
y_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- x_MUX_uxn_device_h_l110_c7_ff60
x_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l110_c7_ff60_cond,
x_MUX_uxn_device_h_l110_c7_ff60_iftrue,
x_MUX_uxn_device_h_l110_c7_ff60_iffalse,
x_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- ctrl_mode_MUX_uxn_device_h_l110_c7_ff60
ctrl_mode_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_cond,
ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iftrue,
ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iffalse,
ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- color_MUX_uxn_device_h_l110_c7_ff60
color_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l110_c7_ff60_cond,
color_MUX_uxn_device_h_l110_c7_ff60_iftrue,
color_MUX_uxn_device_h_l110_c7_ff60_iffalse,
color_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60
is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond,
is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue,
is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse,
is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_592b
BIN_OP_EQ_uxn_device_h_l114_c11_592b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_592b_left,
BIN_OP_EQ_uxn_device_h_l114_c11_592b_right,
BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_return_output);

-- flip_x_MUX_uxn_device_h_l114_c7_dff8
flip_x_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l114_c7_dff8_cond,
flip_x_MUX_uxn_device_h_l114_c7_dff8_iftrue,
flip_x_MUX_uxn_device_h_l114_c7_dff8_iffalse,
flip_x_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- result_MUX_uxn_device_h_l114_c7_dff8
result_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l114_c7_dff8_cond,
result_MUX_uxn_device_h_l114_c7_dff8_iftrue,
result_MUX_uxn_device_h_l114_c7_dff8_iffalse,
result_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- ctrl_MUX_uxn_device_h_l114_c7_dff8
ctrl_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l114_c7_dff8_cond,
ctrl_MUX_uxn_device_h_l114_c7_dff8_iftrue,
ctrl_MUX_uxn_device_h_l114_c7_dff8_iffalse,
ctrl_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_dff8
auto_advance_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_dff8_cond,
auto_advance_MUX_uxn_device_h_l114_c7_dff8_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_dff8_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- layer_MUX_uxn_device_h_l114_c7_dff8
layer_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l114_c7_dff8_cond,
layer_MUX_uxn_device_h_l114_c7_dff8_iftrue,
layer_MUX_uxn_device_h_l114_c7_dff8_iffalse,
layer_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- flip_y_MUX_uxn_device_h_l114_c7_dff8
flip_y_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l114_c7_dff8_cond,
flip_y_MUX_uxn_device_h_l114_c7_dff8_iftrue,
flip_y_MUX_uxn_device_h_l114_c7_dff8_iffalse,
flip_y_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- ram_addr_MUX_uxn_device_h_l114_c7_dff8
ram_addr_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l114_c7_dff8_cond,
ram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue,
ram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse,
ram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8
is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond,
is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue,
is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse,
is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_dff8
vram_addr_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_dff8_cond,
vram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- y_MUX_uxn_device_h_l114_c7_dff8
y_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_dff8_cond,
y_MUX_uxn_device_h_l114_c7_dff8_iftrue,
y_MUX_uxn_device_h_l114_c7_dff8_iffalse,
y_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- x_MUX_uxn_device_h_l114_c7_dff8
x_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l114_c7_dff8_cond,
x_MUX_uxn_device_h_l114_c7_dff8_iftrue,
x_MUX_uxn_device_h_l114_c7_dff8_iffalse,
x_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- ctrl_mode_MUX_uxn_device_h_l114_c7_dff8
ctrl_mode_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_cond,
ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iftrue,
ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iffalse,
ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- color_MUX_uxn_device_h_l114_c7_dff8
color_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l114_c7_dff8_cond,
color_MUX_uxn_device_h_l114_c7_dff8_iftrue,
color_MUX_uxn_device_h_l114_c7_dff8_iffalse,
color_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8
is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond,
is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue,
is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse,
is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output);

-- CONST_SR_8_uxn_device_h_l115_c37_a200
CONST_SR_8_uxn_device_h_l115_c37_a200 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l115_c37_a200_x,
CONST_SR_8_uxn_device_h_l115_c37_a200_return_output);

-- MUX_uxn_device_h_l115_c10_5052
MUX_uxn_device_h_l115_c10_5052 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l115_c10_5052_cond,
MUX_uxn_device_h_l115_c10_5052_iftrue,
MUX_uxn_device_h_l115_c10_5052_iffalse,
MUX_uxn_device_h_l115_c10_5052_return_output);

-- CONST_SR_7_uxn_device_h_l117_c25_e94a
CONST_SR_7_uxn_device_h_l117_c25_e94a : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l117_c25_e94a_x,
CONST_SR_7_uxn_device_h_l117_c25_e94a_return_output);

-- CONST_SR_6_uxn_device_h_l118_c21_37b2
CONST_SR_6_uxn_device_h_l118_c21_37b2 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l118_c21_37b2_x,
CONST_SR_6_uxn_device_h_l118_c21_37b2_return_output);

-- CONST_SR_5_uxn_device_h_l119_c22_587c
CONST_SR_5_uxn_device_h_l119_c22_587c : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l119_c22_587c_x,
CONST_SR_5_uxn_device_h_l119_c22_587c_return_output);

-- CONST_SR_4_uxn_device_h_l120_c22_930b
CONST_SR_4_uxn_device_h_l120_c22_930b : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l120_c22_930b_x,
CONST_SR_4_uxn_device_h_l120_c22_930b_return_output);

-- BIN_OP_EQ_uxn_device_h_l123_c11_4005
BIN_OP_EQ_uxn_device_h_l123_c11_4005 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l123_c11_4005_left,
BIN_OP_EQ_uxn_device_h_l123_c11_4005_right,
BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- result_MUX_uxn_device_h_l123_c7_67de
result_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l123_c7_67de_cond,
result_MUX_uxn_device_h_l123_c7_67de_iftrue,
result_MUX_uxn_device_h_l123_c7_67de_iffalse,
result_MUX_uxn_device_h_l123_c7_67de_return_output);

-- auto_advance_MUX_uxn_device_h_l123_c7_67de
auto_advance_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l123_c7_67de_cond,
auto_advance_MUX_uxn_device_h_l123_c7_67de_iftrue,
auto_advance_MUX_uxn_device_h_l123_c7_67de_iffalse,
auto_advance_MUX_uxn_device_h_l123_c7_67de_return_output);

-- ram_addr_MUX_uxn_device_h_l123_c7_67de
ram_addr_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l123_c7_67de_cond,
ram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue,
ram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse,
ram_addr_MUX_uxn_device_h_l123_c7_67de_return_output);

-- is_y_onscreen_MUX_uxn_device_h_l123_c7_67de
is_y_onscreen_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_cond,
is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue,
is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse,
is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output);

-- vram_addr_MUX_uxn_device_h_l123_c7_67de
vram_addr_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l123_c7_67de_cond,
vram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue,
vram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse,
vram_addr_MUX_uxn_device_h_l123_c7_67de_return_output);

-- y_MUX_uxn_device_h_l123_c7_67de
y_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l123_c7_67de_cond,
y_MUX_uxn_device_h_l123_c7_67de_iftrue,
y_MUX_uxn_device_h_l123_c7_67de_iffalse,
y_MUX_uxn_device_h_l123_c7_67de_return_output);

-- x_MUX_uxn_device_h_l123_c7_67de
x_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l123_c7_67de_cond,
x_MUX_uxn_device_h_l123_c7_67de_iftrue,
x_MUX_uxn_device_h_l123_c7_67de_iffalse,
x_MUX_uxn_device_h_l123_c7_67de_return_output);

-- is_x_onscreen_MUX_uxn_device_h_l123_c7_67de
is_x_onscreen_MUX_uxn_device_h_l123_c7_67de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_cond,
is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue,
is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse,
is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output);

-- BIN_OP_LT_uxn_device_h_l125_c19_80a6
BIN_OP_LT_uxn_device_h_l125_c19_80a6 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l125_c19_80a6_left,
BIN_OP_LT_uxn_device_h_l125_c19_80a6_right,
BIN_OP_LT_uxn_device_h_l125_c19_80a6_return_output);

-- MUX_uxn_device_h_l125_c19_b545
MUX_uxn_device_h_l125_c19_b545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l125_c19_b545_cond,
MUX_uxn_device_h_l125_c19_b545_iftrue,
MUX_uxn_device_h_l125_c19_b545_iffalse,
MUX_uxn_device_h_l125_c19_b545_return_output);

-- BIN_OP_EQ_uxn_device_h_l129_c11_6177
BIN_OP_EQ_uxn_device_h_l129_c11_6177 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l129_c11_6177_left,
BIN_OP_EQ_uxn_device_h_l129_c11_6177_right,
BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_return_output);

-- result_MUX_uxn_device_h_l129_c7_38ee
result_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l129_c7_38ee_cond,
result_MUX_uxn_device_h_l129_c7_38ee_iftrue,
result_MUX_uxn_device_h_l129_c7_38ee_iffalse,
result_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- auto_advance_MUX_uxn_device_h_l129_c7_38ee
auto_advance_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l129_c7_38ee_cond,
auto_advance_MUX_uxn_device_h_l129_c7_38ee_iftrue,
auto_advance_MUX_uxn_device_h_l129_c7_38ee_iffalse,
auto_advance_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- ram_addr_MUX_uxn_device_h_l129_c7_38ee
ram_addr_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l129_c7_38ee_cond,
ram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue,
ram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse,
ram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee
is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_cond,
is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iftrue,
is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iffalse,
is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- vram_addr_MUX_uxn_device_h_l129_c7_38ee
vram_addr_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l129_c7_38ee_cond,
vram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue,
vram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse,
vram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- y_MUX_uxn_device_h_l129_c7_38ee
y_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l129_c7_38ee_cond,
y_MUX_uxn_device_h_l129_c7_38ee_iftrue,
y_MUX_uxn_device_h_l129_c7_38ee_iffalse,
y_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- x_MUX_uxn_device_h_l129_c7_38ee
x_MUX_uxn_device_h_l129_c7_38ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l129_c7_38ee_cond,
x_MUX_uxn_device_h_l129_c7_38ee_iftrue,
x_MUX_uxn_device_h_l129_c7_38ee_iffalse,
x_MUX_uxn_device_h_l129_c7_38ee_return_output);

-- BIN_OP_LT_uxn_device_h_l131_c19_b877
BIN_OP_LT_uxn_device_h_l131_c19_b877 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l131_c19_b877_left,
BIN_OP_LT_uxn_device_h_l131_c19_b877_right,
BIN_OP_LT_uxn_device_h_l131_c19_b877_return_output);

-- MUX_uxn_device_h_l131_c19_52a1
MUX_uxn_device_h_l131_c19_52a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l131_c19_52a1_cond,
MUX_uxn_device_h_l131_c19_52a1_iftrue,
MUX_uxn_device_h_l131_c19_52a1_iffalse,
MUX_uxn_device_h_l131_c19_52a1_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6
result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_cond,
result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c3_79d6
result_vram_address_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c3_79d6_cond,
result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6
result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6
result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- result_u8_value_MUX_uxn_device_h_l134_c3_79d6
result_u8_value_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l134_c3_79d6_cond,
result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iftrue,
result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iffalse,
result_u8_value_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- vram_addr_MUX_uxn_device_h_l134_c3_79d6
vram_addr_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l134_c3_79d6_cond,
vram_addr_MUX_uxn_device_h_l134_c3_79d6_iftrue,
vram_addr_MUX_uxn_device_h_l134_c3_79d6_iffalse,
vram_addr_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- y_MUX_uxn_device_h_l134_c3_79d6
y_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c3_79d6_cond,
y_MUX_uxn_device_h_l134_c3_79d6_iftrue,
y_MUX_uxn_device_h_l134_c3_79d6_iffalse,
y_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- x_MUX_uxn_device_h_l134_c3_79d6
x_MUX_uxn_device_h_l134_c3_79d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l134_c3_79d6_cond,
x_MUX_uxn_device_h_l134_c3_79d6_iftrue,
x_MUX_uxn_device_h_l134_c3_79d6_iffalse,
x_MUX_uxn_device_h_l134_c3_79d6_return_output);

-- BIN_OP_AND_uxn_device_h_l136_c32_113c
BIN_OP_AND_uxn_device_h_l136_c32_113c : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l136_c32_113c_left,
BIN_OP_AND_uxn_device_h_l136_c32_113c_right,
BIN_OP_AND_uxn_device_h_l136_c32_113c_return_output);

-- result_vram_address_MUX_uxn_device_h_l138_c4_c69b
result_vram_address_MUX_uxn_device_h_l138_c4_c69b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l138_c4_c69b_cond,
result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iftrue,
result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iffalse,
result_vram_address_MUX_uxn_device_h_l138_c4_c69b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b
result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_cond,
result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_return_output);

-- vram_addr_MUX_uxn_device_h_l138_c4_c69b
vram_addr_MUX_uxn_device_h_l138_c4_c69b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l138_c4_c69b_cond,
vram_addr_MUX_uxn_device_h_l138_c4_c69b_iftrue,
vram_addr_MUX_uxn_device_h_l138_c4_c69b_iffalse,
vram_addr_MUX_uxn_device_h_l138_c4_c69b_return_output);

-- y_MUX_uxn_device_h_l138_c4_c69b
y_MUX_uxn_device_h_l138_c4_c69b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c4_c69b_cond,
y_MUX_uxn_device_h_l138_c4_c69b_iftrue,
y_MUX_uxn_device_h_l138_c4_c69b_iffalse,
y_MUX_uxn_device_h_l138_c4_c69b_return_output);

-- x_MUX_uxn_device_h_l138_c4_c69b
x_MUX_uxn_device_h_l138_c4_c69b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l138_c4_c69b_cond,
x_MUX_uxn_device_h_l138_c4_c69b_iftrue,
x_MUX_uxn_device_h_l138_c4_c69b_iffalse,
x_MUX_uxn_device_h_l138_c4_c69b_return_output);

-- MUX_uxn_device_h_l139_c9_9514
MUX_uxn_device_h_l139_c9_9514 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l139_c9_9514_cond,
MUX_uxn_device_h_l139_c9_9514_iftrue,
MUX_uxn_device_h_l139_c9_9514_iffalse,
MUX_uxn_device_h_l139_c9_9514_return_output);

-- MUX_uxn_device_h_l140_c9_876d
MUX_uxn_device_h_l140_c9_876d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l140_c9_876d_cond,
MUX_uxn_device_h_l140_c9_876d_iftrue,
MUX_uxn_device_h_l140_c9_876d_iffalse,
MUX_uxn_device_h_l140_c9_876d_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb
BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb : entity work.BIN_OP_INFERRED_MULT_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_return_output);

-- BIN_OP_PLUS_uxn_device_h_l141_c18_375e
BIN_OP_PLUS_uxn_device_h_l141_c18_375e : entity work.BIN_OP_PLUS_uint48_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l141_c18_375e_left,
BIN_OP_PLUS_uxn_device_h_l141_c18_375e_right,
BIN_OP_PLUS_uxn_device_h_l141_c18_375e_return_output);

-- BIN_OP_AND_uxn_device_h_l142_c5_11f7
BIN_OP_AND_uxn_device_h_l142_c5_11f7 : entity work.BIN_OP_AND_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l142_c5_11f7_left,
BIN_OP_AND_uxn_device_h_l142_c5_11f7_right,
BIN_OP_AND_uxn_device_h_l142_c5_11f7_return_output);

-- MUX_uxn_device_h_l143_c19_858b
MUX_uxn_device_h_l143_c19_858b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l143_c19_858b_cond,
MUX_uxn_device_h_l143_c19_858b_iftrue,
MUX_uxn_device_h_l143_c19_858b_iffalse,
MUX_uxn_device_h_l143_c19_858b_return_output);

-- BIN_OP_OR_uxn_device_h_l143_c5_8e5d
BIN_OP_OR_uxn_device_h_l143_c5_8e5d : entity work.BIN_OP_OR_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l143_c5_8e5d_left,
BIN_OP_OR_uxn_device_h_l143_c5_8e5d_right,
BIN_OP_OR_uxn_device_h_l143_c5_8e5d_return_output);

-- MUX_uxn_device_h_l144_c19_4890
MUX_uxn_device_h_l144_c19_4890 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l144_c19_4890_cond,
MUX_uxn_device_h_l144_c19_4890_iftrue,
MUX_uxn_device_h_l144_c19_4890_iffalse,
MUX_uxn_device_h_l144_c19_4890_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c5_e56d
BIN_OP_OR_uxn_device_h_l144_c5_e56d : entity work.BIN_OP_OR_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c5_e56d_left,
BIN_OP_OR_uxn_device_h_l144_c5_e56d_right,
BIN_OP_OR_uxn_device_h_l144_c5_e56d_return_output);

-- BIN_OP_OR_uxn_device_h_l145_c5_7d73
BIN_OP_OR_uxn_device_h_l145_c5_7d73 : entity work.BIN_OP_OR_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l145_c5_7d73_left,
BIN_OP_OR_uxn_device_h_l145_c5_7d73_right,
BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output);

-- BIN_OP_AND_uxn_device_h_l148_c15_64b4
BIN_OP_AND_uxn_device_h_l148_c15_64b4 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l148_c15_64b4_left,
BIN_OP_AND_uxn_device_h_l148_c15_64b4_right,
BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output);

-- result_vram_address_MUX_uxn_device_h_l148_c11_db74
result_vram_address_MUX_uxn_device_h_l148_c11_db74 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l148_c11_db74_cond,
result_vram_address_MUX_uxn_device_h_l148_c11_db74_iftrue,
result_vram_address_MUX_uxn_device_h_l148_c11_db74_iffalse,
result_vram_address_MUX_uxn_device_h_l148_c11_db74_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l148_c11_db74
result_is_vram_write_MUX_uxn_device_h_l148_c11_db74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_cond,
result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iftrue,
result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iffalse,
result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e : entity work.BIN_OP_INFERRED_MULT_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l149_c28_6c56
BIN_OP_PLUS_uxn_device_h_l149_c28_6c56 : entity work.BIN_OP_PLUS_uint48_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_left,
BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_right,
BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_return_output);

-- BIN_OP_EQ_uxn_device_h_l154_c11_0abb
BIN_OP_EQ_uxn_device_h_l154_c11_0abb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l154_c11_0abb_left,
BIN_OP_EQ_uxn_device_h_l154_c11_0abb_right,
BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_return_output);

-- result_MUX_uxn_device_h_l154_c7_2b80
result_MUX_uxn_device_h_l154_c7_2b80 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l154_c7_2b80_cond,
result_MUX_uxn_device_h_l154_c7_2b80_iftrue,
result_MUX_uxn_device_h_l154_c7_2b80_iffalse,
result_MUX_uxn_device_h_l154_c7_2b80_return_output);

-- auto_advance_MUX_uxn_device_h_l154_c7_2b80
auto_advance_MUX_uxn_device_h_l154_c7_2b80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l154_c7_2b80_cond,
auto_advance_MUX_uxn_device_h_l154_c7_2b80_iftrue,
auto_advance_MUX_uxn_device_h_l154_c7_2b80_iffalse,
auto_advance_MUX_uxn_device_h_l154_c7_2b80_return_output);

-- ram_addr_MUX_uxn_device_h_l154_c7_2b80
ram_addr_MUX_uxn_device_h_l154_c7_2b80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l154_c7_2b80_cond,
ram_addr_MUX_uxn_device_h_l154_c7_2b80_iftrue,
ram_addr_MUX_uxn_device_h_l154_c7_2b80_iffalse,
ram_addr_MUX_uxn_device_h_l154_c7_2b80_return_output);

-- x_MUX_uxn_device_h_l154_c7_2b80
x_MUX_uxn_device_h_l154_c7_2b80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l154_c7_2b80_cond,
x_MUX_uxn_device_h_l154_c7_2b80_iftrue,
x_MUX_uxn_device_h_l154_c7_2b80_iffalse,
x_MUX_uxn_device_h_l154_c7_2b80_return_output);

-- result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf
result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_cond,
result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iftrue,
result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iffalse,
result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- result_vram_address_MUX_uxn_device_h_l159_c3_48cf
result_vram_address_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l159_c3_48cf_cond,
result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue,
result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse,
result_vram_address_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf
result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_cond,
result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf
result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_cond,
result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue,
result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse,
result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- result_u16_value_MUX_uxn_device_h_l159_c3_48cf
result_u16_value_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_device_h_l159_c3_48cf_cond,
result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iftrue,
result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iffalse,
result_u16_value_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf
result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_cond,
result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf
result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_cond,
result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- x_MUX_uxn_device_h_l159_c3_48cf
x_MUX_uxn_device_h_l159_c3_48cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l159_c3_48cf_cond,
x_MUX_uxn_device_h_l159_c3_48cf_iftrue,
x_MUX_uxn_device_h_l159_c3_48cf_iffalse,
x_MUX_uxn_device_h_l159_c3_48cf_return_output);

-- result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89
result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_cond,
result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iftrue,
result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iffalse,
result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89
result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_cond,
result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iftrue,
result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iffalse,
result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_return_output);

-- result_u16_value_MUX_uxn_device_h_l162_c4_bd89
result_u16_value_MUX_uxn_device_h_l162_c4_bd89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_device_h_l162_c4_bd89_cond,
result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iftrue,
result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iffalse,
result_u16_value_MUX_uxn_device_h_l162_c4_bd89_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89
result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_cond,
result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iftrue,
result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iffalse,
result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89
result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_cond,
result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_return_output);

-- x_MUX_uxn_device_h_l162_c4_bd89
x_MUX_uxn_device_h_l162_c4_bd89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l162_c4_bd89_cond,
x_MUX_uxn_device_h_l162_c4_bd89_iftrue,
x_MUX_uxn_device_h_l162_c4_bd89_iffalse,
x_MUX_uxn_device_h_l162_c4_bd89_return_output);

-- BIN_OP_AND_uxn_device_h_l166_c15_ac06
BIN_OP_AND_uxn_device_h_l166_c15_ac06 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l166_c15_ac06_left,
BIN_OP_AND_uxn_device_h_l166_c15_ac06_right,
BIN_OP_AND_uxn_device_h_l166_c15_ac06_return_output);

-- BIN_OP_NEQ_uxn_device_h_l166_c15_424e
BIN_OP_NEQ_uxn_device_h_l166_c15_424e : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l166_c15_424e_left,
BIN_OP_NEQ_uxn_device_h_l166_c15_424e_right,
BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l166_c11_80de
result_device_ram_address_MUX_uxn_device_h_l166_c11_80de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_cond,
result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iftrue,
result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iffalse,
result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de
result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_cond,
result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_return_output);

-- result_u16_value_MUX_uxn_device_h_l166_c11_80de
result_u16_value_MUX_uxn_device_h_l166_c11_80de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_device_h_l166_c11_80de_cond,
result_u16_value_MUX_uxn_device_h_l166_c11_80de_iftrue,
result_u16_value_MUX_uxn_device_h_l166_c11_80de_iffalse,
result_u16_value_MUX_uxn_device_h_l166_c11_80de_return_output);

-- x_MUX_uxn_device_h_l166_c11_80de
x_MUX_uxn_device_h_l166_c11_80de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l166_c11_80de_cond,
x_MUX_uxn_device_h_l166_c11_80de_iftrue,
x_MUX_uxn_device_h_l166_c11_80de_iffalse,
x_MUX_uxn_device_h_l166_c11_80de_return_output);

-- BIN_OP_PLUS_uxn_device_h_l167_c5_ef00
BIN_OP_PLUS_uxn_device_h_l167_c5_ef00 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_left,
BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_right,
BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c11_6928
BIN_OP_EQ_uxn_device_h_l174_c11_6928 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c11_6928_left,
BIN_OP_EQ_uxn_device_h_l174_c11_6928_right,
BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_return_output);

-- result_MUX_uxn_device_h_l174_c7_8f85
result_MUX_uxn_device_h_l174_c7_8f85 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c7_8f85_cond,
result_MUX_uxn_device_h_l174_c7_8f85_iftrue,
result_MUX_uxn_device_h_l174_c7_8f85_iffalse,
result_MUX_uxn_device_h_l174_c7_8f85_return_output);

-- ram_addr_MUX_uxn_device_h_l174_c7_8f85
ram_addr_MUX_uxn_device_h_l174_c7_8f85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l174_c7_8f85_cond,
ram_addr_MUX_uxn_device_h_l174_c7_8f85_iftrue,
ram_addr_MUX_uxn_device_h_l174_c7_8f85_iffalse,
ram_addr_MUX_uxn_device_h_l174_c7_8f85_return_output);

-- result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7
result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_cond,
result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iftrue,
result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iffalse,
result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7
result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_cond,
result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_return_output);

-- result_u16_value_MUX_uxn_device_h_l176_c3_31b7
result_u16_value_MUX_uxn_device_h_l176_c3_31b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_device_h_l176_c3_31b7_cond,
result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iftrue,
result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iffalse,
result_u16_value_MUX_uxn_device_h_l176_c3_31b7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7
result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_cond,
result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_return_output);

-- CONST_SR_1_uxn_device_h_l178_c9_209f
CONST_SR_1_uxn_device_h_l178_c9_209f : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_device_h_l178_c9_209f_x,
CONST_SR_1_uxn_device_h_l178_c9_209f_return_output);

-- BIN_OP_AND_uxn_device_h_l178_c9_f7c1
BIN_OP_AND_uxn_device_h_l178_c9_f7c1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l178_c9_f7c1_left,
BIN_OP_AND_uxn_device_h_l178_c9_f7c1_right,
BIN_OP_AND_uxn_device_h_l178_c9_f7c1_return_output);

-- BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d
BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_left,
BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_right,
BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output);

-- result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8
result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_cond,
result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iftrue,
result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iffalse,
result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8
result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_cond,
result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_return_output);

-- result_u16_value_MUX_uxn_device_h_l178_c4_dce8
result_u16_value_MUX_uxn_device_h_l178_c4_dce8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_device_h_l178_c4_dce8_cond,
result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iftrue,
result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iffalse,
result_u16_value_MUX_uxn_device_h_l178_c4_dce8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8
result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_cond,
result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8
result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_cond,
result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_return_output);

-- result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e
result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_cond,
result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iftrue,
result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iffalse,
result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e
result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e
result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_cond,
result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_return_output);

-- BIN_OP_EQ_uxn_device_h_l194_c11_3e97
BIN_OP_EQ_uxn_device_h_l194_c11_3e97 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l194_c11_3e97_left,
BIN_OP_EQ_uxn_device_h_l194_c11_3e97_right,
BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_return_output);

-- result_MUX_uxn_device_h_l194_c7_20b4
result_MUX_uxn_device_h_l194_c7_20b4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l194_c7_20b4_cond,
result_MUX_uxn_device_h_l194_c7_20b4_iftrue,
result_MUX_uxn_device_h_l194_c7_20b4_iffalse,
result_MUX_uxn_device_h_l194_c7_20b4_return_output);

-- result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94
result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_cond,
result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iftrue,
result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iffalse,
result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94
result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_cond,
result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94
result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_cond,
result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iftrue,
result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iffalse,
result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee
result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_cond,
result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee
result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_cond,
result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- result_u16_value_MUX_uxn_device_h_l202_c3_ceee
result_u16_value_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_device_h_l202_c3_ceee_cond,
result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_u16_value_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee
result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_cond,
result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee
result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_cond,
result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- result_u8_value_MUX_uxn_device_h_l202_c3_ceee
result_u8_value_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l202_c3_ceee_cond,
result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_u8_value_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee
result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_cond,
result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- result_vram_address_MUX_uxn_device_h_l202_c3_ceee
result_vram_address_MUX_uxn_device_h_l202_c3_ceee : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l202_c3_ceee_cond,
result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue,
result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse,
result_vram_address_MUX_uxn_device_h_l202_c3_ceee_return_output);

-- BIN_OP_MINUS_uxn_device_h_l203_c58_9801
BIN_OP_MINUS_uxn_device_h_l203_c58_9801 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l203_c58_9801_left,
BIN_OP_MINUS_uxn_device_h_l203_c58_9801_right,
BIN_OP_MINUS_uxn_device_h_l203_c58_9801_return_output);

-- screen_blit_uxn_device_h_l203_c46_a081
screen_blit_uxn_device_h_l203_c46_a081 : entity work.screen_blit_0CLK_b1675d32 port map (
clk,
screen_blit_uxn_device_h_l203_c46_a081_CLOCK_ENABLE,
screen_blit_uxn_device_h_l203_c46_a081_phase,
screen_blit_uxn_device_h_l203_c46_a081_ctrl,
screen_blit_uxn_device_h_l203_c46_a081_auto_advance,
screen_blit_uxn_device_h_l203_c46_a081_x,
screen_blit_uxn_device_h_l203_c46_a081_y,
screen_blit_uxn_device_h_l203_c46_a081_ram_addr,
screen_blit_uxn_device_h_l203_c46_a081_previous_ram_read,
screen_blit_uxn_device_h_l203_c46_a081_return_output);



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
 is_x_onscreen,
 is_y_onscreen,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_return_output,
 is_sprite_port_MUX_uxn_device_h_l95_c2_425e_return_output,
 flip_x_MUX_uxn_device_h_l95_c2_425e_return_output,
 result_MUX_uxn_device_h_l95_c2_425e_return_output,
 ctrl_MUX_uxn_device_h_l95_c2_425e_return_output,
 auto_advance_MUX_uxn_device_h_l95_c2_425e_return_output,
 layer_MUX_uxn_device_h_l95_c2_425e_return_output,
 flip_y_MUX_uxn_device_h_l95_c2_425e_return_output,
 ram_addr_MUX_uxn_device_h_l95_c2_425e_return_output,
 is_drawing_port_MUX_uxn_device_h_l95_c2_425e_return_output,
 is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output,
 vram_addr_MUX_uxn_device_h_l95_c2_425e_return_output,
 is_pixel_port_MUX_uxn_device_h_l95_c2_425e_return_output,
 y_MUX_uxn_device_h_l95_c2_425e_return_output,
 x_MUX_uxn_device_h_l95_c2_425e_return_output,
 ctrl_mode_MUX_uxn_device_h_l95_c2_425e_return_output,
 color_MUX_uxn_device_h_l95_c2_425e_return_output,
 is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output,
 BIN_OP_EQ_uxn_device_h_l96_c19_b027_return_output,
 MUX_uxn_device_h_l96_c19_aa86_return_output,
 BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_return_output,
 MUX_uxn_device_h_l97_c20_1874_return_output,
 BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output,
 result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_return_output,
 result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_return_output,
 BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_return_output,
 flip_x_MUX_uxn_device_h_l110_c7_ff60_return_output,
 result_MUX_uxn_device_h_l110_c7_ff60_return_output,
 ctrl_MUX_uxn_device_h_l110_c7_ff60_return_output,
 auto_advance_MUX_uxn_device_h_l110_c7_ff60_return_output,
 layer_MUX_uxn_device_h_l110_c7_ff60_return_output,
 flip_y_MUX_uxn_device_h_l110_c7_ff60_return_output,
 ram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output,
 is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output,
 vram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output,
 y_MUX_uxn_device_h_l110_c7_ff60_return_output,
 x_MUX_uxn_device_h_l110_c7_ff60_return_output,
 ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_return_output,
 color_MUX_uxn_device_h_l110_c7_ff60_return_output,
 is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_return_output,
 flip_x_MUX_uxn_device_h_l114_c7_dff8_return_output,
 result_MUX_uxn_device_h_l114_c7_dff8_return_output,
 ctrl_MUX_uxn_device_h_l114_c7_dff8_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_dff8_return_output,
 layer_MUX_uxn_device_h_l114_c7_dff8_return_output,
 flip_y_MUX_uxn_device_h_l114_c7_dff8_return_output,
 ram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output,
 is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output,
 y_MUX_uxn_device_h_l114_c7_dff8_return_output,
 x_MUX_uxn_device_h_l114_c7_dff8_return_output,
 ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_return_output,
 color_MUX_uxn_device_h_l114_c7_dff8_return_output,
 is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output,
 CONST_SR_8_uxn_device_h_l115_c37_a200_return_output,
 MUX_uxn_device_h_l115_c10_5052_return_output,
 CONST_SR_7_uxn_device_h_l117_c25_e94a_return_output,
 CONST_SR_6_uxn_device_h_l118_c21_37b2_return_output,
 CONST_SR_5_uxn_device_h_l119_c22_587c_return_output,
 CONST_SR_4_uxn_device_h_l120_c22_930b_return_output,
 BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_return_output,
 result_MUX_uxn_device_h_l123_c7_67de_return_output,
 auto_advance_MUX_uxn_device_h_l123_c7_67de_return_output,
 ram_addr_MUX_uxn_device_h_l123_c7_67de_return_output,
 is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output,
 vram_addr_MUX_uxn_device_h_l123_c7_67de_return_output,
 y_MUX_uxn_device_h_l123_c7_67de_return_output,
 x_MUX_uxn_device_h_l123_c7_67de_return_output,
 is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output,
 BIN_OP_LT_uxn_device_h_l125_c19_80a6_return_output,
 MUX_uxn_device_h_l125_c19_b545_return_output,
 BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_return_output,
 result_MUX_uxn_device_h_l129_c7_38ee_return_output,
 auto_advance_MUX_uxn_device_h_l129_c7_38ee_return_output,
 ram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output,
 is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_return_output,
 vram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output,
 y_MUX_uxn_device_h_l129_c7_38ee_return_output,
 x_MUX_uxn_device_h_l129_c7_38ee_return_output,
 BIN_OP_LT_uxn_device_h_l131_c19_b877_return_output,
 MUX_uxn_device_h_l131_c19_52a1_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c3_79d6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_return_output,
 result_u8_value_MUX_uxn_device_h_l134_c3_79d6_return_output,
 vram_addr_MUX_uxn_device_h_l134_c3_79d6_return_output,
 y_MUX_uxn_device_h_l134_c3_79d6_return_output,
 x_MUX_uxn_device_h_l134_c3_79d6_return_output,
 BIN_OP_AND_uxn_device_h_l136_c32_113c_return_output,
 result_vram_address_MUX_uxn_device_h_l138_c4_c69b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_return_output,
 vram_addr_MUX_uxn_device_h_l138_c4_c69b_return_output,
 y_MUX_uxn_device_h_l138_c4_c69b_return_output,
 x_MUX_uxn_device_h_l138_c4_c69b_return_output,
 MUX_uxn_device_h_l139_c9_9514_return_output,
 MUX_uxn_device_h_l140_c9_876d_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_return_output,
 BIN_OP_PLUS_uxn_device_h_l141_c18_375e_return_output,
 BIN_OP_AND_uxn_device_h_l142_c5_11f7_return_output,
 MUX_uxn_device_h_l143_c19_858b_return_output,
 BIN_OP_OR_uxn_device_h_l143_c5_8e5d_return_output,
 MUX_uxn_device_h_l144_c19_4890_return_output,
 BIN_OP_OR_uxn_device_h_l144_c5_e56d_return_output,
 BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output,
 BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output,
 result_vram_address_MUX_uxn_device_h_l148_c11_db74_return_output,
 result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_return_output,
 BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_return_output,
 BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_return_output,
 result_MUX_uxn_device_h_l154_c7_2b80_return_output,
 auto_advance_MUX_uxn_device_h_l154_c7_2b80_return_output,
 ram_addr_MUX_uxn_device_h_l154_c7_2b80_return_output,
 x_MUX_uxn_device_h_l154_c7_2b80_return_output,
 result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_return_output,
 result_vram_address_MUX_uxn_device_h_l159_c3_48cf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_return_output,
 result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_return_output,
 result_u16_value_MUX_uxn_device_h_l159_c3_48cf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_return_output,
 x_MUX_uxn_device_h_l159_c3_48cf_return_output,
 result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_return_output,
 result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_return_output,
 result_u16_value_MUX_uxn_device_h_l162_c4_bd89_return_output,
 result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_return_output,
 x_MUX_uxn_device_h_l162_c4_bd89_return_output,
 BIN_OP_AND_uxn_device_h_l166_c15_ac06_return_output,
 BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_return_output,
 result_u16_value_MUX_uxn_device_h_l166_c11_80de_return_output,
 x_MUX_uxn_device_h_l166_c11_80de_return_output,
 BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_return_output,
 result_MUX_uxn_device_h_l174_c7_8f85_return_output,
 ram_addr_MUX_uxn_device_h_l174_c7_8f85_return_output,
 result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_return_output,
 result_u16_value_MUX_uxn_device_h_l176_c3_31b7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_return_output,
 CONST_SR_1_uxn_device_h_l178_c9_209f_return_output,
 BIN_OP_AND_uxn_device_h_l178_c9_f7c1_return_output,
 BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output,
 result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_return_output,
 result_u16_value_MUX_uxn_device_h_l178_c4_dce8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_return_output,
 result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_return_output,
 BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_return_output,
 result_MUX_uxn_device_h_l194_c7_20b4_return_output,
 result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_return_output,
 result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_return_output,
 result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_return_output,
 result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_return_output,
 result_u16_value_MUX_uxn_device_h_l202_c3_ceee_return_output,
 result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_return_output,
 result_u8_value_MUX_uxn_device_h_l202_c3_ceee_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_return_output,
 result_vram_address_MUX_uxn_device_h_l202_c3_ceee_return_output,
 BIN_OP_MINUS_uxn_device_h_l203_c58_9801_return_output,
 screen_blit_uxn_device_h_l203_c46_a081_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l95_c2_425e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e1b0_uxn_device_h_l95_c2_425e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_425e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l110_c7_ff60_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_425e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_uxn_device_h_l101_c3_a5ad : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_aa86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_aa86_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_aa86_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l96_c19_aa86_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_1874_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_1874_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_1874_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l97_c20_1874_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l110_c7_ff60_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l110_c7_ff60_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l110_c7_ff60_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_dff8_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l114_c7_dff8_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_dff8_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_dff8_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l123_c7_67de_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c10_5052_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c10_5052_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c10_5052_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l115_c37_a200_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l115_c37_a200_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l115_c27_257f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l115_c10_5052_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l116_c11_9455_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l117_c25_e94a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l117_c25_e94a_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l117_c15_90ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l118_c21_37b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l118_c21_37b2_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l118_c11_4936_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l119_c22_587c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l119_c22_587c_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_d1c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l120_c22_930b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l120_c22_930b_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l120_c12_5a18_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l123_c7_67de_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_92fc_uxn_device_h_l123_c7_67de_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l123_c7_67de_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l129_c7_38ee_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l129_c7_38ee_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l125_c19_b545_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l125_c19_b545_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l125_c19_b545_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l125_c19_b545_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l129_c7_38ee_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_198a_uxn_device_h_l129_c7_38ee_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l129_c7_38ee_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l154_c7_2b80_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l129_c7_38ee_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l129_c7_38ee_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c7_2b80_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l129_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l131_c19_52a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l131_c19_52a1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l131_c19_52a1_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l131_c19_52a1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l135_c4_aeea : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l134_c3_79d6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c4_c69b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l134_c3_79d6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l134_c3_79d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l136_c22_f0c9_return_output : unsigned(7 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(23 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c4_c69b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c4_c69b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l138_c4_c69b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c9_9514_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c9_9514_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c9_9514_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l139_c9_9514_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c9_876d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c9_876d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c9_876d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l140_c9_876d_return_output : unsigned(15 downto 0);
 variable VAR_vram_addr_uxn_device_h_l141_c5_44e8 : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_device_h_l141_c18_5fb9_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_left : unsigned(47 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_device_h_l141_c54_46cf_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_return_output : unsigned(48 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_left : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c19_858b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c19_858b_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c19_858b_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l143_c19_858b_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_left : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c19_4890_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c19_4890_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c19_4890_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_device_h_l144_c19_4890_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l149_c5_ade1 : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_device_h_l149_c28_e57c_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_left : unsigned(47 downto 0);
 variable VAR_CAST_TO_uint24_t_uxn_device_h_l149_c64_506c_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_return_output : unsigned(48 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l154_c7_2b80_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4c5d_uxn_device_h_l154_c7_2b80_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l154_c7_2b80_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_8f85_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c7_2b80_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c7_2b80_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l154_c7_2b80_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l157_c3_12a7 : unsigned(23 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l158_c3_eff0 : unsigned(7 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l161_c4_1c35 : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l159_c3_48cf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l162_c4_bd89_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l159_c3_48cf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l159_c3_48cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l162_c4_bd89_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l162_c4_bd89_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l166_c11_80de_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l162_c4_bd89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l166_c11_80de_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l167_c5_2b87 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l166_c11_80de_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l166_c11_80de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c7_8f85_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ddc9_uxn_device_h_l174_c7_8f85_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_8f85_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l194_c7_20b4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l174_c7_8f85_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_left : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l178_c9_209f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_uxn_device_h_l178_c9_209f_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l194_c7_20b4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_5bff_uxn_device_h_l194_c7_20b4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l194_c7_20b4_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0984_uxn_device_h_l194_c7_20b4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l194_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l205_c4_9f4a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l214_c4_8c60 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result : screen_blit_result_t;
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_phase : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_ctrl : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_auto_advance : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_x : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_y : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_return_output : unsigned(7 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output : screen_blit_result_t;
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_7b0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l207_c26_2549_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_a8ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_b4db_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l210_c23_1cf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l211_c25_8fa8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_device_h_l115_l155_DUPLICATE_7e83_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_5872_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_9786_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l202_l134_DUPLICATE_71cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l202_l134_DUPLICATE_da8b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l166_l159_l195_l188_DUPLICATE_90f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595_return_output : unsigned(0 downto 0);
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
variable REG_VAR_is_x_onscreen : unsigned(0 downto 0);
variable REG_VAR_is_y_onscreen : unsigned(0 downto 0);
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
  REG_VAR_is_x_onscreen := is_x_onscreen;
  REG_VAR_is_y_onscreen := is_y_onscreen;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l96_c19_aa86_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_right := to_unsigned(15728640, 24);
     VAR_MUX_uxn_device_h_l125_c19_b545_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l140_c9_876d_iffalse := to_unsigned(287, 16);
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_right := to_unsigned(14, 4);
     VAR_result_vram_address_uxn_device_h_l157_c3_12a7 := resize(to_unsigned(0, 1), 24);
     VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse := VAR_result_vram_address_uxn_device_h_l157_c3_12a7;
     VAR_MUX_uxn_device_h_l131_c19_52a1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_right := to_unsigned(262143, 24);
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iftrue := to_unsigned(46, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_right := to_unsigned(15, 4);
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l131_c19_52a1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l143_c19_858b_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_right := to_unsigned(320, 24);
     VAR_MUX_uxn_device_h_l144_c19_4890_iftrue := to_unsigned(262144, 24);
     VAR_result_device_ram_address_uxn_device_h_l135_c4_aeea := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue := VAR_result_device_ram_address_uxn_device_h_l135_c4_aeea;
     VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_right := to_unsigned(7, 8);
     VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_right := to_unsigned(320, 16);
     VAR_MUX_uxn_device_h_l139_c9_9514_iffalse := to_unsigned(319, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_right := to_unsigned(320, 24);
     VAR_result_vram_address_uxn_device_h_l161_c4_1c35 := resize(to_unsigned(0, 1), 24);
     VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue := VAR_result_vram_address_uxn_device_h_l161_c4_1c35;
     VAR_result_device_ram_address_uxn_device_h_l205_c4_9f4a := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue := VAR_result_device_ram_address_uxn_device_h_l205_c4_9f4a;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_right := to_unsigned(3, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_right := to_unsigned(0, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iftrue := to_unsigned(1, 1);
     VAR_result_u8_value_uxn_device_h_l158_c3_eff0 := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l97_c20_1874_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_right := to_unsigned(5, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iffalse := to_unsigned(1, 1);
     VAR_vram_addr_uxn_device_h_l101_c3_a5ad := resize(to_unsigned(0, 1), 24);
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue := VAR_vram_addr_uxn_device_h_l101_c3_a5ad;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_right := to_unsigned(8, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l97_c20_1874_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_right := to_unsigned(1, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l125_c19_b545_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_right := to_unsigned(2, 8);
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_right := to_unsigned(1, 8);
     VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l143_c19_858b_iftrue := to_unsigned(524288, 24);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_right := to_unsigned(4, 8);
     VAR_MUX_uxn_device_h_l144_c19_4890_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_right := to_unsigned(6, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_right := to_unsigned(1, 8);
     VAR_MUX_uxn_device_h_l96_c19_aa86_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l214_c4_8c60 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse := VAR_result_device_ram_address_uxn_device_h_l214_c4_8c60;
     VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_right := to_unsigned(288, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_right := to_unsigned(3, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_CLOCK_ENABLE;
     VAR_CONST_SR_1_uxn_device_h_l178_c9_209f_x := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_iftrue := auto_advance;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_auto_advance := auto_advance;
     VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_left := color;
     VAR_color_MUX_uxn_device_h_l110_c7_ff60_iftrue := color;
     VAR_color_MUX_uxn_device_h_l114_c7_dff8_iffalse := color;
     VAR_color_MUX_uxn_device_h_l95_c2_425e_iftrue := color;
     VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_iffalse := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_iftrue := ctrl;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_ctrl := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iffalse := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iftrue := ctrl_mode;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_cond := ctrl_mode;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_cond := ctrl_mode;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_cond := ctrl_mode;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_cond := ctrl_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_cond := ctrl_mode;
     VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_cond := ctrl_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_cond := ctrl_mode;
     VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_cond := ctrl_mode;
     VAR_x_MUX_uxn_device_h_l138_c4_c69b_cond := ctrl_mode;
     VAR_x_MUX_uxn_device_h_l162_c4_bd89_cond := ctrl_mode;
     VAR_y_MUX_uxn_device_h_l138_c4_c69b_cond := ctrl_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_left := VAR_device_port;
     VAR_MUX_uxn_device_h_l144_c19_4890_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_iffalse := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_iftrue := flip_x;
     VAR_MUX_uxn_device_h_l143_c19_858b_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_iffalse := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_iftrue := flip_y;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iffalse := is_drawing_port;
     VAR_MUX_uxn_device_h_l115_c10_5052_cond := is_pixel_port;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iffalse := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_cond := is_pixel_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_cond := is_pixel_port;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_cond := is_pixel_port;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_cond := is_pixel_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_cond := is_pixel_port;
     VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_x_MUX_uxn_device_h_l159_c3_48cf_cond := is_pixel_port;
     VAR_y_MUX_uxn_device_h_l134_c3_79d6_cond := is_pixel_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_cond := is_sprite_port;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iffalse := is_sprite_port;
     VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_cond := is_sprite_port;
     VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_cond := is_sprite_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_cond := is_sprite_port;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_cond := is_sprite_port;
     VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_left := is_x_onscreen;
     VAR_MUX_uxn_device_h_l139_c9_9514_cond := is_x_onscreen;
     VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue := is_x_onscreen;
     VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue := is_x_onscreen;
     VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse := is_x_onscreen;
     VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue := is_x_onscreen;
     VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue := is_y_onscreen;
     VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue := is_y_onscreen;
     VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue := is_y_onscreen;
     VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iffalse := is_y_onscreen;
     VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue := is_y_onscreen;
     VAR_layer_MUX_uxn_device_h_l110_c7_ff60_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l114_c7_dff8_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l95_c2_425e_iftrue := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_left := VAR_previous_device_ram_read;
     VAR_CONST_SR_8_uxn_device_h_l115_c37_a200_x := VAR_previous_device_ram_read;
     VAR_MUX_uxn_device_h_l140_c9_876d_iftrue := VAR_previous_device_ram_read;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_iftrue := VAR_previous_device_ram_read;
     VAR_x_MUX_uxn_device_h_l123_c7_67de_iftrue := VAR_previous_device_ram_read;
     VAR_y_MUX_uxn_device_h_l134_c3_79d6_iffalse := VAR_previous_device_ram_read;
     VAR_y_MUX_uxn_device_h_l138_c4_c69b_iffalse := VAR_previous_device_ram_read;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_previous_ram_read := VAR_previous_ram_read;
     VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue := ram_addr;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_ram_addr := ram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_iffalse := vram_addr;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_left := x;
     VAR_MUX_uxn_device_h_l139_c9_9514_iftrue := x;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_x := x;
     VAR_x_MUX_uxn_device_h_l110_c7_ff60_iftrue := x;
     VAR_x_MUX_uxn_device_h_l114_c7_dff8_iftrue := x;
     VAR_x_MUX_uxn_device_h_l134_c3_79d6_iffalse := x;
     VAR_x_MUX_uxn_device_h_l138_c4_c69b_iffalse := x;
     VAR_x_MUX_uxn_device_h_l154_c7_2b80_iffalse := x;
     VAR_x_MUX_uxn_device_h_l159_c3_48cf_iffalse := x;
     VAR_x_MUX_uxn_device_h_l162_c4_bd89_iftrue := x;
     VAR_x_MUX_uxn_device_h_l166_c11_80de_iffalse := x;
     VAR_x_MUX_uxn_device_h_l95_c2_425e_iftrue := x;
     VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iftrue := y;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_y := y;
     VAR_y_MUX_uxn_device_h_l110_c7_ff60_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_dff8_iftrue := y;
     VAR_y_MUX_uxn_device_h_l123_c7_67de_iftrue := y;
     VAR_y_MUX_uxn_device_h_l129_c7_38ee_iffalse := y;
     VAR_y_MUX_uxn_device_h_l95_c2_425e_iftrue := y;
     -- CAST_TO_uint8_t_uint16_t_uxn_device_h_l115_l155_DUPLICATE_7e83 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_device_h_l115_l155_DUPLICATE_7e83_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_9786 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_9786_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595_return_output := result.is_deo_done;

     -- MUX[uxn_device_h_l144_c19_4890] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l144_c19_4890_cond <= VAR_MUX_uxn_device_h_l144_c19_4890_cond;
     MUX_uxn_device_h_l144_c19_4890_iftrue <= VAR_MUX_uxn_device_h_l144_c19_4890_iftrue;
     MUX_uxn_device_h_l144_c19_4890_iffalse <= VAR_MUX_uxn_device_h_l144_c19_4890_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l144_c19_4890_return_output := MUX_uxn_device_h_l144_c19_4890_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_return_output := result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- BIN_OP_EQ[uxn_device_h_l123_c11_4005] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l123_c11_4005_left <= VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_left;
     BIN_OP_EQ_uxn_device_h_l123_c11_4005_right <= VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output := BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l203_c58_9801] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l203_c58_9801_left <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_left;
     BIN_OP_MINUS_uxn_device_h_l203_c58_9801_right <= VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_return_output := BIN_OP_MINUS_uxn_device_h_l203_c58_9801_return_output;

     -- BIN_OP_LT[uxn_device_h_l131_c19_b877] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l131_c19_b877_left <= VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_left;
     BIN_OP_LT_uxn_device_h_l131_c19_b877_right <= VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_return_output := BIN_OP_LT_uxn_device_h_l131_c19_b877_return_output;

     -- CAST_TO_uint24_t[uxn_device_h_l149_c28_e57c] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_device_h_l149_c28_e57c_return_output := CAST_TO_uint24_t_uint16_t(
     VAR_previous_device_ram_read);

     -- CONST_SR_8[uxn_device_h_l115_c37_a200] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l115_c37_a200_x <= VAR_CONST_SR_8_uxn_device_h_l115_c37_a200_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l115_c37_a200_return_output := CONST_SR_8_uxn_device_h_l115_c37_a200_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_cond;
     result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_return_output := result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- BIN_OP_LT[uxn_device_h_l125_c19_80a6] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l125_c19_80a6_left <= VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_left;
     BIN_OP_LT_uxn_device_h_l125_c19_80a6_right <= VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_return_output := BIN_OP_LT_uxn_device_h_l125_c19_80a6_return_output;

     -- BIN_OP_AND[uxn_device_h_l136_c32_113c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l136_c32_113c_left <= VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_left;
     BIN_OP_AND_uxn_device_h_l136_c32_113c_right <= VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_return_output := BIN_OP_AND_uxn_device_h_l136_c32_113c_return_output;

     -- MUX[uxn_device_h_l143_c19_858b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l143_c19_858b_cond <= VAR_MUX_uxn_device_h_l143_c19_858b_cond;
     MUX_uxn_device_h_l143_c19_858b_iftrue <= VAR_MUX_uxn_device_h_l143_c19_858b_iftrue;
     MUX_uxn_device_h_l143_c19_858b_iffalse <= VAR_MUX_uxn_device_h_l143_c19_858b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l143_c19_858b_return_output := MUX_uxn_device_h_l143_c19_858b_return_output;

     -- CAST_TO_uint24_t[uxn_device_h_l149_c64_506c] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_device_h_l149_c64_506c_return_output := CAST_TO_uint24_t_uint16_t(
     x);

     -- BIN_OP_PLUS[uxn_device_h_l167_c5_ef00] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_left <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_left;
     BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_right <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_return_output := BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_592b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_592b_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_592b_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l96_c19_b027] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l96_c19_b027_left <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_left;
     BIN_OP_EQ_uxn_device_h_l96_c19_b027_right <= VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_return_output := BIN_OP_EQ_uxn_device_h_l96_c19_b027_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_return_output := result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l202_l134_DUPLICATE_da8b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l202_l134_DUPLICATE_da8b_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l202_l134_DUPLICATE_71cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l202_l134_DUPLICATE_71cb_return_output := result.vram_write_layer;

     -- MUX[uxn_device_h_l139_c9_9514] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l139_c9_9514_cond <= VAR_MUX_uxn_device_h_l139_c9_9514_cond;
     MUX_uxn_device_h_l139_c9_9514_iftrue <= VAR_MUX_uxn_device_h_l139_c9_9514_iftrue;
     MUX_uxn_device_h_l139_c9_9514_iffalse <= VAR_MUX_uxn_device_h_l139_c9_9514_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l139_c9_9514_return_output := MUX_uxn_device_h_l139_c9_9514_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_92fc[uxn_device_h_l123_c7_67de] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_92fc_uxn_device_h_l123_c7_67de_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_92fc(
     result,
     to_unsigned(0, 1),
     to_unsigned(38, 8));

     -- BIN_OP_EQ[uxn_device_h_l154_c11_0abb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l154_c11_0abb_left <= VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_left;
     BIN_OP_EQ_uxn_device_h_l154_c11_0abb_right <= VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output := BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output;

     -- CONST_SR_1[uxn_device_h_l178_c9_209f] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_device_h_l178_c9_209f_x <= VAR_CONST_SR_1_uxn_device_h_l178_c9_209f_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_device_h_l178_c9_209f_return_output := CONST_SR_1_uxn_device_h_l178_c9_209f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l114_c7_dff8] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_dff8_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l110_c7_ff60] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l110_c7_ff60_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(40, 8));

     -- result_device_ram_address_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- result_vram_address_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_cond;
     result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_return_output := result_vram_address_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l194_c11_3e97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l194_c11_3e97_left <= VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_left;
     BIN_OP_EQ_uxn_device_h_l194_c11_3e97_right <= VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output := BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output := result.is_device_ram_16bit;

     -- BIN_OP_EQ[uxn_device_h_l97_c20_ecbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_left <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_left;
     BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_right <= VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_return_output := BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l129_c11_6177] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l129_c11_6177_left <= VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_left;
     BIN_OP_EQ_uxn_device_h_l129_c11_6177_right <= VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output := BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_device_h_l110_c11_76eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l110_c11_76eb_left <= VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_left;
     BIN_OP_EQ_uxn_device_h_l110_c11_76eb_right <= VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output := BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c11_6928] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c11_6928_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_left;
     BIN_OP_EQ_uxn_device_h_l174_c11_6928_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output := BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output;

     -- CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_5872 LATENCY=0
     VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_5872_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l95_c6_56f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l95_c6_56f3_left <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_left;
     BIN_OP_EQ_uxn_device_h_l95_c6_56f3_right <= VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output := BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l166_l159_l195_l188_DUPLICATE_90f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l166_l159_l195_l188_DUPLICATE_90f3_return_output := result.is_device_ram_write;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_color_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_layer_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_result_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_x_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_y_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l110_c11_76eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_592b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_result_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_x_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_y_MUX_uxn_device_h_l123_c7_67de_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4005_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_result_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_x_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_y_MUX_uxn_device_h_l129_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l129_c11_6177_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output;
     VAR_result_MUX_uxn_device_h_l154_c7_2b80_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output;
     VAR_x_MUX_uxn_device_h_l154_c7_2b80_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c11_0abb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_8f85_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c11_6928_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output;
     VAR_result_MUX_uxn_device_h_l194_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_3e97_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_425e_cond := VAR_BIN_OP_EQ_uxn_device_h_l95_c6_56f3_return_output;
     VAR_MUX_uxn_device_h_l96_c19_aa86_cond := VAR_BIN_OP_EQ_uxn_device_h_l96_c19_b027_return_output;
     VAR_MUX_uxn_device_h_l97_c20_1874_cond := VAR_BIN_OP_EQ_uxn_device_h_l97_c20_ecbf_return_output;
     VAR_MUX_uxn_device_h_l125_c19_b545_cond := VAR_BIN_OP_LT_uxn_device_h_l125_c19_80a6_return_output;
     VAR_MUX_uxn_device_h_l131_c19_52a1_cond := VAR_BIN_OP_LT_uxn_device_h_l131_c19_b877_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_phase := VAR_BIN_OP_MINUS_uxn_device_h_l203_c58_9801_return_output;
     VAR_x_uxn_device_h_l167_c5_2b87 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l167_c5_ef00_return_output, 16);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_left := VAR_CAST_TO_uint24_t_uxn_device_h_l149_c28_e57c_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_right := VAR_CAST_TO_uint24_t_uxn_device_h_l149_c64_506c_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_left := VAR_CAST_TO_uint8_t_uint16_t_uxn_device_h_l115_l155_DUPLICATE_7e83_return_output;
     VAR_MUX_uxn_device_h_l115_c10_5052_iffalse := VAR_CAST_TO_uint8_t_uint16_t_uxn_device_h_l115_l155_DUPLICATE_7e83_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_device_h_l115_l155_DUPLICATE_7e83_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iftrue := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_value_d41d_uxn_device_h_l178_l202_l166_l162_l159_l176_DUPLICATE_51e2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l178_l195_l188_l162_l159_DUPLICATE_a595_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_16bit_d41d_uxn_device_h_l178_l195_l102_l162_l188_l159_DUPLICATE_e5d0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l166_l159_l195_l188_DUPLICATE_90f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l166_l159_l195_l188_DUPLICATE_90f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l166_l159_l195_l188_DUPLICATE_90f3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l166_l159_l195_l188_DUPLICATE_90f3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_9786_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_9786_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_9786_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l202_l134_DUPLICATE_71cb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l202_l134_DUPLICATE_71cb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_5872_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_5872_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_device_h_l202_l148_l134_DUPLICATE_5872_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l178_l102_l166_l162_l159_l176_DUPLICATE_c0d3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l202_l134_DUPLICATE_da8b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l202_l134_DUPLICATE_da8b_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_left := VAR_CONST_SR_1_uxn_device_h_l178_c9_209f_return_output;
     VAR_x_MUX_uxn_device_h_l138_c4_c69b_iftrue := VAR_MUX_uxn_device_h_l139_c9_9514_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_right := VAR_MUX_uxn_device_h_l143_c19_858b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_right := VAR_MUX_uxn_device_h_l144_c19_4890_return_output;
     VAR_result_MUX_uxn_device_h_l110_c7_ff60_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l110_c7_ff60_return_output;
     VAR_result_MUX_uxn_device_h_l114_c7_dff8_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l114_c7_dff8_return_output;
     VAR_result_MUX_uxn_device_h_l123_c7_67de_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_92fc_uxn_device_h_l123_c7_67de_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_iftrue := VAR_x_uxn_device_h_l167_c5_2b87;
     VAR_x_MUX_uxn_device_h_l166_c11_80de_iftrue := VAR_x_uxn_device_h_l167_c5_2b87;
     -- result_is_device_ram_16bit_MUX[uxn_device_h_l195_c3_3b94] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_cond;
     result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iftrue;
     result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_return_output := result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_return_output;

     -- MUX[uxn_device_h_l125_c19_b545] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l125_c19_b545_cond <= VAR_MUX_uxn_device_h_l125_c19_b545_cond;
     MUX_uxn_device_h_l125_c19_b545_iftrue <= VAR_MUX_uxn_device_h_l125_c19_b545_iftrue;
     MUX_uxn_device_h_l125_c19_b545_iffalse <= VAR_MUX_uxn_device_h_l125_c19_b545_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l125_c19_b545_return_output := MUX_uxn_device_h_l125_c19_b545_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l149_c28_b65e] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_return_output;

     -- x_MUX[uxn_device_h_l138_c4_c69b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l138_c4_c69b_cond <= VAR_x_MUX_uxn_device_h_l138_c4_c69b_cond;
     x_MUX_uxn_device_h_l138_c4_c69b_iftrue <= VAR_x_MUX_uxn_device_h_l138_c4_c69b_iftrue;
     x_MUX_uxn_device_h_l138_c4_c69b_iffalse <= VAR_x_MUX_uxn_device_h_l138_c4_c69b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l138_c4_c69b_return_output := x_MUX_uxn_device_h_l138_c4_c69b_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_cond;
     result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_return_output := result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- MUX[uxn_device_h_l96_c19_aa86] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l96_c19_aa86_cond <= VAR_MUX_uxn_device_h_l96_c19_aa86_cond;
     MUX_uxn_device_h_l96_c19_aa86_iftrue <= VAR_MUX_uxn_device_h_l96_c19_aa86_iftrue;
     MUX_uxn_device_h_l96_c19_aa86_iffalse <= VAR_MUX_uxn_device_h_l96_c19_aa86_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l96_c19_aa86_return_output := MUX_uxn_device_h_l96_c19_aa86_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l195_c3_3b94] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_cond;
     result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_return_output := result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l188_c8_db2e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_cond;
     result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_return_output := result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l188_c8_db2e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_return_output;

     -- BIN_OP_AND[uxn_device_h_l178_c9_f7c1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l178_c9_f7c1_left <= VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_left;
     BIN_OP_AND_uxn_device_h_l178_c9_f7c1_right <= VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_return_output := BIN_OP_AND_uxn_device_h_l178_c9_f7c1_return_output;

     -- MUX[uxn_device_h_l97_c20_1874] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l97_c20_1874_cond <= VAR_MUX_uxn_device_h_l97_c20_1874_cond;
     MUX_uxn_device_h_l97_c20_1874_iftrue <= VAR_MUX_uxn_device_h_l97_c20_1874_iftrue;
     MUX_uxn_device_h_l97_c20_1874_iffalse <= VAR_MUX_uxn_device_h_l97_c20_1874_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l97_c20_1874_return_output := MUX_uxn_device_h_l97_c20_1874_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- MUX[uxn_device_h_l131_c19_52a1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l131_c19_52a1_cond <= VAR_MUX_uxn_device_h_l131_c19_52a1_cond;
     MUX_uxn_device_h_l131_c19_52a1_iftrue <= VAR_MUX_uxn_device_h_l131_c19_52a1_iftrue;
     MUX_uxn_device_h_l131_c19_52a1_iffalse <= VAR_MUX_uxn_device_h_l131_c19_52a1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l131_c19_52a1_return_output := MUX_uxn_device_h_l131_c19_52a1_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_device_h_l162_c4_bd89] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_cond;
     result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iftrue;
     result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_return_output := result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_return_output;

     -- BIN_OP_AND[uxn_device_h_l166_c15_ac06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l166_c15_ac06_left <= VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_left;
     BIN_OP_AND_uxn_device_h_l166_c15_ac06_right <= VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_return_output := BIN_OP_AND_uxn_device_h_l166_c15_ac06_return_output;

     -- auto_advance_MUX[uxn_device_h_l154_c7_2b80] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l154_c7_2b80_cond <= VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_cond;
     auto_advance_MUX_uxn_device_h_l154_c7_2b80_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_iftrue;
     auto_advance_MUX_uxn_device_h_l154_c7_2b80_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_return_output := auto_advance_MUX_uxn_device_h_l154_c7_2b80_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l195_c3_3b94] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_return_output := result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_return_output;

     -- ram_addr_MUX[uxn_device_h_l174_c7_8f85] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l174_c7_8f85_cond <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_cond;
     ram_addr_MUX_uxn_device_h_l174_c7_8f85_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_iftrue;
     ram_addr_MUX_uxn_device_h_l174_c7_8f85_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_return_output := ram_addr_MUX_uxn_device_h_l174_c7_8f85_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_device_h_l188_c8_db2e] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_cond;
     result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iftrue;
     result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_return_output := result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l115_c27_257f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l115_c27_257f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l115_c37_a200_return_output);

     -- CAST_TO_uint24_t[uxn_device_h_l141_c54_46cf] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_device_h_l141_c54_46cf_return_output := CAST_TO_uint24_t_uint16_t(
     VAR_MUX_uxn_device_h_l139_c9_9514_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l136_c22_f0c9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l136_c22_f0c9_return_output := CAST_TO_uint8_t_uint4_t(
     VAR_BIN_OP_AND_uxn_device_h_l136_c32_113c_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l162_c4_bd89] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_cond;
     result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_return_output := result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_return_output;

     -- Submodule level 2
     VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_left := VAR_BIN_OP_AND_uxn_device_h_l166_c15_ac06_return_output;
     VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_left := VAR_BIN_OP_AND_uxn_device_h_l178_c9_f7c1_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c28_b65e_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_right := VAR_CAST_TO_uint24_t_uxn_device_h_l141_c54_46cf_return_output;
     VAR_MUX_uxn_device_h_l115_c10_5052_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l115_c27_257f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l136_c22_f0c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue := VAR_MUX_uxn_device_h_l125_c19_b545_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_right := VAR_MUX_uxn_device_h_l131_c19_52a1_return_output;
     VAR_MUX_uxn_device_h_l140_c9_876d_cond := VAR_MUX_uxn_device_h_l131_c19_52a1_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iftrue := VAR_MUX_uxn_device_h_l131_c19_52a1_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_left := VAR_MUX_uxn_device_h_l96_c19_aa86_return_output;
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iftrue := VAR_MUX_uxn_device_h_l96_c19_aa86_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_right := VAR_MUX_uxn_device_h_l97_c20_1874_return_output;
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iftrue := VAR_MUX_uxn_device_h_l97_c20_1874_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_iffalse := VAR_auto_advance_MUX_uxn_device_h_l154_c7_2b80_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_iffalse := VAR_ram_addr_MUX_uxn_device_h_l174_c7_8f85_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l162_c4_bd89_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l188_c8_db2e_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iftrue := VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l162_c4_bd89_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iffalse := VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l188_c8_db2e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l188_c8_db2e_return_output;
     VAR_x_MUX_uxn_device_h_l134_c3_79d6_iftrue := VAR_x_MUX_uxn_device_h_l138_c4_c69b_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l149_c28_6c56] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_left <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_left;
     BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_right <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_return_output := BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l178_c9_cd1d] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_left <= VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_left;
     BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_right <= VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output := BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output;

     -- BIN_OP_OR[uxn_device_h_l98_c21_e736] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l98_c21_e736_left <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_left;
     BIN_OP_OR_uxn_device_h_l98_c21_e736_right <= VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output := BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_5bff[uxn_device_h_l194_c7_20b4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_5bff_uxn_device_h_l194_c7_20b4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_5bff(
     result,
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l195_c3_3b94_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l195_c3_3b94_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l195_c3_3b94_return_output);

     -- is_y_onscreen_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_cond;
     is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_return_output := is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- ram_addr_MUX[uxn_device_h_l154_c7_2b80] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l154_c7_2b80_cond <= VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_cond;
     ram_addr_MUX_uxn_device_h_l154_c7_2b80_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_iftrue;
     ram_addr_MUX_uxn_device_h_l154_c7_2b80_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_return_output := ram_addr_MUX_uxn_device_h_l154_c7_2b80_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_cond;
     result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_return_output := result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- BIN_OP_AND[uxn_device_h_l148_c15_64b4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l148_c15_64b4_left <= VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_left;
     BIN_OP_AND_uxn_device_h_l148_c15_64b4_right <= VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output := BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_cond;
     result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_return_output := result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- MUX[uxn_device_h_l115_c10_5052] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l115_c10_5052_cond <= VAR_MUX_uxn_device_h_l115_c10_5052_cond;
     MUX_uxn_device_h_l115_c10_5052_iftrue <= VAR_MUX_uxn_device_h_l115_c10_5052_iftrue;
     MUX_uxn_device_h_l115_c10_5052_iffalse <= VAR_MUX_uxn_device_h_l115_c10_5052_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l115_c10_5052_return_output := MUX_uxn_device_h_l115_c10_5052_return_output;

     -- BIN_OP_NEQ[uxn_device_h_l166_c15_424e] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_device_h_l166_c15_424e_left <= VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_left;
     BIN_OP_NEQ_uxn_device_h_l166_c15_424e_right <= VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output := BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output;

     -- MUX[uxn_device_h_l140_c9_876d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l140_c9_876d_cond <= VAR_MUX_uxn_device_h_l140_c9_876d_cond;
     MUX_uxn_device_h_l140_c9_876d_iftrue <= VAR_MUX_uxn_device_h_l140_c9_876d_iftrue;
     MUX_uxn_device_h_l140_c9_876d_iffalse <= VAR_MUX_uxn_device_h_l140_c9_876d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l140_c9_876d_return_output := MUX_uxn_device_h_l140_c9_876d_return_output;

     -- result_u8_value_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_cond;
     result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_return_output := result_u8_value_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- is_pixel_port_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     is_pixel_port_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_cond;
     is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iftrue;
     is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_return_output := is_pixel_port_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- is_sprite_port_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     is_sprite_port_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_cond;
     is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iftrue;
     is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_return_output := is_sprite_port_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- auto_advance_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_cond;
     auto_advance_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     auto_advance_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_return_output := auto_advance_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- is_x_onscreen_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_cond;
     is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue;
     is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output := is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- x_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_x_MUX_uxn_device_h_l134_c3_79d6_cond;
     x_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_x_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     x_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_x_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l134_c3_79d6_return_output := x_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- Submodule level 3
     VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_cond := VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_cond := VAR_BIN_OP_AND_uxn_device_h_l148_c15_64b4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_cond := VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_cond := VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_cond := VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output;
     VAR_x_MUX_uxn_device_h_l166_c11_80de_cond := VAR_BIN_OP_NEQ_uxn_device_h_l166_c15_424e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_cond := VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_cond := VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_cond := VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_cond := VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_cond := VAR_BIN_OP_NEQ_uxn_device_h_l178_c9_cd1d_return_output;
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_cond := VAR_BIN_OP_OR_uxn_device_h_l98_c21_e736_return_output;
     VAR_result_vram_address_uxn_device_h_l149_c5_ade1 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l149_c28_6c56_return_output, 24);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_CONST_SR_4_uxn_device_h_l120_c22_930b_x := VAR_MUX_uxn_device_h_l115_c10_5052_return_output;
     VAR_CONST_SR_5_uxn_device_h_l119_c22_587c_x := VAR_MUX_uxn_device_h_l115_c10_5052_return_output;
     VAR_CONST_SR_6_uxn_device_h_l118_c21_37b2_x := VAR_MUX_uxn_device_h_l115_c10_5052_return_output;
     VAR_CONST_SR_7_uxn_device_h_l117_c25_e94a_x := VAR_MUX_uxn_device_h_l115_c10_5052_return_output;
     VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_iftrue := VAR_MUX_uxn_device_h_l115_c10_5052_return_output;
     VAR_y_MUX_uxn_device_h_l138_c4_c69b_iftrue := VAR_MUX_uxn_device_h_l140_c9_876d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_auto_advance_MUX_uxn_device_h_l129_c7_38ee_return_output;
     REG_VAR_is_pixel_port := VAR_is_pixel_port_MUX_uxn_device_h_l95_c2_425e_return_output;
     REG_VAR_is_sprite_port := VAR_is_sprite_port_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_is_x_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_is_y_onscreen_MUX_uxn_device_h_l129_c7_38ee_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse := VAR_ram_addr_MUX_uxn_device_h_l154_c7_2b80_return_output;
     VAR_result_MUX_uxn_device_h_l194_c7_20b4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_5bff_uxn_device_h_l194_c7_20b4_return_output;
     VAR_x_MUX_uxn_device_h_l129_c7_38ee_iftrue := VAR_x_MUX_uxn_device_h_l134_c3_79d6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_iftrue := VAR_result_vram_address_uxn_device_h_l149_c5_ade1;
     -- is_x_onscreen_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond;
     is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output := is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- ctrl_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_cond;
     ctrl_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     ctrl_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_return_output := ctrl_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- x_MUX[uxn_device_h_l166_c11_80de] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l166_c11_80de_cond <= VAR_x_MUX_uxn_device_h_l166_c11_80de_cond;
     x_MUX_uxn_device_h_l166_c11_80de_iftrue <= VAR_x_MUX_uxn_device_h_l166_c11_80de_iftrue;
     x_MUX_uxn_device_h_l166_c11_80de_iffalse <= VAR_x_MUX_uxn_device_h_l166_c11_80de_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l166_c11_80de_return_output := x_MUX_uxn_device_h_l166_c11_80de_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l166_c11_80de] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_cond;
     result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_return_output := result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l178_c4_dce8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_cond;
     result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_return_output := result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l116_c11_9455] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l116_c11_9455_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_MUX_uxn_device_h_l115_c10_5052_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l178_c4_dce8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_cond;
     result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_return_output := result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_5a38] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_device_h_l102_c3_5a38] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_cond;
     result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iftrue;
     result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_return_output := result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_return_output;

     -- is_drawing_port_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     is_drawing_port_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_cond;
     is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iftrue;
     is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_return_output := is_drawing_port_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- CONST_SR_5[uxn_device_h_l119_c22_587c] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l119_c22_587c_x <= VAR_CONST_SR_5_uxn_device_h_l119_c22_587c_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l119_c22_587c_return_output := CONST_SR_5_uxn_device_h_l119_c22_587c_return_output;

     -- CONST_SR_4[uxn_device_h_l120_c22_930b] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l120_c22_930b_x <= VAR_CONST_SR_4_uxn_device_h_l120_c22_930b_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l120_c22_930b_return_output := CONST_SR_4_uxn_device_h_l120_c22_930b_return_output;

     -- auto_advance_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_cond;
     auto_advance_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_iftrue;
     auto_advance_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_return_output := auto_advance_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- y_MUX[uxn_device_h_l138_c4_c69b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c4_c69b_cond <= VAR_y_MUX_uxn_device_h_l138_c4_c69b_cond;
     y_MUX_uxn_device_h_l138_c4_c69b_iftrue <= VAR_y_MUX_uxn_device_h_l138_c4_c69b_iftrue;
     y_MUX_uxn_device_h_l138_c4_c69b_iffalse <= VAR_y_MUX_uxn_device_h_l138_c4_c69b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c4_c69b_return_output := y_MUX_uxn_device_h_l138_c4_c69b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l178_c4_dce8] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_return_output := result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_return_output;

     -- CONST_SR_6[uxn_device_h_l118_c21_37b2] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l118_c21_37b2_x <= VAR_CONST_SR_6_uxn_device_h_l118_c21_37b2_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l118_c21_37b2_return_output := CONST_SR_6_uxn_device_h_l118_c21_37b2_return_output;

     -- result_u16_value_MUX[uxn_device_h_l178_c4_dce8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_device_h_l178_c4_dce8_cond <= VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_cond;
     result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iftrue <= VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iftrue;
     result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iffalse <= VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_return_output := result_u16_value_MUX_uxn_device_h_l178_c4_dce8_return_output;

     -- is_y_onscreen_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_cond;
     is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iftrue;
     is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output := is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- ram_addr_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_cond;
     ram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     ram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output := ram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l166_c11_80de] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_return_output := result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_return_output;

     -- CAST_TO_uint24_t[uxn_device_h_l141_c18_5fb9] LATENCY=0
     VAR_CAST_TO_uint24_t_uxn_device_h_l141_c18_5fb9_return_output := CAST_TO_uint24_t_uint16_t(
     VAR_MUX_uxn_device_h_l140_c9_876d_return_output);

     -- CONST_SR_7[uxn_device_h_l117_c25_e94a] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l117_c25_e94a_x <= VAR_CONST_SR_7_uxn_device_h_l117_c25_e94a_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l117_c25_e94a_return_output := CONST_SR_7_uxn_device_h_l117_c25_e94a_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_device_h_l178_c4_dce8] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_cond;
     result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iftrue;
     result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_return_output := result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l148_c11_db74] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_cond;
     result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_return_output := result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l102_c3_5a38] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_cond;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_return_output := result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- result_u16_value_MUX[uxn_device_h_l166_c11_80de] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_device_h_l166_c11_80de_cond <= VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_cond;
     result_u16_value_MUX_uxn_device_h_l166_c11_80de_iftrue <= VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_iftrue;
     result_u16_value_MUX_uxn_device_h_l166_c11_80de_iffalse <= VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_return_output := result_u16_value_MUX_uxn_device_h_l166_c11_80de_return_output;

     -- result_vram_address_MUX[uxn_device_h_l148_c11_db74] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l148_c11_db74_cond <= VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_cond;
     result_vram_address_MUX_uxn_device_h_l148_c11_db74_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_iftrue;
     result_vram_address_MUX_uxn_device_h_l148_c11_db74_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_return_output := result_vram_address_MUX_uxn_device_h_l148_c11_db74_return_output;

     -- Submodule level 4
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_left := VAR_CAST_TO_uint24_t_uxn_device_h_l141_c18_5fb9_return_output;
     VAR_color_MUX_uxn_device_h_l114_c7_dff8_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l116_c11_9455_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_67de_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l123_c7_67de_return_output;
     VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_ctrl_MUX_uxn_device_h_l114_c7_dff8_return_output;
     REG_VAR_is_drawing_port := VAR_is_drawing_port_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_is_x_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_is_y_onscreen_MUX_uxn_device_h_l123_c7_67de_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_ram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l166_c11_80de_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l178_c4_dce8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l178_c4_dce8_return_output;
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iftrue := VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l178_c4_dce8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l166_c11_80de_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l178_c4_dce8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l148_c11_db74_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iffalse := VAR_result_u16_value_MUX_uxn_device_h_l166_c11_80de_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iftrue := VAR_result_u16_value_MUX_uxn_device_h_l178_c4_dce8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l148_c11_db74_return_output;
     VAR_x_MUX_uxn_device_h_l162_c4_bd89_iffalse := VAR_x_MUX_uxn_device_h_l166_c11_80de_return_output;
     VAR_y_MUX_uxn_device_h_l134_c3_79d6_iftrue := VAR_y_MUX_uxn_device_h_l138_c4_c69b_return_output;
     -- result_is_device_ram_write_MUX[uxn_device_h_l162_c4_bd89] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_return_output := result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_return_output;

     -- result_u16_value_MUX[uxn_device_h_l162_c4_bd89] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_device_h_l162_c4_bd89_cond <= VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_cond;
     result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iftrue <= VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iftrue;
     result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iffalse <= VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_return_output := result_u16_value_MUX_uxn_device_h_l162_c4_bd89_return_output;

     -- result_is_device_ram_16bit_MUX[uxn_device_h_l176_c3_31b7] LATENCY=0
     -- Inputs
     result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_cond <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_cond;
     result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iftrue <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iftrue;
     result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iffalse <= VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_return_output := result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l120_c12_5a18] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l120_c12_5a18_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l120_c22_930b_return_output);

     -- x_MUX[uxn_device_h_l162_c4_bd89] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l162_c4_bd89_cond <= VAR_x_MUX_uxn_device_h_l162_c4_bd89_cond;
     x_MUX_uxn_device_h_l162_c4_bd89_iftrue <= VAR_x_MUX_uxn_device_h_l162_c4_bd89_iftrue;
     x_MUX_uxn_device_h_l162_c4_bd89_iffalse <= VAR_x_MUX_uxn_device_h_l162_c4_bd89_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l162_c4_bd89_return_output := x_MUX_uxn_device_h_l162_c4_bd89_return_output;

     -- ram_addr_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_cond;
     ram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue;
     ram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_return_output := ram_addr_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- y_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_y_MUX_uxn_device_h_l134_c3_79d6_cond;
     y_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_y_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     y_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_y_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c3_79d6_return_output := y_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l118_c11_4936] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l118_c11_4936_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l118_c21_37b2_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l117_c15_90ff] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l117_c15_90ff_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l117_c25_e94a_return_output);

     -- auto_advance_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_return_output := auto_advance_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l162_c4_bd89] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_cond;
     result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_return_output := result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- is_x_onscreen_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond;
     is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output := is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l176_c3_31b7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_cond;
     result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_return_output := result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l176_c3_31b7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l138_c4_c69b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_cond;
     result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_return_output := result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_return_output;

     -- ctrl_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_cond;
     ctrl_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     ctrl_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_return_output := ctrl_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l176_c3_31b7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_cond;
     result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_return_output := result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_return_output;

     -- result_u16_value_MUX[uxn_device_h_l176_c3_31b7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_device_h_l176_c3_31b7_cond <= VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_cond;
     result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iftrue <= VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iftrue;
     result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iffalse <= VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_return_output := result_u16_value_MUX_uxn_device_h_l176_c3_31b7_return_output;

     -- is_y_onscreen_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_cond;
     is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output := is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l119_c12_d1c6] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_d1c6_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l119_c22_587c_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e1b0[uxn_device_h_l95_c2_425e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e1b0_uxn_device_h_l95_c2_425e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_e1b0(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l102_c3_5a38_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_5a38_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_5a38_return_output);

     -- color_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_color_MUX_uxn_device_h_l114_c7_dff8_cond;
     color_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_color_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     color_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_color_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l114_c7_dff8_return_output := color_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l141_c18_1ccb] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_return_output;

     -- Submodule level 5
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l141_c18_1ccb_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l117_c15_90ff_return_output;
     VAR_layer_MUX_uxn_device_h_l114_c7_dff8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l118_c11_4936_return_output;
     VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l119_c12_d1c6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l120_c12_5a18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l129_c7_38ee_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_color_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_color_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_ctrl_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_is_x_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_is_y_onscreen_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_ram_addr_MUX_uxn_device_h_l123_c7_67de_return_output;
     VAR_result_MUX_uxn_device_h_l95_c2_425e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_e1b0_uxn_device_h_l95_c2_425e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l162_c4_bd89_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l162_c4_bd89_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l138_c4_c69b_return_output;
     VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iftrue := VAR_result_u16_value_MUX_uxn_device_h_l162_c4_bd89_return_output;
     VAR_x_MUX_uxn_device_h_l159_c3_48cf_iftrue := VAR_x_MUX_uxn_device_h_l162_c4_bd89_return_output;
     VAR_y_MUX_uxn_device_h_l129_c7_38ee_iftrue := VAR_y_MUX_uxn_device_h_l134_c3_79d6_return_output;
     -- ctrl_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_cond;
     ctrl_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_iftrue;
     ctrl_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_return_output := ctrl_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_return_output := result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ddc9[uxn_device_h_l174_c7_8f85] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ddc9_uxn_device_h_l174_c7_8f85_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_ddc9(
     result,
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l176_c3_31b7_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l176_c3_31b7_return_output,
     VAR_result_u16_value_MUX_uxn_device_h_l176_c3_31b7_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l176_c3_31b7_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l176_c3_31b7_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c7_2b80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_cond;
     result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_return_output := result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- auto_advance_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_cond;
     auto_advance_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     auto_advance_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_return_output := auto_advance_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- result_u16_value_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_cond;
     result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_return_output := result_u16_value_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- flip_y_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_cond;
     flip_y_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     flip_y_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_return_output := flip_y_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_cond;
     ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_return_output := ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- is_x_onscreen_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_cond;
     is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue;
     is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output := is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l141_c18_375e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l141_c18_375e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_left;
     BIN_OP_PLUS_uxn_device_h_l141_c18_375e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_return_output := BIN_OP_PLUS_uxn_device_h_l141_c18_375e_return_output;

     -- x_MUX[uxn_device_h_l159_c3_48cf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l159_c3_48cf_cond <= VAR_x_MUX_uxn_device_h_l159_c3_48cf_cond;
     x_MUX_uxn_device_h_l159_c3_48cf_iftrue <= VAR_x_MUX_uxn_device_h_l159_c3_48cf_iftrue;
     x_MUX_uxn_device_h_l159_c3_48cf_iffalse <= VAR_x_MUX_uxn_device_h_l159_c3_48cf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l159_c3_48cf_return_output := x_MUX_uxn_device_h_l159_c3_48cf_return_output;

     -- is_y_onscreen_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_cond;
     is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output := is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- color_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_color_MUX_uxn_device_h_l110_c7_ff60_cond;
     color_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_color_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     color_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_color_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l110_c7_ff60_return_output := color_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- ram_addr_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_cond;
     ram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     ram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output := ram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- y_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_y_MUX_uxn_device_h_l129_c7_38ee_cond;
     y_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_y_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     y_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_y_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l129_c7_38ee_return_output := y_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- layer_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_layer_MUX_uxn_device_h_l114_c7_dff8_cond;
     layer_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_layer_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     layer_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_layer_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l114_c7_dff8_return_output := layer_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- flip_x_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_cond;
     flip_x_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     flip_x_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_return_output := flip_x_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- Submodule level 6
     VAR_vram_addr_uxn_device_h_l141_c5_44e8 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l141_c18_375e_return_output, 24);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c7_2b80_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_color_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_color_MUX_uxn_device_h_l110_c7_ff60_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_flip_x_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_flip_y_MUX_uxn_device_h_l114_c7_dff8_return_output;
     REG_VAR_is_x_onscreen := VAR_is_x_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_is_y_onscreen_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_layer_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_layer_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_ram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output;
     VAR_result_MUX_uxn_device_h_l174_c7_8f85_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_ddc9_uxn_device_h_l174_c7_8f85_return_output;
     VAR_x_MUX_uxn_device_h_l154_c7_2b80_iftrue := VAR_x_MUX_uxn_device_h_l159_c3_48cf_return_output;
     VAR_y_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_y_MUX_uxn_device_h_l129_c7_38ee_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_left := VAR_vram_addr_uxn_device_h_l141_c5_44e8;
     -- y_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_y_MUX_uxn_device_h_l123_c7_67de_cond;
     y_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_y_MUX_uxn_device_h_l123_c7_67de_iftrue;
     y_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_y_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l123_c7_67de_return_output := y_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- ram_addr_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_cond;
     ram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     ram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output := ram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l174_c7_8f85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_return_output;

     -- auto_advance_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_cond;
     auto_advance_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_iftrue;
     auto_advance_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_return_output := auto_advance_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- is_y_onscreen_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_cond;
     is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iftrue;
     is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output := is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4c5d[uxn_device_h_l154_c7_2b80] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4c5d_uxn_device_h_l154_c7_2b80_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_4c5d(
     result,
     VAR_result_u8_value_uxn_device_h_l158_c3_eff0,
     VAR_result_is_device_ram_16bit_MUX_uxn_device_h_l159_c3_48cf_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l159_c3_48cf_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l159_c3_48cf_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l159_c3_48cf_return_output,
     VAR_result_u16_value_MUX_uxn_device_h_l159_c3_48cf_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l159_c3_48cf_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l159_c3_48cf_return_output);

     -- flip_x_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_cond;
     flip_x_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     flip_x_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_return_output := flip_x_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- x_MUX[uxn_device_h_l154_c7_2b80] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l154_c7_2b80_cond <= VAR_x_MUX_uxn_device_h_l154_c7_2b80_cond;
     x_MUX_uxn_device_h_l154_c7_2b80_iftrue <= VAR_x_MUX_uxn_device_h_l154_c7_2b80_iftrue;
     x_MUX_uxn_device_h_l154_c7_2b80_iffalse <= VAR_x_MUX_uxn_device_h_l154_c7_2b80_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l154_c7_2b80_return_output := x_MUX_uxn_device_h_l154_c7_2b80_return_output;

     -- flip_y_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_cond;
     flip_y_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     flip_y_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_return_output := flip_y_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_cond;
     ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_return_output := ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- BIN_OP_AND[uxn_device_h_l142_c5_11f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l142_c5_11f7_left <= VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_left;
     BIN_OP_AND_uxn_device_h_l142_c5_11f7_right <= VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_return_output := BIN_OP_AND_uxn_device_h_l142_c5_11f7_return_output;

     -- color_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_color_MUX_uxn_device_h_l95_c2_425e_cond;
     color_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_color_MUX_uxn_device_h_l95_c2_425e_iftrue;
     color_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_color_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l95_c2_425e_return_output := color_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- layer_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_layer_MUX_uxn_device_h_l110_c7_ff60_cond;
     layer_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_layer_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     layer_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_layer_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l110_c7_ff60_return_output := layer_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_left := VAR_BIN_OP_AND_uxn_device_h_l142_c5_11f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l174_c7_8f85_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l95_c2_425e_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_flip_x_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_flip_y_MUX_uxn_device_h_l110_c7_ff60_return_output;
     REG_VAR_is_y_onscreen := VAR_is_y_onscreen_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_layer_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_layer_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output;
     VAR_result_MUX_uxn_device_h_l154_c7_2b80_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_4c5d_uxn_device_h_l154_c7_2b80_return_output;
     VAR_x_MUX_uxn_device_h_l129_c7_38ee_iffalse := VAR_x_MUX_uxn_device_h_l154_c7_2b80_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_y_MUX_uxn_device_h_l123_c7_67de_return_output;
     -- flip_x_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_cond;
     flip_x_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_iftrue;
     flip_x_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_return_output := flip_x_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l194_c7_20b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_return_output;

     -- BIN_OP_OR[uxn_device_h_l143_c5_8e5d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l143_c5_8e5d_left <= VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_left;
     BIN_OP_OR_uxn_device_h_l143_c5_8e5d_right <= VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_return_output := BIN_OP_OR_uxn_device_h_l143_c5_8e5d_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_cond;
     ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iftrue;
     ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_return_output := ctrl_mode_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- ram_addr_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_cond;
     ram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue;
     ram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_return_output := ram_addr_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- layer_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_layer_MUX_uxn_device_h_l95_c2_425e_cond;
     layer_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_layer_MUX_uxn_device_h_l95_c2_425e_iftrue;
     layer_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_layer_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l95_c2_425e_return_output := layer_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- x_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_x_MUX_uxn_device_h_l129_c7_38ee_cond;
     x_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_x_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     x_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_x_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l129_c7_38ee_return_output := x_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- y_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_y_MUX_uxn_device_h_l114_c7_dff8_cond;
     y_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     y_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_dff8_return_output := y_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- flip_y_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_cond;
     flip_y_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_iftrue;
     flip_y_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_return_output := flip_y_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- Submodule level 8
     VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_left := VAR_BIN_OP_OR_uxn_device_h_l143_c5_8e5d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c7_20b4_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l95_c2_425e_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l95_c2_425e_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l95_c2_425e_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l95_c2_425e_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_x_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_x_MUX_uxn_device_h_l129_c7_38ee_return_output;
     VAR_y_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_dff8_return_output;
     -- x_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_x_MUX_uxn_device_h_l123_c7_67de_cond;
     x_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_x_MUX_uxn_device_h_l123_c7_67de_iftrue;
     x_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_x_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l123_c7_67de_return_output := x_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l201_c1_9054] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c5_e56d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c5_e56d_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_left;
     BIN_OP_OR_uxn_device_h_l144_c5_e56d_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_return_output := BIN_OP_OR_uxn_device_h_l144_c5_e56d_return_output;

     -- y_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_y_MUX_uxn_device_h_l110_c7_ff60_cond;
     y_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_y_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     y_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_y_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l110_c7_ff60_return_output := y_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- Submodule level 9
     VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_left := VAR_BIN_OP_OR_uxn_device_h_l144_c5_e56d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l201_c1_9054_return_output;
     VAR_x_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_x_MUX_uxn_device_h_l123_c7_67de_return_output;
     VAR_y_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_y_MUX_uxn_device_h_l110_c7_ff60_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l202_c1_7512] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_return_output;

     -- BIN_OP_OR[uxn_device_h_l145_c5_7d73] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l145_c5_7d73_left <= VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_left;
     BIN_OP_OR_uxn_device_h_l145_c5_7d73_right <= VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output := BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output;

     -- y_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_y_MUX_uxn_device_h_l95_c2_425e_cond;
     y_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_y_MUX_uxn_device_h_l95_c2_425e_iftrue;
     y_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_y_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l95_c2_425e_return_output := y_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- x_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_x_MUX_uxn_device_h_l114_c7_dff8_cond;
     x_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_x_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     x_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_x_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l114_c7_dff8_return_output := x_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- Submodule level 10
     VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iftrue := VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_iftrue := VAR_BIN_OP_OR_uxn_device_h_l145_c5_7d73_return_output;
     VAR_screen_blit_uxn_device_h_l203_c46_a081_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l202_c1_7512_return_output;
     VAR_x_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_x_MUX_uxn_device_h_l114_c7_dff8_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l95_c2_425e_return_output;
     -- vram_addr_MUX[uxn_device_h_l138_c4_c69b] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l138_c4_c69b_cond <= VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_cond;
     vram_addr_MUX_uxn_device_h_l138_c4_c69b_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_iftrue;
     vram_addr_MUX_uxn_device_h_l138_c4_c69b_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_return_output := vram_addr_MUX_uxn_device_h_l138_c4_c69b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l138_c4_c69b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l138_c4_c69b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_cond;
     result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iftrue;
     result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_return_output := result_vram_address_MUX_uxn_device_h_l138_c4_c69b_return_output;

     -- x_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_x_MUX_uxn_device_h_l110_c7_ff60_cond;
     x_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_x_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     x_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_x_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l110_c7_ff60_return_output := x_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- screen_blit[uxn_device_h_l203_c46_a081] LATENCY=0
     -- Clock enable
     screen_blit_uxn_device_h_l203_c46_a081_CLOCK_ENABLE <= VAR_screen_blit_uxn_device_h_l203_c46_a081_CLOCK_ENABLE;
     -- Inputs
     screen_blit_uxn_device_h_l203_c46_a081_phase <= VAR_screen_blit_uxn_device_h_l203_c46_a081_phase;
     screen_blit_uxn_device_h_l203_c46_a081_ctrl <= VAR_screen_blit_uxn_device_h_l203_c46_a081_ctrl;
     screen_blit_uxn_device_h_l203_c46_a081_auto_advance <= VAR_screen_blit_uxn_device_h_l203_c46_a081_auto_advance;
     screen_blit_uxn_device_h_l203_c46_a081_x <= VAR_screen_blit_uxn_device_h_l203_c46_a081_x;
     screen_blit_uxn_device_h_l203_c46_a081_y <= VAR_screen_blit_uxn_device_h_l203_c46_a081_y;
     screen_blit_uxn_device_h_l203_c46_a081_ram_addr <= VAR_screen_blit_uxn_device_h_l203_c46_a081_ram_addr;
     screen_blit_uxn_device_h_l203_c46_a081_previous_ram_read <= VAR_screen_blit_uxn_device_h_l203_c46_a081_previous_ram_read;
     -- Outputs
     VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output := screen_blit_uxn_device_h_l203_c46_a081_return_output;

     -- Submodule level 11
     VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l138_c4_c69b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_iftrue := VAR_vram_addr_MUX_uxn_device_h_l138_c4_c69b_return_output;
     VAR_x_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_x_MUX_uxn_device_h_l110_c7_ff60_return_output;
     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l209_c22_b4db] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_b4db_return_output := VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output.u8_value;

     -- CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d[uxn_device_h_l207_c26_2549] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l207_c26_2549_return_output := VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d[uxn_device_h_l208_c30_a8ab] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_a8ab_return_output := VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output.vram_write_layer;

     -- vram_addr_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_cond;
     vram_addr_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     vram_addr_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_return_output := vram_addr_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l206_c27_7b0c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_7b0c_return_output := VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output.is_vram_write;

     -- x_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_x_MUX_uxn_device_h_l95_c2_425e_cond;
     x_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_x_MUX_uxn_device_h_l95_c2_425e_iftrue;
     x_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_x_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l95_c2_425e_return_output := x_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d[uxn_device_h_l210_c23_1cf9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l210_c23_1cf9_return_output := VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d[uxn_device_h_l211_c25_8fa8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l211_c25_8fa8_return_output := VAR_screen_blit_uxn_device_h_l203_c46_a081_return_output.is_blit_done;

     -- result_vram_address_MUX[uxn_device_h_l134_c3_79d6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c3_79d6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_cond;
     result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_return_output := result_vram_address_MUX_uxn_device_h_l134_c3_79d6_return_output;

     -- Submodule level 12
     VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iftrue := VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_ram_address_d41d_uxn_device_h_l210_c23_1cf9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l211_c25_8fa8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l206_c27_7b0c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_vram_write_layer_d41d_uxn_device_h_l208_c30_a8ab_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue := VAR_CONST_REF_RD_uint24_t_screen_blit_result_t_vram_address_d41d_uxn_device_h_l207_c26_2549_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iftrue := VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l209_c22_b4db_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue := VAR_vram_addr_MUX_uxn_device_h_l134_c3_79d6_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l95_c2_425e_return_output;
     -- vram_addr_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_cond;
     vram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     vram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output := vram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_return_output := result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- result_u8_value_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_return_output := result_u8_value_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_198a[uxn_device_h_l129_c7_38ee] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_198a_uxn_device_h_l129_c7_38ee_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_198a(
     result,
     to_unsigned(1, 1),
     VAR_result_vram_write_layer_MUX_uxn_device_h_l134_c3_79d6_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l134_c3_79d6_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_79d6_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c3_79d6_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l134_c3_79d6_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_return_output := result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- result_vram_address_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_return_output := result_vram_address_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- result_u16_value_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_return_output := result_u16_value_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l202_c3_ceee] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_cond;
     result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_return_output := result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_device_h_l129_c7_38ee_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_198a_uxn_device_h_l129_c7_38ee_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_vram_addr_MUX_uxn_device_h_l129_c7_38ee_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0984[uxn_device_h_l194_c7_20b4] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0984_uxn_device_h_l194_c7_20b4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_0984(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l202_c3_ceee_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l202_c3_ceee_return_output,
     VAR_result_u16_value_MUX_uxn_device_h_l202_c3_ceee_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l202_c3_ceee_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l202_c3_ceee_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l202_c3_ceee_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l202_c3_ceee_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l202_c3_ceee_return_output);

     -- vram_addr_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_cond;
     vram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_iftrue;
     vram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_return_output := vram_addr_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l194_c7_20b4_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_0984_uxn_device_h_l194_c7_20b4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_vram_addr_MUX_uxn_device_h_l123_c7_67de_return_output;
     -- vram_addr_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output := vram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- result_MUX[uxn_device_h_l194_c7_20b4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l194_c7_20b4_cond <= VAR_result_MUX_uxn_device_h_l194_c7_20b4_cond;
     result_MUX_uxn_device_h_l194_c7_20b4_iftrue <= VAR_result_MUX_uxn_device_h_l194_c7_20b4_iftrue;
     result_MUX_uxn_device_h_l194_c7_20b4_iffalse <= VAR_result_MUX_uxn_device_h_l194_c7_20b4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l194_c7_20b4_return_output := result_MUX_uxn_device_h_l194_c7_20b4_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l174_c7_8f85_iffalse := VAR_result_MUX_uxn_device_h_l194_c7_20b4_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_dff8_return_output;
     -- vram_addr_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_cond;
     vram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     vram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output := vram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- result_MUX[uxn_device_h_l174_c7_8f85] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c7_8f85_cond <= VAR_result_MUX_uxn_device_h_l174_c7_8f85_cond;
     result_MUX_uxn_device_h_l174_c7_8f85_iftrue <= VAR_result_MUX_uxn_device_h_l174_c7_8f85_iftrue;
     result_MUX_uxn_device_h_l174_c7_8f85_iffalse <= VAR_result_MUX_uxn_device_h_l174_c7_8f85_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c7_8f85_return_output := result_MUX_uxn_device_h_l174_c7_8f85_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l154_c7_2b80_iffalse := VAR_result_MUX_uxn_device_h_l174_c7_8f85_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_vram_addr_MUX_uxn_device_h_l110_c7_ff60_return_output;
     -- vram_addr_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_cond;
     vram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_iftrue;
     vram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_return_output := vram_addr_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- result_MUX[uxn_device_h_l154_c7_2b80] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l154_c7_2b80_cond <= VAR_result_MUX_uxn_device_h_l154_c7_2b80_cond;
     result_MUX_uxn_device_h_l154_c7_2b80_iftrue <= VAR_result_MUX_uxn_device_h_l154_c7_2b80_iftrue;
     result_MUX_uxn_device_h_l154_c7_2b80_iffalse <= VAR_result_MUX_uxn_device_h_l154_c7_2b80_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l154_c7_2b80_return_output := result_MUX_uxn_device_h_l154_c7_2b80_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l129_c7_38ee_iffalse := VAR_result_MUX_uxn_device_h_l154_c7_2b80_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l95_c2_425e_return_output;
     -- result_MUX[uxn_device_h_l129_c7_38ee] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l129_c7_38ee_cond <= VAR_result_MUX_uxn_device_h_l129_c7_38ee_cond;
     result_MUX_uxn_device_h_l129_c7_38ee_iftrue <= VAR_result_MUX_uxn_device_h_l129_c7_38ee_iftrue;
     result_MUX_uxn_device_h_l129_c7_38ee_iffalse <= VAR_result_MUX_uxn_device_h_l129_c7_38ee_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l129_c7_38ee_return_output := result_MUX_uxn_device_h_l129_c7_38ee_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l123_c7_67de_iffalse := VAR_result_MUX_uxn_device_h_l129_c7_38ee_return_output;
     -- result_MUX[uxn_device_h_l123_c7_67de] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l123_c7_67de_cond <= VAR_result_MUX_uxn_device_h_l123_c7_67de_cond;
     result_MUX_uxn_device_h_l123_c7_67de_iftrue <= VAR_result_MUX_uxn_device_h_l123_c7_67de_iftrue;
     result_MUX_uxn_device_h_l123_c7_67de_iffalse <= VAR_result_MUX_uxn_device_h_l123_c7_67de_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l123_c7_67de_return_output := result_MUX_uxn_device_h_l123_c7_67de_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l114_c7_dff8_iffalse := VAR_result_MUX_uxn_device_h_l123_c7_67de_return_output;
     -- result_MUX[uxn_device_h_l114_c7_dff8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l114_c7_dff8_cond <= VAR_result_MUX_uxn_device_h_l114_c7_dff8_cond;
     result_MUX_uxn_device_h_l114_c7_dff8_iftrue <= VAR_result_MUX_uxn_device_h_l114_c7_dff8_iftrue;
     result_MUX_uxn_device_h_l114_c7_dff8_iffalse <= VAR_result_MUX_uxn_device_h_l114_c7_dff8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l114_c7_dff8_return_output := result_MUX_uxn_device_h_l114_c7_dff8_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l110_c7_ff60_iffalse := VAR_result_MUX_uxn_device_h_l114_c7_dff8_return_output;
     -- result_MUX[uxn_device_h_l110_c7_ff60] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l110_c7_ff60_cond <= VAR_result_MUX_uxn_device_h_l110_c7_ff60_cond;
     result_MUX_uxn_device_h_l110_c7_ff60_iftrue <= VAR_result_MUX_uxn_device_h_l110_c7_ff60_iftrue;
     result_MUX_uxn_device_h_l110_c7_ff60_iffalse <= VAR_result_MUX_uxn_device_h_l110_c7_ff60_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l110_c7_ff60_return_output := result_MUX_uxn_device_h_l110_c7_ff60_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l95_c2_425e_iffalse := VAR_result_MUX_uxn_device_h_l110_c7_ff60_return_output;
     -- result_MUX[uxn_device_h_l95_c2_425e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l95_c2_425e_cond <= VAR_result_MUX_uxn_device_h_l95_c2_425e_cond;
     result_MUX_uxn_device_h_l95_c2_425e_iftrue <= VAR_result_MUX_uxn_device_h_l95_c2_425e_iftrue;
     result_MUX_uxn_device_h_l95_c2_425e_iffalse <= VAR_result_MUX_uxn_device_h_l95_c2_425e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l95_c2_425e_return_output := result_MUX_uxn_device_h_l95_c2_425e_return_output;

     -- Submodule level 22
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l95_c2_425e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l95_c2_425e_return_output;
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
REG_COMB_is_x_onscreen <= REG_VAR_is_x_onscreen;
REG_COMB_is_y_onscreen <= REG_VAR_is_y_onscreen;
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
     is_x_onscreen <= REG_COMB_is_x_onscreen;
     is_y_onscreen <= REG_COMB_is_y_onscreen;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
