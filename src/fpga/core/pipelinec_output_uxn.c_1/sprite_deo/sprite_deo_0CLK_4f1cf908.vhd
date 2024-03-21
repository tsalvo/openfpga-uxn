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
-- Submodules: 346
entity sprite_deo_0CLK_4f1cf908 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end sprite_deo_0CLK_4f1cf908;
architecture arch of sprite_deo_0CLK_4f1cf908 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_addr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_addr_incr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16b : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp12 : unsigned(11 downto 0) := to_unsigned(0, 12);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal x_sprite_incr : unsigned(7 downto 0) := to_unsigned(0, 8);
signal y_sprite_incr : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(3 downto 0) := to_unsigned(0, 4);
signal auto_length : unsigned(3 downto 0) := to_unsigned(0, 4);
signal tmp4 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_blit_done : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_last_blit : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal screen_blit_result : screen_blit_result_t := screen_blit_result_t_NULL;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_ram_addr : unsigned(15 downto 0);
signal REG_COMB_ram_addr_incr : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_tmp16b : unsigned(15 downto 0);
signal REG_COMB_tmp12 : unsigned(11 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_x_sprite_incr : unsigned(7 downto 0);
signal REG_COMB_y_sprite_incr : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(3 downto 0);
signal REG_COMB_auto_length : unsigned(3 downto 0);
signal REG_COMB_tmp4 : unsigned(3 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_is_blit_done : unsigned(0 downto 0);
signal REG_COMB_is_last_blit : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;
signal REG_COMB_screen_blit_result : screen_blit_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l270_c6_ca16]
signal BIN_OP_EQ_uxn_device_h_l270_c6_ca16_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l270_c6_ca16_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l277_c7_0b29]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l270_c2_4b38]
signal flip_y_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l270_c2_4b38]
signal screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l270_c2_4b38]
signal ctrl_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l270_c2_4b38]
signal ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l270_c2_4b38]
signal layer_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l270_c2_4b38]
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l270_c2_4b38]
signal tmp12_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l270_c2_4b38]
signal x_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l270_c2_4b38]
signal tmp16_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l270_c2_4b38]
signal is_blit_done_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l270_c2_4b38]
signal tmp16b_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l270_c2_4b38]
signal auto_advance_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l270_c2_4b38]
signal ram_addr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l270_c2_4b38]
signal flip_x_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l270_c2_4b38]
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l270_c2_4b38]
signal color_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l270_c2_4b38]
signal is_last_blit_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l270_c2_4b38]
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l270_c2_4b38]
signal tmp4_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l270_c2_4b38]
signal result_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l270_c2_4b38_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l270_c2_4b38_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l270_c2_4b38_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l270_c2_4b38]
signal y_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l270_c2_4b38]
signal auto_length_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l277_c11_78be]
signal BIN_OP_EQ_uxn_device_h_l277_c11_78be_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l277_c11_78be_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l280_c7_ae3c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l277_c7_0b29]
signal flip_y_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l277_c7_0b29]
signal screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l277_c7_0b29]
signal ctrl_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l277_c7_0b29]
signal ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l277_c7_0b29]
signal layer_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l277_c7_0b29]
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l277_c7_0b29]
signal tmp12_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l277_c7_0b29]
signal x_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l277_c7_0b29]
signal tmp16_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l277_c7_0b29]
signal is_blit_done_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l277_c7_0b29]
signal tmp16b_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l277_c7_0b29]
signal auto_advance_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l277_c7_0b29]
signal ram_addr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l277_c7_0b29]
signal flip_x_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l277_c7_0b29]
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l277_c7_0b29]
signal color_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l277_c7_0b29]
signal is_last_blit_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l277_c7_0b29]
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l277_c7_0b29]
signal tmp4_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l277_c7_0b29]
signal result_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l277_c7_0b29_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l277_c7_0b29_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l277_c7_0b29_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l277_c7_0b29]
signal y_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l277_c7_0b29]
signal auto_length_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l280_c11_927d]
signal BIN_OP_EQ_uxn_device_h_l280_c11_927d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l280_c11_927d_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l285_c7_ca68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l280_c7_ae3c]
signal flip_y_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l280_c7_ae3c]
signal screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l280_c7_ae3c]
signal ctrl_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l280_c7_ae3c]
signal ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l280_c7_ae3c]
signal layer_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l280_c7_ae3c]
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l280_c7_ae3c]
signal tmp12_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l280_c7_ae3c]
signal x_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l280_c7_ae3c]
signal tmp16_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l280_c7_ae3c]
signal is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l280_c7_ae3c]
signal tmp16b_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l280_c7_ae3c]
signal auto_advance_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l280_c7_ae3c]
signal ram_addr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l280_c7_ae3c]
signal flip_x_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l280_c7_ae3c]
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l280_c7_ae3c]
signal color_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l280_c7_ae3c]
signal is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l280_c7_ae3c]
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l280_c7_ae3c]
signal tmp4_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l280_c7_ae3c]
signal result_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l280_c7_ae3c_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l280_c7_ae3c_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l280_c7_ae3c_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l280_c7_ae3c]
signal y_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l280_c7_ae3c]
signal auto_length_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l285_c11_accd]
signal BIN_OP_EQ_uxn_device_h_l285_c11_accd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l285_c11_accd_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l289_c7_4274]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l285_c7_ca68]
signal flip_y_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l285_c7_ca68]
signal screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l285_c7_ca68]
signal ctrl_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l285_c7_ca68]
signal ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l285_c7_ca68]
signal layer_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l285_c7_ca68]
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l285_c7_ca68]
signal tmp12_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l285_c7_ca68]
signal x_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l285_c7_ca68]
signal tmp16_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l285_c7_ca68]
signal is_blit_done_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l285_c7_ca68]
signal tmp16b_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l285_c7_ca68]
signal auto_advance_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l285_c7_ca68]
signal ram_addr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l285_c7_ca68]
signal flip_x_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l285_c7_ca68]
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l285_c7_ca68]
signal color_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l285_c7_ca68]
signal is_last_blit_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l285_c7_ca68]
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l285_c7_ca68]
signal tmp4_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l285_c7_ca68]
signal result_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l285_c7_ca68_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l285_c7_ca68_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l285_c7_ca68_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l285_c7_ca68]
signal y_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l285_c7_ca68]
signal auto_length_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_device_h_l286_c3_1212]
signal BIN_OP_OR_uxn_device_h_l286_c3_1212_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l286_c3_1212_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l286_c3_1212_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l289_c11_94bf]
signal BIN_OP_EQ_uxn_device_h_l289_c11_94bf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l289_c11_94bf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l294_c7_a3f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l289_c7_4274]
signal flip_y_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l289_c7_4274]
signal screen_blit_result_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l289_c7_4274_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l289_c7_4274]
signal ctrl_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l289_c7_4274]
signal ctrl_mode_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l289_c7_4274]
signal layer_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l289_c7_4274]
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l289_c7_4274]
signal tmp12_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l289_c7_4274]
signal x_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l289_c7_4274]
signal tmp16_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l289_c7_4274]
signal is_blit_done_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l289_c7_4274]
signal tmp16b_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l289_c7_4274]
signal auto_advance_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l289_c7_4274]
signal ram_addr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l289_c7_4274]
signal flip_x_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l289_c7_4274]
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l289_c7_4274]
signal color_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l289_c7_4274]
signal is_last_blit_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l289_c7_4274]
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l289_c7_4274]
signal tmp4_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l289_c7_4274]
signal result_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l289_c7_4274_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l289_c7_4274_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l289_c7_4274_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l289_c7_4274]
signal y_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l289_c7_4274]
signal auto_length_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l294_c11_475b]
signal BIN_OP_EQ_uxn_device_h_l294_c11_475b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l294_c11_475b_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l298_c7_e683]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l294_c7_a3f2]
signal flip_y_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l294_c7_a3f2]
signal screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l294_c7_a3f2]
signal ctrl_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l294_c7_a3f2]
signal ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l294_c7_a3f2]
signal layer_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l294_c7_a3f2]
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l294_c7_a3f2]
signal tmp12_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l294_c7_a3f2]
signal x_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l294_c7_a3f2]
signal tmp16_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l294_c7_a3f2]
signal is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l294_c7_a3f2]
signal tmp16b_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l294_c7_a3f2]
signal auto_advance_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l294_c7_a3f2]
signal ram_addr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l294_c7_a3f2]
signal flip_x_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l294_c7_a3f2]
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l294_c7_a3f2]
signal color_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l294_c7_a3f2]
signal is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l294_c7_a3f2]
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l294_c7_a3f2]
signal tmp4_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l294_c7_a3f2]
signal result_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l294_c7_a3f2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l294_c7_a3f2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l294_c7_a3f2_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l294_c7_a3f2]
signal y_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l294_c7_a3f2]
signal auto_length_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_device_h_l295_c3_fab3]
signal BIN_OP_OR_uxn_device_h_l295_c3_fab3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l295_c3_fab3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l295_c3_fab3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l298_c11_5379]
signal BIN_OP_EQ_uxn_device_h_l298_c11_5379_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l298_c11_5379_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_6e72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l298_c7_e683]
signal flip_y_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l298_c7_e683]
signal screen_blit_result_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l298_c7_e683_return_output : screen_blit_result_t;

-- ctrl_MUX[uxn_device_h_l298_c7_e683]
signal ctrl_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l298_c7_e683]
signal ctrl_mode_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l298_c7_e683]
signal layer_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l298_c7_e683]
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l298_c7_e683]
signal tmp12_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l298_c7_e683]
signal x_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l298_c7_e683]
signal tmp16_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l298_c7_e683]
signal is_blit_done_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l298_c7_e683]
signal tmp16b_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l298_c7_e683]
signal auto_advance_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l298_c7_e683]
signal ram_addr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l298_c7_e683]
signal flip_x_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l298_c7_e683]
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l298_c7_e683]
signal color_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l298_c7_e683]
signal is_last_blit_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l298_c7_e683]
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l298_c7_e683]
signal tmp4_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l298_c7_e683]
signal result_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l298_c7_e683_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l298_c7_e683_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l298_c7_e683_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l298_c7_e683]
signal y_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l298_c7_e683]
signal auto_length_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l307_c11_9c9c]
signal BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_c0b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l307_c7_6e72]
signal screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l307_c7_6e72]
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l307_c7_6e72]
signal tmp12_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l307_c7_6e72]
signal x_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l307_c7_6e72]
signal tmp16_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l307_c7_6e72]
signal is_blit_done_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l307_c7_6e72]
signal tmp16b_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l307_c7_6e72]
signal auto_advance_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l307_c7_6e72]
signal ram_addr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l307_c7_6e72]
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(7 downto 0);

-- is_last_blit_MUX[uxn_device_h_l307_c7_6e72]
signal is_last_blit_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l307_c7_6e72]
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l307_c7_6e72]
signal tmp4_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l307_c7_6e72]
signal result_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l307_c7_6e72_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l307_c7_6e72_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l307_c7_6e72_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l307_c7_6e72]
signal y_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l307_c7_6e72]
signal auto_length_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l312_c11_496d]
signal BIN_OP_EQ_uxn_device_h_l312_c11_496d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_496d_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l321_c1_eebe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l312_c7_c0b6]
signal screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l312_c7_c0b6]
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l312_c7_c0b6]
signal tmp12_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l312_c7_c0b6]
signal x_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l312_c7_c0b6]
signal tmp16_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l312_c7_c0b6]
signal is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l312_c7_c0b6]
signal tmp16b_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l312_c7_c0b6]
signal auto_advance_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l312_c7_c0b6]
signal ram_addr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l312_c7_c0b6]
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(7 downto 0);

-- is_last_blit_MUX[uxn_device_h_l312_c7_c0b6]
signal is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l312_c7_c0b6]
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l312_c7_c0b6]
signal tmp4_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l312_c7_c0b6]
signal result_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l312_c7_c0b6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l312_c7_c0b6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l312_c7_c0b6_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l312_c7_c0b6]
signal y_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l312_c7_c0b6]
signal auto_length_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_device_h_l313_c3_95df]
signal BIN_OP_OR_uxn_device_h_l313_c3_95df_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l313_c3_95df_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l313_c3_95df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l322_c18_e5de]
signal BIN_OP_EQ_uxn_device_h_l322_c18_e5de_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l322_c18_e5de_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l322_c18_e5de_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l322_c18_9fa6]
signal MUX_uxn_device_h_l322_c18_9fa6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l322_c18_9fa6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l322_c18_9fa6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l322_c18_9fa6_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l324_c19_f784]
signal MUX_uxn_device_h_l324_c19_f784_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l324_c19_f784_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l324_c19_f784_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l324_c19_f784_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l325_c19_29dc]
signal MUX_uxn_device_h_l325_c19_29dc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l325_c19_29dc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l325_c19_29dc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l325_c19_29dc_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l326_c39_6cc9]
signal MUX_uxn_device_h_l326_c39_6cc9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l326_c39_6cc9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c39_6cc9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c39_6cc9_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l326_c20_db12]
signal MUX_uxn_device_h_l326_c20_db12_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l326_c20_db12_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c20_db12_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c20_db12_return_output : unsigned(15 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l372_c1_8b1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l327_c3_a9d2]
signal screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l327_c3_a9d2]
signal x_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l327_c3_a9d2]
signal tmp16_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l327_c3_a9d2]
signal tmp16b_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l327_c3_a9d2]
signal ram_addr_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);

-- is_last_blit_MUX[uxn_device_h_l327_c3_a9d2]
signal is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l327_c3_a9d2]
signal tmp4_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l327_c3_a9d2]
signal result_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l327_c3_a9d2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l327_c3_a9d2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l327_c3_a9d2_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l327_c3_a9d2]
signal y_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l328_c8_e3f4]
signal BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l328_c4_af6b]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l328_c4_af6b]
signal x_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l328_c4_af6b]
signal tmp16_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l328_c4_af6b]
signal tmp16b_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l328_c4_af6b]
signal ram_addr_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l328_c4_af6b]
signal tmp4_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(3 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l328_c4_af6b]
signal result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l328_c4_af6b]
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l328_c4_af6b]
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l328_c4_af6b]
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l328_c4_af6b]
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l328_c4_af6b]
signal result_u8_value_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l328_c4_af6b]
signal y_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l329_c23_62a1]
signal BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l329_c49_5b91]
signal BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l329_c13_c07d]
signal MUX_uxn_device_h_l329_c13_c07d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l329_c13_c07d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c13_c07d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c13_c07d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l330_c24_d5a5]
signal BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l330_c51_a4d7]
signal BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l330_c14_6c23]
signal MUX_uxn_device_h_l330_c14_6c23_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l330_c14_6c23_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l330_c14_6c23_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l330_c14_6c23_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l331_c36_6202]
signal BIN_OP_MINUS_uxn_device_h_l331_c36_6202_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l331_c36_6202_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l331_c36_6202_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l331_c58_64f7]
signal BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l331_c26_3240]
signal MUX_uxn_device_h_l331_c26_3240_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l331_c26_3240_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c26_3240_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c26_3240_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l331_c10_e68e]
signal MUX_uxn_device_h_l331_c10_e68e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l331_c10_e68e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c10_e68e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c10_e68e_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l332_c36_d167]
signal BIN_OP_MINUS_uxn_device_h_l332_c36_d167_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l332_c36_d167_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l332_c36_d167_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l332_c58_8fda]
signal BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l332_c26_acf6]
signal MUX_uxn_device_h_l332_c26_acf6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l332_c26_acf6_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c26_acf6_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c26_acf6_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l332_c10_f6fb]
signal MUX_uxn_device_h_l332_c10_f6fb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l332_c10_f6fb_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c10_f6fb_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c10_f6fb_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l337_c33_57b6]
signal CONST_SR_8_uxn_device_h_l337_c33_57b6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l337_c33_57b6_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l339_c22_398e]
signal BIN_OP_MINUS_uxn_device_h_l339_c22_398e_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l339_c22_398e_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l339_c22_398e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l339_c13_9a82]
signal BIN_OP_EQ_uxn_device_h_l339_c13_9a82_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c13_9a82_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l339_c9_f614]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l339_c9_f614]
signal ram_addr_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l339_c9_f614]
signal tmp4_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l339_c9_f614]
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l339_c9_f614]
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l339_c9_f614]
signal result_u8_value_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l339_c9_f614]
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l344_c22_0751]
signal BIN_OP_MINUS_uxn_device_h_l344_c22_0751_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l344_c22_0751_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l344_c22_0751_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l344_c13_b62e]
signal BIN_OP_EQ_uxn_device_h_l344_c13_b62e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c13_b62e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l344_c9_0980]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l344_c9_0980]
signal ram_addr_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l344_c9_0980]
signal tmp4_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l344_c9_0980]
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l344_c9_0980]
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l344_c9_0980]
signal result_u8_value_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l344_c9_0980]
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_device_h_l347_c33_4bef]
signal CONST_SR_8_uxn_device_h_l347_c33_4bef_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l347_c33_4bef_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l349_c22_94de]
signal BIN_OP_MINUS_uxn_device_h_l349_c22_94de_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l349_c22_94de_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l349_c22_94de_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l349_c13_7449]
signal BIN_OP_EQ_uxn_device_h_l349_c13_7449_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l349_c13_7449_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l349_c9_40bd]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l349_c9_40bd]
signal ram_addr_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l349_c9_40bd]
signal tmp4_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l349_c9_40bd]
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l349_c9_40bd]
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l349_c9_40bd]
signal result_u8_value_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l349_c9_40bd]
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l354_c22_b60f]
signal BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l354_c13_d95a]
signal BIN_OP_EQ_uxn_device_h_l354_c13_d95a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l354_c13_d95a_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l354_c9_b7e3]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l354_c9_b7e3]
signal ram_addr_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l354_c9_b7e3]
signal tmp4_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l354_c9_b7e3]
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l354_c9_b7e3]
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l354_c9_b7e3]
signal result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l354_c9_b7e3]
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l355_c5_cd12]
signal BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l358_c33_8a21]
signal CONST_SR_8_uxn_device_h_l358_c33_8a21_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l358_c33_8a21_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l360_c22_8b7e]
signal BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l360_c13_6788]
signal BIN_OP_EQ_uxn_device_h_l360_c13_6788_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l360_c13_6788_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l360_c9_3644]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l360_c9_3644]
signal tmp4_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l360_c9_3644]
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l360_c9_3644]
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l360_c9_3644]
signal result_u8_value_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l360_c9_3644]
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l365_c22_d6ba]
signal BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l365_c13_15df]
signal BIN_OP_EQ_uxn_device_h_l365_c13_15df_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l365_c13_15df_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l365_c9_2381]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l365_c9_2381]
signal tmp4_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(3 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l365_c9_2381]
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l365_c9_2381]
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l365_c9_2381]
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l366_c5_5eff]
signal BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_left : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_return_output : unsigned(4 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l373_c1_579b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_dac9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l373_c4_1c57]
signal screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output : screen_blit_result_t;

-- screen_2bpp[uxn_device_h_l374_c26_b79f]
signal screen_2bpp_uxn_device_h_l374_c26_b79f_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_phase : unsigned(11 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_x1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_y1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_color : unsigned(3 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_fx : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_fy : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_ram_addr : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_previous_ram_read : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_b79f_return_output : screen_blit_result_t;

-- screen_1bpp[uxn_device_h_l376_c26_8897]
signal screen_1bpp_uxn_device_h_l376_c26_8897_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_phase : unsigned(11 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_x1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_y1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_color : unsigned(3 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_fx : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_fy : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_ram_addr : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_previous_ram_read : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_8897_return_output : screen_blit_result_t;

-- BIN_OP_EQ[uxn_device_h_l385_c19_60a4]
signal BIN_OP_EQ_uxn_device_h_l385_c19_60a4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l385_c19_60a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l385_c19_60a4_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l385_c19_dc40]
signal MUX_uxn_device_h_l385_c19_dc40_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l385_c19_dc40_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l385_c19_dc40_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l385_c19_dc40_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_device_h_l388_c11_f3dd]
signal BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l388_c60_ef41]
signal BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_return_output : unsigned(12 downto 0);

-- MUX[uxn_device_h_l388_c11_dc82]
signal MUX_uxn_device_h_l388_c11_dc82_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c11_dc82_iftrue : unsigned(11 downto 0);
signal MUX_uxn_device_h_l388_c11_dc82_iffalse : unsigned(11 downto 0);
signal MUX_uxn_device_h_l388_c11_dc82_return_output : unsigned(11 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c
signal CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output : unsigned(11 downto 0);

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

function uint8_7_7( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function uint8_6_6( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;

function uint8_5_5( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint8_4_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint8_3_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(3 downto 0)));
return return_output;
end function;

function uint8_7_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 4)));
return return_output;
end function;

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint8_1_1( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint8_2_2( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63( ref_toks_0 : screen_blit_result_t;
 ref_toks_1 : unsigned) return screen_blit_result_t is
 
  variable base : screen_blit_result_t; 
  variable return_output : screen_blit_result_t;
begin
      base := ref_toks_0;
      base.is_blit_done := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_96f0( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_39b7( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.u16_addr := ref_toks_4;
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


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l270_c6_ca16
BIN_OP_EQ_uxn_device_h_l270_c6_ca16 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l270_c6_ca16_left,
BIN_OP_EQ_uxn_device_h_l270_c6_ca16_right,
BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- flip_y_MUX_uxn_device_h_l270_c2_4b38
flip_y_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l270_c2_4b38_cond,
flip_y_MUX_uxn_device_h_l270_c2_4b38_iftrue,
flip_y_MUX_uxn_device_h_l270_c2_4b38_iffalse,
flip_y_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- screen_blit_result_MUX_uxn_device_h_l270_c2_4b38
screen_blit_result_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_cond,
screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iftrue,
screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iffalse,
screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- ctrl_MUX_uxn_device_h_l270_c2_4b38
ctrl_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l270_c2_4b38_cond,
ctrl_MUX_uxn_device_h_l270_c2_4b38_iftrue,
ctrl_MUX_uxn_device_h_l270_c2_4b38_iffalse,
ctrl_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- ctrl_mode_MUX_uxn_device_h_l270_c2_4b38
ctrl_mode_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_cond,
ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iftrue,
ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iffalse,
ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- layer_MUX_uxn_device_h_l270_c2_4b38
layer_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l270_c2_4b38_cond,
layer_MUX_uxn_device_h_l270_c2_4b38_iftrue,
layer_MUX_uxn_device_h_l270_c2_4b38_iffalse,
layer_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38
ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_cond,
ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue,
ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse,
ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- tmp12_MUX_uxn_device_h_l270_c2_4b38
tmp12_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l270_c2_4b38_cond,
tmp12_MUX_uxn_device_h_l270_c2_4b38_iftrue,
tmp12_MUX_uxn_device_h_l270_c2_4b38_iffalse,
tmp12_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- x_MUX_uxn_device_h_l270_c2_4b38
x_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l270_c2_4b38_cond,
x_MUX_uxn_device_h_l270_c2_4b38_iftrue,
x_MUX_uxn_device_h_l270_c2_4b38_iffalse,
x_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- tmp16_MUX_uxn_device_h_l270_c2_4b38
tmp16_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l270_c2_4b38_cond,
tmp16_MUX_uxn_device_h_l270_c2_4b38_iftrue,
tmp16_MUX_uxn_device_h_l270_c2_4b38_iffalse,
tmp16_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- is_blit_done_MUX_uxn_device_h_l270_c2_4b38
is_blit_done_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l270_c2_4b38_cond,
is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iftrue,
is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iffalse,
is_blit_done_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- tmp16b_MUX_uxn_device_h_l270_c2_4b38
tmp16b_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l270_c2_4b38_cond,
tmp16b_MUX_uxn_device_h_l270_c2_4b38_iftrue,
tmp16b_MUX_uxn_device_h_l270_c2_4b38_iffalse,
tmp16b_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- auto_advance_MUX_uxn_device_h_l270_c2_4b38
auto_advance_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l270_c2_4b38_cond,
auto_advance_MUX_uxn_device_h_l270_c2_4b38_iftrue,
auto_advance_MUX_uxn_device_h_l270_c2_4b38_iffalse,
auto_advance_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- ram_addr_MUX_uxn_device_h_l270_c2_4b38
ram_addr_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l270_c2_4b38_cond,
ram_addr_MUX_uxn_device_h_l270_c2_4b38_iftrue,
ram_addr_MUX_uxn_device_h_l270_c2_4b38_iffalse,
ram_addr_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- flip_x_MUX_uxn_device_h_l270_c2_4b38
flip_x_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l270_c2_4b38_cond,
flip_x_MUX_uxn_device_h_l270_c2_4b38_iftrue,
flip_x_MUX_uxn_device_h_l270_c2_4b38_iffalse,
flip_x_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38
y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond,
y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue,
y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse,
y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- color_MUX_uxn_device_h_l270_c2_4b38
color_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l270_c2_4b38_cond,
color_MUX_uxn_device_h_l270_c2_4b38_iftrue,
color_MUX_uxn_device_h_l270_c2_4b38_iffalse,
color_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- is_last_blit_MUX_uxn_device_h_l270_c2_4b38
is_last_blit_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l270_c2_4b38_cond,
is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iftrue,
is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iffalse,
is_last_blit_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38
x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond,
x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue,
x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse,
x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- tmp4_MUX_uxn_device_h_l270_c2_4b38
tmp4_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l270_c2_4b38_cond,
tmp4_MUX_uxn_device_h_l270_c2_4b38_iftrue,
tmp4_MUX_uxn_device_h_l270_c2_4b38_iffalse,
tmp4_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- result_MUX_uxn_device_h_l270_c2_4b38
result_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l270_c2_4b38_cond,
result_MUX_uxn_device_h_l270_c2_4b38_iftrue,
result_MUX_uxn_device_h_l270_c2_4b38_iffalse,
result_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- y_MUX_uxn_device_h_l270_c2_4b38
y_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l270_c2_4b38_cond,
y_MUX_uxn_device_h_l270_c2_4b38_iftrue,
y_MUX_uxn_device_h_l270_c2_4b38_iffalse,
y_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- auto_length_MUX_uxn_device_h_l270_c2_4b38
auto_length_MUX_uxn_device_h_l270_c2_4b38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l270_c2_4b38_cond,
auto_length_MUX_uxn_device_h_l270_c2_4b38_iftrue,
auto_length_MUX_uxn_device_h_l270_c2_4b38_iffalse,
auto_length_MUX_uxn_device_h_l270_c2_4b38_return_output);

-- BIN_OP_EQ_uxn_device_h_l277_c11_78be
BIN_OP_EQ_uxn_device_h_l277_c11_78be : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l277_c11_78be_left,
BIN_OP_EQ_uxn_device_h_l277_c11_78be_right,
BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- flip_y_MUX_uxn_device_h_l277_c7_0b29
flip_y_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l277_c7_0b29_cond,
flip_y_MUX_uxn_device_h_l277_c7_0b29_iftrue,
flip_y_MUX_uxn_device_h_l277_c7_0b29_iffalse,
flip_y_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- screen_blit_result_MUX_uxn_device_h_l277_c7_0b29
screen_blit_result_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_cond,
screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iftrue,
screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iffalse,
screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- ctrl_MUX_uxn_device_h_l277_c7_0b29
ctrl_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l277_c7_0b29_cond,
ctrl_MUX_uxn_device_h_l277_c7_0b29_iftrue,
ctrl_MUX_uxn_device_h_l277_c7_0b29_iffalse,
ctrl_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- ctrl_mode_MUX_uxn_device_h_l277_c7_0b29
ctrl_mode_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_cond,
ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iftrue,
ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iffalse,
ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- layer_MUX_uxn_device_h_l277_c7_0b29
layer_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l277_c7_0b29_cond,
layer_MUX_uxn_device_h_l277_c7_0b29_iftrue,
layer_MUX_uxn_device_h_l277_c7_0b29_iffalse,
layer_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29
ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_cond,
ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue,
ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse,
ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- tmp12_MUX_uxn_device_h_l277_c7_0b29
tmp12_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l277_c7_0b29_cond,
tmp12_MUX_uxn_device_h_l277_c7_0b29_iftrue,
tmp12_MUX_uxn_device_h_l277_c7_0b29_iffalse,
tmp12_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- x_MUX_uxn_device_h_l277_c7_0b29
x_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l277_c7_0b29_cond,
x_MUX_uxn_device_h_l277_c7_0b29_iftrue,
x_MUX_uxn_device_h_l277_c7_0b29_iffalse,
x_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- tmp16_MUX_uxn_device_h_l277_c7_0b29
tmp16_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l277_c7_0b29_cond,
tmp16_MUX_uxn_device_h_l277_c7_0b29_iftrue,
tmp16_MUX_uxn_device_h_l277_c7_0b29_iffalse,
tmp16_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- is_blit_done_MUX_uxn_device_h_l277_c7_0b29
is_blit_done_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l277_c7_0b29_cond,
is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iftrue,
is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iffalse,
is_blit_done_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- tmp16b_MUX_uxn_device_h_l277_c7_0b29
tmp16b_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l277_c7_0b29_cond,
tmp16b_MUX_uxn_device_h_l277_c7_0b29_iftrue,
tmp16b_MUX_uxn_device_h_l277_c7_0b29_iffalse,
tmp16b_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- auto_advance_MUX_uxn_device_h_l277_c7_0b29
auto_advance_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l277_c7_0b29_cond,
auto_advance_MUX_uxn_device_h_l277_c7_0b29_iftrue,
auto_advance_MUX_uxn_device_h_l277_c7_0b29_iffalse,
auto_advance_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- ram_addr_MUX_uxn_device_h_l277_c7_0b29
ram_addr_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l277_c7_0b29_cond,
ram_addr_MUX_uxn_device_h_l277_c7_0b29_iftrue,
ram_addr_MUX_uxn_device_h_l277_c7_0b29_iffalse,
ram_addr_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- flip_x_MUX_uxn_device_h_l277_c7_0b29
flip_x_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l277_c7_0b29_cond,
flip_x_MUX_uxn_device_h_l277_c7_0b29_iftrue,
flip_x_MUX_uxn_device_h_l277_c7_0b29_iffalse,
flip_x_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29
y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond,
y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue,
y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse,
y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- color_MUX_uxn_device_h_l277_c7_0b29
color_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l277_c7_0b29_cond,
color_MUX_uxn_device_h_l277_c7_0b29_iftrue,
color_MUX_uxn_device_h_l277_c7_0b29_iffalse,
color_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- is_last_blit_MUX_uxn_device_h_l277_c7_0b29
is_last_blit_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l277_c7_0b29_cond,
is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iftrue,
is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iffalse,
is_last_blit_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29
x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond,
x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue,
x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse,
x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- tmp4_MUX_uxn_device_h_l277_c7_0b29
tmp4_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l277_c7_0b29_cond,
tmp4_MUX_uxn_device_h_l277_c7_0b29_iftrue,
tmp4_MUX_uxn_device_h_l277_c7_0b29_iffalse,
tmp4_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- result_MUX_uxn_device_h_l277_c7_0b29
result_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l277_c7_0b29_cond,
result_MUX_uxn_device_h_l277_c7_0b29_iftrue,
result_MUX_uxn_device_h_l277_c7_0b29_iffalse,
result_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- y_MUX_uxn_device_h_l277_c7_0b29
y_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l277_c7_0b29_cond,
y_MUX_uxn_device_h_l277_c7_0b29_iftrue,
y_MUX_uxn_device_h_l277_c7_0b29_iffalse,
y_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- auto_length_MUX_uxn_device_h_l277_c7_0b29
auto_length_MUX_uxn_device_h_l277_c7_0b29 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l277_c7_0b29_cond,
auto_length_MUX_uxn_device_h_l277_c7_0b29_iftrue,
auto_length_MUX_uxn_device_h_l277_c7_0b29_iffalse,
auto_length_MUX_uxn_device_h_l277_c7_0b29_return_output);

-- BIN_OP_EQ_uxn_device_h_l280_c11_927d
BIN_OP_EQ_uxn_device_h_l280_c11_927d : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l280_c11_927d_left,
BIN_OP_EQ_uxn_device_h_l280_c11_927d_right,
BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- flip_y_MUX_uxn_device_h_l280_c7_ae3c
flip_y_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l280_c7_ae3c_cond,
flip_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
flip_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
flip_y_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c
screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_cond,
screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- ctrl_MUX_uxn_device_h_l280_c7_ae3c
ctrl_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l280_c7_ae3c_cond,
ctrl_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
ctrl_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
ctrl_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c
ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_cond,
ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- layer_MUX_uxn_device_h_l280_c7_ae3c
layer_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l280_c7_ae3c_cond,
layer_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
layer_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
layer_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c
ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_cond,
ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- tmp12_MUX_uxn_device_h_l280_c7_ae3c
tmp12_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l280_c7_ae3c_cond,
tmp12_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
tmp12_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
tmp12_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- x_MUX_uxn_device_h_l280_c7_ae3c
x_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l280_c7_ae3c_cond,
x_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
x_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
x_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- tmp16_MUX_uxn_device_h_l280_c7_ae3c
tmp16_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l280_c7_ae3c_cond,
tmp16_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
tmp16_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
tmp16_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- is_blit_done_MUX_uxn_device_h_l280_c7_ae3c
is_blit_done_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_cond,
is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- tmp16b_MUX_uxn_device_h_l280_c7_ae3c
tmp16b_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l280_c7_ae3c_cond,
tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
tmp16b_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- auto_advance_MUX_uxn_device_h_l280_c7_ae3c
auto_advance_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l280_c7_ae3c_cond,
auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
auto_advance_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- ram_addr_MUX_uxn_device_h_l280_c7_ae3c
ram_addr_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l280_c7_ae3c_cond,
ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
ram_addr_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- flip_x_MUX_uxn_device_h_l280_c7_ae3c
flip_x_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l280_c7_ae3c_cond,
flip_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
flip_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
flip_x_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c
y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond,
y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- color_MUX_uxn_device_h_l280_c7_ae3c
color_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l280_c7_ae3c_cond,
color_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
color_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
color_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- is_last_blit_MUX_uxn_device_h_l280_c7_ae3c
is_last_blit_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_cond,
is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c
x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond,
x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- tmp4_MUX_uxn_device_h_l280_c7_ae3c
tmp4_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l280_c7_ae3c_cond,
tmp4_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
tmp4_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
tmp4_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- result_MUX_uxn_device_h_l280_c7_ae3c
result_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l280_c7_ae3c_cond,
result_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
result_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
result_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- y_MUX_uxn_device_h_l280_c7_ae3c
y_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l280_c7_ae3c_cond,
y_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
y_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
y_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- auto_length_MUX_uxn_device_h_l280_c7_ae3c
auto_length_MUX_uxn_device_h_l280_c7_ae3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l280_c7_ae3c_cond,
auto_length_MUX_uxn_device_h_l280_c7_ae3c_iftrue,
auto_length_MUX_uxn_device_h_l280_c7_ae3c_iffalse,
auto_length_MUX_uxn_device_h_l280_c7_ae3c_return_output);

-- BIN_OP_EQ_uxn_device_h_l285_c11_accd
BIN_OP_EQ_uxn_device_h_l285_c11_accd : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l285_c11_accd_left,
BIN_OP_EQ_uxn_device_h_l285_c11_accd_right,
BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_return_output);

-- flip_y_MUX_uxn_device_h_l285_c7_ca68
flip_y_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l285_c7_ca68_cond,
flip_y_MUX_uxn_device_h_l285_c7_ca68_iftrue,
flip_y_MUX_uxn_device_h_l285_c7_ca68_iffalse,
flip_y_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- screen_blit_result_MUX_uxn_device_h_l285_c7_ca68
screen_blit_result_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_cond,
screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iftrue,
screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iffalse,
screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- ctrl_MUX_uxn_device_h_l285_c7_ca68
ctrl_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l285_c7_ca68_cond,
ctrl_MUX_uxn_device_h_l285_c7_ca68_iftrue,
ctrl_MUX_uxn_device_h_l285_c7_ca68_iffalse,
ctrl_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- ctrl_mode_MUX_uxn_device_h_l285_c7_ca68
ctrl_mode_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_cond,
ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iftrue,
ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iffalse,
ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- layer_MUX_uxn_device_h_l285_c7_ca68
layer_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l285_c7_ca68_cond,
layer_MUX_uxn_device_h_l285_c7_ca68_iftrue,
layer_MUX_uxn_device_h_l285_c7_ca68_iffalse,
layer_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68
ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_cond,
ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue,
ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse,
ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- tmp12_MUX_uxn_device_h_l285_c7_ca68
tmp12_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l285_c7_ca68_cond,
tmp12_MUX_uxn_device_h_l285_c7_ca68_iftrue,
tmp12_MUX_uxn_device_h_l285_c7_ca68_iffalse,
tmp12_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- x_MUX_uxn_device_h_l285_c7_ca68
x_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l285_c7_ca68_cond,
x_MUX_uxn_device_h_l285_c7_ca68_iftrue,
x_MUX_uxn_device_h_l285_c7_ca68_iffalse,
x_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- tmp16_MUX_uxn_device_h_l285_c7_ca68
tmp16_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l285_c7_ca68_cond,
tmp16_MUX_uxn_device_h_l285_c7_ca68_iftrue,
tmp16_MUX_uxn_device_h_l285_c7_ca68_iffalse,
tmp16_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- is_blit_done_MUX_uxn_device_h_l285_c7_ca68
is_blit_done_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l285_c7_ca68_cond,
is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iftrue,
is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iffalse,
is_blit_done_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- tmp16b_MUX_uxn_device_h_l285_c7_ca68
tmp16b_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l285_c7_ca68_cond,
tmp16b_MUX_uxn_device_h_l285_c7_ca68_iftrue,
tmp16b_MUX_uxn_device_h_l285_c7_ca68_iffalse,
tmp16b_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- auto_advance_MUX_uxn_device_h_l285_c7_ca68
auto_advance_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l285_c7_ca68_cond,
auto_advance_MUX_uxn_device_h_l285_c7_ca68_iftrue,
auto_advance_MUX_uxn_device_h_l285_c7_ca68_iffalse,
auto_advance_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- ram_addr_MUX_uxn_device_h_l285_c7_ca68
ram_addr_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l285_c7_ca68_cond,
ram_addr_MUX_uxn_device_h_l285_c7_ca68_iftrue,
ram_addr_MUX_uxn_device_h_l285_c7_ca68_iffalse,
ram_addr_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- flip_x_MUX_uxn_device_h_l285_c7_ca68
flip_x_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l285_c7_ca68_cond,
flip_x_MUX_uxn_device_h_l285_c7_ca68_iftrue,
flip_x_MUX_uxn_device_h_l285_c7_ca68_iffalse,
flip_x_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68
y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond,
y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue,
y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse,
y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- color_MUX_uxn_device_h_l285_c7_ca68
color_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l285_c7_ca68_cond,
color_MUX_uxn_device_h_l285_c7_ca68_iftrue,
color_MUX_uxn_device_h_l285_c7_ca68_iffalse,
color_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- is_last_blit_MUX_uxn_device_h_l285_c7_ca68
is_last_blit_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l285_c7_ca68_cond,
is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iftrue,
is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iffalse,
is_last_blit_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68
x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond,
x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue,
x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse,
x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- tmp4_MUX_uxn_device_h_l285_c7_ca68
tmp4_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l285_c7_ca68_cond,
tmp4_MUX_uxn_device_h_l285_c7_ca68_iftrue,
tmp4_MUX_uxn_device_h_l285_c7_ca68_iffalse,
tmp4_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- result_MUX_uxn_device_h_l285_c7_ca68
result_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l285_c7_ca68_cond,
result_MUX_uxn_device_h_l285_c7_ca68_iftrue,
result_MUX_uxn_device_h_l285_c7_ca68_iffalse,
result_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- y_MUX_uxn_device_h_l285_c7_ca68
y_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l285_c7_ca68_cond,
y_MUX_uxn_device_h_l285_c7_ca68_iftrue,
y_MUX_uxn_device_h_l285_c7_ca68_iffalse,
y_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- auto_length_MUX_uxn_device_h_l285_c7_ca68
auto_length_MUX_uxn_device_h_l285_c7_ca68 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l285_c7_ca68_cond,
auto_length_MUX_uxn_device_h_l285_c7_ca68_iftrue,
auto_length_MUX_uxn_device_h_l285_c7_ca68_iffalse,
auto_length_MUX_uxn_device_h_l285_c7_ca68_return_output);

-- BIN_OP_OR_uxn_device_h_l286_c3_1212
BIN_OP_OR_uxn_device_h_l286_c3_1212 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l286_c3_1212_left,
BIN_OP_OR_uxn_device_h_l286_c3_1212_right,
BIN_OP_OR_uxn_device_h_l286_c3_1212_return_output);

-- BIN_OP_EQ_uxn_device_h_l289_c11_94bf
BIN_OP_EQ_uxn_device_h_l289_c11_94bf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l289_c11_94bf_left,
BIN_OP_EQ_uxn_device_h_l289_c11_94bf_right,
BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- flip_y_MUX_uxn_device_h_l289_c7_4274
flip_y_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l289_c7_4274_cond,
flip_y_MUX_uxn_device_h_l289_c7_4274_iftrue,
flip_y_MUX_uxn_device_h_l289_c7_4274_iffalse,
flip_y_MUX_uxn_device_h_l289_c7_4274_return_output);

-- screen_blit_result_MUX_uxn_device_h_l289_c7_4274
screen_blit_result_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l289_c7_4274_cond,
screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iftrue,
screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iffalse,
screen_blit_result_MUX_uxn_device_h_l289_c7_4274_return_output);

-- ctrl_MUX_uxn_device_h_l289_c7_4274
ctrl_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l289_c7_4274_cond,
ctrl_MUX_uxn_device_h_l289_c7_4274_iftrue,
ctrl_MUX_uxn_device_h_l289_c7_4274_iffalse,
ctrl_MUX_uxn_device_h_l289_c7_4274_return_output);

-- ctrl_mode_MUX_uxn_device_h_l289_c7_4274
ctrl_mode_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l289_c7_4274_cond,
ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iftrue,
ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iffalse,
ctrl_mode_MUX_uxn_device_h_l289_c7_4274_return_output);

-- layer_MUX_uxn_device_h_l289_c7_4274
layer_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l289_c7_4274_cond,
layer_MUX_uxn_device_h_l289_c7_4274_iftrue,
layer_MUX_uxn_device_h_l289_c7_4274_iffalse,
layer_MUX_uxn_device_h_l289_c7_4274_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l289_c7_4274
ram_addr_incr_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_cond,
ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iftrue,
ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iffalse,
ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_return_output);

-- tmp12_MUX_uxn_device_h_l289_c7_4274
tmp12_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l289_c7_4274_cond,
tmp12_MUX_uxn_device_h_l289_c7_4274_iftrue,
tmp12_MUX_uxn_device_h_l289_c7_4274_iffalse,
tmp12_MUX_uxn_device_h_l289_c7_4274_return_output);

-- x_MUX_uxn_device_h_l289_c7_4274
x_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l289_c7_4274_cond,
x_MUX_uxn_device_h_l289_c7_4274_iftrue,
x_MUX_uxn_device_h_l289_c7_4274_iffalse,
x_MUX_uxn_device_h_l289_c7_4274_return_output);

-- tmp16_MUX_uxn_device_h_l289_c7_4274
tmp16_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l289_c7_4274_cond,
tmp16_MUX_uxn_device_h_l289_c7_4274_iftrue,
tmp16_MUX_uxn_device_h_l289_c7_4274_iffalse,
tmp16_MUX_uxn_device_h_l289_c7_4274_return_output);

-- is_blit_done_MUX_uxn_device_h_l289_c7_4274
is_blit_done_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l289_c7_4274_cond,
is_blit_done_MUX_uxn_device_h_l289_c7_4274_iftrue,
is_blit_done_MUX_uxn_device_h_l289_c7_4274_iffalse,
is_blit_done_MUX_uxn_device_h_l289_c7_4274_return_output);

-- tmp16b_MUX_uxn_device_h_l289_c7_4274
tmp16b_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l289_c7_4274_cond,
tmp16b_MUX_uxn_device_h_l289_c7_4274_iftrue,
tmp16b_MUX_uxn_device_h_l289_c7_4274_iffalse,
tmp16b_MUX_uxn_device_h_l289_c7_4274_return_output);

-- auto_advance_MUX_uxn_device_h_l289_c7_4274
auto_advance_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l289_c7_4274_cond,
auto_advance_MUX_uxn_device_h_l289_c7_4274_iftrue,
auto_advance_MUX_uxn_device_h_l289_c7_4274_iffalse,
auto_advance_MUX_uxn_device_h_l289_c7_4274_return_output);

-- ram_addr_MUX_uxn_device_h_l289_c7_4274
ram_addr_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l289_c7_4274_cond,
ram_addr_MUX_uxn_device_h_l289_c7_4274_iftrue,
ram_addr_MUX_uxn_device_h_l289_c7_4274_iffalse,
ram_addr_MUX_uxn_device_h_l289_c7_4274_return_output);

-- flip_x_MUX_uxn_device_h_l289_c7_4274
flip_x_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l289_c7_4274_cond,
flip_x_MUX_uxn_device_h_l289_c7_4274_iftrue,
flip_x_MUX_uxn_device_h_l289_c7_4274_iffalse,
flip_x_MUX_uxn_device_h_l289_c7_4274_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l289_c7_4274
y_sprite_incr_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond,
y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue,
y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse,
y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output);

-- color_MUX_uxn_device_h_l289_c7_4274
color_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l289_c7_4274_cond,
color_MUX_uxn_device_h_l289_c7_4274_iftrue,
color_MUX_uxn_device_h_l289_c7_4274_iffalse,
color_MUX_uxn_device_h_l289_c7_4274_return_output);

-- is_last_blit_MUX_uxn_device_h_l289_c7_4274
is_last_blit_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l289_c7_4274_cond,
is_last_blit_MUX_uxn_device_h_l289_c7_4274_iftrue,
is_last_blit_MUX_uxn_device_h_l289_c7_4274_iffalse,
is_last_blit_MUX_uxn_device_h_l289_c7_4274_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l289_c7_4274
x_sprite_incr_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond,
x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue,
x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse,
x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output);

-- tmp4_MUX_uxn_device_h_l289_c7_4274
tmp4_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l289_c7_4274_cond,
tmp4_MUX_uxn_device_h_l289_c7_4274_iftrue,
tmp4_MUX_uxn_device_h_l289_c7_4274_iffalse,
tmp4_MUX_uxn_device_h_l289_c7_4274_return_output);

-- result_MUX_uxn_device_h_l289_c7_4274
result_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l289_c7_4274_cond,
result_MUX_uxn_device_h_l289_c7_4274_iftrue,
result_MUX_uxn_device_h_l289_c7_4274_iffalse,
result_MUX_uxn_device_h_l289_c7_4274_return_output);

-- y_MUX_uxn_device_h_l289_c7_4274
y_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l289_c7_4274_cond,
y_MUX_uxn_device_h_l289_c7_4274_iftrue,
y_MUX_uxn_device_h_l289_c7_4274_iffalse,
y_MUX_uxn_device_h_l289_c7_4274_return_output);

-- auto_length_MUX_uxn_device_h_l289_c7_4274
auto_length_MUX_uxn_device_h_l289_c7_4274 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l289_c7_4274_cond,
auto_length_MUX_uxn_device_h_l289_c7_4274_iftrue,
auto_length_MUX_uxn_device_h_l289_c7_4274_iffalse,
auto_length_MUX_uxn_device_h_l289_c7_4274_return_output);

-- BIN_OP_EQ_uxn_device_h_l294_c11_475b
BIN_OP_EQ_uxn_device_h_l294_c11_475b : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l294_c11_475b_left,
BIN_OP_EQ_uxn_device_h_l294_c11_475b_right,
BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_return_output);

-- flip_y_MUX_uxn_device_h_l294_c7_a3f2
flip_y_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l294_c7_a3f2_cond,
flip_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
flip_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
flip_y_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2
screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_cond,
screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- ctrl_MUX_uxn_device_h_l294_c7_a3f2
ctrl_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l294_c7_a3f2_cond,
ctrl_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
ctrl_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
ctrl_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2
ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_cond,
ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- layer_MUX_uxn_device_h_l294_c7_a3f2
layer_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l294_c7_a3f2_cond,
layer_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
layer_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
layer_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2
ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_cond,
ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- tmp12_MUX_uxn_device_h_l294_c7_a3f2
tmp12_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l294_c7_a3f2_cond,
tmp12_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
tmp12_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
tmp12_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- x_MUX_uxn_device_h_l294_c7_a3f2
x_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l294_c7_a3f2_cond,
x_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
x_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
x_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- tmp16_MUX_uxn_device_h_l294_c7_a3f2
tmp16_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l294_c7_a3f2_cond,
tmp16_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
tmp16_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
tmp16_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- is_blit_done_MUX_uxn_device_h_l294_c7_a3f2
is_blit_done_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_cond,
is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- tmp16b_MUX_uxn_device_h_l294_c7_a3f2
tmp16b_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l294_c7_a3f2_cond,
tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
tmp16b_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- auto_advance_MUX_uxn_device_h_l294_c7_a3f2
auto_advance_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l294_c7_a3f2_cond,
auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
auto_advance_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- ram_addr_MUX_uxn_device_h_l294_c7_a3f2
ram_addr_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l294_c7_a3f2_cond,
ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
ram_addr_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- flip_x_MUX_uxn_device_h_l294_c7_a3f2
flip_x_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l294_c7_a3f2_cond,
flip_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
flip_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
flip_x_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2
y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond,
y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- color_MUX_uxn_device_h_l294_c7_a3f2
color_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l294_c7_a3f2_cond,
color_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
color_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
color_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- is_last_blit_MUX_uxn_device_h_l294_c7_a3f2
is_last_blit_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_cond,
is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2
x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond,
x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- tmp4_MUX_uxn_device_h_l294_c7_a3f2
tmp4_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l294_c7_a3f2_cond,
tmp4_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
tmp4_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
tmp4_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- result_MUX_uxn_device_h_l294_c7_a3f2
result_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l294_c7_a3f2_cond,
result_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
result_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
result_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- y_MUX_uxn_device_h_l294_c7_a3f2
y_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l294_c7_a3f2_cond,
y_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
y_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
y_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- auto_length_MUX_uxn_device_h_l294_c7_a3f2
auto_length_MUX_uxn_device_h_l294_c7_a3f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l294_c7_a3f2_cond,
auto_length_MUX_uxn_device_h_l294_c7_a3f2_iftrue,
auto_length_MUX_uxn_device_h_l294_c7_a3f2_iffalse,
auto_length_MUX_uxn_device_h_l294_c7_a3f2_return_output);

-- BIN_OP_OR_uxn_device_h_l295_c3_fab3
BIN_OP_OR_uxn_device_h_l295_c3_fab3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l295_c3_fab3_left,
BIN_OP_OR_uxn_device_h_l295_c3_fab3_right,
BIN_OP_OR_uxn_device_h_l295_c3_fab3_return_output);

-- BIN_OP_EQ_uxn_device_h_l298_c11_5379
BIN_OP_EQ_uxn_device_h_l298_c11_5379 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l298_c11_5379_left,
BIN_OP_EQ_uxn_device_h_l298_c11_5379_right,
BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- flip_y_MUX_uxn_device_h_l298_c7_e683
flip_y_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l298_c7_e683_cond,
flip_y_MUX_uxn_device_h_l298_c7_e683_iftrue,
flip_y_MUX_uxn_device_h_l298_c7_e683_iffalse,
flip_y_MUX_uxn_device_h_l298_c7_e683_return_output);

-- screen_blit_result_MUX_uxn_device_h_l298_c7_e683
screen_blit_result_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l298_c7_e683_cond,
screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iftrue,
screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iffalse,
screen_blit_result_MUX_uxn_device_h_l298_c7_e683_return_output);

-- ctrl_MUX_uxn_device_h_l298_c7_e683
ctrl_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l298_c7_e683_cond,
ctrl_MUX_uxn_device_h_l298_c7_e683_iftrue,
ctrl_MUX_uxn_device_h_l298_c7_e683_iffalse,
ctrl_MUX_uxn_device_h_l298_c7_e683_return_output);

-- ctrl_mode_MUX_uxn_device_h_l298_c7_e683
ctrl_mode_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l298_c7_e683_cond,
ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iftrue,
ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iffalse,
ctrl_mode_MUX_uxn_device_h_l298_c7_e683_return_output);

-- layer_MUX_uxn_device_h_l298_c7_e683
layer_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l298_c7_e683_cond,
layer_MUX_uxn_device_h_l298_c7_e683_iftrue,
layer_MUX_uxn_device_h_l298_c7_e683_iffalse,
layer_MUX_uxn_device_h_l298_c7_e683_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l298_c7_e683
ram_addr_incr_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_cond,
ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iftrue,
ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iffalse,
ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_return_output);

-- tmp12_MUX_uxn_device_h_l298_c7_e683
tmp12_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l298_c7_e683_cond,
tmp12_MUX_uxn_device_h_l298_c7_e683_iftrue,
tmp12_MUX_uxn_device_h_l298_c7_e683_iffalse,
tmp12_MUX_uxn_device_h_l298_c7_e683_return_output);

-- x_MUX_uxn_device_h_l298_c7_e683
x_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l298_c7_e683_cond,
x_MUX_uxn_device_h_l298_c7_e683_iftrue,
x_MUX_uxn_device_h_l298_c7_e683_iffalse,
x_MUX_uxn_device_h_l298_c7_e683_return_output);

-- tmp16_MUX_uxn_device_h_l298_c7_e683
tmp16_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l298_c7_e683_cond,
tmp16_MUX_uxn_device_h_l298_c7_e683_iftrue,
tmp16_MUX_uxn_device_h_l298_c7_e683_iffalse,
tmp16_MUX_uxn_device_h_l298_c7_e683_return_output);

-- is_blit_done_MUX_uxn_device_h_l298_c7_e683
is_blit_done_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l298_c7_e683_cond,
is_blit_done_MUX_uxn_device_h_l298_c7_e683_iftrue,
is_blit_done_MUX_uxn_device_h_l298_c7_e683_iffalse,
is_blit_done_MUX_uxn_device_h_l298_c7_e683_return_output);

-- tmp16b_MUX_uxn_device_h_l298_c7_e683
tmp16b_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l298_c7_e683_cond,
tmp16b_MUX_uxn_device_h_l298_c7_e683_iftrue,
tmp16b_MUX_uxn_device_h_l298_c7_e683_iffalse,
tmp16b_MUX_uxn_device_h_l298_c7_e683_return_output);

-- auto_advance_MUX_uxn_device_h_l298_c7_e683
auto_advance_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l298_c7_e683_cond,
auto_advance_MUX_uxn_device_h_l298_c7_e683_iftrue,
auto_advance_MUX_uxn_device_h_l298_c7_e683_iffalse,
auto_advance_MUX_uxn_device_h_l298_c7_e683_return_output);

-- ram_addr_MUX_uxn_device_h_l298_c7_e683
ram_addr_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l298_c7_e683_cond,
ram_addr_MUX_uxn_device_h_l298_c7_e683_iftrue,
ram_addr_MUX_uxn_device_h_l298_c7_e683_iffalse,
ram_addr_MUX_uxn_device_h_l298_c7_e683_return_output);

-- flip_x_MUX_uxn_device_h_l298_c7_e683
flip_x_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l298_c7_e683_cond,
flip_x_MUX_uxn_device_h_l298_c7_e683_iftrue,
flip_x_MUX_uxn_device_h_l298_c7_e683_iffalse,
flip_x_MUX_uxn_device_h_l298_c7_e683_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l298_c7_e683
y_sprite_incr_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond,
y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue,
y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse,
y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output);

-- color_MUX_uxn_device_h_l298_c7_e683
color_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l298_c7_e683_cond,
color_MUX_uxn_device_h_l298_c7_e683_iftrue,
color_MUX_uxn_device_h_l298_c7_e683_iffalse,
color_MUX_uxn_device_h_l298_c7_e683_return_output);

-- is_last_blit_MUX_uxn_device_h_l298_c7_e683
is_last_blit_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l298_c7_e683_cond,
is_last_blit_MUX_uxn_device_h_l298_c7_e683_iftrue,
is_last_blit_MUX_uxn_device_h_l298_c7_e683_iffalse,
is_last_blit_MUX_uxn_device_h_l298_c7_e683_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l298_c7_e683
x_sprite_incr_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond,
x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue,
x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse,
x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output);

-- tmp4_MUX_uxn_device_h_l298_c7_e683
tmp4_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l298_c7_e683_cond,
tmp4_MUX_uxn_device_h_l298_c7_e683_iftrue,
tmp4_MUX_uxn_device_h_l298_c7_e683_iffalse,
tmp4_MUX_uxn_device_h_l298_c7_e683_return_output);

-- result_MUX_uxn_device_h_l298_c7_e683
result_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l298_c7_e683_cond,
result_MUX_uxn_device_h_l298_c7_e683_iftrue,
result_MUX_uxn_device_h_l298_c7_e683_iffalse,
result_MUX_uxn_device_h_l298_c7_e683_return_output);

-- y_MUX_uxn_device_h_l298_c7_e683
y_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l298_c7_e683_cond,
y_MUX_uxn_device_h_l298_c7_e683_iftrue,
y_MUX_uxn_device_h_l298_c7_e683_iffalse,
y_MUX_uxn_device_h_l298_c7_e683_return_output);

-- auto_length_MUX_uxn_device_h_l298_c7_e683
auto_length_MUX_uxn_device_h_l298_c7_e683 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l298_c7_e683_cond,
auto_length_MUX_uxn_device_h_l298_c7_e683_iftrue,
auto_length_MUX_uxn_device_h_l298_c7_e683_iffalse,
auto_length_MUX_uxn_device_h_l298_c7_e683_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c11_9c9c
BIN_OP_EQ_uxn_device_h_l307_c11_9c9c : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_left,
BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_right,
BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- screen_blit_result_MUX_uxn_device_h_l307_c7_6e72
screen_blit_result_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_cond,
screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iftrue,
screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iffalse,
screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72
ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_cond,
ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue,
ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse,
ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- tmp12_MUX_uxn_device_h_l307_c7_6e72
tmp12_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l307_c7_6e72_cond,
tmp12_MUX_uxn_device_h_l307_c7_6e72_iftrue,
tmp12_MUX_uxn_device_h_l307_c7_6e72_iffalse,
tmp12_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- x_MUX_uxn_device_h_l307_c7_6e72
x_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l307_c7_6e72_cond,
x_MUX_uxn_device_h_l307_c7_6e72_iftrue,
x_MUX_uxn_device_h_l307_c7_6e72_iffalse,
x_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- tmp16_MUX_uxn_device_h_l307_c7_6e72
tmp16_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l307_c7_6e72_cond,
tmp16_MUX_uxn_device_h_l307_c7_6e72_iftrue,
tmp16_MUX_uxn_device_h_l307_c7_6e72_iffalse,
tmp16_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- is_blit_done_MUX_uxn_device_h_l307_c7_6e72
is_blit_done_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l307_c7_6e72_cond,
is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iftrue,
is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iffalse,
is_blit_done_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- tmp16b_MUX_uxn_device_h_l307_c7_6e72
tmp16b_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l307_c7_6e72_cond,
tmp16b_MUX_uxn_device_h_l307_c7_6e72_iftrue,
tmp16b_MUX_uxn_device_h_l307_c7_6e72_iffalse,
tmp16b_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- auto_advance_MUX_uxn_device_h_l307_c7_6e72
auto_advance_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l307_c7_6e72_cond,
auto_advance_MUX_uxn_device_h_l307_c7_6e72_iftrue,
auto_advance_MUX_uxn_device_h_l307_c7_6e72_iffalse,
auto_advance_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- ram_addr_MUX_uxn_device_h_l307_c7_6e72
ram_addr_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l307_c7_6e72_cond,
ram_addr_MUX_uxn_device_h_l307_c7_6e72_iftrue,
ram_addr_MUX_uxn_device_h_l307_c7_6e72_iffalse,
ram_addr_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72
y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond,
y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue,
y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse,
y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- is_last_blit_MUX_uxn_device_h_l307_c7_6e72
is_last_blit_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l307_c7_6e72_cond,
is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iftrue,
is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iffalse,
is_last_blit_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72
x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond,
x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue,
x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse,
x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- tmp4_MUX_uxn_device_h_l307_c7_6e72
tmp4_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l307_c7_6e72_cond,
tmp4_MUX_uxn_device_h_l307_c7_6e72_iftrue,
tmp4_MUX_uxn_device_h_l307_c7_6e72_iffalse,
tmp4_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- result_MUX_uxn_device_h_l307_c7_6e72
result_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l307_c7_6e72_cond,
result_MUX_uxn_device_h_l307_c7_6e72_iftrue,
result_MUX_uxn_device_h_l307_c7_6e72_iffalse,
result_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- y_MUX_uxn_device_h_l307_c7_6e72
y_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l307_c7_6e72_cond,
y_MUX_uxn_device_h_l307_c7_6e72_iftrue,
y_MUX_uxn_device_h_l307_c7_6e72_iffalse,
y_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- auto_length_MUX_uxn_device_h_l307_c7_6e72
auto_length_MUX_uxn_device_h_l307_c7_6e72 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l307_c7_6e72_cond,
auto_length_MUX_uxn_device_h_l307_c7_6e72_iftrue,
auto_length_MUX_uxn_device_h_l307_c7_6e72_iffalse,
auto_length_MUX_uxn_device_h_l307_c7_6e72_return_output);

-- BIN_OP_EQ_uxn_device_h_l312_c11_496d
BIN_OP_EQ_uxn_device_h_l312_c11_496d : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l312_c11_496d_left,
BIN_OP_EQ_uxn_device_h_l312_c11_496d_right,
BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_return_output);

-- screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6
screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_cond,
screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6
ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_cond,
ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- tmp12_MUX_uxn_device_h_l312_c7_c0b6
tmp12_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l312_c7_c0b6_cond,
tmp12_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
tmp12_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
tmp12_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- x_MUX_uxn_device_h_l312_c7_c0b6
x_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l312_c7_c0b6_cond,
x_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
x_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
x_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- tmp16_MUX_uxn_device_h_l312_c7_c0b6
tmp16_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l312_c7_c0b6_cond,
tmp16_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
tmp16_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
tmp16_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- is_blit_done_MUX_uxn_device_h_l312_c7_c0b6
is_blit_done_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_cond,
is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- tmp16b_MUX_uxn_device_h_l312_c7_c0b6
tmp16b_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l312_c7_c0b6_cond,
tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
tmp16b_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- auto_advance_MUX_uxn_device_h_l312_c7_c0b6
auto_advance_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l312_c7_c0b6_cond,
auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
auto_advance_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- ram_addr_MUX_uxn_device_h_l312_c7_c0b6
ram_addr_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l312_c7_c0b6_cond,
ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
ram_addr_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6
y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond,
y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- is_last_blit_MUX_uxn_device_h_l312_c7_c0b6
is_last_blit_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_cond,
is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6
x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond,
x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- tmp4_MUX_uxn_device_h_l312_c7_c0b6
tmp4_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l312_c7_c0b6_cond,
tmp4_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
tmp4_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
tmp4_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- result_MUX_uxn_device_h_l312_c7_c0b6
result_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l312_c7_c0b6_cond,
result_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
result_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
result_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- y_MUX_uxn_device_h_l312_c7_c0b6
y_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l312_c7_c0b6_cond,
y_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
y_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
y_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- auto_length_MUX_uxn_device_h_l312_c7_c0b6
auto_length_MUX_uxn_device_h_l312_c7_c0b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l312_c7_c0b6_cond,
auto_length_MUX_uxn_device_h_l312_c7_c0b6_iftrue,
auto_length_MUX_uxn_device_h_l312_c7_c0b6_iffalse,
auto_length_MUX_uxn_device_h_l312_c7_c0b6_return_output);

-- BIN_OP_OR_uxn_device_h_l313_c3_95df
BIN_OP_OR_uxn_device_h_l313_c3_95df : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l313_c3_95df_left,
BIN_OP_OR_uxn_device_h_l313_c3_95df_right,
BIN_OP_OR_uxn_device_h_l313_c3_95df_return_output);

-- BIN_OP_EQ_uxn_device_h_l322_c18_e5de
BIN_OP_EQ_uxn_device_h_l322_c18_e5de : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l322_c18_e5de_left,
BIN_OP_EQ_uxn_device_h_l322_c18_e5de_right,
BIN_OP_EQ_uxn_device_h_l322_c18_e5de_return_output);

-- MUX_uxn_device_h_l322_c18_9fa6
MUX_uxn_device_h_l322_c18_9fa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l322_c18_9fa6_cond,
MUX_uxn_device_h_l322_c18_9fa6_iftrue,
MUX_uxn_device_h_l322_c18_9fa6_iffalse,
MUX_uxn_device_h_l322_c18_9fa6_return_output);

-- MUX_uxn_device_h_l324_c19_f784
MUX_uxn_device_h_l324_c19_f784 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l324_c19_f784_cond,
MUX_uxn_device_h_l324_c19_f784_iftrue,
MUX_uxn_device_h_l324_c19_f784_iffalse,
MUX_uxn_device_h_l324_c19_f784_return_output);

-- MUX_uxn_device_h_l325_c19_29dc
MUX_uxn_device_h_l325_c19_29dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l325_c19_29dc_cond,
MUX_uxn_device_h_l325_c19_29dc_iftrue,
MUX_uxn_device_h_l325_c19_29dc_iffalse,
MUX_uxn_device_h_l325_c19_29dc_return_output);

-- MUX_uxn_device_h_l326_c39_6cc9
MUX_uxn_device_h_l326_c39_6cc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l326_c39_6cc9_cond,
MUX_uxn_device_h_l326_c39_6cc9_iftrue,
MUX_uxn_device_h_l326_c39_6cc9_iffalse,
MUX_uxn_device_h_l326_c39_6cc9_return_output);

-- MUX_uxn_device_h_l326_c20_db12
MUX_uxn_device_h_l326_c20_db12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l326_c20_db12_cond,
MUX_uxn_device_h_l326_c20_db12_iftrue,
MUX_uxn_device_h_l326_c20_db12_iffalse,
MUX_uxn_device_h_l326_c20_db12_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output);

-- screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2
screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_cond,
screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- x_MUX_uxn_device_h_l327_c3_a9d2
x_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l327_c3_a9d2_cond,
x_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
x_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
x_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- tmp16_MUX_uxn_device_h_l327_c3_a9d2
tmp16_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l327_c3_a9d2_cond,
tmp16_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
tmp16_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
tmp16_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- tmp16b_MUX_uxn_device_h_l327_c3_a9d2
tmp16b_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l327_c3_a9d2_cond,
tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
tmp16b_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- ram_addr_MUX_uxn_device_h_l327_c3_a9d2
ram_addr_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l327_c3_a9d2_cond,
ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
ram_addr_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- is_last_blit_MUX_uxn_device_h_l327_c3_a9d2
is_last_blit_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_cond,
is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- tmp4_MUX_uxn_device_h_l327_c3_a9d2
tmp4_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l327_c3_a9d2_cond,
tmp4_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
tmp4_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
tmp4_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- result_MUX_uxn_device_h_l327_c3_a9d2
result_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l327_c3_a9d2_cond,
result_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
result_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
result_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- y_MUX_uxn_device_h_l327_c3_a9d2
y_MUX_uxn_device_h_l327_c3_a9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l327_c3_a9d2_cond,
y_MUX_uxn_device_h_l327_c3_a9d2_iftrue,
y_MUX_uxn_device_h_l327_c3_a9d2_iffalse,
y_MUX_uxn_device_h_l327_c3_a9d2_return_output);

-- BIN_OP_EQ_uxn_device_h_l328_c8_e3f4
BIN_OP_EQ_uxn_device_h_l328_c8_e3f4 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_left,
BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_right,
BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- x_MUX_uxn_device_h_l328_c4_af6b
x_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l328_c4_af6b_cond,
x_MUX_uxn_device_h_l328_c4_af6b_iftrue,
x_MUX_uxn_device_h_l328_c4_af6b_iffalse,
x_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- tmp16_MUX_uxn_device_h_l328_c4_af6b
tmp16_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l328_c4_af6b_cond,
tmp16_MUX_uxn_device_h_l328_c4_af6b_iftrue,
tmp16_MUX_uxn_device_h_l328_c4_af6b_iffalse,
tmp16_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- tmp16b_MUX_uxn_device_h_l328_c4_af6b
tmp16b_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l328_c4_af6b_cond,
tmp16b_MUX_uxn_device_h_l328_c4_af6b_iftrue,
tmp16b_MUX_uxn_device_h_l328_c4_af6b_iffalse,
tmp16b_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- ram_addr_MUX_uxn_device_h_l328_c4_af6b
ram_addr_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l328_c4_af6b_cond,
ram_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue,
ram_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse,
ram_addr_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- tmp4_MUX_uxn_device_h_l328_c4_af6b
tmp4_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l328_c4_af6b_cond,
tmp4_MUX_uxn_device_h_l328_c4_af6b_iftrue,
tmp4_MUX_uxn_device_h_l328_c4_af6b_iffalse,
tmp4_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- result_u16_addr_MUX_uxn_device_h_l328_c4_af6b
result_u16_addr_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_cond,
result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue,
result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse,
result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b
result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_cond,
result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b
result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_cond,
result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b
result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_cond,
result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- result_u8_value_MUX_uxn_device_h_l328_c4_af6b
result_u8_value_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l328_c4_af6b_cond,
result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iftrue,
result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iffalse,
result_u8_value_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- y_MUX_uxn_device_h_l328_c4_af6b
y_MUX_uxn_device_h_l328_c4_af6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l328_c4_af6b_cond,
y_MUX_uxn_device_h_l328_c4_af6b_iftrue,
y_MUX_uxn_device_h_l328_c4_af6b_iffalse,
y_MUX_uxn_device_h_l328_c4_af6b_return_output);

-- BIN_OP_MINUS_uxn_device_h_l329_c23_62a1
BIN_OP_MINUS_uxn_device_h_l329_c23_62a1 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_left,
BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_right,
BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_return_output);

-- BIN_OP_PLUS_uxn_device_h_l329_c49_5b91
BIN_OP_PLUS_uxn_device_h_l329_c49_5b91 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_left,
BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_right,
BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_return_output);

-- MUX_uxn_device_h_l329_c13_c07d
MUX_uxn_device_h_l329_c13_c07d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l329_c13_c07d_cond,
MUX_uxn_device_h_l329_c13_c07d_iftrue,
MUX_uxn_device_h_l329_c13_c07d_iffalse,
MUX_uxn_device_h_l329_c13_c07d_return_output);

-- BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5
BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_left,
BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_right,
BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7
BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_left,
BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_right,
BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_return_output);

-- MUX_uxn_device_h_l330_c14_6c23
MUX_uxn_device_h_l330_c14_6c23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l330_c14_6c23_cond,
MUX_uxn_device_h_l330_c14_6c23_iftrue,
MUX_uxn_device_h_l330_c14_6c23_iffalse,
MUX_uxn_device_h_l330_c14_6c23_return_output);

-- BIN_OP_MINUS_uxn_device_h_l331_c36_6202
BIN_OP_MINUS_uxn_device_h_l331_c36_6202 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l331_c36_6202_left,
BIN_OP_MINUS_uxn_device_h_l331_c36_6202_right,
BIN_OP_MINUS_uxn_device_h_l331_c36_6202_return_output);

-- BIN_OP_PLUS_uxn_device_h_l331_c58_64f7
BIN_OP_PLUS_uxn_device_h_l331_c58_64f7 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_left,
BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_right,
BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_return_output);

-- MUX_uxn_device_h_l331_c26_3240
MUX_uxn_device_h_l331_c26_3240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l331_c26_3240_cond,
MUX_uxn_device_h_l331_c26_3240_iftrue,
MUX_uxn_device_h_l331_c26_3240_iffalse,
MUX_uxn_device_h_l331_c26_3240_return_output);

-- MUX_uxn_device_h_l331_c10_e68e
MUX_uxn_device_h_l331_c10_e68e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l331_c10_e68e_cond,
MUX_uxn_device_h_l331_c10_e68e_iftrue,
MUX_uxn_device_h_l331_c10_e68e_iffalse,
MUX_uxn_device_h_l331_c10_e68e_return_output);

-- BIN_OP_MINUS_uxn_device_h_l332_c36_d167
BIN_OP_MINUS_uxn_device_h_l332_c36_d167 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l332_c36_d167_left,
BIN_OP_MINUS_uxn_device_h_l332_c36_d167_right,
BIN_OP_MINUS_uxn_device_h_l332_c36_d167_return_output);

-- BIN_OP_PLUS_uxn_device_h_l332_c58_8fda
BIN_OP_PLUS_uxn_device_h_l332_c58_8fda : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_left,
BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_right,
BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_return_output);

-- MUX_uxn_device_h_l332_c26_acf6
MUX_uxn_device_h_l332_c26_acf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l332_c26_acf6_cond,
MUX_uxn_device_h_l332_c26_acf6_iftrue,
MUX_uxn_device_h_l332_c26_acf6_iffalse,
MUX_uxn_device_h_l332_c26_acf6_return_output);

-- MUX_uxn_device_h_l332_c10_f6fb
MUX_uxn_device_h_l332_c10_f6fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l332_c10_f6fb_cond,
MUX_uxn_device_h_l332_c10_f6fb_iftrue,
MUX_uxn_device_h_l332_c10_f6fb_iffalse,
MUX_uxn_device_h_l332_c10_f6fb_return_output);

-- CONST_SR_8_uxn_device_h_l337_c33_57b6
CONST_SR_8_uxn_device_h_l337_c33_57b6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l337_c33_57b6_x,
CONST_SR_8_uxn_device_h_l337_c33_57b6_return_output);

-- BIN_OP_MINUS_uxn_device_h_l339_c22_398e
BIN_OP_MINUS_uxn_device_h_l339_c22_398e : entity work.BIN_OP_MINUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l339_c22_398e_left,
BIN_OP_MINUS_uxn_device_h_l339_c22_398e_right,
BIN_OP_MINUS_uxn_device_h_l339_c22_398e_return_output);

-- BIN_OP_EQ_uxn_device_h_l339_c13_9a82
BIN_OP_EQ_uxn_device_h_l339_c13_9a82 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l339_c13_9a82_left,
BIN_OP_EQ_uxn_device_h_l339_c13_9a82_right,
BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_return_output);

-- ram_addr_MUX_uxn_device_h_l339_c9_f614
ram_addr_MUX_uxn_device_h_l339_c9_f614 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l339_c9_f614_cond,
ram_addr_MUX_uxn_device_h_l339_c9_f614_iftrue,
ram_addr_MUX_uxn_device_h_l339_c9_f614_iffalse,
ram_addr_MUX_uxn_device_h_l339_c9_f614_return_output);

-- tmp4_MUX_uxn_device_h_l339_c9_f614
tmp4_MUX_uxn_device_h_l339_c9_f614 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l339_c9_f614_cond,
tmp4_MUX_uxn_device_h_l339_c9_f614_iftrue,
tmp4_MUX_uxn_device_h_l339_c9_f614_iffalse,
tmp4_MUX_uxn_device_h_l339_c9_f614_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_cond,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l339_c9_f614
result_device_ram_address_MUX_uxn_device_h_l339_c9_f614 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_cond,
result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iftrue,
result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iffalse,
result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_return_output);

-- result_u8_value_MUX_uxn_device_h_l339_c9_f614
result_u8_value_MUX_uxn_device_h_l339_c9_f614 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l339_c9_f614_cond,
result_u8_value_MUX_uxn_device_h_l339_c9_f614_iftrue,
result_u8_value_MUX_uxn_device_h_l339_c9_f614_iffalse,
result_u8_value_MUX_uxn_device_h_l339_c9_f614_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l339_c9_f614
result_is_deo_done_MUX_uxn_device_h_l339_c9_f614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_cond,
result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iftrue,
result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iffalse,
result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_return_output);

-- BIN_OP_MINUS_uxn_device_h_l344_c22_0751
BIN_OP_MINUS_uxn_device_h_l344_c22_0751 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l344_c22_0751_left,
BIN_OP_MINUS_uxn_device_h_l344_c22_0751_right,
BIN_OP_MINUS_uxn_device_h_l344_c22_0751_return_output);

-- BIN_OP_EQ_uxn_device_h_l344_c13_b62e
BIN_OP_EQ_uxn_device_h_l344_c13_b62e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l344_c13_b62e_left,
BIN_OP_EQ_uxn_device_h_l344_c13_b62e_right,
BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_return_output);

-- ram_addr_MUX_uxn_device_h_l344_c9_0980
ram_addr_MUX_uxn_device_h_l344_c9_0980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l344_c9_0980_cond,
ram_addr_MUX_uxn_device_h_l344_c9_0980_iftrue,
ram_addr_MUX_uxn_device_h_l344_c9_0980_iffalse,
ram_addr_MUX_uxn_device_h_l344_c9_0980_return_output);

-- tmp4_MUX_uxn_device_h_l344_c9_0980
tmp4_MUX_uxn_device_h_l344_c9_0980 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l344_c9_0980_cond,
tmp4_MUX_uxn_device_h_l344_c9_0980_iftrue,
tmp4_MUX_uxn_device_h_l344_c9_0980_iffalse,
tmp4_MUX_uxn_device_h_l344_c9_0980_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_cond,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l344_c9_0980
result_device_ram_address_MUX_uxn_device_h_l344_c9_0980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_cond,
result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iftrue,
result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iffalse,
result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_return_output);

-- result_u8_value_MUX_uxn_device_h_l344_c9_0980
result_u8_value_MUX_uxn_device_h_l344_c9_0980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l344_c9_0980_cond,
result_u8_value_MUX_uxn_device_h_l344_c9_0980_iftrue,
result_u8_value_MUX_uxn_device_h_l344_c9_0980_iffalse,
result_u8_value_MUX_uxn_device_h_l344_c9_0980_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l344_c9_0980
result_is_deo_done_MUX_uxn_device_h_l344_c9_0980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_cond,
result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iftrue,
result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iffalse,
result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_return_output);

-- CONST_SR_8_uxn_device_h_l347_c33_4bef
CONST_SR_8_uxn_device_h_l347_c33_4bef : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l347_c33_4bef_x,
CONST_SR_8_uxn_device_h_l347_c33_4bef_return_output);

-- BIN_OP_MINUS_uxn_device_h_l349_c22_94de
BIN_OP_MINUS_uxn_device_h_l349_c22_94de : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l349_c22_94de_left,
BIN_OP_MINUS_uxn_device_h_l349_c22_94de_right,
BIN_OP_MINUS_uxn_device_h_l349_c22_94de_return_output);

-- BIN_OP_EQ_uxn_device_h_l349_c13_7449
BIN_OP_EQ_uxn_device_h_l349_c13_7449 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l349_c13_7449_left,
BIN_OP_EQ_uxn_device_h_l349_c13_7449_right,
BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_return_output);

-- ram_addr_MUX_uxn_device_h_l349_c9_40bd
ram_addr_MUX_uxn_device_h_l349_c9_40bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l349_c9_40bd_cond,
ram_addr_MUX_uxn_device_h_l349_c9_40bd_iftrue,
ram_addr_MUX_uxn_device_h_l349_c9_40bd_iffalse,
ram_addr_MUX_uxn_device_h_l349_c9_40bd_return_output);

-- tmp4_MUX_uxn_device_h_l349_c9_40bd
tmp4_MUX_uxn_device_h_l349_c9_40bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l349_c9_40bd_cond,
tmp4_MUX_uxn_device_h_l349_c9_40bd_iftrue,
tmp4_MUX_uxn_device_h_l349_c9_40bd_iffalse,
tmp4_MUX_uxn_device_h_l349_c9_40bd_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_cond,
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd
result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_cond,
result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_return_output);

-- result_u8_value_MUX_uxn_device_h_l349_c9_40bd
result_u8_value_MUX_uxn_device_h_l349_c9_40bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l349_c9_40bd_cond,
result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iftrue,
result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iffalse,
result_u8_value_MUX_uxn_device_h_l349_c9_40bd_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd
result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_cond,
result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iftrue,
result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iffalse,
result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_return_output);

-- BIN_OP_MINUS_uxn_device_h_l354_c22_b60f
BIN_OP_MINUS_uxn_device_h_l354_c22_b60f : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_left,
BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_right,
BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_return_output);

-- BIN_OP_EQ_uxn_device_h_l354_c13_d95a
BIN_OP_EQ_uxn_device_h_l354_c13_d95a : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l354_c13_d95a_left,
BIN_OP_EQ_uxn_device_h_l354_c13_d95a_right,
BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_return_output);

-- ram_addr_MUX_uxn_device_h_l354_c9_b7e3
ram_addr_MUX_uxn_device_h_l354_c9_b7e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l354_c9_b7e3_cond,
ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iftrue,
ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iffalse,
ram_addr_MUX_uxn_device_h_l354_c9_b7e3_return_output);

-- tmp4_MUX_uxn_device_h_l354_c9_b7e3
tmp4_MUX_uxn_device_h_l354_c9_b7e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l354_c9_b7e3_cond,
tmp4_MUX_uxn_device_h_l354_c9_b7e3_iftrue,
tmp4_MUX_uxn_device_h_l354_c9_b7e3_iffalse,
tmp4_MUX_uxn_device_h_l354_c9_b7e3_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_cond,
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3
result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_cond,
result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_return_output);

-- result_u8_value_MUX_uxn_device_h_l354_c9_b7e3
result_u8_value_MUX_uxn_device_h_l354_c9_b7e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_cond,
result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iftrue,
result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iffalse,
result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3
result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_cond,
result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_return_output);

-- BIN_OP_PLUS_uxn_device_h_l355_c5_cd12
BIN_OP_PLUS_uxn_device_h_l355_c5_cd12 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_left,
BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_right,
BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_return_output);

-- CONST_SR_8_uxn_device_h_l358_c33_8a21
CONST_SR_8_uxn_device_h_l358_c33_8a21 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l358_c33_8a21_x,
CONST_SR_8_uxn_device_h_l358_c33_8a21_return_output);

-- BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e
BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_left,
BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_right,
BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_return_output);

-- BIN_OP_EQ_uxn_device_h_l360_c13_6788
BIN_OP_EQ_uxn_device_h_l360_c13_6788 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l360_c13_6788_left,
BIN_OP_EQ_uxn_device_h_l360_c13_6788_right,
BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_return_output);

-- tmp4_MUX_uxn_device_h_l360_c9_3644
tmp4_MUX_uxn_device_h_l360_c9_3644 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l360_c9_3644_cond,
tmp4_MUX_uxn_device_h_l360_c9_3644_iftrue,
tmp4_MUX_uxn_device_h_l360_c9_3644_iffalse,
tmp4_MUX_uxn_device_h_l360_c9_3644_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_cond,
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l360_c9_3644
result_device_ram_address_MUX_uxn_device_h_l360_c9_3644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_cond,
result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iftrue,
result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iffalse,
result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_return_output);

-- result_u8_value_MUX_uxn_device_h_l360_c9_3644
result_u8_value_MUX_uxn_device_h_l360_c9_3644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l360_c9_3644_cond,
result_u8_value_MUX_uxn_device_h_l360_c9_3644_iftrue,
result_u8_value_MUX_uxn_device_h_l360_c9_3644_iffalse,
result_u8_value_MUX_uxn_device_h_l360_c9_3644_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l360_c9_3644
result_is_deo_done_MUX_uxn_device_h_l360_c9_3644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_cond,
result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iftrue,
result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iffalse,
result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_return_output);

-- BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba
BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_left,
BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_right,
BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_return_output);

-- BIN_OP_EQ_uxn_device_h_l365_c13_15df
BIN_OP_EQ_uxn_device_h_l365_c13_15df : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l365_c13_15df_left,
BIN_OP_EQ_uxn_device_h_l365_c13_15df_right,
BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_return_output);

-- tmp4_MUX_uxn_device_h_l365_c9_2381
tmp4_MUX_uxn_device_h_l365_c9_2381 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l365_c9_2381_cond,
tmp4_MUX_uxn_device_h_l365_c9_2381_iftrue,
tmp4_MUX_uxn_device_h_l365_c9_2381_iffalse,
tmp4_MUX_uxn_device_h_l365_c9_2381_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_cond,
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l365_c9_2381
result_device_ram_address_MUX_uxn_device_h_l365_c9_2381 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_cond,
result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iftrue,
result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iffalse,
result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l365_c9_2381
result_is_deo_done_MUX_uxn_device_h_l365_c9_2381 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_cond,
result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iftrue,
result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iffalse,
result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_return_output);

-- BIN_OP_PLUS_uxn_device_h_l366_c5_5eff
BIN_OP_PLUS_uxn_device_h_l366_c5_5eff : entity work.BIN_OP_PLUS_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_left,
BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_right,
BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_return_output);

-- screen_blit_result_MUX_uxn_device_h_l373_c4_1c57
screen_blit_result_MUX_uxn_device_h_l373_c4_1c57 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_cond,
screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iftrue,
screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iffalse,
screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output);

-- screen_2bpp_uxn_device_h_l374_c26_b79f
screen_2bpp_uxn_device_h_l374_c26_b79f : entity work.screen_2bpp_0CLK_0d5dc7b6 port map (
clk,
screen_2bpp_uxn_device_h_l374_c26_b79f_CLOCK_ENABLE,
screen_2bpp_uxn_device_h_l374_c26_b79f_phase,
screen_2bpp_uxn_device_h_l374_c26_b79f_x1,
screen_2bpp_uxn_device_h_l374_c26_b79f_y1,
screen_2bpp_uxn_device_h_l374_c26_b79f_color,
screen_2bpp_uxn_device_h_l374_c26_b79f_fx,
screen_2bpp_uxn_device_h_l374_c26_b79f_fy,
screen_2bpp_uxn_device_h_l374_c26_b79f_ram_addr,
screen_2bpp_uxn_device_h_l374_c26_b79f_previous_ram_read,
screen_2bpp_uxn_device_h_l374_c26_b79f_return_output);

-- screen_1bpp_uxn_device_h_l376_c26_8897
screen_1bpp_uxn_device_h_l376_c26_8897 : entity work.screen_1bpp_0CLK_13e364a0 port map (
clk,
screen_1bpp_uxn_device_h_l376_c26_8897_CLOCK_ENABLE,
screen_1bpp_uxn_device_h_l376_c26_8897_phase,
screen_1bpp_uxn_device_h_l376_c26_8897_x1,
screen_1bpp_uxn_device_h_l376_c26_8897_y1,
screen_1bpp_uxn_device_h_l376_c26_8897_color,
screen_1bpp_uxn_device_h_l376_c26_8897_fx,
screen_1bpp_uxn_device_h_l376_c26_8897_fy,
screen_1bpp_uxn_device_h_l376_c26_8897_ram_addr,
screen_1bpp_uxn_device_h_l376_c26_8897_previous_ram_read,
screen_1bpp_uxn_device_h_l376_c26_8897_return_output);

-- BIN_OP_EQ_uxn_device_h_l385_c19_60a4
BIN_OP_EQ_uxn_device_h_l385_c19_60a4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l385_c19_60a4_left,
BIN_OP_EQ_uxn_device_h_l385_c19_60a4_right,
BIN_OP_EQ_uxn_device_h_l385_c19_60a4_return_output);

-- MUX_uxn_device_h_l385_c19_dc40
MUX_uxn_device_h_l385_c19_dc40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l385_c19_dc40_cond,
MUX_uxn_device_h_l385_c19_dc40_iftrue,
MUX_uxn_device_h_l385_c19_dc40_iffalse,
MUX_uxn_device_h_l385_c19_dc40_return_output);

-- BIN_OP_XOR_uxn_device_h_l388_c11_f3dd
BIN_OP_XOR_uxn_device_h_l388_c11_f3dd : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_left,
BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_right,
BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_return_output);

-- BIN_OP_PLUS_uxn_device_h_l388_c60_ef41
BIN_OP_PLUS_uxn_device_h_l388_c60_ef41 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_left,
BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_right,
BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_return_output);

-- MUX_uxn_device_h_l388_c11_dc82
MUX_uxn_device_h_l388_c11_dc82 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l388_c11_dc82_cond,
MUX_uxn_device_h_l388_c11_dc82_iftrue,
MUX_uxn_device_h_l388_c11_dc82_iffalse,
MUX_uxn_device_h_l388_c11_dc82_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c
CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_x,
CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_left,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_right,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 x,
 y,
 ram_addr,
 ram_addr_incr,
 tmp16,
 tmp16b,
 tmp12,
 ctrl,
 auto_advance,
 x_sprite_incr,
 y_sprite_incr,
 color,
 auto_length,
 tmp4,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 is_blit_done,
 is_last_blit,
 result,
 screen_blit_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_return_output,
 flip_y_MUX_uxn_device_h_l270_c2_4b38_return_output,
 screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_return_output,
 ctrl_MUX_uxn_device_h_l270_c2_4b38_return_output,
 ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_return_output,
 layer_MUX_uxn_device_h_l270_c2_4b38_return_output,
 ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_return_output,
 tmp12_MUX_uxn_device_h_l270_c2_4b38_return_output,
 x_MUX_uxn_device_h_l270_c2_4b38_return_output,
 tmp16_MUX_uxn_device_h_l270_c2_4b38_return_output,
 is_blit_done_MUX_uxn_device_h_l270_c2_4b38_return_output,
 tmp16b_MUX_uxn_device_h_l270_c2_4b38_return_output,
 auto_advance_MUX_uxn_device_h_l270_c2_4b38_return_output,
 ram_addr_MUX_uxn_device_h_l270_c2_4b38_return_output,
 flip_x_MUX_uxn_device_h_l270_c2_4b38_return_output,
 y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output,
 color_MUX_uxn_device_h_l270_c2_4b38_return_output,
 is_last_blit_MUX_uxn_device_h_l270_c2_4b38_return_output,
 x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output,
 tmp4_MUX_uxn_device_h_l270_c2_4b38_return_output,
 result_MUX_uxn_device_h_l270_c2_4b38_return_output,
 y_MUX_uxn_device_h_l270_c2_4b38_return_output,
 auto_length_MUX_uxn_device_h_l270_c2_4b38_return_output,
 BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 flip_y_MUX_uxn_device_h_l277_c7_0b29_return_output,
 screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_return_output,
 ctrl_MUX_uxn_device_h_l277_c7_0b29_return_output,
 ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_return_output,
 layer_MUX_uxn_device_h_l277_c7_0b29_return_output,
 ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_return_output,
 tmp12_MUX_uxn_device_h_l277_c7_0b29_return_output,
 x_MUX_uxn_device_h_l277_c7_0b29_return_output,
 tmp16_MUX_uxn_device_h_l277_c7_0b29_return_output,
 is_blit_done_MUX_uxn_device_h_l277_c7_0b29_return_output,
 tmp16b_MUX_uxn_device_h_l277_c7_0b29_return_output,
 auto_advance_MUX_uxn_device_h_l277_c7_0b29_return_output,
 ram_addr_MUX_uxn_device_h_l277_c7_0b29_return_output,
 flip_x_MUX_uxn_device_h_l277_c7_0b29_return_output,
 y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output,
 color_MUX_uxn_device_h_l277_c7_0b29_return_output,
 is_last_blit_MUX_uxn_device_h_l277_c7_0b29_return_output,
 x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output,
 tmp4_MUX_uxn_device_h_l277_c7_0b29_return_output,
 result_MUX_uxn_device_h_l277_c7_0b29_return_output,
 y_MUX_uxn_device_h_l277_c7_0b29_return_output,
 auto_length_MUX_uxn_device_h_l277_c7_0b29_return_output,
 BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_return_output,
 flip_y_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 ctrl_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 layer_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 tmp12_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 x_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 tmp16_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 tmp16b_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 auto_advance_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 ram_addr_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 flip_x_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 color_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 tmp4_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 result_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 y_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 auto_length_MUX_uxn_device_h_l280_c7_ae3c_return_output,
 BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_return_output,
 flip_y_MUX_uxn_device_h_l285_c7_ca68_return_output,
 screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_return_output,
 ctrl_MUX_uxn_device_h_l285_c7_ca68_return_output,
 ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_return_output,
 layer_MUX_uxn_device_h_l285_c7_ca68_return_output,
 ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_return_output,
 tmp12_MUX_uxn_device_h_l285_c7_ca68_return_output,
 x_MUX_uxn_device_h_l285_c7_ca68_return_output,
 tmp16_MUX_uxn_device_h_l285_c7_ca68_return_output,
 is_blit_done_MUX_uxn_device_h_l285_c7_ca68_return_output,
 tmp16b_MUX_uxn_device_h_l285_c7_ca68_return_output,
 auto_advance_MUX_uxn_device_h_l285_c7_ca68_return_output,
 ram_addr_MUX_uxn_device_h_l285_c7_ca68_return_output,
 flip_x_MUX_uxn_device_h_l285_c7_ca68_return_output,
 y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output,
 color_MUX_uxn_device_h_l285_c7_ca68_return_output,
 is_last_blit_MUX_uxn_device_h_l285_c7_ca68_return_output,
 x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output,
 tmp4_MUX_uxn_device_h_l285_c7_ca68_return_output,
 result_MUX_uxn_device_h_l285_c7_ca68_return_output,
 y_MUX_uxn_device_h_l285_c7_ca68_return_output,
 auto_length_MUX_uxn_device_h_l285_c7_ca68_return_output,
 BIN_OP_OR_uxn_device_h_l286_c3_1212_return_output,
 BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 flip_y_MUX_uxn_device_h_l289_c7_4274_return_output,
 screen_blit_result_MUX_uxn_device_h_l289_c7_4274_return_output,
 ctrl_MUX_uxn_device_h_l289_c7_4274_return_output,
 ctrl_mode_MUX_uxn_device_h_l289_c7_4274_return_output,
 layer_MUX_uxn_device_h_l289_c7_4274_return_output,
 ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_return_output,
 tmp12_MUX_uxn_device_h_l289_c7_4274_return_output,
 x_MUX_uxn_device_h_l289_c7_4274_return_output,
 tmp16_MUX_uxn_device_h_l289_c7_4274_return_output,
 is_blit_done_MUX_uxn_device_h_l289_c7_4274_return_output,
 tmp16b_MUX_uxn_device_h_l289_c7_4274_return_output,
 auto_advance_MUX_uxn_device_h_l289_c7_4274_return_output,
 ram_addr_MUX_uxn_device_h_l289_c7_4274_return_output,
 flip_x_MUX_uxn_device_h_l289_c7_4274_return_output,
 y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output,
 color_MUX_uxn_device_h_l289_c7_4274_return_output,
 is_last_blit_MUX_uxn_device_h_l289_c7_4274_return_output,
 x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output,
 tmp4_MUX_uxn_device_h_l289_c7_4274_return_output,
 result_MUX_uxn_device_h_l289_c7_4274_return_output,
 y_MUX_uxn_device_h_l289_c7_4274_return_output,
 auto_length_MUX_uxn_device_h_l289_c7_4274_return_output,
 BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_return_output,
 flip_y_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 ctrl_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 layer_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 tmp12_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 x_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 tmp16_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 tmp16b_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 auto_advance_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 ram_addr_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 flip_x_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 color_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 tmp4_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 result_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 y_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 auto_length_MUX_uxn_device_h_l294_c7_a3f2_return_output,
 BIN_OP_OR_uxn_device_h_l295_c3_fab3_return_output,
 BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_return_output,
 flip_y_MUX_uxn_device_h_l298_c7_e683_return_output,
 screen_blit_result_MUX_uxn_device_h_l298_c7_e683_return_output,
 ctrl_MUX_uxn_device_h_l298_c7_e683_return_output,
 ctrl_mode_MUX_uxn_device_h_l298_c7_e683_return_output,
 layer_MUX_uxn_device_h_l298_c7_e683_return_output,
 ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_return_output,
 tmp12_MUX_uxn_device_h_l298_c7_e683_return_output,
 x_MUX_uxn_device_h_l298_c7_e683_return_output,
 tmp16_MUX_uxn_device_h_l298_c7_e683_return_output,
 is_blit_done_MUX_uxn_device_h_l298_c7_e683_return_output,
 tmp16b_MUX_uxn_device_h_l298_c7_e683_return_output,
 auto_advance_MUX_uxn_device_h_l298_c7_e683_return_output,
 ram_addr_MUX_uxn_device_h_l298_c7_e683_return_output,
 flip_x_MUX_uxn_device_h_l298_c7_e683_return_output,
 y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output,
 color_MUX_uxn_device_h_l298_c7_e683_return_output,
 is_last_blit_MUX_uxn_device_h_l298_c7_e683_return_output,
 x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output,
 tmp4_MUX_uxn_device_h_l298_c7_e683_return_output,
 result_MUX_uxn_device_h_l298_c7_e683_return_output,
 y_MUX_uxn_device_h_l298_c7_e683_return_output,
 auto_length_MUX_uxn_device_h_l298_c7_e683_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_return_output,
 ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_return_output,
 tmp12_MUX_uxn_device_h_l307_c7_6e72_return_output,
 x_MUX_uxn_device_h_l307_c7_6e72_return_output,
 tmp16_MUX_uxn_device_h_l307_c7_6e72_return_output,
 is_blit_done_MUX_uxn_device_h_l307_c7_6e72_return_output,
 tmp16b_MUX_uxn_device_h_l307_c7_6e72_return_output,
 auto_advance_MUX_uxn_device_h_l307_c7_6e72_return_output,
 ram_addr_MUX_uxn_device_h_l307_c7_6e72_return_output,
 y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output,
 is_last_blit_MUX_uxn_device_h_l307_c7_6e72_return_output,
 x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output,
 tmp4_MUX_uxn_device_h_l307_c7_6e72_return_output,
 result_MUX_uxn_device_h_l307_c7_6e72_return_output,
 y_MUX_uxn_device_h_l307_c7_6e72_return_output,
 auto_length_MUX_uxn_device_h_l307_c7_6e72_return_output,
 BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_return_output,
 screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 tmp12_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 x_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 tmp16_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 tmp16b_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 auto_advance_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 ram_addr_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 tmp4_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 result_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 y_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 auto_length_MUX_uxn_device_h_l312_c7_c0b6_return_output,
 BIN_OP_OR_uxn_device_h_l313_c3_95df_return_output,
 BIN_OP_EQ_uxn_device_h_l322_c18_e5de_return_output,
 MUX_uxn_device_h_l322_c18_9fa6_return_output,
 MUX_uxn_device_h_l324_c19_f784_return_output,
 MUX_uxn_device_h_l325_c19_29dc_return_output,
 MUX_uxn_device_h_l326_c39_6cc9_return_output,
 MUX_uxn_device_h_l326_c20_db12_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output,
 screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 x_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 tmp16_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 tmp16b_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 ram_addr_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 tmp4_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 result_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 y_MUX_uxn_device_h_l327_c3_a9d2_return_output,
 BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_return_output,
 x_MUX_uxn_device_h_l328_c4_af6b_return_output,
 tmp16_MUX_uxn_device_h_l328_c4_af6b_return_output,
 tmp16b_MUX_uxn_device_h_l328_c4_af6b_return_output,
 ram_addr_MUX_uxn_device_h_l328_c4_af6b_return_output,
 tmp4_MUX_uxn_device_h_l328_c4_af6b_return_output,
 result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_return_output,
 result_u8_value_MUX_uxn_device_h_l328_c4_af6b_return_output,
 y_MUX_uxn_device_h_l328_c4_af6b_return_output,
 BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_return_output,
 BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_return_output,
 MUX_uxn_device_h_l329_c13_c07d_return_output,
 BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_return_output,
 BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_return_output,
 MUX_uxn_device_h_l330_c14_6c23_return_output,
 BIN_OP_MINUS_uxn_device_h_l331_c36_6202_return_output,
 BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_return_output,
 MUX_uxn_device_h_l331_c26_3240_return_output,
 MUX_uxn_device_h_l331_c10_e68e_return_output,
 BIN_OP_MINUS_uxn_device_h_l332_c36_d167_return_output,
 BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_return_output,
 MUX_uxn_device_h_l332_c26_acf6_return_output,
 MUX_uxn_device_h_l332_c10_f6fb_return_output,
 CONST_SR_8_uxn_device_h_l337_c33_57b6_return_output,
 BIN_OP_MINUS_uxn_device_h_l339_c22_398e_return_output,
 BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_return_output,
 ram_addr_MUX_uxn_device_h_l339_c9_f614_return_output,
 tmp4_MUX_uxn_device_h_l339_c9_f614_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_return_output,
 result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_return_output,
 result_u8_value_MUX_uxn_device_h_l339_c9_f614_return_output,
 result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_return_output,
 BIN_OP_MINUS_uxn_device_h_l344_c22_0751_return_output,
 BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_return_output,
 ram_addr_MUX_uxn_device_h_l344_c9_0980_return_output,
 tmp4_MUX_uxn_device_h_l344_c9_0980_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_return_output,
 result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_return_output,
 result_u8_value_MUX_uxn_device_h_l344_c9_0980_return_output,
 result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_return_output,
 CONST_SR_8_uxn_device_h_l347_c33_4bef_return_output,
 BIN_OP_MINUS_uxn_device_h_l349_c22_94de_return_output,
 BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_return_output,
 ram_addr_MUX_uxn_device_h_l349_c9_40bd_return_output,
 tmp4_MUX_uxn_device_h_l349_c9_40bd_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_return_output,
 result_u8_value_MUX_uxn_device_h_l349_c9_40bd_return_output,
 result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_return_output,
 BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_return_output,
 BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_return_output,
 ram_addr_MUX_uxn_device_h_l354_c9_b7e3_return_output,
 tmp4_MUX_uxn_device_h_l354_c9_b7e3_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_return_output,
 result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_return_output,
 BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_return_output,
 CONST_SR_8_uxn_device_h_l358_c33_8a21_return_output,
 BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_return_output,
 BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_return_output,
 tmp4_MUX_uxn_device_h_l360_c9_3644_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_return_output,
 result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_return_output,
 result_u8_value_MUX_uxn_device_h_l360_c9_3644_return_output,
 result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_return_output,
 BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_return_output,
 BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_return_output,
 tmp4_MUX_uxn_device_h_l365_c9_2381_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_return_output,
 result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_return_output,
 result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_return_output,
 BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_return_output,
 screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output,
 screen_2bpp_uxn_device_h_l374_c26_b79f_return_output,
 screen_1bpp_uxn_device_h_l376_c26_8897_return_output,
 BIN_OP_EQ_uxn_device_h_l385_c19_60a4_return_output,
 MUX_uxn_device_h_l385_c19_dc40_return_output,
 BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_return_output,
 BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_return_output,
 MUX_uxn_device_h_l388_c11_dc82_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output,
 BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l270_c2_4b38_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l270_c2_4b38_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c2_4b38_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l277_c7_0b29_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c2_4b38_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l277_c7_0b29_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l277_c7_0b29_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l277_c7_0b29_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_ae3c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_ae3c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l285_c7_ca68_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l285_c7_ca68_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l285_c7_ca68_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l285_c7_ca68_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l289_c7_4274_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l289_c7_4274_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l289_c7_4274_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l289_c7_4274_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l294_c7_a3f2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l294_c7_a3f2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l298_c7_e683_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l298_c7_e683_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l298_c7_e683_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l298_c7_e683_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_6e72_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l300_c15_3a47_return_output : unsigned(0 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l301_c11_badd_return_output : unsigned(0 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l302_c12_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l303_c12_5793_return_output : unsigned(0 downto 0);
 variable VAR_uint8_3_0_uxn_device_h_l304_c11_b057_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l307_c7_6e72_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l307_c7_6e72_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_6e72_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_c0b6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l315_c3_e24c : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l327_c3_a9d2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_a9d2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9fa6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9fa6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9fa6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9fa6_return_output : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l323_c17_f4b0_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_f784_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l324_c19_db23_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_f784_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_f784_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_f784_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_29dc_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l325_c19_2d9f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_29dc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_29dc_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_29dc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_db12_cond : unsigned(0 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l326_c20_f078_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_db12_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_db12_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_6cc9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_6cc9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_6cc9_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_6cc9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_db12_return_output : unsigned(15 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l327_c3_a9d2_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0_uxn_device_h_l327_c3_a9d2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l327_c3_a9d2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_a9d2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_a9d2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_a9d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l334_c5_55f4 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_af6b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_af6b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_af6b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_c07d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_c07d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_c07d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_c07d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_6c23_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_6c23_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_6c23_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_6c23_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_e68e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_e68e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_e68e_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_3240_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_3240_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_3240_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_3240_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_e68e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_f6fb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_f6fb_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_f6fb_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_acf6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_acf6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_acf6_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_acf6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_f6fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l337_c33_57b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l337_c33_57b6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_742c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_ac50_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l347_c33_4bef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l347_c33_4bef_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l347_c23_4ceb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l352_c23_5d2a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_uxn_device_h_l355_c5_5562 : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l358_c33_8a21_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l358_c33_8a21_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l358_c23_dc1b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l360_c9_3644_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l363_c23_8631_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l366_c5_3ae4 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l365_c9_2381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l365_c9_2381_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_return_output : unsigned(4 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_cond : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_phase : unsigned(11 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_x1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_y1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_color : unsigned(3 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_fx : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_fy : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_return_output : screen_blit_result_t;
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_phase : unsigned(11 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_x1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_y1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_color : unsigned(3 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_fx : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_fy : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_8897_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l379_c4_65bb : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l381_c27_4262_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l382_c22_770b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l384_c22_46d5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_dc40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_dc40_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_dc40_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_dc40_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_dc82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_dc82_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_dc82_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_dc82_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l281_l308_l290_l286_l313_l295_DUPLICATE_e96f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l388_l389_DUPLICATE_8beb_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ram_addr : unsigned(15 downto 0);
variable REG_VAR_ram_addr_incr : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_tmp16b : unsigned(15 downto 0);
variable REG_VAR_tmp12 : unsigned(11 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_x_sprite_incr : unsigned(7 downto 0);
variable REG_VAR_y_sprite_incr : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(3 downto 0);
variable REG_VAR_auto_length : unsigned(3 downto 0);
variable REG_VAR_tmp4 : unsigned(3 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_is_blit_done : unsigned(0 downto 0);
variable REG_VAR_is_last_blit : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
variable REG_VAR_screen_blit_result : screen_blit_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ram_addr := ram_addr;
  REG_VAR_ram_addr_incr := ram_addr_incr;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_tmp16b := tmp16b;
  REG_VAR_tmp12 := tmp12;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_x_sprite_incr := x_sprite_incr;
  REG_VAR_y_sprite_incr := y_sprite_incr;
  REG_VAR_color := color;
  REG_VAR_auto_length := auto_length;
  REG_VAR_tmp4 := tmp4;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_is_blit_done := is_blit_done;
  REG_VAR_is_last_blit := is_last_blit;
  REG_VAR_result := result;
  REG_VAR_screen_blit_result := screen_blit_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_right := to_unsigned(8, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_right := to_unsigned(9, 12);
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iftrue := to_unsigned(0, 1);
     VAR_tmp4_uxn_device_h_l315_c3_e24c := resize(to_unsigned(0, 1), 4);
     VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_iftrue := VAR_tmp4_uxn_device_h_l315_c3_e24c;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_right := to_unsigned(3, 12);
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_right := to_unsigned(6, 12);
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_right := to_unsigned(2, 2);
     VAR_result_device_ram_address_uxn_device_h_l379_c4_65bb := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iftrue := to_unsigned(0, 1);
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_right := to_unsigned(2, 12);
     VAR_MUX_uxn_device_h_l326_c39_6cc9_iffalse := to_unsigned(8, 16);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l325_c19_29dc_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iftrue := to_unsigned(43, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iftrue := to_unsigned(40, 8);
     VAR_MUX_uxn_device_h_l324_c19_f784_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_MUX_uxn_device_h_l324_c19_f784_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_right := to_unsigned(5, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iftrue := to_unsigned(41, 8);
     VAR_MUX_uxn_device_h_l326_c20_db12_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_right := to_unsigned(7, 12);
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iftrue := to_unsigned(45, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iftrue := to_unsigned(42, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l326_c39_6cc9_iftrue := to_unsigned(16, 16);
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iftrue := to_unsigned(0, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_right := to_unsigned(0, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iftrue := to_unsigned(0, 1);
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_right := to_unsigned(6, 3);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iftrue := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_right := to_unsigned(1, 12);
     VAR_result_u16_addr_uxn_device_h_l334_c5_55f4 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_result_u16_addr_uxn_device_h_l334_c5_55f4;
     VAR_MUX_uxn_device_h_l385_c19_dc40_iffalse := to_unsigned(0, 1);
     VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_iftrue := to_unsigned(9, 12);
     VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_right := to_unsigned(3, 2);
     VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_right := to_unsigned(5, 3);
     VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_right := to_unsigned(4, 3);
     VAR_MUX_uxn_device_h_l385_c19_dc40_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_right := to_unsigned(4, 12);
     VAR_MUX_uxn_device_h_l325_c19_29dc_iftrue := resize(to_unsigned(8, 4), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_device_h_l322_c18_9fa6_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iftrue := auto_advance;
     VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_iftrue := auto_length;
     VAR_color_MUX_uxn_device_h_l270_c2_4b38_iftrue := color;
     VAR_color_MUX_uxn_device_h_l277_c7_0b29_iftrue := color;
     VAR_color_MUX_uxn_device_h_l280_c7_ae3c_iftrue := color;
     VAR_color_MUX_uxn_device_h_l285_c7_ca68_iftrue := color;
     VAR_color_MUX_uxn_device_h_l289_c7_4274_iftrue := color;
     VAR_color_MUX_uxn_device_h_l294_c7_a3f2_iftrue := color;
     VAR_color_MUX_uxn_device_h_l298_c7_e683_iffalse := color;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_color := color;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_color := color;
     VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_iffalse := ctrl;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l326_c39_6cc9_cond := ctrl_mode;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_cond := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iffalse := ctrl_mode;
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l329_c13_c07d_cond := flip_x;
     VAR_MUX_uxn_device_h_l331_c26_3240_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_iffalse := flip_x;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_fx := flip_x;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_fx := flip_x;
     VAR_MUX_uxn_device_h_l330_c14_6c23_cond := flip_y;
     VAR_MUX_uxn_device_h_l332_c26_acf6_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_iffalse := flip_y;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_fy := flip_y;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_fy := flip_y;
     VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_left := is_blit_done;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_cond := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iftrue := is_blit_done;
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_result_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_x_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_y_MUX_uxn_device_h_l327_c3_a9d2_cond := is_blit_done;
     VAR_MUX_uxn_device_h_l331_c10_e68e_cond := is_last_blit;
     VAR_MUX_uxn_device_h_l332_c10_f6fb_cond := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iftrue := is_last_blit;
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iftrue := is_last_blit;
     VAR_layer_MUX_uxn_device_h_l270_c2_4b38_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l277_c7_0b29_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l285_c7_ca68_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l289_c7_4274_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l298_c7_e683_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_right := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_left := VAR_phase;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_left := VAR_phase;
     VAR_MUX_uxn_device_h_l322_c18_9fa6_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_iftrue := VAR_previous_device_ram_read;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_previous_ram_read := VAR_previous_ram_read;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_left := ram_addr;
     VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iffalse := ram_addr;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_ram_addr := ram_addr;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_ram_addr := ram_addr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue := ram_addr_incr;
     VAR_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue := result;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue := screen_blit_result;
     VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_left := tmp12;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_right := tmp12;
     VAR_MUX_uxn_device_h_l388_c11_dc82_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_iftrue := tmp12;
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_left := tmp16;
     VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_left := tmp16;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_x1 := tmp16;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_x1 := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_iffalse := tmp16;
     VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_left := tmp16b;
     VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_left := tmp16b;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_y1 := tmp16b;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_y1 := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iffalse := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_iffalse := tmp16b;
     VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_right := tmp4;
     VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_left := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_iffalse := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_iffalse := tmp4;
     VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_left := x;
     VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_left := x;
     VAR_MUX_uxn_device_h_l331_c10_e68e_iffalse := x;
     VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l270_c2_4b38_iftrue := x;
     VAR_x_MUX_uxn_device_h_l277_c7_0b29_iftrue := x;
     VAR_x_MUX_uxn_device_h_l289_c7_4274_iftrue := x;
     VAR_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l298_c7_e683_iftrue := x;
     VAR_x_MUX_uxn_device_h_l307_c7_6e72_iftrue := x;
     VAR_x_MUX_uxn_device_h_l312_c7_c0b6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l327_c3_a9d2_iffalse := x;
     VAR_x_MUX_uxn_device_h_l328_c4_af6b_iffalse := x;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue := x_sprite_incr;
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_left := y;
     VAR_CONST_SR_8_uxn_device_h_l347_c33_4bef_x := y;
     VAR_MUX_uxn_device_h_l332_c10_f6fb_iffalse := y;
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l270_c2_4b38_iftrue := y;
     VAR_y_MUX_uxn_device_h_l277_c7_0b29_iftrue := y;
     VAR_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l285_c7_ca68_iftrue := y;
     VAR_y_MUX_uxn_device_h_l298_c7_e683_iftrue := y;
     VAR_y_MUX_uxn_device_h_l307_c7_6e72_iftrue := y;
     VAR_y_MUX_uxn_device_h_l312_c7_c0b6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l327_c3_a9d2_iffalse := y;
     VAR_y_MUX_uxn_device_h_l328_c4_af6b_iffalse := y;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue := y_sprite_incr;
     -- BIN_OP_EQ[uxn_device_h_l277_c11_78be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l277_c11_78be_left <= VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_left;
     BIN_OP_EQ_uxn_device_h_l277_c11_78be_right <= VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output := BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l285_c7_ca68] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l285_c7_ca68_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_EQ[uxn_device_h_l298_c11_5379] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l298_c11_5379_left <= VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_left;
     BIN_OP_EQ_uxn_device_h_l298_c11_5379_right <= VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output := BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l365_c9_2381] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l365_c9_2381_return_output := result.device_ram_address;

     -- CAST_TO_uint8_t[uxn_device_h_l352_c23_5d2a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l352_c23_5d2a_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- BIN_OP_PLUS[uxn_device_h_l366_c5_5eff] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_left <= VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_left;
     BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_right <= VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_return_output := BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l298_c7_e683] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l298_c7_e683_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(45, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l294_c7_a3f2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l294_c7_a3f2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(44, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l280_c7_ae3c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_ae3c_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l307_c7_6e72] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l307_c7_6e72_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l328_c4_af6b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l328_c4_af6b_return_output := result.is_vram_write;

     -- uint8_3_0[uxn_device_h_l304_c11_b057] LATENCY=0
     VAR_uint8_3_0_uxn_device_h_l304_c11_b057_return_output := uint8_3_0(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l328_c8_e3f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_left;
     BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output := BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l360_c22_8b7e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_left;
     BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_return_output := BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_return_output;

     -- uint8_5_5[uxn_device_h_l302_c12_d4d6] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l302_c12_d4d6_return_output := uint8_5_5(
     VAR_previous_device_ram_read);

     -- uint8_4_4[uxn_device_h_l303_c12_5793] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l303_c12_5793_return_output := uint8_4_4(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l294_c11_475b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l294_c11_475b_left <= VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_left;
     BIN_OP_EQ_uxn_device_h_l294_c11_475b_right <= VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output := BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;

     -- CONST_SR_8[uxn_device_h_l347_c33_4bef] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l347_c33_4bef_x <= VAR_CONST_SR_8_uxn_device_h_l347_c33_4bef_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l347_c33_4bef_return_output := CONST_SR_8_uxn_device_h_l347_c33_4bef_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l289_c7_4274] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l289_c7_4274_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(47, 8));

     -- BIN_OP_EQ[uxn_device_h_l270_c6_ca16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l270_c6_ca16_left <= VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_left;
     BIN_OP_EQ_uxn_device_h_l270_c6_ca16_right <= VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output := BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l365_c22_d6ba] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_left <= VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_left;
     BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_right <= VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_return_output := BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_return_output;

     -- BIN_OP_EQ[uxn_device_h_l289_c11_94bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l289_c11_94bf_left <= VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_left;
     BIN_OP_EQ_uxn_device_h_l289_c11_94bf_right <= VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output := BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;

     -- uint8_6_6[uxn_device_h_l301_c11_badd] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l301_c11_badd_return_output := uint8_6_6(
     VAR_previous_device_ram_read);

     -- uint8_7_7[uxn_device_h_l300_c15_3a47] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l300_c15_3a47_return_output := uint8_7_7(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output := result.is_deo_done;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output := screen_blit_result.is_blit_done;

     -- BIN_OP_MINUS[uxn_device_h_l354_c22_b60f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_left <= VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_left;
     BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_right <= VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_return_output := BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l285_c11_accd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l285_c11_accd_left <= VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_left;
     BIN_OP_EQ_uxn_device_h_l285_c11_accd_right <= VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output := BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l270_c2_4b38] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l270_c2_4b38_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l365_c9_2381] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l365_c9_2381_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l312_c11_496d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l312_c11_496d_left <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_left;
     BIN_OP_EQ_uxn_device_h_l312_c11_496d_right <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output := BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;

     -- MUX[uxn_device_h_l326_c39_6cc9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l326_c39_6cc9_cond <= VAR_MUX_uxn_device_h_l326_c39_6cc9_cond;
     MUX_uxn_device_h_l326_c39_6cc9_iftrue <= VAR_MUX_uxn_device_h_l326_c39_6cc9_iftrue;
     MUX_uxn_device_h_l326_c39_6cc9_iffalse <= VAR_MUX_uxn_device_h_l326_c39_6cc9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l326_c39_6cc9_return_output := MUX_uxn_device_h_l326_c39_6cc9_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l277_c7_0b29] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l277_c7_0b29_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_MINUS[uxn_device_h_l339_c22_398e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l339_c22_398e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_left;
     BIN_OP_MINUS_uxn_device_h_l339_c22_398e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_return_output := BIN_OP_MINUS_uxn_device_h_l339_c22_398e_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l363_c23_8631] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l363_c23_8631_return_output := CAST_TO_uint8_t_uint16_t(
     ram_addr);

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l360_c9_3644] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l360_c9_3644_return_output := result.u8_value;

     -- BIN_OP_MINUS[uxn_device_h_l349_c22_94de] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l349_c22_94de_left <= VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_left;
     BIN_OP_MINUS_uxn_device_h_l349_c22_94de_right <= VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_return_output := BIN_OP_MINUS_uxn_device_h_l349_c22_94de_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l342_c23_ac50] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_ac50_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_PLUS[uxn_device_h_l388_c60_ef41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_left <= VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_left;
     BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_right <= VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_return_output := BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l281_l308_l290_l286_l313_l295_DUPLICATE_e96f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l281_l308_l290_l286_l313_l295_DUPLICATE_e96f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_MINUS[uxn_device_h_l344_c22_0751] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l344_c22_0751_left <= VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_left;
     BIN_OP_MINUS_uxn_device_h_l344_c22_0751_right <= VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_return_output := BIN_OP_MINUS_uxn_device_h_l344_c22_0751_return_output;

     -- BIN_OP_EQ[uxn_device_h_l307_c11_9c9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_left;
     BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output := BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;

     -- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_left <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_left;
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_right <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output := BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l322_c18_e5de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l322_c18_e5de_left <= VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_left;
     BIN_OP_EQ_uxn_device_h_l322_c18_e5de_right <= VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_return_output := BIN_OP_EQ_uxn_device_h_l322_c18_e5de_return_output;

     -- BIN_OP_EQ[uxn_device_h_l280_c11_927d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l280_c11_927d_left <= VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_left;
     BIN_OP_EQ_uxn_device_h_l280_c11_927d_right <= VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output := BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l328_c4_af6b] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l328_c4_af6b_return_output := result.u16_addr;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_color_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_layer_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_result_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_x_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_y_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_ca16_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_color_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_layer_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_result_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_x_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_y_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_78be_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_color_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_y_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_927d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_color_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_layer_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_result_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_x_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_y_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_accd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_color_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_layer_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_result_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_x_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_y_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_94bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_color_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_result_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_x_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_y_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_475b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_color_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_layer_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_result_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_x_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_y_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_5379_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_x_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_y_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_9c9c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_x_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_y_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_496d_return_output;
     VAR_MUX_uxn_device_h_l322_c18_9fa6_cond := VAR_BIN_OP_EQ_uxn_device_h_l322_c18_e5de_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_x_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_y_MUX_uxn_device_h_l328_c4_af6b_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_e3f4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_right := VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_398e_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_right := VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0751_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_right := VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_94de_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_right := VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_b60f_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_right := VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_8b7e_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_right := VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_d6ba_return_output;
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l374_l376_DUPLICATE_684d_return_output;
     VAR_tmp4_uxn_device_h_l366_c5_3ae4 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_5eff_return_output, 4);
     VAR_MUX_uxn_device_h_l388_c11_dc82_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_ef41_return_output, 12);
     VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l281_l308_l290_l286_l313_l295_DUPLICATE_e96f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l281_l308_l290_l286_l313_l295_DUPLICATE_e96f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l281_l308_l290_l286_l313_l295_DUPLICATE_e96f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l281_l308_l290_l286_l313_l295_DUPLICATE_e96f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_ac50_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l352_c23_5d2a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l363_c23_8631_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_700f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l360_l349_l354_l344_l339_l328_l365_DUPLICATE_1c8e_return_output;
     VAR_MUX_uxn_device_h_l326_c20_db12_iftrue := VAR_MUX_uxn_device_h_l326_c39_6cc9_return_output;
     VAR_result_MUX_uxn_device_h_l277_c7_0b29_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l277_c7_0b29_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_result_MUX_uxn_device_h_l285_c7_ca68_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l285_c7_ca68_return_output;
     VAR_result_MUX_uxn_device_h_l289_c7_4274_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l289_c7_4274_return_output;
     VAR_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_result_MUX_uxn_device_h_l298_c7_e683_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l298_c7_e683_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_6e72_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l307_c7_6e72_return_output;
     VAR_result_MUX_uxn_device_h_l270_c2_4b38_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l270_c2_4b38_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l365_c9_2381_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l365_c9_2381_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l328_c4_af6b_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l328_c4_af6b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l360_c9_3644_return_output;
     VAR_color_MUX_uxn_device_h_l298_c7_e683_iftrue := VAR_uint8_3_0_uxn_device_h_l304_c11_b057_return_output;
     VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_iftrue := VAR_uint8_4_4_uxn_device_h_l303_c12_5793_return_output;
     VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_iftrue := VAR_uint8_5_5_uxn_device_h_l302_c12_d4d6_return_output;
     VAR_layer_MUX_uxn_device_h_l298_c7_e683_iftrue := VAR_uint8_6_6_uxn_device_h_l301_c11_badd_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iftrue := VAR_uint8_7_7_uxn_device_h_l300_c15_3a47_return_output;
     VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_iftrue := VAR_tmp4_uxn_device_h_l366_c5_3ae4;
     -- result_is_vram_write_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_cond;
     result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_return_output := result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output := CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l365_c13_15df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l365_c13_15df_left <= VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_left;
     BIN_OP_EQ_uxn_device_h_l365_c13_15df_right <= VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output := BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output;

     -- MUX[uxn_device_h_l322_c18_9fa6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l322_c18_9fa6_cond <= VAR_MUX_uxn_device_h_l322_c18_9fa6_cond;
     MUX_uxn_device_h_l322_c18_9fa6_iftrue <= VAR_MUX_uxn_device_h_l322_c18_9fa6_iftrue;
     MUX_uxn_device_h_l322_c18_9fa6_iffalse <= VAR_MUX_uxn_device_h_l322_c18_9fa6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l322_c18_9fa6_return_output := MUX_uxn_device_h_l322_c18_9fa6_return_output;

     -- color_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_color_MUX_uxn_device_h_l298_c7_e683_cond;
     color_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_color_MUX_uxn_device_h_l298_c7_e683_iftrue;
     color_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_color_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l298_c7_e683_return_output := color_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- layer_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_layer_MUX_uxn_device_h_l298_c7_e683_cond;
     layer_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_layer_MUX_uxn_device_h_l298_c7_e683_iftrue;
     layer_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_layer_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l298_c7_e683_return_output := layer_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- BIN_OP_EQ[uxn_device_h_l339_c13_9a82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l339_c13_9a82_left <= VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_left;
     BIN_OP_EQ_uxn_device_h_l339_c13_9a82_right <= VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output := BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_cond;
     result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_return_output := result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l354_c13_d95a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l354_c13_d95a_left <= VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_left;
     BIN_OP_EQ_uxn_device_h_l354_c13_d95a_right <= VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output := BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_cond;
     ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iftrue;
     ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_return_output := ctrl_mode_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- BIN_OP_OR[uxn_device_h_l286_c3_1212] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l286_c3_1212_left <= VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_left;
     BIN_OP_OR_uxn_device_h_l286_c3_1212_right <= VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_return_output := BIN_OP_OR_uxn_device_h_l286_c3_1212_return_output;

     -- BIN_OP_OR[uxn_device_h_l313_c3_95df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l313_c3_95df_left <= VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_left;
     BIN_OP_OR_uxn_device_h_l313_c3_95df_right <= VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_return_output := BIN_OP_OR_uxn_device_h_l313_c3_95df_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l347_c23_4ceb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l347_c23_4ceb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l347_c33_4bef_return_output);

     -- ctrl_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_cond;
     ctrl_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_iftrue;
     ctrl_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_return_output := ctrl_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- BIN_OP_OR[uxn_device_h_l295_c3_fab3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l295_c3_fab3_left <= VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_left;
     BIN_OP_OR_uxn_device_h_l295_c3_fab3_right <= VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_return_output := BIN_OP_OR_uxn_device_h_l295_c3_fab3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l360_c13_6788] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l360_c13_6788_left <= VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_left;
     BIN_OP_EQ_uxn_device_h_l360_c13_6788_right <= VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output := BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output;

     -- BIN_OP_EQ[uxn_device_h_l349_c13_7449] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l349_c13_7449_left <= VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_left;
     BIN_OP_EQ_uxn_device_h_l349_c13_7449_right <= VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output := BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- flip_x_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_cond;
     flip_x_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_iftrue;
     flip_x_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_return_output := flip_x_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- BIN_OP_EQ[uxn_device_h_l344_c13_b62e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l344_c13_b62e_left <= VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_left;
     BIN_OP_EQ_uxn_device_h_l344_c13_b62e_right <= VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output := BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;

     -- flip_y_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_cond;
     flip_y_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_iftrue;
     flip_y_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_return_output := flip_y_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- Submodule level 2
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_9a82_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b62e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;
     VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_7449_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_d95a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output;
     VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_6788_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output;
     VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_15df_return_output;
     VAR_x_MUX_uxn_device_h_l285_c7_ca68_iftrue := VAR_BIN_OP_OR_uxn_device_h_l286_c3_1212_return_output;
     VAR_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue := VAR_BIN_OP_OR_uxn_device_h_l295_c3_fab3_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iftrue := VAR_BIN_OP_OR_uxn_device_h_l313_c3_95df_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l347_c23_4ceb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output;
     VAR_y_MUX_uxn_device_h_l289_c7_4274_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l291_l309_l282_DUPLICATE_8f1c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_MUX_uxn_device_h_l322_c18_9fa6_return_output;
     VAR_color_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_color_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_ctrl_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_flip_x_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_flip_y_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_layer_MUX_uxn_device_h_l298_c7_e683_return_output;
     -- uint8_0_0[uxn_device_h_l324_c19_db23] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l324_c19_db23_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l322_c18_9fa6_return_output);

     -- flip_x_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_cond;
     flip_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     flip_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_return_output := flip_x_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- auto_advance_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_cond;
     auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_return_output := auto_advance_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- layer_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_cond;
     layer_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     layer_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_return_output := layer_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l365_c9_2381] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_cond;
     result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_return_output := result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_return_output;

     -- ctrl_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_cond;
     ctrl_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     ctrl_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_return_output := ctrl_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l365_c9_2381] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_return_output;

     -- uint8_7_4[uxn_device_h_l323_c17_f4b0] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l323_c17_f4b0_return_output := uint8_7_4(
     VAR_MUX_uxn_device_h_l322_c18_9fa6_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_cond;
     ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_return_output := ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- flip_y_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_cond;
     flip_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     flip_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_return_output := flip_y_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- color_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_color_MUX_uxn_device_h_l294_c7_a3f2_cond;
     color_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_color_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     color_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_color_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l294_c7_a3f2_return_output := color_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- uint8_1_1[uxn_device_h_l325_c19_2d9f] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l325_c19_2d9f_return_output := uint8_1_1(
     VAR_MUX_uxn_device_h_l322_c18_9fa6_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l365_c9_2381] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_cond;
     result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_return_output := result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_return_output;

     -- result_u8_value_MUX[uxn_device_h_l360_c9_3644] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l360_c9_3644_cond <= VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_cond;
     result_u8_value_MUX_uxn_device_h_l360_c9_3644_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_iftrue;
     result_u8_value_MUX_uxn_device_h_l360_c9_3644_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_return_output := result_u8_value_MUX_uxn_device_h_l360_c9_3644_return_output;

     -- tmp4_MUX[uxn_device_h_l365_c9_2381] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l365_c9_2381_cond <= VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_cond;
     tmp4_MUX_uxn_device_h_l365_c9_2381_iftrue <= VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_iftrue;
     tmp4_MUX_uxn_device_h_l365_c9_2381_iffalse <= VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_return_output := tmp4_MUX_uxn_device_h_l365_c9_2381_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l365_c9_2381] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_return_output := result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_return_output;

     -- uint8_2_2[uxn_device_h_l326_c20_f078] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l326_c20_f078_return_output := uint8_2_2(
     VAR_MUX_uxn_device_h_l322_c18_9fa6_return_output);

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_auto_advance_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_color_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_color_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_ctrl_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_flip_x_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_flip_y_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_layer_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_layer_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_2381_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_2381_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_2381_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l360_c9_3644_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_2381_return_output;
     VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_iffalse := VAR_tmp4_MUX_uxn_device_h_l365_c9_2381_return_output;
     VAR_MUX_uxn_device_h_l324_c19_f784_cond := VAR_uint8_0_0_uxn_device_h_l324_c19_db23_return_output;
     VAR_MUX_uxn_device_h_l325_c19_29dc_cond := VAR_uint8_1_1_uxn_device_h_l325_c19_2d9f_return_output;
     VAR_MUX_uxn_device_h_l326_c20_db12_cond := VAR_uint8_2_2_uxn_device_h_l326_c20_f078_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_left := VAR_uint8_7_4_uxn_device_h_l323_c17_f4b0_return_output;
     VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_uint8_7_4_uxn_device_h_l323_c17_f4b0_return_output;
     -- layer_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_layer_MUX_uxn_device_h_l289_c7_4274_cond;
     layer_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_layer_MUX_uxn_device_h_l289_c7_4274_iftrue;
     layer_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_layer_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l289_c7_4274_return_output := layer_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l360_c9_3644] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_return_output;

     -- MUX[uxn_device_h_l326_c20_db12] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l326_c20_db12_cond <= VAR_MUX_uxn_device_h_l326_c20_db12_cond;
     MUX_uxn_device_h_l326_c20_db12_iftrue <= VAR_MUX_uxn_device_h_l326_c20_db12_iftrue;
     MUX_uxn_device_h_l326_c20_db12_iffalse <= VAR_MUX_uxn_device_h_l326_c20_db12_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l326_c20_db12_return_output := MUX_uxn_device_h_l326_c20_db12_return_output;

     -- auto_advance_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_cond;
     auto_advance_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     auto_advance_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_return_output := auto_advance_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- flip_y_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_cond;
     flip_y_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_iftrue;
     flip_y_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_return_output := flip_y_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l360_c9_3644] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_cond;
     result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_return_output := result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_return_output;

     -- ctrl_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_cond;
     ctrl_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_iftrue;
     ctrl_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_return_output := ctrl_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l360_c9_3644] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_cond;
     result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_return_output := result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_return_output;

     -- BIN_OP_EQ[uxn_device_h_l385_c19_60a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l385_c19_60a4_left <= VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_left;
     BIN_OP_EQ_uxn_device_h_l385_c19_60a4_right <= VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_return_output := BIN_OP_EQ_uxn_device_h_l385_c19_60a4_return_output;

     -- tmp4_MUX[uxn_device_h_l360_c9_3644] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l360_c9_3644_cond <= VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_cond;
     tmp4_MUX_uxn_device_h_l360_c9_3644_iftrue <= VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_iftrue;
     tmp4_MUX_uxn_device_h_l360_c9_3644_iffalse <= VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_return_output := tmp4_MUX_uxn_device_h_l360_c9_3644_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_cond;
     ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iftrue;
     ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_return_output := ctrl_mode_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- MUX[uxn_device_h_l324_c19_f784] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l324_c19_f784_cond <= VAR_MUX_uxn_device_h_l324_c19_f784_cond;
     MUX_uxn_device_h_l324_c19_f784_iftrue <= VAR_MUX_uxn_device_h_l324_c19_f784_iftrue;
     MUX_uxn_device_h_l324_c19_f784_iffalse <= VAR_MUX_uxn_device_h_l324_c19_f784_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l324_c19_f784_return_output := MUX_uxn_device_h_l324_c19_f784_return_output;

     -- auto_length_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_cond;
     auto_length_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     auto_length_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_return_output := auto_length_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- flip_x_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_cond;
     flip_x_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_iftrue;
     flip_x_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_return_output := flip_x_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- MUX[uxn_device_h_l325_c19_29dc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l325_c19_29dc_cond <= VAR_MUX_uxn_device_h_l325_c19_29dc_cond;
     MUX_uxn_device_h_l325_c19_29dc_iftrue <= VAR_MUX_uxn_device_h_l325_c19_29dc_iftrue;
     MUX_uxn_device_h_l325_c19_29dc_iffalse <= VAR_MUX_uxn_device_h_l325_c19_29dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l325_c19_29dc_return_output := MUX_uxn_device_h_l325_c19_29dc_return_output;

     -- color_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_color_MUX_uxn_device_h_l289_c7_4274_cond;
     color_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_color_MUX_uxn_device_h_l289_c7_4274_iftrue;
     color_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_color_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l289_c7_4274_return_output := color_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l360_c9_3644] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_return_output := result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l385_c19_dc40_cond := VAR_BIN_OP_EQ_uxn_device_h_l385_c19_60a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_right := VAR_MUX_uxn_device_h_l324_c19_f784_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_right := VAR_MUX_uxn_device_h_l324_c19_f784_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_right := VAR_MUX_uxn_device_h_l324_c19_f784_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_right := VAR_MUX_uxn_device_h_l324_c19_f784_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_MUX_uxn_device_h_l324_c19_f784_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_right := VAR_MUX_uxn_device_h_l325_c19_29dc_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_right := VAR_MUX_uxn_device_h_l325_c19_29dc_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_right := VAR_MUX_uxn_device_h_l325_c19_29dc_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_right := VAR_MUX_uxn_device_h_l325_c19_29dc_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_MUX_uxn_device_h_l325_c19_29dc_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_right := VAR_MUX_uxn_device_h_l326_c20_db12_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_MUX_uxn_device_h_l326_c20_db12_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_auto_advance_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_auto_length_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_color_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_color_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_ctrl_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_flip_x_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_flip_y_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_layer_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_layer_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_3644_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_3644_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_3644_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_3644_return_output;
     VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_iffalse := VAR_tmp4_MUX_uxn_device_h_l360_c9_3644_return_output;
     -- MUX[uxn_device_h_l385_c19_dc40] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l385_c19_dc40_cond <= VAR_MUX_uxn_device_h_l385_c19_dc40_cond;
     MUX_uxn_device_h_l385_c19_dc40_iftrue <= VAR_MUX_uxn_device_h_l385_c19_dc40_iftrue;
     MUX_uxn_device_h_l385_c19_dc40_iffalse <= VAR_MUX_uxn_device_h_l385_c19_dc40_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l385_c19_dc40_return_output := MUX_uxn_device_h_l385_c19_dc40_return_output;

     -- layer_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_layer_MUX_uxn_device_h_l285_c7_ca68_cond;
     layer_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_layer_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     layer_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_layer_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l285_c7_ca68_return_output := layer_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l354_c9_b7e3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_return_output := result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_return_output;

     -- auto_length_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_cond;
     auto_length_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     auto_length_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_return_output := auto_length_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l331_c58_64f7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_left;
     BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_return_output := BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_cond;
     ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_return_output := ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l354_c9_b7e3] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_cond;
     ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output := ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond;
     x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output := x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l332_c36_d167] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l332_c36_d167_left <= VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_left;
     BIN_OP_MINUS_uxn_device_h_l332_c36_d167_right <= VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_return_output := BIN_OP_MINUS_uxn_device_h_l332_c36_d167_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l330_c51_a4d7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_left;
     BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_return_output := BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l354_c9_b7e3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_cond;
     result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_return_output := result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_return_output;

     -- flip_x_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_cond;
     flip_x_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     flip_x_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_return_output := flip_x_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l329_c49_5b91] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_left <= VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_left;
     BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_right <= VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_return_output := BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l331_c36_6202] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l331_c36_6202_left <= VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_left;
     BIN_OP_MINUS_uxn_device_h_l331_c36_6202_right <= VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_return_output := BIN_OP_MINUS_uxn_device_h_l331_c36_6202_return_output;

     -- ctrl_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_cond;
     ctrl_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     ctrl_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_return_output := ctrl_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- tmp4_MUX[uxn_device_h_l354_c9_b7e3] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l354_c9_b7e3_cond <= VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_cond;
     tmp4_MUX_uxn_device_h_l354_c9_b7e3_iftrue <= VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_iftrue;
     tmp4_MUX_uxn_device_h_l354_c9_b7e3_iffalse <= VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_return_output := tmp4_MUX_uxn_device_h_l354_c9_b7e3_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l329_c23_62a1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_left <= VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_left;
     BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_right <= VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_return_output := BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l355_c5_cd12] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_left <= VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_left;
     BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_right <= VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_return_output := BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_cond;
     y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output := y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l332_c58_8fda] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_left <= VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_left;
     BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_right <= VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_return_output := BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l354_c9_b7e3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_cond;
     result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_return_output := result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_return_output;

     -- color_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_color_MUX_uxn_device_h_l285_c7_ca68_cond;
     color_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_color_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     color_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_color_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l285_c7_ca68_return_output := color_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- flip_y_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_cond;
     flip_y_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     flip_y_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_return_output := flip_y_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- auto_advance_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_cond;
     auto_advance_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_iftrue;
     auto_advance_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_return_output := auto_advance_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l330_c24_d5a5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_left <= VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_left;
     BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_right <= VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_return_output := BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l329_c13_c07d_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_62a1_return_output;
     VAR_MUX_uxn_device_h_l330_c14_6c23_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_d5a5_return_output;
     VAR_MUX_uxn_device_h_l331_c26_3240_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_6202_return_output;
     VAR_MUX_uxn_device_h_l332_c26_acf6_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_d167_return_output;
     VAR_MUX_uxn_device_h_l329_c13_c07d_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5b91_return_output, 16);
     VAR_MUX_uxn_device_h_l330_c14_6c23_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_a4d7_return_output, 16);
     VAR_MUX_uxn_device_h_l331_c26_3240_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_64f7_return_output, 16);
     VAR_MUX_uxn_device_h_l332_c26_acf6_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_8fda_return_output, 16);
     VAR_ram_addr_uxn_device_h_l355_c5_5562 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_cd12_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iffalse := VAR_MUX_uxn_device_h_l385_c19_dc40_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_auto_length_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_color_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_color_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_ctrl_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_flip_x_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_flip_y_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_layer_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_b7e3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_b7e3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_b7e3_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_b7e3_return_output;
     VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_iffalse := VAR_tmp4_MUX_uxn_device_h_l354_c9_b7e3_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_CONST_SR_8_uxn_device_h_l358_c33_8a21_x := VAR_ram_addr_uxn_device_h_l355_c5_5562;
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iftrue := VAR_ram_addr_uxn_device_h_l355_c5_5562;
     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l349_c9_40bd] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l349_c9_40bd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_cond;
     result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_return_output := result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_return_output;

     -- auto_length_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_cond;
     auto_length_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_iftrue;
     auto_length_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_return_output := auto_length_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- layer_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_cond;
     layer_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     layer_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_return_output := layer_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- MUX[uxn_device_h_l331_c26_3240] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l331_c26_3240_cond <= VAR_MUX_uxn_device_h_l331_c26_3240_cond;
     MUX_uxn_device_h_l331_c26_3240_iftrue <= VAR_MUX_uxn_device_h_l331_c26_3240_iftrue;
     MUX_uxn_device_h_l331_c26_3240_iffalse <= VAR_MUX_uxn_device_h_l331_c26_3240_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l331_c26_3240_return_output := MUX_uxn_device_h_l331_c26_3240_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l349_c9_40bd] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_return_output := result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_return_output;

     -- MUX[uxn_device_h_l329_c13_c07d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l329_c13_c07d_cond <= VAR_MUX_uxn_device_h_l329_c13_c07d_cond;
     MUX_uxn_device_h_l329_c13_c07d_iftrue <= VAR_MUX_uxn_device_h_l329_c13_c07d_iftrue;
     MUX_uxn_device_h_l329_c13_c07d_iffalse <= VAR_MUX_uxn_device_h_l329_c13_c07d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l329_c13_c07d_return_output := MUX_uxn_device_h_l329_c13_c07d_return_output;

     -- ctrl_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_cond;
     ctrl_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     ctrl_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_return_output := ctrl_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l349_c9_40bd] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_cond;
     result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_return_output := result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_return_output;

     -- ram_addr_MUX[uxn_device_h_l354_c9_b7e3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l354_c9_b7e3_cond <= VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_cond;
     ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iftrue;
     ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_return_output := ram_addr_MUX_uxn_device_h_l354_c9_b7e3_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond;
     x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output := x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- auto_advance_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_cond;
     auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_return_output := auto_advance_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- flip_y_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_cond;
     flip_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     flip_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_return_output := flip_y_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- is_last_blit_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_cond;
     is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_return_output := is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- MUX[uxn_device_h_l330_c14_6c23] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l330_c14_6c23_cond <= VAR_MUX_uxn_device_h_l330_c14_6c23_cond;
     MUX_uxn_device_h_l330_c14_6c23_iftrue <= VAR_MUX_uxn_device_h_l330_c14_6c23_iftrue;
     MUX_uxn_device_h_l330_c14_6c23_iffalse <= VAR_MUX_uxn_device_h_l330_c14_6c23_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l330_c14_6c23_return_output := MUX_uxn_device_h_l330_c14_6c23_return_output;

     -- flip_x_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_cond;
     flip_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     flip_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_return_output := flip_x_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- MUX[uxn_device_h_l332_c26_acf6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l332_c26_acf6_cond <= VAR_MUX_uxn_device_h_l332_c26_acf6_cond;
     MUX_uxn_device_h_l332_c26_acf6_iftrue <= VAR_MUX_uxn_device_h_l332_c26_acf6_iftrue;
     MUX_uxn_device_h_l332_c26_acf6_iffalse <= VAR_MUX_uxn_device_h_l332_c26_acf6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l332_c26_acf6_return_output := MUX_uxn_device_h_l332_c26_acf6_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_cond;
     y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output := y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- CONST_SR_8[uxn_device_h_l358_c33_8a21] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l358_c33_8a21_x <= VAR_CONST_SR_8_uxn_device_h_l358_c33_8a21_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l358_c33_8a21_return_output := CONST_SR_8_uxn_device_h_l358_c33_8a21_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_cond;
     ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_return_output := ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- tmp4_MUX[uxn_device_h_l349_c9_40bd] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l349_c9_40bd_cond <= VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_cond;
     tmp4_MUX_uxn_device_h_l349_c9_40bd_iftrue <= VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_iftrue;
     tmp4_MUX_uxn_device_h_l349_c9_40bd_iffalse <= VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_return_output := tmp4_MUX_uxn_device_h_l349_c9_40bd_return_output;

     -- color_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_color_MUX_uxn_device_h_l280_c7_ae3c_cond;
     color_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_color_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     color_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_color_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l280_c7_ae3c_return_output := color_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_cond;
     ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_return_output := ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_MUX_uxn_device_h_l329_c13_c07d_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_MUX_uxn_device_h_l330_c14_6c23_return_output;
     VAR_MUX_uxn_device_h_l331_c10_e68e_iftrue := VAR_MUX_uxn_device_h_l331_c26_3240_return_output;
     VAR_MUX_uxn_device_h_l332_c10_f6fb_iftrue := VAR_MUX_uxn_device_h_l332_c26_acf6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_auto_advance_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_auto_length_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_color_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_color_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_ctrl_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_flip_x_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_flip_y_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_layer_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_layer_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_iffalse := VAR_ram_addr_MUX_uxn_device_h_l354_c9_b7e3_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_40bd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_40bd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_40bd_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_40bd_return_output;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_iffalse := VAR_tmp4_MUX_uxn_device_h_l349_c9_40bd_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_6e72_return_output;
     -- ram_addr_MUX[uxn_device_h_l349_c9_40bd] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l349_c9_40bd_cond <= VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_cond;
     ram_addr_MUX_uxn_device_h_l349_c9_40bd_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_iftrue;
     ram_addr_MUX_uxn_device_h_l349_c9_40bd_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_return_output := ram_addr_MUX_uxn_device_h_l349_c9_40bd_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l358_c23_dc1b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l358_c23_dc1b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l358_c33_8a21_return_output);

     -- ctrl_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_cond;
     ctrl_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     ctrl_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_return_output := ctrl_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- is_last_blit_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_cond;
     is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_return_output := is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond;
     y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output := y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- flip_y_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_cond;
     flip_y_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     flip_y_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_return_output := flip_y_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l344_c9_0980] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_return_output := result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_return_output;

     -- MUX[uxn_device_h_l332_c10_f6fb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l332_c10_f6fb_cond <= VAR_MUX_uxn_device_h_l332_c10_f6fb_cond;
     MUX_uxn_device_h_l332_c10_f6fb_iftrue <= VAR_MUX_uxn_device_h_l332_c10_f6fb_iftrue;
     MUX_uxn_device_h_l332_c10_f6fb_iffalse <= VAR_MUX_uxn_device_h_l332_c10_f6fb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l332_c10_f6fb_return_output := MUX_uxn_device_h_l332_c10_f6fb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l344_c9_0980] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_cond;
     result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_return_output := result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_cond;
     ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_return_output := ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_cond;
     x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output := x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l344_c9_0980] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_cond;
     ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_return_output := ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- layer_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_layer_MUX_uxn_device_h_l277_c7_0b29_cond;
     layer_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_layer_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     layer_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_layer_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l277_c7_0b29_return_output := layer_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- MUX[uxn_device_h_l331_c10_e68e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l331_c10_e68e_cond <= VAR_MUX_uxn_device_h_l331_c10_e68e_cond;
     MUX_uxn_device_h_l331_c10_e68e_iftrue <= VAR_MUX_uxn_device_h_l331_c10_e68e_iftrue;
     MUX_uxn_device_h_l331_c10_e68e_iffalse <= VAR_MUX_uxn_device_h_l331_c10_e68e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l331_c10_e68e_return_output := MUX_uxn_device_h_l331_c10_e68e_return_output;

     -- color_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_color_MUX_uxn_device_h_l277_c7_0b29_cond;
     color_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_color_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     color_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_color_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l277_c7_0b29_return_output := color_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- auto_length_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_cond;
     auto_length_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     auto_length_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_return_output := auto_length_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- tmp16b_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_cond;
     tmp16b_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     tmp16b_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_return_output := tmp16b_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- tmp16_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_cond;
     tmp16_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     tmp16_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_return_output := tmp16_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l344_c9_0980] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_cond;
     result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_return_output := result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- auto_advance_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_cond;
     auto_advance_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_iftrue;
     auto_advance_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_return_output := auto_advance_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- tmp4_MUX[uxn_device_h_l344_c9_0980] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l344_c9_0980_cond <= VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_cond;
     tmp4_MUX_uxn_device_h_l344_c9_0980_iftrue <= VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_iftrue;
     tmp4_MUX_uxn_device_h_l344_c9_0980_iffalse <= VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_return_output := tmp4_MUX_uxn_device_h_l344_c9_0980_return_output;

     -- flip_x_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_cond;
     flip_x_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     flip_x_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_return_output := flip_x_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l358_c23_dc1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_CONST_SR_8_uxn_device_h_l337_c33_57b6_x := VAR_MUX_uxn_device_h_l331_c10_e68e_return_output;
     VAR_x_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_MUX_uxn_device_h_l331_c10_e68e_return_output;
     VAR_y_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_MUX_uxn_device_h_l332_c10_f6fb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_auto_advance_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_auto_length_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_color_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_color_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_ctrl_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_flip_x_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_flip_y_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_layer_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_layer_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_iffalse := VAR_ram_addr_MUX_uxn_device_h_l349_c9_40bd_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_0980_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_0980_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_0980_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_0980_return_output;
     VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_tmp16_MUX_uxn_device_h_l328_c4_af6b_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_tmp16b_MUX_uxn_device_h_l328_c4_af6b_return_output;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_iffalse := VAR_tmp4_MUX_uxn_device_h_l344_c9_0980_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_e683_return_output;
     -- tmp4_MUX[uxn_device_h_l339_c9_f614] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l339_c9_f614_cond <= VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_cond;
     tmp4_MUX_uxn_device_h_l339_c9_f614_iftrue <= VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_iftrue;
     tmp4_MUX_uxn_device_h_l339_c9_f614_iffalse <= VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_return_output := tmp4_MUX_uxn_device_h_l339_c9_f614_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond;
     y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output := y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- tmp16b_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_cond;
     tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_return_output := tmp16b_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- CONST_SR_8[uxn_device_h_l337_c33_57b6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l337_c33_57b6_x <= VAR_CONST_SR_8_uxn_device_h_l337_c33_57b6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l337_c33_57b6_return_output := CONST_SR_8_uxn_device_h_l337_c33_57b6_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l339_c9_f614] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_return_output := result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- flip_y_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_cond;
     flip_y_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     flip_y_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_return_output := flip_y_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- flip_x_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_cond;
     flip_x_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     flip_x_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_return_output := flip_x_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_cond;
     ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_return_output := ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- color_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_color_MUX_uxn_device_h_l270_c2_4b38_cond;
     color_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_color_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     color_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_color_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l270_c2_4b38_return_output := color_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l339_c9_f614] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_return_output;

     -- y_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_y_MUX_uxn_device_h_l328_c4_af6b_cond;
     y_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_y_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     y_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_y_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l328_c4_af6b_return_output := y_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- ram_addr_MUX[uxn_device_h_l344_c9_0980] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l344_c9_0980_cond <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_cond;
     ram_addr_MUX_uxn_device_h_l344_c9_0980_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_iftrue;
     ram_addr_MUX_uxn_device_h_l344_c9_0980_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_return_output := ram_addr_MUX_uxn_device_h_l344_c9_0980_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_cond;
     x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output := x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- auto_advance_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_cond;
     auto_advance_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     auto_advance_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_return_output := auto_advance_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- auto_length_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_cond;
     auto_length_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_iftrue;
     auto_length_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_return_output := auto_length_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l339_c9_f614] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_cond;
     result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_return_output := result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_return_output;

     -- ctrl_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_cond;
     ctrl_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     ctrl_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_return_output := ctrl_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- tmp16_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_cond;
     tmp16_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     tmp16_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_return_output := tmp16_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_cond;
     ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output := ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l339_c9_f614] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_cond;
     result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_return_output := result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_return_output;

     -- x_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_x_MUX_uxn_device_h_l328_c4_af6b_cond;
     x_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_x_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     x_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_x_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l328_c4_af6b_return_output := x_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- layer_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_layer_MUX_uxn_device_h_l270_c2_4b38_cond;
     layer_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_layer_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     layer_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_layer_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l270_c2_4b38_return_output := layer_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- result_u8_value_MUX[uxn_device_h_l354_c9_b7e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_cond <= VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_cond;
     result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iftrue;
     result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_return_output := result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_return_output;

     -- is_last_blit_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_cond;
     is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_return_output := is_last_blit_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_auto_length_MUX_uxn_device_h_l289_c7_4274_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l270_c2_4b38_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l270_c2_4b38_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_4b38_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l270_c2_4b38_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l307_c7_6e72_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_iffalse := VAR_ram_addr_MUX_uxn_device_h_l344_c9_0980_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_f614_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_f614_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_f614_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l354_c9_b7e3_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_f614_return_output;
     VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_tmp16_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_tmp16b_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_tmp4_MUX_uxn_device_h_l339_c9_f614_return_output;
     VAR_x_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_x_MUX_uxn_device_h_l328_c4_af6b_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_y_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_y_MUX_uxn_device_h_l328_c4_af6b_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     -- result_is_device_ram_write_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- x_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_x_MUX_uxn_device_h_l327_c3_a9d2_cond;
     x_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_x_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     x_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_x_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l327_c3_a9d2_return_output := x_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- is_last_blit_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_cond;
     is_last_blit_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_iftrue;
     is_last_blit_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_return_output := is_last_blit_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_cond;
     result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_return_output := result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_cond;
     result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_return_output := result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l349_c9_40bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l349_c9_40bd_cond <= VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_cond;
     result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iftrue;
     result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_return_output := result_u8_value_MUX_uxn_device_h_l349_c9_40bd_return_output;

     -- auto_advance_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_cond;
     auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_return_output := auto_advance_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond;
     y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output := y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_cond;
     x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output := x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- auto_length_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_cond;
     auto_length_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     auto_length_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_return_output := auto_length_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- tmp16b_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_cond;
     tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_return_output := tmp16b_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- ram_addr_MUX[uxn_device_h_l339_c9_f614] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l339_c9_f614_cond <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_cond;
     ram_addr_MUX_uxn_device_h_l339_c9_f614_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_iftrue;
     ram_addr_MUX_uxn_device_h_l339_c9_f614_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_return_output := ram_addr_MUX_uxn_device_h_l339_c9_f614_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_cond;
     ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_return_output := ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- y_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_y_MUX_uxn_device_h_l327_c3_a9d2_cond;
     y_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_y_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     y_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_y_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l327_c3_a9d2_return_output := y_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- tmp16_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_cond;
     tmp16_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     tmp16_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_return_output := tmp16_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l337_c23_742c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_742c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l337_c33_57b6_return_output);

     -- tmp4_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_cond;
     tmp4_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     tmp4_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_return_output := tmp4_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_742c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_auto_advance_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_auto_length_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l339_c9_f614_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l349_c9_40bd_return_output;
     VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_tmp16_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_tmp16b_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_tmp4_MUX_uxn_device_h_l328_c4_af6b_return_output;
     VAR_x_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_x_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_y_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_y_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_4274_return_output;
     -- result_u8_value_MUX[uxn_device_h_l344_c9_0980] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l344_c9_0980_cond <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_cond;
     result_u8_value_MUX_uxn_device_h_l344_c9_0980_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_iftrue;
     result_u8_value_MUX_uxn_device_h_l344_c9_0980_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_return_output := result_u8_value_MUX_uxn_device_h_l344_c9_0980_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond;
     x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output := x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- x_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_x_MUX_uxn_device_h_l312_c7_c0b6_cond;
     x_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_x_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     x_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_x_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l312_c7_c0b6_return_output := x_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- auto_length_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_cond;
     auto_length_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     auto_length_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_return_output := auto_length_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- y_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_y_MUX_uxn_device_h_l312_c7_c0b6_cond;
     y_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_y_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     y_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_y_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l312_c7_c0b6_return_output := y_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l321_c1_eebe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_return_output;

     -- ram_addr_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_cond;
     ram_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     ram_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_return_output := ram_addr_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_cond;
     y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output := y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- is_last_blit_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_cond;
     is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_return_output := is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- auto_advance_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_cond;
     auto_advance_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     auto_advance_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_return_output := auto_advance_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- tmp16_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_cond;
     tmp16_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     tmp16_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_return_output := tmp16_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63[uxn_device_h_l327_c3_a9d2] LATENCY=0
     VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l327_c3_a9d2_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63(
     screen_blit_result,
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_af6b_return_output);

     -- ram_addr_incr_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_cond;
     ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_return_output := ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- tmp4_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_cond;
     tmp4_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     tmp4_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_return_output := tmp4_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- tmp16b_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_cond;
     tmp16b_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     tmp16b_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_return_output := tmp16b_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_eebe_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_auto_advance_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_auto_length_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_ram_addr_MUX_uxn_device_h_l328_c4_af6b_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l344_c9_0980_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_tmp16_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_tmp16b_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_tmp4_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_x_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_x_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_y_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_y_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_ca68_return_output;
     -- x_sprite_incr_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond;
     x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output := x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- is_last_blit_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_cond;
     is_last_blit_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_iftrue;
     is_last_blit_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_return_output := is_last_blit_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_cond;
     ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output := ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- result_u8_value_MUX[uxn_device_h_l339_c9_f614] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l339_c9_f614_cond <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_cond;
     result_u8_value_MUX_uxn_device_h_l339_c9_f614_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_iftrue;
     result_u8_value_MUX_uxn_device_h_l339_c9_f614_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_return_output := result_u8_value_MUX_uxn_device_h_l339_c9_f614_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l372_c1_8b1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output;

     -- y_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_y_MUX_uxn_device_h_l307_c7_6e72_cond;
     y_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_y_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     y_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_y_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l307_c7_6e72_return_output := y_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- tmp16b_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_cond;
     tmp16b_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_iftrue;
     tmp16b_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_return_output := tmp16b_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- tmp4_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_cond;
     tmp4_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     tmp4_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_return_output := tmp4_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- auto_length_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_cond;
     auto_length_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     auto_length_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_return_output := auto_length_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- x_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_x_MUX_uxn_device_h_l307_c7_6e72_cond;
     x_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_x_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     x_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_x_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l307_c7_6e72_return_output := x_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_cond;
     y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output := y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- ram_addr_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_cond;
     ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_return_output := ram_addr_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- tmp16_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_cond;
     tmp16_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_iftrue;
     tmp16_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_return_output := tmp16_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- auto_advance_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_cond;
     auto_advance_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     auto_advance_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_return_output := auto_advance_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_8b1e_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_auto_length_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l339_c9_f614_return_output;
     VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_tmp16_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_tmp16b_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_tmp4_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_x_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_x_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_y_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_y_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     -- x_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_x_MUX_uxn_device_h_l298_c7_e683_cond;
     x_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_x_MUX_uxn_device_h_l298_c7_e683_iftrue;
     x_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_x_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l298_c7_e683_return_output := x_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- y_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_y_MUX_uxn_device_h_l298_c7_e683_cond;
     y_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_y_MUX_uxn_device_h_l298_c7_e683_iftrue;
     y_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_y_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l298_c7_e683_return_output := y_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond;
     x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output := x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- tmp16b_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_cond;
     tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_return_output := tmp16b_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_cond;
     ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_return_output := ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- tmp4_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_cond;
     tmp4_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     tmp4_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_return_output := tmp4_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- auto_length_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_cond;
     auto_length_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     auto_length_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_return_output := auto_length_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- tmp16_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_cond;
     tmp16_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     tmp16_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_return_output := tmp16_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_cond;
     y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output := y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- ram_addr_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_cond;
     ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_return_output := ram_addr_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_dac9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l328_c4_af6b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l328_c4_af6b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_cond;
     result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iftrue;
     result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_return_output := result_u8_value_MUX_uxn_device_h_l328_c4_af6b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l373_c1_579b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_return_output;

     -- is_last_blit_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_cond;
     is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_return_output := is_last_blit_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- Submodule level 12
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_dac9_return_output;
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_579b_return_output;
     REG_VAR_auto_length := VAR_auto_length_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_ram_addr_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_tmp16_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_tmp16b_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_tmp4_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_x_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_y_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_0b29_return_output;
     -- screen_1bpp[uxn_device_h_l376_c26_8897] LATENCY=0
     -- Clock enable
     screen_1bpp_uxn_device_h_l376_c26_8897_CLOCK_ENABLE <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_CLOCK_ENABLE;
     -- Inputs
     screen_1bpp_uxn_device_h_l376_c26_8897_phase <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_phase;
     screen_1bpp_uxn_device_h_l376_c26_8897_x1 <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_x1;
     screen_1bpp_uxn_device_h_l376_c26_8897_y1 <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_y1;
     screen_1bpp_uxn_device_h_l376_c26_8897_color <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_color;
     screen_1bpp_uxn_device_h_l376_c26_8897_fx <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_fx;
     screen_1bpp_uxn_device_h_l376_c26_8897_fy <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_fy;
     screen_1bpp_uxn_device_h_l376_c26_8897_ram_addr <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_ram_addr;
     screen_1bpp_uxn_device_h_l376_c26_8897_previous_ram_read <= VAR_screen_1bpp_uxn_device_h_l376_c26_8897_previous_ram_read;
     -- Outputs
     VAR_screen_1bpp_uxn_device_h_l376_c26_8897_return_output := screen_1bpp_uxn_device_h_l376_c26_8897_return_output;

     -- tmp16_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_cond;
     tmp16_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_iftrue;
     tmp16_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_return_output := tmp16_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- x_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_x_MUX_uxn_device_h_l294_c7_a3f2_cond;
     x_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_x_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     x_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_x_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l294_c7_a3f2_return_output := x_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- tmp4_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_cond;
     tmp4_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_iftrue;
     tmp4_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_return_output := tmp4_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond;
     x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output := x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_cond;
     ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_return_output := ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- tmp16b_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_cond;
     tmp16b_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_iftrue;
     tmp16b_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_return_output := tmp16b_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- is_last_blit_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_cond;
     is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_return_output := is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_cond;
     y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output := y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- ram_addr_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_cond;
     ram_addr_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     ram_addr_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_return_output := ram_addr_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- y_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_y_MUX_uxn_device_h_l294_c7_a3f2_cond;
     y_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_y_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     y_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_y_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l294_c7_a3f2_return_output := y_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- screen_2bpp[uxn_device_h_l374_c26_b79f] LATENCY=0
     -- Clock enable
     screen_2bpp_uxn_device_h_l374_c26_b79f_CLOCK_ENABLE <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_CLOCK_ENABLE;
     -- Inputs
     screen_2bpp_uxn_device_h_l374_c26_b79f_phase <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_phase;
     screen_2bpp_uxn_device_h_l374_c26_b79f_x1 <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_x1;
     screen_2bpp_uxn_device_h_l374_c26_b79f_y1 <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_y1;
     screen_2bpp_uxn_device_h_l374_c26_b79f_color <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_color;
     screen_2bpp_uxn_device_h_l374_c26_b79f_fx <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_fx;
     screen_2bpp_uxn_device_h_l374_c26_b79f_fy <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_fy;
     screen_2bpp_uxn_device_h_l374_c26_b79f_ram_addr <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_ram_addr;
     screen_2bpp_uxn_device_h_l374_c26_b79f_previous_ram_read <= VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_previous_ram_read;
     -- Outputs
     VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_return_output := screen_2bpp_uxn_device_h_l374_c26_b79f_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0[uxn_device_h_l327_c3_a9d2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0_uxn_device_h_l327_c3_a9d2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_96f0(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_af6b_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_af6b_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_af6b_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_af6b_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_af6b_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_af6b_return_output);

     -- Submodule level 13
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_ram_addr_MUX_uxn_device_h_l307_c7_6e72_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iffalse := VAR_screen_1bpp_uxn_device_h_l376_c26_8897_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iftrue := VAR_screen_2bpp_uxn_device_h_l374_c26_b79f_return_output;
     VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_tmp16_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_tmp16b_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_tmp4_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_x_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_x_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     REG_VAR_x_sprite_incr := VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_y_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_y_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     REG_VAR_y_sprite_incr := VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_4b38_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l373_c4_1c57] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_cond;
     screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iftrue;
     screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output := screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output;

     -- is_last_blit_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_cond;
     is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_return_output := is_last_blit_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- ram_addr_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_cond;
     ram_addr_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_iftrue;
     ram_addr_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_return_output := ram_addr_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- y_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_y_MUX_uxn_device_h_l289_c7_4274_cond;
     y_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_y_MUX_uxn_device_h_l289_c7_4274_iftrue;
     y_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_y_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l289_c7_4274_return_output := y_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- x_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_x_MUX_uxn_device_h_l289_c7_4274_cond;
     x_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_x_MUX_uxn_device_h_l289_c7_4274_iftrue;
     x_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_x_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l289_c7_4274_return_output := x_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- tmp16_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_cond;
     tmp16_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     tmp16_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_return_output := tmp16_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- tmp16b_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_cond;
     tmp16b_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     tmp16b_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_return_output := tmp16b_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- tmp4_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_cond;
     tmp4_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     tmp4_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_return_output := tmp4_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- Submodule level 14
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_tmp16_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_tmp16b_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_tmp4_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_x_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_x_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_y_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_y_MUX_uxn_device_h_l289_c7_4274_return_output;
     -- x_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_x_MUX_uxn_device_h_l285_c7_ca68_cond;
     x_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_x_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     x_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_x_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l285_c7_ca68_return_output := x_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l381_c27_4262] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l381_c27_4262_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output.is_vram_write;

     -- ram_addr_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_cond;
     ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_return_output := ram_addr_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- y_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_y_MUX_uxn_device_h_l285_c7_ca68_cond;
     y_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_y_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     y_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_y_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l285_c7_ca68_return_output := y_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- is_last_blit_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_cond;
     is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_return_output := is_last_blit_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- tmp16_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_cond;
     tmp16_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     tmp16_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_return_output := tmp16_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l382_c22_770b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l382_c22_770b_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output.u16_addr;

     -- tmp4_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_cond;
     tmp4_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_iftrue;
     tmp4_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_return_output := tmp4_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_cond;
     screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output := screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l384_c22_46d5] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l384_c22_46d5_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_1c57_return_output.u8_value;

     -- tmp16b_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_cond;
     tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_return_output := tmp16b_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- Submodule level 15
     REG_VAR_is_last_blit := VAR_is_last_blit_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_ram_addr_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_tmp16_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_tmp16b_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_tmp4_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_x_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_y_MUX_uxn_device_h_l285_c7_ca68_return_output;
     -- tmp16_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_cond;
     tmp16_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     tmp16_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_return_output := tmp16_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l388_l389_DUPLICATE_8beb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l388_l389_DUPLICATE_8beb_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_a9d2_return_output.is_blit_done;

     -- ram_addr_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_cond;
     ram_addr_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_iftrue;
     ram_addr_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_return_output := ram_addr_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7[uxn_device_h_l327_c3_a9d2] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l327_c3_a9d2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39b7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l379_c4_65bb,
     to_unsigned(0, 1),
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l381_c27_4262_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l382_c22_770b_return_output,
     layer,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l384_c22_46d5_return_output);

     -- tmp4_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_cond;
     tmp4_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     tmp4_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_return_output := tmp4_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- x_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_x_MUX_uxn_device_h_l280_c7_ae3c_cond;
     x_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_x_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     x_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_x_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l280_c7_ae3c_return_output := x_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- y_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_y_MUX_uxn_device_h_l280_c7_ae3c_cond;
     y_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_y_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     y_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_y_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l280_c7_ae3c_return_output := y_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- tmp16b_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_cond;
     tmp16b_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     tmp16b_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_return_output := tmp16b_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_cond;
     screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_return_output := screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- Submodule level 16
     VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_right := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l388_l389_DUPLICATE_8beb_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l388_l389_DUPLICATE_8beb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_ram_addr_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_tmp16_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_tmp16b_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_tmp4_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_x_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_x_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_y_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_y_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     -- is_blit_done_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_cond;
     is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_return_output := is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- tmp4_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_cond;
     tmp4_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     tmp4_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_return_output := tmp4_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- y_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_y_MUX_uxn_device_h_l277_c7_0b29_cond;
     y_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_y_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     y_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_y_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l277_c7_0b29_return_output := y_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- x_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_x_MUX_uxn_device_h_l277_c7_0b29_cond;
     x_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_x_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     x_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_x_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l277_c7_0b29_return_output := x_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- BIN_OP_XOR[uxn_device_h_l388_c11_f3dd] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_left <= VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_left;
     BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_right <= VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_return_output := BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_return_output;

     -- tmp16_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_cond;
     tmp16_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     tmp16_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_return_output := tmp16_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- tmp16b_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_cond;
     tmp16b_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     tmp16b_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_return_output := tmp16b_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_cond;
     screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_return_output := screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- result_MUX[uxn_device_h_l327_c3_a9d2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l327_c3_a9d2_cond <= VAR_result_MUX_uxn_device_h_l327_c3_a9d2_cond;
     result_MUX_uxn_device_h_l327_c3_a9d2_iftrue <= VAR_result_MUX_uxn_device_h_l327_c3_a9d2_iftrue;
     result_MUX_uxn_device_h_l327_c3_a9d2_iffalse <= VAR_result_MUX_uxn_device_h_l327_c3_a9d2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l327_c3_a9d2_return_output := result_MUX_uxn_device_h_l327_c3_a9d2_return_output;

     -- ram_addr_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_cond;
     ram_addr_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     ram_addr_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_return_output := ram_addr_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- Submodule level 17
     VAR_MUX_uxn_device_h_l388_c11_dc82_cond := VAR_BIN_OP_XOR_uxn_device_h_l388_c11_f3dd_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_result_MUX_uxn_device_h_l327_c3_a9d2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_6e72_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_device_h_l270_c2_4b38_return_output;
     REG_VAR_tmp16b := VAR_tmp16b_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_tmp4_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_x_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_x_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_y_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_y_MUX_uxn_device_h_l277_c7_0b29_return_output;
     -- result_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_result_MUX_uxn_device_h_l312_c7_c0b6_cond;
     result_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_result_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     result_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_result_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l312_c7_c0b6_return_output := result_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- ram_addr_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_cond;
     ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_return_output := ram_addr_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- tmp4_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_cond;
     tmp4_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     tmp4_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_return_output := tmp4_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- y_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_y_MUX_uxn_device_h_l270_c2_4b38_cond;
     y_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_y_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     y_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_y_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l270_c2_4b38_return_output := y_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_cond;
     screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iftrue;
     screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_return_output := screen_blit_result_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- x_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_x_MUX_uxn_device_h_l270_c2_4b38_cond;
     x_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_x_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     x_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_x_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l270_c2_4b38_return_output := x_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- MUX[uxn_device_h_l388_c11_dc82] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l388_c11_dc82_cond <= VAR_MUX_uxn_device_h_l388_c11_dc82_cond;
     MUX_uxn_device_h_l388_c11_dc82_iftrue <= VAR_MUX_uxn_device_h_l388_c11_dc82_iftrue;
     MUX_uxn_device_h_l388_c11_dc82_iffalse <= VAR_MUX_uxn_device_h_l388_c11_dc82_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l388_c11_dc82_return_output := MUX_uxn_device_h_l388_c11_dc82_return_output;

     -- is_blit_done_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_cond;
     is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_return_output := is_blit_done_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- Submodule level 18
     VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_iffalse := VAR_MUX_uxn_device_h_l388_c11_dc82_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_ram_addr_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_result_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_tmp4_MUX_uxn_device_h_l277_c7_0b29_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l270_c2_4b38_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l270_c2_4b38_return_output;
     -- tmp4_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_cond;
     tmp4_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     tmp4_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_return_output := tmp4_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- ram_addr_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_cond;
     ram_addr_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     ram_addr_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_return_output := ram_addr_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_cond;
     screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_return_output := screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- result_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_result_MUX_uxn_device_h_l307_c7_6e72_cond;
     result_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_result_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     result_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_result_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l307_c7_6e72_return_output := result_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- tmp12_MUX[uxn_device_h_l312_c7_c0b6] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l312_c7_c0b6_cond <= VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_cond;
     tmp12_MUX_uxn_device_h_l312_c7_c0b6_iftrue <= VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_iftrue;
     tmp12_MUX_uxn_device_h_l312_c7_c0b6_iffalse <= VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_return_output := tmp12_MUX_uxn_device_h_l312_c7_c0b6_return_output;

     -- is_blit_done_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_cond;
     is_blit_done_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_iftrue;
     is_blit_done_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_return_output := is_blit_done_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- Submodule level 19
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_ram_addr_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_result_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_result_MUX_uxn_device_h_l307_c7_6e72_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_iffalse := VAR_tmp12_MUX_uxn_device_h_l312_c7_c0b6_return_output;
     REG_VAR_tmp4 := VAR_tmp4_MUX_uxn_device_h_l270_c2_4b38_return_output;
     -- tmp12_MUX[uxn_device_h_l307_c7_6e72] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l307_c7_6e72_cond <= VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_cond;
     tmp12_MUX_uxn_device_h_l307_c7_6e72_iftrue <= VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_iftrue;
     tmp12_MUX_uxn_device_h_l307_c7_6e72_iffalse <= VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_return_output := tmp12_MUX_uxn_device_h_l307_c7_6e72_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_cond;
     screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iftrue;
     screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_return_output := screen_blit_result_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- is_blit_done_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_cond;
     is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_return_output := is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- result_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_result_MUX_uxn_device_h_l298_c7_e683_cond;
     result_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_result_MUX_uxn_device_h_l298_c7_e683_iftrue;
     result_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_result_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l298_c7_e683_return_output := result_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- ram_addr_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_cond;
     ram_addr_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     ram_addr_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_return_output := ram_addr_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- Submodule level 20
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_result_MUX_uxn_device_h_l298_c7_e683_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_iffalse := VAR_tmp12_MUX_uxn_device_h_l307_c7_6e72_return_output;
     -- tmp12_MUX[uxn_device_h_l298_c7_e683] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l298_c7_e683_cond <= VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_cond;
     tmp12_MUX_uxn_device_h_l298_c7_e683_iftrue <= VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_iftrue;
     tmp12_MUX_uxn_device_h_l298_c7_e683_iffalse <= VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_return_output := tmp12_MUX_uxn_device_h_l298_c7_e683_return_output;

     -- result_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_result_MUX_uxn_device_h_l294_c7_a3f2_cond;
     result_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_result_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     result_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_result_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l294_c7_a3f2_return_output := result_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_cond;
     screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_return_output := screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- is_blit_done_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_cond;
     is_blit_done_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_iftrue;
     is_blit_done_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_return_output := is_blit_done_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- Submodule level 21
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_result_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_result_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_iffalse := VAR_tmp12_MUX_uxn_device_h_l298_c7_e683_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_cond;
     screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_return_output := screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- is_blit_done_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_cond;
     is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_return_output := is_blit_done_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- tmp12_MUX[uxn_device_h_l294_c7_a3f2] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l294_c7_a3f2_cond <= VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_cond;
     tmp12_MUX_uxn_device_h_l294_c7_a3f2_iftrue <= VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_iftrue;
     tmp12_MUX_uxn_device_h_l294_c7_a3f2_iffalse <= VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_return_output := tmp12_MUX_uxn_device_h_l294_c7_a3f2_return_output;

     -- result_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_result_MUX_uxn_device_h_l289_c7_4274_cond;
     result_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_result_MUX_uxn_device_h_l289_c7_4274_iftrue;
     result_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_result_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l289_c7_4274_return_output := result_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- Submodule level 22
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_result_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_result_MUX_uxn_device_h_l289_c7_4274_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_iffalse := VAR_tmp12_MUX_uxn_device_h_l294_c7_a3f2_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_cond;
     screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_return_output := screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- is_blit_done_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_cond;
     is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_return_output := is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- result_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_result_MUX_uxn_device_h_l285_c7_ca68_cond;
     result_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_result_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     result_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_result_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l285_c7_ca68_return_output := result_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- tmp12_MUX[uxn_device_h_l289_c7_4274] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l289_c7_4274_cond <= VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_cond;
     tmp12_MUX_uxn_device_h_l289_c7_4274_iftrue <= VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_iftrue;
     tmp12_MUX_uxn_device_h_l289_c7_4274_iffalse <= VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_return_output := tmp12_MUX_uxn_device_h_l289_c7_4274_return_output;

     -- Submodule level 23
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_result_MUX_uxn_device_h_l285_c7_ca68_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_iffalse := VAR_tmp12_MUX_uxn_device_h_l289_c7_4274_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_cond;
     screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_return_output := screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- is_blit_done_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_cond;
     is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_return_output := is_blit_done_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- tmp12_MUX[uxn_device_h_l285_c7_ca68] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l285_c7_ca68_cond <= VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_cond;
     tmp12_MUX_uxn_device_h_l285_c7_ca68_iftrue <= VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_iftrue;
     tmp12_MUX_uxn_device_h_l285_c7_ca68_iffalse <= VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_return_output := tmp12_MUX_uxn_device_h_l285_c7_ca68_return_output;

     -- result_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_result_MUX_uxn_device_h_l280_c7_ae3c_cond;
     result_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_result_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     result_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_result_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l280_c7_ae3c_return_output := result_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- Submodule level 24
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_result_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_result_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     REG_VAR_screen_blit_result := VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_iffalse := VAR_tmp12_MUX_uxn_device_h_l285_c7_ca68_return_output;
     -- tmp12_MUX[uxn_device_h_l280_c7_ae3c] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l280_c7_ae3c_cond <= VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_cond;
     tmp12_MUX_uxn_device_h_l280_c7_ae3c_iftrue <= VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_iftrue;
     tmp12_MUX_uxn_device_h_l280_c7_ae3c_iffalse <= VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_return_output := tmp12_MUX_uxn_device_h_l280_c7_ae3c_return_output;

     -- result_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_result_MUX_uxn_device_h_l277_c7_0b29_cond;
     result_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_result_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     result_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_result_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l277_c7_0b29_return_output := result_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- is_blit_done_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_cond;
     is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_return_output := is_blit_done_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- Submodule level 25
     REG_VAR_is_blit_done := VAR_is_blit_done_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_result_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_result_MUX_uxn_device_h_l277_c7_0b29_return_output;
     VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_iffalse := VAR_tmp12_MUX_uxn_device_h_l280_c7_ae3c_return_output;
     -- result_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_result_MUX_uxn_device_h_l270_c2_4b38_cond;
     result_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_result_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     result_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_result_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l270_c2_4b38_return_output := result_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- tmp12_MUX[uxn_device_h_l277_c7_0b29] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l277_c7_0b29_cond <= VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_cond;
     tmp12_MUX_uxn_device_h_l277_c7_0b29_iftrue <= VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_iftrue;
     tmp12_MUX_uxn_device_h_l277_c7_0b29_iffalse <= VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_return_output := tmp12_MUX_uxn_device_h_l277_c7_0b29_return_output;

     -- Submodule level 26
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l270_c2_4b38_return_output;
     VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_iffalse := VAR_tmp12_MUX_uxn_device_h_l277_c7_0b29_return_output;
     -- tmp12_MUX[uxn_device_h_l270_c2_4b38] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l270_c2_4b38_cond <= VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_cond;
     tmp12_MUX_uxn_device_h_l270_c2_4b38_iftrue <= VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_iftrue;
     tmp12_MUX_uxn_device_h_l270_c2_4b38_iffalse <= VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_return_output := tmp12_MUX_uxn_device_h_l270_c2_4b38_return_output;

     -- Submodule level 27
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_device_h_l270_c2_4b38_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ram_addr <= REG_VAR_ram_addr;
REG_COMB_ram_addr_incr <= REG_VAR_ram_addr_incr;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_tmp16b <= REG_VAR_tmp16b;
REG_COMB_tmp12 <= REG_VAR_tmp12;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_x_sprite_incr <= REG_VAR_x_sprite_incr;
REG_COMB_y_sprite_incr <= REG_VAR_y_sprite_incr;
REG_COMB_color <= REG_VAR_color;
REG_COMB_auto_length <= REG_VAR_auto_length;
REG_COMB_tmp4 <= REG_VAR_tmp4;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_is_blit_done <= REG_VAR_is_blit_done;
REG_COMB_is_last_blit <= REG_VAR_is_last_blit;
REG_COMB_result <= REG_VAR_result;
REG_COMB_screen_blit_result <= REG_VAR_screen_blit_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     ram_addr <= REG_COMB_ram_addr;
     ram_addr_incr <= REG_COMB_ram_addr_incr;
     tmp16 <= REG_COMB_tmp16;
     tmp16b <= REG_COMB_tmp16b;
     tmp12 <= REG_COMB_tmp12;
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     x_sprite_incr <= REG_COMB_x_sprite_incr;
     y_sprite_incr <= REG_COMB_y_sprite_incr;
     color <= REG_COMB_color;
     auto_length <= REG_COMB_auto_length;
     tmp4 <= REG_COMB_tmp4;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     is_blit_done <= REG_COMB_is_blit_done;
     is_last_blit <= REG_COMB_is_last_blit;
     result <= REG_COMB_result;
     screen_blit_result <= REG_COMB_screen_blit_result;
 end if;
 end if;
end process;

end arch;
