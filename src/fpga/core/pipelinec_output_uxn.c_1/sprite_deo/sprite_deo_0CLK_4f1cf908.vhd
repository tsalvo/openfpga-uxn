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
-- BIN_OP_EQ[uxn_device_h_l270_c6_1727]
signal BIN_OP_EQ_uxn_device_h_l270_c6_1727_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l270_c6_1727_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l277_c7_b744]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l270_c2_c6b9]
signal flip_y_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l270_c2_c6b9]
signal ram_addr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l270_c2_c6b9]
signal flip_x_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l270_c2_c6b9]
signal tmp16b_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l270_c2_c6b9]
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l270_c2_c6b9]
signal tmp12_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(11 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l270_c2_c6b9]
signal ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l270_c2_c6b9]
signal is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l270_c2_c6b9]
signal result_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l270_c2_c6b9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l270_c2_c6b9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l270_c2_c6b9_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l270_c2_c6b9]
signal y_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l270_c2_c6b9]
signal color_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l270_c2_c6b9]
signal screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l270_c2_c6b9]
signal tmp4_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l270_c2_c6b9]
signal is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l270_c2_c6b9]
signal layer_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l270_c2_c6b9]
signal tmp16_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l270_c2_c6b9]
signal ctrl_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l270_c2_c6b9]
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l270_c2_c6b9]
signal x_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l270_c2_c6b9]
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l270_c2_c6b9]
signal auto_length_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l270_c2_c6b9]
signal auto_advance_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l277_c11_acea]
signal BIN_OP_EQ_uxn_device_h_l277_c11_acea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l277_c11_acea_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l280_c7_4b5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l277_c7_b744]
signal flip_y_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l277_c7_b744]
signal ram_addr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l277_c7_b744]
signal flip_x_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l277_c7_b744]
signal tmp16b_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l277_c7_b744]
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l277_c7_b744]
signal tmp12_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(11 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l277_c7_b744]
signal ctrl_mode_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l277_c7_b744]
signal is_last_blit_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l277_c7_b744]
signal result_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l277_c7_b744_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l277_c7_b744_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l277_c7_b744_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l277_c7_b744]
signal y_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l277_c7_b744]
signal color_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l277_c7_b744]
signal screen_blit_result_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l277_c7_b744_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l277_c7_b744]
signal tmp4_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l277_c7_b744]
signal is_blit_done_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l277_c7_b744]
signal layer_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l277_c7_b744]
signal tmp16_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l277_c7_b744]
signal ctrl_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l277_c7_b744]
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l277_c7_b744]
signal x_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l277_c7_b744]
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l277_c7_b744]
signal auto_length_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l277_c7_b744]
signal auto_advance_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l280_c11_f982]
signal BIN_OP_EQ_uxn_device_h_l280_c11_f982_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l280_c11_f982_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l285_c7_5ad9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l280_c7_4b5a]
signal flip_y_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l280_c7_4b5a]
signal ram_addr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l280_c7_4b5a]
signal flip_x_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l280_c7_4b5a]
signal tmp16b_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l280_c7_4b5a]
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l280_c7_4b5a]
signal tmp12_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(11 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l280_c7_4b5a]
signal ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l280_c7_4b5a]
signal is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l280_c7_4b5a]
signal result_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l280_c7_4b5a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l280_c7_4b5a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l280_c7_4b5a_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l280_c7_4b5a]
signal y_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l280_c7_4b5a]
signal color_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l280_c7_4b5a]
signal screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l280_c7_4b5a]
signal tmp4_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l280_c7_4b5a]
signal is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l280_c7_4b5a]
signal layer_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l280_c7_4b5a]
signal tmp16_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l280_c7_4b5a]
signal ctrl_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l280_c7_4b5a]
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l280_c7_4b5a]
signal x_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l280_c7_4b5a]
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l280_c7_4b5a]
signal auto_length_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l280_c7_4b5a]
signal auto_advance_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l285_c11_5494]
signal BIN_OP_EQ_uxn_device_h_l285_c11_5494_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l285_c11_5494_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l289_c7_66c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l285_c7_5ad9]
signal flip_y_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l285_c7_5ad9]
signal ram_addr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l285_c7_5ad9]
signal flip_x_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l285_c7_5ad9]
signal tmp16b_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l285_c7_5ad9]
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l285_c7_5ad9]
signal tmp12_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(11 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l285_c7_5ad9]
signal ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l285_c7_5ad9]
signal is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l285_c7_5ad9]
signal result_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l285_c7_5ad9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l285_c7_5ad9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l285_c7_5ad9_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l285_c7_5ad9]
signal y_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l285_c7_5ad9]
signal color_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l285_c7_5ad9]
signal screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l285_c7_5ad9]
signal tmp4_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l285_c7_5ad9]
signal is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l285_c7_5ad9]
signal layer_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l285_c7_5ad9]
signal tmp16_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l285_c7_5ad9]
signal ctrl_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l285_c7_5ad9]
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l285_c7_5ad9]
signal x_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l285_c7_5ad9]
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l285_c7_5ad9]
signal auto_length_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l285_c7_5ad9]
signal auto_advance_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l286_c3_88db]
signal BIN_OP_OR_uxn_device_h_l286_c3_88db_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l286_c3_88db_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l286_c3_88db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l289_c11_0c80]
signal BIN_OP_EQ_uxn_device_h_l289_c11_0c80_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l289_c11_0c80_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l294_c7_3246]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l289_c7_66c7]
signal flip_y_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l289_c7_66c7]
signal ram_addr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l289_c7_66c7]
signal flip_x_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l289_c7_66c7]
signal tmp16b_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l289_c7_66c7]
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l289_c7_66c7]
signal tmp12_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(11 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l289_c7_66c7]
signal ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l289_c7_66c7]
signal is_last_blit_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l289_c7_66c7]
signal result_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l289_c7_66c7_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l289_c7_66c7_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l289_c7_66c7_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l289_c7_66c7]
signal y_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l289_c7_66c7]
signal color_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l289_c7_66c7]
signal screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l289_c7_66c7]
signal tmp4_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l289_c7_66c7]
signal is_blit_done_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l289_c7_66c7]
signal layer_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l289_c7_66c7]
signal tmp16_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l289_c7_66c7]
signal ctrl_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l289_c7_66c7]
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l289_c7_66c7]
signal x_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l289_c7_66c7]
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l289_c7_66c7]
signal auto_length_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l289_c7_66c7]
signal auto_advance_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l294_c11_1dc9]
signal BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l298_c7_acf2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l294_c7_3246]
signal flip_y_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l294_c7_3246]
signal ram_addr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l294_c7_3246]
signal flip_x_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l294_c7_3246]
signal tmp16b_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l294_c7_3246]
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l294_c7_3246]
signal tmp12_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(11 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l294_c7_3246]
signal ctrl_mode_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l294_c7_3246]
signal is_last_blit_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l294_c7_3246]
signal result_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l294_c7_3246_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l294_c7_3246_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l294_c7_3246_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l294_c7_3246]
signal y_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l294_c7_3246]
signal color_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l294_c7_3246]
signal screen_blit_result_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l294_c7_3246_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l294_c7_3246]
signal tmp4_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l294_c7_3246]
signal is_blit_done_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l294_c7_3246]
signal layer_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l294_c7_3246]
signal tmp16_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l294_c7_3246]
signal ctrl_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l294_c7_3246]
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l294_c7_3246]
signal x_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l294_c7_3246]
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l294_c7_3246]
signal auto_length_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l294_c7_3246]
signal auto_advance_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l295_c3_3e63]
signal BIN_OP_OR_uxn_device_h_l295_c3_3e63_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l295_c3_3e63_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l295_c3_3e63_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l298_c11_be6b]
signal BIN_OP_EQ_uxn_device_h_l298_c11_be6b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l298_c11_be6b_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_eeac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l298_c7_acf2]
signal flip_y_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l298_c7_acf2]
signal ram_addr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l298_c7_acf2]
signal flip_x_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l298_c7_acf2]
signal tmp16b_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l298_c7_acf2]
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l298_c7_acf2]
signal tmp12_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(11 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l298_c7_acf2]
signal ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l298_c7_acf2]
signal is_last_blit_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l298_c7_acf2]
signal result_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l298_c7_acf2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l298_c7_acf2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l298_c7_acf2_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l298_c7_acf2]
signal y_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l298_c7_acf2]
signal color_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l298_c7_acf2]
signal screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l298_c7_acf2]
signal tmp4_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l298_c7_acf2]
signal is_blit_done_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l298_c7_acf2]
signal layer_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l298_c7_acf2]
signal tmp16_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l298_c7_acf2]
signal ctrl_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l298_c7_acf2]
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l298_c7_acf2]
signal x_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l298_c7_acf2]
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l298_c7_acf2]
signal auto_length_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l298_c7_acf2]
signal auto_advance_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l307_c11_e458]
signal BIN_OP_EQ_uxn_device_h_l307_c11_e458_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_e458_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_1c96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l307_c7_eeac]
signal ram_addr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l307_c7_eeac]
signal tmp16b_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l307_c7_eeac]
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l307_c7_eeac]
signal tmp12_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l307_c7_eeac]
signal is_last_blit_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l307_c7_eeac]
signal result_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l307_c7_eeac_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l307_c7_eeac_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l307_c7_eeac_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l307_c7_eeac]
signal y_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l307_c7_eeac]
signal screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l307_c7_eeac]
signal tmp4_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l307_c7_eeac]
signal is_blit_done_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l307_c7_eeac]
signal tmp16_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l307_c7_eeac]
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l307_c7_eeac]
signal x_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l307_c7_eeac]
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l307_c7_eeac]
signal auto_length_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l307_c7_eeac]
signal auto_advance_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l312_c11_c935]
signal BIN_OP_EQ_uxn_device_h_l312_c11_c935_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_c935_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l321_c1_3d5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l312_c7_1c96]
signal ram_addr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l312_c7_1c96]
signal tmp16b_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l312_c7_1c96]
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l312_c7_1c96]
signal tmp12_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l312_c7_1c96]
signal is_last_blit_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l312_c7_1c96]
signal result_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l312_c7_1c96_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l312_c7_1c96_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l312_c7_1c96_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l312_c7_1c96]
signal y_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l312_c7_1c96]
signal screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l312_c7_1c96]
signal tmp4_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l312_c7_1c96]
signal is_blit_done_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l312_c7_1c96]
signal tmp16_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l312_c7_1c96]
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l312_c7_1c96]
signal x_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l312_c7_1c96]
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l312_c7_1c96]
signal auto_length_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(3 downto 0);

-- auto_advance_MUX[uxn_device_h_l312_c7_1c96]
signal auto_advance_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l313_c3_563d]
signal BIN_OP_OR_uxn_device_h_l313_c3_563d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l313_c3_563d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l313_c3_563d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l322_c18_a813]
signal BIN_OP_EQ_uxn_device_h_l322_c18_a813_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l322_c18_a813_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l322_c18_a813_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l322_c18_9dcb]
signal MUX_uxn_device_h_l322_c18_9dcb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l322_c18_9dcb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l322_c18_9dcb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l322_c18_9dcb_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l324_c19_d566]
signal MUX_uxn_device_h_l324_c19_d566_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l324_c19_d566_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l324_c19_d566_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l324_c19_d566_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l325_c19_8f09]
signal MUX_uxn_device_h_l325_c19_8f09_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l325_c19_8f09_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l325_c19_8f09_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l325_c19_8f09_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l326_c39_4b72]
signal MUX_uxn_device_h_l326_c39_4b72_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l326_c39_4b72_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c39_4b72_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c39_4b72_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l326_c20_93e1]
signal MUX_uxn_device_h_l326_c20_93e1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l326_c20_93e1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c20_93e1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l326_c20_93e1_return_output : unsigned(15 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l372_c1_bed8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l327_c3_daaa]
signal ram_addr_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l327_c3_daaa]
signal tmp16b_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);

-- is_last_blit_MUX[uxn_device_h_l327_c3_daaa]
signal is_last_blit_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l327_c3_daaa]
signal result_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l327_c3_daaa_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l327_c3_daaa_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l327_c3_daaa_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l327_c3_daaa]
signal y_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l327_c3_daaa]
signal screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output : screen_blit_result_t;

-- tmp4_MUX[uxn_device_h_l327_c3_daaa]
signal tmp4_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_device_h_l327_c3_daaa]
signal tmp16_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l327_c3_daaa]
signal x_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l328_c8_fd31]
signal BIN_OP_EQ_uxn_device_h_l328_c8_fd31_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l328_c8_fd31_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l328_c4_f456]
signal ram_addr_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l328_c4_f456]
signal tmp16b_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l328_c4_f456]
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l328_c4_f456]
signal result_u8_value_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l328_c4_f456]
signal result_u16_addr_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l328_c4_f456]
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l328_c4_f456]
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l328_c4_f456]
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l328_c4_f456]
signal y_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l328_c4_f456]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l328_c4_f456]
signal tmp4_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_device_h_l328_c4_f456]
signal tmp16_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l328_c4_f456]
signal x_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l329_c23_7391]
signal BIN_OP_MINUS_uxn_device_h_l329_c23_7391_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l329_c23_7391_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l329_c23_7391_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l329_c49_5123]
signal BIN_OP_PLUS_uxn_device_h_l329_c49_5123_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l329_c49_5123_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l329_c49_5123_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l329_c13_d8bc]
signal MUX_uxn_device_h_l329_c13_d8bc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l329_c13_d8bc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c13_d8bc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c13_d8bc_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l330_c24_bb92]
signal BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l330_c51_e997]
signal BIN_OP_PLUS_uxn_device_h_l330_c51_e997_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l330_c51_e997_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l330_c51_e997_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l330_c14_592d]
signal MUX_uxn_device_h_l330_c14_592d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l330_c14_592d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l330_c14_592d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l330_c14_592d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l331_c36_a76e]
signal BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l331_c58_e2b2]
signal BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l331_c26_acb2]
signal MUX_uxn_device_h_l331_c26_acb2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l331_c26_acb2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c26_acb2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c26_acb2_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l331_c10_1821]
signal MUX_uxn_device_h_l331_c10_1821_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l331_c10_1821_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c10_1821_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l331_c10_1821_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l332_c36_5b2b]
signal BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l332_c58_37fd]
signal BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l332_c26_899b]
signal MUX_uxn_device_h_l332_c26_899b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l332_c26_899b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c26_899b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c26_899b_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l332_c10_a2f0]
signal MUX_uxn_device_h_l332_c10_a2f0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l332_c10_a2f0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c10_a2f0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c10_a2f0_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l337_c33_070d]
signal CONST_SR_8_uxn_device_h_l337_c33_070d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l337_c33_070d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l339_c22_0c0f]
signal BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l339_c13_f4ea]
signal BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l339_c9_2726]
signal ram_addr_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l339_c9_2726]
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l339_c9_2726]
signal result_u8_value_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l339_c9_2726]
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l339_c9_2726]
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(7 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l339_c9_2726]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l339_c9_2726]
signal tmp4_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(3 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l344_c22_0766]
signal BIN_OP_MINUS_uxn_device_h_l344_c22_0766_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l344_c22_0766_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l344_c22_0766_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l344_c13_7d3b]
signal BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l344_c9_4026]
signal ram_addr_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l344_c9_4026]
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l344_c9_4026]
signal result_u8_value_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l344_c9_4026]
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l344_c9_4026]
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(7 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l344_c9_4026]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l344_c9_4026]
signal tmp4_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_device_h_l347_c33_2061]
signal CONST_SR_8_uxn_device_h_l347_c33_2061_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l347_c33_2061_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l349_c22_68cc]
signal BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l349_c13_a6cc]
signal BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l349_c9_1573]
signal ram_addr_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l349_c9_1573]
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l349_c9_1573]
signal result_u8_value_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l349_c9_1573]
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l349_c9_1573]
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(7 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l349_c9_1573]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l349_c9_1573]
signal tmp4_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(3 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l354_c22_cbfc]
signal BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l354_c13_a61e]
signal BIN_OP_EQ_uxn_device_h_l354_c13_a61e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l354_c13_a61e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l354_c9_2ecf]
signal ram_addr_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l354_c9_2ecf]
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l354_c9_2ecf]
signal result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l354_c9_2ecf]
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l354_c9_2ecf]
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(7 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l354_c9_2ecf]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l354_c9_2ecf]
signal tmp4_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l355_c5_0f61]
signal BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l358_c33_73b0]
signal CONST_SR_8_uxn_device_h_l358_c33_73b0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l358_c33_73b0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l360_c22_ba25]
signal BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l360_c13_fb96]
signal BIN_OP_EQ_uxn_device_h_l360_c13_fb96_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l360_c13_fb96_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l360_c9_858b]
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l360_c9_858b]
signal result_u8_value_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l360_c9_858b]
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l360_c9_858b]
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(7 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l360_c9_858b]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l360_c9_858b]
signal tmp4_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(3 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l365_c22_4a0c]
signal BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l365_c13_6917]
signal BIN_OP_EQ_uxn_device_h_l365_c13_6917_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l365_c13_6917_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l365_c9_0b35]
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l365_c9_0b35]
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l365_c9_0b35]
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(7 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l365_c9_0b35]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l365_c9_0b35]
signal tmp4_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l366_c5_a455]
signal BIN_OP_PLUS_uxn_device_h_l366_c5_a455_left : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l366_c5_a455_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l366_c5_a455_return_output : unsigned(4 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l373_c1_2f46]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_a6ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l373_c4_c94e]
signal screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output : screen_blit_result_t;

-- screen_2bpp[uxn_device_h_l374_c26_e332]
signal screen_2bpp_uxn_device_h_l374_c26_e332_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_phase : unsigned(11 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_x1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_y1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_color : unsigned(3 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_fx : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_fy : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_ram_addr : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_previous_ram_read : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l374_c26_e332_return_output : screen_blit_result_t;

-- screen_1bpp[uxn_device_h_l376_c26_636b]
signal screen_1bpp_uxn_device_h_l376_c26_636b_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_phase : unsigned(11 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_x1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_y1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_color : unsigned(3 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_fx : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_fy : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_ram_addr : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_previous_ram_read : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l376_c26_636b_return_output : screen_blit_result_t;

-- BIN_OP_EQ[uxn_device_h_l385_c19_c70b]
signal BIN_OP_EQ_uxn_device_h_l385_c19_c70b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l385_c19_c70b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l385_c19_c70b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l385_c19_c122]
signal MUX_uxn_device_h_l385_c19_c122_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l385_c19_c122_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l385_c19_c122_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l385_c19_c122_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_device_h_l388_c11_ec0e]
signal BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l388_c60_833e]
signal BIN_OP_PLUS_uxn_device_h_l388_c60_833e_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l388_c60_833e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l388_c60_833e_return_output : unsigned(12 downto 0);

-- MUX[uxn_device_h_l388_c11_7375]
signal MUX_uxn_device_h_l388_c11_7375_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c11_7375_iftrue : unsigned(11 downto 0);
signal MUX_uxn_device_h_l388_c11_7375_iffalse : unsigned(11 downto 0);
signal MUX_uxn_device_h_l388_c11_7375_return_output : unsigned(11 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0
signal CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output : unsigned(11 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_39a7( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.device_ram_address := ref_toks_6;

      return_output := base;
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
-- BIN_OP_EQ_uxn_device_h_l270_c6_1727
BIN_OP_EQ_uxn_device_h_l270_c6_1727 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l270_c6_1727_left,
BIN_OP_EQ_uxn_device_h_l270_c6_1727_right,
BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_return_output);

-- flip_y_MUX_uxn_device_h_l270_c2_c6b9
flip_y_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l270_c2_c6b9_cond,
flip_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
flip_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
flip_y_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- ram_addr_MUX_uxn_device_h_l270_c2_c6b9
ram_addr_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l270_c2_c6b9_cond,
ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
ram_addr_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- flip_x_MUX_uxn_device_h_l270_c2_c6b9
flip_x_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l270_c2_c6b9_cond,
flip_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
flip_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
flip_x_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- tmp16b_MUX_uxn_device_h_l270_c2_c6b9
tmp16b_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l270_c2_c6b9_cond,
tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
tmp16b_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9
ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_cond,
ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- tmp12_MUX_uxn_device_h_l270_c2_c6b9
tmp12_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l270_c2_c6b9_cond,
tmp12_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
tmp12_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
tmp12_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9
ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_cond,
ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- is_last_blit_MUX_uxn_device_h_l270_c2_c6b9
is_last_blit_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_cond,
is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- result_MUX_uxn_device_h_l270_c2_c6b9
result_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l270_c2_c6b9_cond,
result_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
result_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
result_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- y_MUX_uxn_device_h_l270_c2_c6b9
y_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l270_c2_c6b9_cond,
y_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
y_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
y_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- color_MUX_uxn_device_h_l270_c2_c6b9
color_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l270_c2_c6b9_cond,
color_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
color_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
color_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9
screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_cond,
screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- tmp4_MUX_uxn_device_h_l270_c2_c6b9
tmp4_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l270_c2_c6b9_cond,
tmp4_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
tmp4_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
tmp4_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- is_blit_done_MUX_uxn_device_h_l270_c2_c6b9
is_blit_done_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_cond,
is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- layer_MUX_uxn_device_h_l270_c2_c6b9
layer_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l270_c2_c6b9_cond,
layer_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
layer_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
layer_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- tmp16_MUX_uxn_device_h_l270_c2_c6b9
tmp16_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l270_c2_c6b9_cond,
tmp16_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
tmp16_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
tmp16_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- ctrl_MUX_uxn_device_h_l270_c2_c6b9
ctrl_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l270_c2_c6b9_cond,
ctrl_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
ctrl_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
ctrl_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9
x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond,
x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- x_MUX_uxn_device_h_l270_c2_c6b9
x_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l270_c2_c6b9_cond,
x_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
x_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
x_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9
y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond,
y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- auto_length_MUX_uxn_device_h_l270_c2_c6b9
auto_length_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l270_c2_c6b9_cond,
auto_length_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
auto_length_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
auto_length_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- auto_advance_MUX_uxn_device_h_l270_c2_c6b9
auto_advance_MUX_uxn_device_h_l270_c2_c6b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l270_c2_c6b9_cond,
auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iftrue,
auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iffalse,
auto_advance_MUX_uxn_device_h_l270_c2_c6b9_return_output);

-- BIN_OP_EQ_uxn_device_h_l277_c11_acea
BIN_OP_EQ_uxn_device_h_l277_c11_acea : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l277_c11_acea_left,
BIN_OP_EQ_uxn_device_h_l277_c11_acea_right,
BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- flip_y_MUX_uxn_device_h_l277_c7_b744
flip_y_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l277_c7_b744_cond,
flip_y_MUX_uxn_device_h_l277_c7_b744_iftrue,
flip_y_MUX_uxn_device_h_l277_c7_b744_iffalse,
flip_y_MUX_uxn_device_h_l277_c7_b744_return_output);

-- ram_addr_MUX_uxn_device_h_l277_c7_b744
ram_addr_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l277_c7_b744_cond,
ram_addr_MUX_uxn_device_h_l277_c7_b744_iftrue,
ram_addr_MUX_uxn_device_h_l277_c7_b744_iffalse,
ram_addr_MUX_uxn_device_h_l277_c7_b744_return_output);

-- flip_x_MUX_uxn_device_h_l277_c7_b744
flip_x_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l277_c7_b744_cond,
flip_x_MUX_uxn_device_h_l277_c7_b744_iftrue,
flip_x_MUX_uxn_device_h_l277_c7_b744_iffalse,
flip_x_MUX_uxn_device_h_l277_c7_b744_return_output);

-- tmp16b_MUX_uxn_device_h_l277_c7_b744
tmp16b_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l277_c7_b744_cond,
tmp16b_MUX_uxn_device_h_l277_c7_b744_iftrue,
tmp16b_MUX_uxn_device_h_l277_c7_b744_iffalse,
tmp16b_MUX_uxn_device_h_l277_c7_b744_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l277_c7_b744
ram_addr_incr_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_cond,
ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iftrue,
ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iffalse,
ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_return_output);

-- tmp12_MUX_uxn_device_h_l277_c7_b744
tmp12_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l277_c7_b744_cond,
tmp12_MUX_uxn_device_h_l277_c7_b744_iftrue,
tmp12_MUX_uxn_device_h_l277_c7_b744_iffalse,
tmp12_MUX_uxn_device_h_l277_c7_b744_return_output);

-- ctrl_mode_MUX_uxn_device_h_l277_c7_b744
ctrl_mode_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l277_c7_b744_cond,
ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iftrue,
ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iffalse,
ctrl_mode_MUX_uxn_device_h_l277_c7_b744_return_output);

-- is_last_blit_MUX_uxn_device_h_l277_c7_b744
is_last_blit_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l277_c7_b744_cond,
is_last_blit_MUX_uxn_device_h_l277_c7_b744_iftrue,
is_last_blit_MUX_uxn_device_h_l277_c7_b744_iffalse,
is_last_blit_MUX_uxn_device_h_l277_c7_b744_return_output);

-- result_MUX_uxn_device_h_l277_c7_b744
result_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l277_c7_b744_cond,
result_MUX_uxn_device_h_l277_c7_b744_iftrue,
result_MUX_uxn_device_h_l277_c7_b744_iffalse,
result_MUX_uxn_device_h_l277_c7_b744_return_output);

-- y_MUX_uxn_device_h_l277_c7_b744
y_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l277_c7_b744_cond,
y_MUX_uxn_device_h_l277_c7_b744_iftrue,
y_MUX_uxn_device_h_l277_c7_b744_iffalse,
y_MUX_uxn_device_h_l277_c7_b744_return_output);

-- color_MUX_uxn_device_h_l277_c7_b744
color_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l277_c7_b744_cond,
color_MUX_uxn_device_h_l277_c7_b744_iftrue,
color_MUX_uxn_device_h_l277_c7_b744_iffalse,
color_MUX_uxn_device_h_l277_c7_b744_return_output);

-- screen_blit_result_MUX_uxn_device_h_l277_c7_b744
screen_blit_result_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l277_c7_b744_cond,
screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iftrue,
screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iffalse,
screen_blit_result_MUX_uxn_device_h_l277_c7_b744_return_output);

-- tmp4_MUX_uxn_device_h_l277_c7_b744
tmp4_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l277_c7_b744_cond,
tmp4_MUX_uxn_device_h_l277_c7_b744_iftrue,
tmp4_MUX_uxn_device_h_l277_c7_b744_iffalse,
tmp4_MUX_uxn_device_h_l277_c7_b744_return_output);

-- is_blit_done_MUX_uxn_device_h_l277_c7_b744
is_blit_done_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l277_c7_b744_cond,
is_blit_done_MUX_uxn_device_h_l277_c7_b744_iftrue,
is_blit_done_MUX_uxn_device_h_l277_c7_b744_iffalse,
is_blit_done_MUX_uxn_device_h_l277_c7_b744_return_output);

-- layer_MUX_uxn_device_h_l277_c7_b744
layer_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l277_c7_b744_cond,
layer_MUX_uxn_device_h_l277_c7_b744_iftrue,
layer_MUX_uxn_device_h_l277_c7_b744_iffalse,
layer_MUX_uxn_device_h_l277_c7_b744_return_output);

-- tmp16_MUX_uxn_device_h_l277_c7_b744
tmp16_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l277_c7_b744_cond,
tmp16_MUX_uxn_device_h_l277_c7_b744_iftrue,
tmp16_MUX_uxn_device_h_l277_c7_b744_iffalse,
tmp16_MUX_uxn_device_h_l277_c7_b744_return_output);

-- ctrl_MUX_uxn_device_h_l277_c7_b744
ctrl_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l277_c7_b744_cond,
ctrl_MUX_uxn_device_h_l277_c7_b744_iftrue,
ctrl_MUX_uxn_device_h_l277_c7_b744_iffalse,
ctrl_MUX_uxn_device_h_l277_c7_b744_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l277_c7_b744
x_sprite_incr_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond,
x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue,
x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse,
x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output);

-- x_MUX_uxn_device_h_l277_c7_b744
x_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l277_c7_b744_cond,
x_MUX_uxn_device_h_l277_c7_b744_iftrue,
x_MUX_uxn_device_h_l277_c7_b744_iffalse,
x_MUX_uxn_device_h_l277_c7_b744_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l277_c7_b744
y_sprite_incr_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond,
y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue,
y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse,
y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output);

-- auto_length_MUX_uxn_device_h_l277_c7_b744
auto_length_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l277_c7_b744_cond,
auto_length_MUX_uxn_device_h_l277_c7_b744_iftrue,
auto_length_MUX_uxn_device_h_l277_c7_b744_iffalse,
auto_length_MUX_uxn_device_h_l277_c7_b744_return_output);

-- auto_advance_MUX_uxn_device_h_l277_c7_b744
auto_advance_MUX_uxn_device_h_l277_c7_b744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l277_c7_b744_cond,
auto_advance_MUX_uxn_device_h_l277_c7_b744_iftrue,
auto_advance_MUX_uxn_device_h_l277_c7_b744_iffalse,
auto_advance_MUX_uxn_device_h_l277_c7_b744_return_output);

-- BIN_OP_EQ_uxn_device_h_l280_c11_f982
BIN_OP_EQ_uxn_device_h_l280_c11_f982 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l280_c11_f982_left,
BIN_OP_EQ_uxn_device_h_l280_c11_f982_right,
BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- flip_y_MUX_uxn_device_h_l280_c7_4b5a
flip_y_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l280_c7_4b5a_cond,
flip_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
flip_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
flip_y_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- ram_addr_MUX_uxn_device_h_l280_c7_4b5a
ram_addr_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l280_c7_4b5a_cond,
ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
ram_addr_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- flip_x_MUX_uxn_device_h_l280_c7_4b5a
flip_x_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l280_c7_4b5a_cond,
flip_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
flip_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
flip_x_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- tmp16b_MUX_uxn_device_h_l280_c7_4b5a
tmp16b_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l280_c7_4b5a_cond,
tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
tmp16b_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a
ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_cond,
ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- tmp12_MUX_uxn_device_h_l280_c7_4b5a
tmp12_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l280_c7_4b5a_cond,
tmp12_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
tmp12_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
tmp12_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a
ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_cond,
ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- is_last_blit_MUX_uxn_device_h_l280_c7_4b5a
is_last_blit_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_cond,
is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- result_MUX_uxn_device_h_l280_c7_4b5a
result_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l280_c7_4b5a_cond,
result_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
result_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
result_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- y_MUX_uxn_device_h_l280_c7_4b5a
y_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l280_c7_4b5a_cond,
y_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
y_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
y_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- color_MUX_uxn_device_h_l280_c7_4b5a
color_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l280_c7_4b5a_cond,
color_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
color_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
color_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a
screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_cond,
screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- tmp4_MUX_uxn_device_h_l280_c7_4b5a
tmp4_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l280_c7_4b5a_cond,
tmp4_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
tmp4_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
tmp4_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- is_blit_done_MUX_uxn_device_h_l280_c7_4b5a
is_blit_done_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_cond,
is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- layer_MUX_uxn_device_h_l280_c7_4b5a
layer_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l280_c7_4b5a_cond,
layer_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
layer_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
layer_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- tmp16_MUX_uxn_device_h_l280_c7_4b5a
tmp16_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l280_c7_4b5a_cond,
tmp16_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
tmp16_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
tmp16_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- ctrl_MUX_uxn_device_h_l280_c7_4b5a
ctrl_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l280_c7_4b5a_cond,
ctrl_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
ctrl_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
ctrl_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a
x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond,
x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- x_MUX_uxn_device_h_l280_c7_4b5a
x_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l280_c7_4b5a_cond,
x_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
x_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
x_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a
y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond,
y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- auto_length_MUX_uxn_device_h_l280_c7_4b5a
auto_length_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l280_c7_4b5a_cond,
auto_length_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
auto_length_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
auto_length_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- auto_advance_MUX_uxn_device_h_l280_c7_4b5a
auto_advance_MUX_uxn_device_h_l280_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l280_c7_4b5a_cond,
auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iftrue,
auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iffalse,
auto_advance_MUX_uxn_device_h_l280_c7_4b5a_return_output);

-- BIN_OP_EQ_uxn_device_h_l285_c11_5494
BIN_OP_EQ_uxn_device_h_l285_c11_5494 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l285_c11_5494_left,
BIN_OP_EQ_uxn_device_h_l285_c11_5494_right,
BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- flip_y_MUX_uxn_device_h_l285_c7_5ad9
flip_y_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l285_c7_5ad9_cond,
flip_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
flip_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
flip_y_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- ram_addr_MUX_uxn_device_h_l285_c7_5ad9
ram_addr_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l285_c7_5ad9_cond,
ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
ram_addr_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- flip_x_MUX_uxn_device_h_l285_c7_5ad9
flip_x_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l285_c7_5ad9_cond,
flip_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
flip_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
flip_x_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- tmp16b_MUX_uxn_device_h_l285_c7_5ad9
tmp16b_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l285_c7_5ad9_cond,
tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
tmp16b_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9
ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_cond,
ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- tmp12_MUX_uxn_device_h_l285_c7_5ad9
tmp12_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l285_c7_5ad9_cond,
tmp12_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
tmp12_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
tmp12_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9
ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_cond,
ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- is_last_blit_MUX_uxn_device_h_l285_c7_5ad9
is_last_blit_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_cond,
is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- result_MUX_uxn_device_h_l285_c7_5ad9
result_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l285_c7_5ad9_cond,
result_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
result_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
result_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- y_MUX_uxn_device_h_l285_c7_5ad9
y_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l285_c7_5ad9_cond,
y_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
y_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
y_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- color_MUX_uxn_device_h_l285_c7_5ad9
color_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l285_c7_5ad9_cond,
color_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
color_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
color_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9
screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_cond,
screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- tmp4_MUX_uxn_device_h_l285_c7_5ad9
tmp4_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l285_c7_5ad9_cond,
tmp4_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
tmp4_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
tmp4_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- is_blit_done_MUX_uxn_device_h_l285_c7_5ad9
is_blit_done_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_cond,
is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- layer_MUX_uxn_device_h_l285_c7_5ad9
layer_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l285_c7_5ad9_cond,
layer_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
layer_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
layer_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- tmp16_MUX_uxn_device_h_l285_c7_5ad9
tmp16_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l285_c7_5ad9_cond,
tmp16_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
tmp16_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
tmp16_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- ctrl_MUX_uxn_device_h_l285_c7_5ad9
ctrl_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l285_c7_5ad9_cond,
ctrl_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
ctrl_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
ctrl_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9
x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond,
x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- x_MUX_uxn_device_h_l285_c7_5ad9
x_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l285_c7_5ad9_cond,
x_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
x_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
x_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9
y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond,
y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- auto_length_MUX_uxn_device_h_l285_c7_5ad9
auto_length_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l285_c7_5ad9_cond,
auto_length_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
auto_length_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
auto_length_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- auto_advance_MUX_uxn_device_h_l285_c7_5ad9
auto_advance_MUX_uxn_device_h_l285_c7_5ad9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l285_c7_5ad9_cond,
auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iftrue,
auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iffalse,
auto_advance_MUX_uxn_device_h_l285_c7_5ad9_return_output);

-- BIN_OP_OR_uxn_device_h_l286_c3_88db
BIN_OP_OR_uxn_device_h_l286_c3_88db : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l286_c3_88db_left,
BIN_OP_OR_uxn_device_h_l286_c3_88db_right,
BIN_OP_OR_uxn_device_h_l286_c3_88db_return_output);

-- BIN_OP_EQ_uxn_device_h_l289_c11_0c80
BIN_OP_EQ_uxn_device_h_l289_c11_0c80 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l289_c11_0c80_left,
BIN_OP_EQ_uxn_device_h_l289_c11_0c80_right,
BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_return_output);

-- flip_y_MUX_uxn_device_h_l289_c7_66c7
flip_y_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l289_c7_66c7_cond,
flip_y_MUX_uxn_device_h_l289_c7_66c7_iftrue,
flip_y_MUX_uxn_device_h_l289_c7_66c7_iffalse,
flip_y_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- ram_addr_MUX_uxn_device_h_l289_c7_66c7
ram_addr_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l289_c7_66c7_cond,
ram_addr_MUX_uxn_device_h_l289_c7_66c7_iftrue,
ram_addr_MUX_uxn_device_h_l289_c7_66c7_iffalse,
ram_addr_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- flip_x_MUX_uxn_device_h_l289_c7_66c7
flip_x_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l289_c7_66c7_cond,
flip_x_MUX_uxn_device_h_l289_c7_66c7_iftrue,
flip_x_MUX_uxn_device_h_l289_c7_66c7_iffalse,
flip_x_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- tmp16b_MUX_uxn_device_h_l289_c7_66c7
tmp16b_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l289_c7_66c7_cond,
tmp16b_MUX_uxn_device_h_l289_c7_66c7_iftrue,
tmp16b_MUX_uxn_device_h_l289_c7_66c7_iffalse,
tmp16b_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7
ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_cond,
ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue,
ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse,
ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- tmp12_MUX_uxn_device_h_l289_c7_66c7
tmp12_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l289_c7_66c7_cond,
tmp12_MUX_uxn_device_h_l289_c7_66c7_iftrue,
tmp12_MUX_uxn_device_h_l289_c7_66c7_iffalse,
tmp12_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- ctrl_mode_MUX_uxn_device_h_l289_c7_66c7
ctrl_mode_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_cond,
ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iftrue,
ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iffalse,
ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- is_last_blit_MUX_uxn_device_h_l289_c7_66c7
is_last_blit_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l289_c7_66c7_cond,
is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iftrue,
is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iffalse,
is_last_blit_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- result_MUX_uxn_device_h_l289_c7_66c7
result_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l289_c7_66c7_cond,
result_MUX_uxn_device_h_l289_c7_66c7_iftrue,
result_MUX_uxn_device_h_l289_c7_66c7_iffalse,
result_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- y_MUX_uxn_device_h_l289_c7_66c7
y_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l289_c7_66c7_cond,
y_MUX_uxn_device_h_l289_c7_66c7_iftrue,
y_MUX_uxn_device_h_l289_c7_66c7_iffalse,
y_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- color_MUX_uxn_device_h_l289_c7_66c7
color_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l289_c7_66c7_cond,
color_MUX_uxn_device_h_l289_c7_66c7_iftrue,
color_MUX_uxn_device_h_l289_c7_66c7_iffalse,
color_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- screen_blit_result_MUX_uxn_device_h_l289_c7_66c7
screen_blit_result_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_cond,
screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iftrue,
screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iffalse,
screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- tmp4_MUX_uxn_device_h_l289_c7_66c7
tmp4_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l289_c7_66c7_cond,
tmp4_MUX_uxn_device_h_l289_c7_66c7_iftrue,
tmp4_MUX_uxn_device_h_l289_c7_66c7_iffalse,
tmp4_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- is_blit_done_MUX_uxn_device_h_l289_c7_66c7
is_blit_done_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l289_c7_66c7_cond,
is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iftrue,
is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iffalse,
is_blit_done_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- layer_MUX_uxn_device_h_l289_c7_66c7
layer_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l289_c7_66c7_cond,
layer_MUX_uxn_device_h_l289_c7_66c7_iftrue,
layer_MUX_uxn_device_h_l289_c7_66c7_iffalse,
layer_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- tmp16_MUX_uxn_device_h_l289_c7_66c7
tmp16_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l289_c7_66c7_cond,
tmp16_MUX_uxn_device_h_l289_c7_66c7_iftrue,
tmp16_MUX_uxn_device_h_l289_c7_66c7_iffalse,
tmp16_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- ctrl_MUX_uxn_device_h_l289_c7_66c7
ctrl_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l289_c7_66c7_cond,
ctrl_MUX_uxn_device_h_l289_c7_66c7_iftrue,
ctrl_MUX_uxn_device_h_l289_c7_66c7_iffalse,
ctrl_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7
x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond,
x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue,
x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse,
x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- x_MUX_uxn_device_h_l289_c7_66c7
x_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l289_c7_66c7_cond,
x_MUX_uxn_device_h_l289_c7_66c7_iftrue,
x_MUX_uxn_device_h_l289_c7_66c7_iffalse,
x_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7
y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond,
y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue,
y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse,
y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- auto_length_MUX_uxn_device_h_l289_c7_66c7
auto_length_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l289_c7_66c7_cond,
auto_length_MUX_uxn_device_h_l289_c7_66c7_iftrue,
auto_length_MUX_uxn_device_h_l289_c7_66c7_iffalse,
auto_length_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- auto_advance_MUX_uxn_device_h_l289_c7_66c7
auto_advance_MUX_uxn_device_h_l289_c7_66c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l289_c7_66c7_cond,
auto_advance_MUX_uxn_device_h_l289_c7_66c7_iftrue,
auto_advance_MUX_uxn_device_h_l289_c7_66c7_iffalse,
auto_advance_MUX_uxn_device_h_l289_c7_66c7_return_output);

-- BIN_OP_EQ_uxn_device_h_l294_c11_1dc9
BIN_OP_EQ_uxn_device_h_l294_c11_1dc9 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_left,
BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_right,
BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- flip_y_MUX_uxn_device_h_l294_c7_3246
flip_y_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l294_c7_3246_cond,
flip_y_MUX_uxn_device_h_l294_c7_3246_iftrue,
flip_y_MUX_uxn_device_h_l294_c7_3246_iffalse,
flip_y_MUX_uxn_device_h_l294_c7_3246_return_output);

-- ram_addr_MUX_uxn_device_h_l294_c7_3246
ram_addr_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l294_c7_3246_cond,
ram_addr_MUX_uxn_device_h_l294_c7_3246_iftrue,
ram_addr_MUX_uxn_device_h_l294_c7_3246_iffalse,
ram_addr_MUX_uxn_device_h_l294_c7_3246_return_output);

-- flip_x_MUX_uxn_device_h_l294_c7_3246
flip_x_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l294_c7_3246_cond,
flip_x_MUX_uxn_device_h_l294_c7_3246_iftrue,
flip_x_MUX_uxn_device_h_l294_c7_3246_iffalse,
flip_x_MUX_uxn_device_h_l294_c7_3246_return_output);

-- tmp16b_MUX_uxn_device_h_l294_c7_3246
tmp16b_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l294_c7_3246_cond,
tmp16b_MUX_uxn_device_h_l294_c7_3246_iftrue,
tmp16b_MUX_uxn_device_h_l294_c7_3246_iffalse,
tmp16b_MUX_uxn_device_h_l294_c7_3246_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l294_c7_3246
ram_addr_incr_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_cond,
ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iftrue,
ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iffalse,
ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_return_output);

-- tmp12_MUX_uxn_device_h_l294_c7_3246
tmp12_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l294_c7_3246_cond,
tmp12_MUX_uxn_device_h_l294_c7_3246_iftrue,
tmp12_MUX_uxn_device_h_l294_c7_3246_iffalse,
tmp12_MUX_uxn_device_h_l294_c7_3246_return_output);

-- ctrl_mode_MUX_uxn_device_h_l294_c7_3246
ctrl_mode_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l294_c7_3246_cond,
ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iftrue,
ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iffalse,
ctrl_mode_MUX_uxn_device_h_l294_c7_3246_return_output);

-- is_last_blit_MUX_uxn_device_h_l294_c7_3246
is_last_blit_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l294_c7_3246_cond,
is_last_blit_MUX_uxn_device_h_l294_c7_3246_iftrue,
is_last_blit_MUX_uxn_device_h_l294_c7_3246_iffalse,
is_last_blit_MUX_uxn_device_h_l294_c7_3246_return_output);

-- result_MUX_uxn_device_h_l294_c7_3246
result_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l294_c7_3246_cond,
result_MUX_uxn_device_h_l294_c7_3246_iftrue,
result_MUX_uxn_device_h_l294_c7_3246_iffalse,
result_MUX_uxn_device_h_l294_c7_3246_return_output);

-- y_MUX_uxn_device_h_l294_c7_3246
y_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l294_c7_3246_cond,
y_MUX_uxn_device_h_l294_c7_3246_iftrue,
y_MUX_uxn_device_h_l294_c7_3246_iffalse,
y_MUX_uxn_device_h_l294_c7_3246_return_output);

-- color_MUX_uxn_device_h_l294_c7_3246
color_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l294_c7_3246_cond,
color_MUX_uxn_device_h_l294_c7_3246_iftrue,
color_MUX_uxn_device_h_l294_c7_3246_iffalse,
color_MUX_uxn_device_h_l294_c7_3246_return_output);

-- screen_blit_result_MUX_uxn_device_h_l294_c7_3246
screen_blit_result_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l294_c7_3246_cond,
screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iftrue,
screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iffalse,
screen_blit_result_MUX_uxn_device_h_l294_c7_3246_return_output);

-- tmp4_MUX_uxn_device_h_l294_c7_3246
tmp4_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l294_c7_3246_cond,
tmp4_MUX_uxn_device_h_l294_c7_3246_iftrue,
tmp4_MUX_uxn_device_h_l294_c7_3246_iffalse,
tmp4_MUX_uxn_device_h_l294_c7_3246_return_output);

-- is_blit_done_MUX_uxn_device_h_l294_c7_3246
is_blit_done_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l294_c7_3246_cond,
is_blit_done_MUX_uxn_device_h_l294_c7_3246_iftrue,
is_blit_done_MUX_uxn_device_h_l294_c7_3246_iffalse,
is_blit_done_MUX_uxn_device_h_l294_c7_3246_return_output);

-- layer_MUX_uxn_device_h_l294_c7_3246
layer_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l294_c7_3246_cond,
layer_MUX_uxn_device_h_l294_c7_3246_iftrue,
layer_MUX_uxn_device_h_l294_c7_3246_iffalse,
layer_MUX_uxn_device_h_l294_c7_3246_return_output);

-- tmp16_MUX_uxn_device_h_l294_c7_3246
tmp16_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l294_c7_3246_cond,
tmp16_MUX_uxn_device_h_l294_c7_3246_iftrue,
tmp16_MUX_uxn_device_h_l294_c7_3246_iffalse,
tmp16_MUX_uxn_device_h_l294_c7_3246_return_output);

-- ctrl_MUX_uxn_device_h_l294_c7_3246
ctrl_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l294_c7_3246_cond,
ctrl_MUX_uxn_device_h_l294_c7_3246_iftrue,
ctrl_MUX_uxn_device_h_l294_c7_3246_iffalse,
ctrl_MUX_uxn_device_h_l294_c7_3246_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l294_c7_3246
x_sprite_incr_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond,
x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue,
x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse,
x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output);

-- x_MUX_uxn_device_h_l294_c7_3246
x_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l294_c7_3246_cond,
x_MUX_uxn_device_h_l294_c7_3246_iftrue,
x_MUX_uxn_device_h_l294_c7_3246_iffalse,
x_MUX_uxn_device_h_l294_c7_3246_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l294_c7_3246
y_sprite_incr_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond,
y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue,
y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse,
y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output);

-- auto_length_MUX_uxn_device_h_l294_c7_3246
auto_length_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l294_c7_3246_cond,
auto_length_MUX_uxn_device_h_l294_c7_3246_iftrue,
auto_length_MUX_uxn_device_h_l294_c7_3246_iffalse,
auto_length_MUX_uxn_device_h_l294_c7_3246_return_output);

-- auto_advance_MUX_uxn_device_h_l294_c7_3246
auto_advance_MUX_uxn_device_h_l294_c7_3246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l294_c7_3246_cond,
auto_advance_MUX_uxn_device_h_l294_c7_3246_iftrue,
auto_advance_MUX_uxn_device_h_l294_c7_3246_iffalse,
auto_advance_MUX_uxn_device_h_l294_c7_3246_return_output);

-- BIN_OP_OR_uxn_device_h_l295_c3_3e63
BIN_OP_OR_uxn_device_h_l295_c3_3e63 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l295_c3_3e63_left,
BIN_OP_OR_uxn_device_h_l295_c3_3e63_right,
BIN_OP_OR_uxn_device_h_l295_c3_3e63_return_output);

-- BIN_OP_EQ_uxn_device_h_l298_c11_be6b
BIN_OP_EQ_uxn_device_h_l298_c11_be6b : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l298_c11_be6b_left,
BIN_OP_EQ_uxn_device_h_l298_c11_be6b_right,
BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- flip_y_MUX_uxn_device_h_l298_c7_acf2
flip_y_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l298_c7_acf2_cond,
flip_y_MUX_uxn_device_h_l298_c7_acf2_iftrue,
flip_y_MUX_uxn_device_h_l298_c7_acf2_iffalse,
flip_y_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- ram_addr_MUX_uxn_device_h_l298_c7_acf2
ram_addr_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l298_c7_acf2_cond,
ram_addr_MUX_uxn_device_h_l298_c7_acf2_iftrue,
ram_addr_MUX_uxn_device_h_l298_c7_acf2_iffalse,
ram_addr_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- flip_x_MUX_uxn_device_h_l298_c7_acf2
flip_x_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l298_c7_acf2_cond,
flip_x_MUX_uxn_device_h_l298_c7_acf2_iftrue,
flip_x_MUX_uxn_device_h_l298_c7_acf2_iffalse,
flip_x_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- tmp16b_MUX_uxn_device_h_l298_c7_acf2
tmp16b_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l298_c7_acf2_cond,
tmp16b_MUX_uxn_device_h_l298_c7_acf2_iftrue,
tmp16b_MUX_uxn_device_h_l298_c7_acf2_iffalse,
tmp16b_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2
ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_cond,
ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue,
ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse,
ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- tmp12_MUX_uxn_device_h_l298_c7_acf2
tmp12_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l298_c7_acf2_cond,
tmp12_MUX_uxn_device_h_l298_c7_acf2_iftrue,
tmp12_MUX_uxn_device_h_l298_c7_acf2_iffalse,
tmp12_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- ctrl_mode_MUX_uxn_device_h_l298_c7_acf2
ctrl_mode_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_cond,
ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iftrue,
ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iffalse,
ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- is_last_blit_MUX_uxn_device_h_l298_c7_acf2
is_last_blit_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l298_c7_acf2_cond,
is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iftrue,
is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iffalse,
is_last_blit_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- result_MUX_uxn_device_h_l298_c7_acf2
result_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l298_c7_acf2_cond,
result_MUX_uxn_device_h_l298_c7_acf2_iftrue,
result_MUX_uxn_device_h_l298_c7_acf2_iffalse,
result_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- y_MUX_uxn_device_h_l298_c7_acf2
y_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l298_c7_acf2_cond,
y_MUX_uxn_device_h_l298_c7_acf2_iftrue,
y_MUX_uxn_device_h_l298_c7_acf2_iffalse,
y_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- color_MUX_uxn_device_h_l298_c7_acf2
color_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l298_c7_acf2_cond,
color_MUX_uxn_device_h_l298_c7_acf2_iftrue,
color_MUX_uxn_device_h_l298_c7_acf2_iffalse,
color_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- screen_blit_result_MUX_uxn_device_h_l298_c7_acf2
screen_blit_result_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_cond,
screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iftrue,
screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iffalse,
screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- tmp4_MUX_uxn_device_h_l298_c7_acf2
tmp4_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l298_c7_acf2_cond,
tmp4_MUX_uxn_device_h_l298_c7_acf2_iftrue,
tmp4_MUX_uxn_device_h_l298_c7_acf2_iffalse,
tmp4_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- is_blit_done_MUX_uxn_device_h_l298_c7_acf2
is_blit_done_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l298_c7_acf2_cond,
is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iftrue,
is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iffalse,
is_blit_done_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- layer_MUX_uxn_device_h_l298_c7_acf2
layer_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l298_c7_acf2_cond,
layer_MUX_uxn_device_h_l298_c7_acf2_iftrue,
layer_MUX_uxn_device_h_l298_c7_acf2_iffalse,
layer_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- tmp16_MUX_uxn_device_h_l298_c7_acf2
tmp16_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l298_c7_acf2_cond,
tmp16_MUX_uxn_device_h_l298_c7_acf2_iftrue,
tmp16_MUX_uxn_device_h_l298_c7_acf2_iffalse,
tmp16_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- ctrl_MUX_uxn_device_h_l298_c7_acf2
ctrl_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l298_c7_acf2_cond,
ctrl_MUX_uxn_device_h_l298_c7_acf2_iftrue,
ctrl_MUX_uxn_device_h_l298_c7_acf2_iffalse,
ctrl_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2
x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond,
x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue,
x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse,
x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- x_MUX_uxn_device_h_l298_c7_acf2
x_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l298_c7_acf2_cond,
x_MUX_uxn_device_h_l298_c7_acf2_iftrue,
x_MUX_uxn_device_h_l298_c7_acf2_iffalse,
x_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2
y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond,
y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue,
y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse,
y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- auto_length_MUX_uxn_device_h_l298_c7_acf2
auto_length_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l298_c7_acf2_cond,
auto_length_MUX_uxn_device_h_l298_c7_acf2_iftrue,
auto_length_MUX_uxn_device_h_l298_c7_acf2_iffalse,
auto_length_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- auto_advance_MUX_uxn_device_h_l298_c7_acf2
auto_advance_MUX_uxn_device_h_l298_c7_acf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l298_c7_acf2_cond,
auto_advance_MUX_uxn_device_h_l298_c7_acf2_iftrue,
auto_advance_MUX_uxn_device_h_l298_c7_acf2_iffalse,
auto_advance_MUX_uxn_device_h_l298_c7_acf2_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c11_e458
BIN_OP_EQ_uxn_device_h_l307_c11_e458 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c11_e458_left,
BIN_OP_EQ_uxn_device_h_l307_c11_e458_right,
BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- ram_addr_MUX_uxn_device_h_l307_c7_eeac
ram_addr_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l307_c7_eeac_cond,
ram_addr_MUX_uxn_device_h_l307_c7_eeac_iftrue,
ram_addr_MUX_uxn_device_h_l307_c7_eeac_iffalse,
ram_addr_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- tmp16b_MUX_uxn_device_h_l307_c7_eeac
tmp16b_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l307_c7_eeac_cond,
tmp16b_MUX_uxn_device_h_l307_c7_eeac_iftrue,
tmp16b_MUX_uxn_device_h_l307_c7_eeac_iffalse,
tmp16b_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac
ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_cond,
ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue,
ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse,
ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- tmp12_MUX_uxn_device_h_l307_c7_eeac
tmp12_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l307_c7_eeac_cond,
tmp12_MUX_uxn_device_h_l307_c7_eeac_iftrue,
tmp12_MUX_uxn_device_h_l307_c7_eeac_iffalse,
tmp12_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- is_last_blit_MUX_uxn_device_h_l307_c7_eeac
is_last_blit_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l307_c7_eeac_cond,
is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iftrue,
is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iffalse,
is_last_blit_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- result_MUX_uxn_device_h_l307_c7_eeac
result_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l307_c7_eeac_cond,
result_MUX_uxn_device_h_l307_c7_eeac_iftrue,
result_MUX_uxn_device_h_l307_c7_eeac_iffalse,
result_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- y_MUX_uxn_device_h_l307_c7_eeac
y_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l307_c7_eeac_cond,
y_MUX_uxn_device_h_l307_c7_eeac_iftrue,
y_MUX_uxn_device_h_l307_c7_eeac_iffalse,
y_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- screen_blit_result_MUX_uxn_device_h_l307_c7_eeac
screen_blit_result_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_cond,
screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iftrue,
screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iffalse,
screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- tmp4_MUX_uxn_device_h_l307_c7_eeac
tmp4_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l307_c7_eeac_cond,
tmp4_MUX_uxn_device_h_l307_c7_eeac_iftrue,
tmp4_MUX_uxn_device_h_l307_c7_eeac_iffalse,
tmp4_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- is_blit_done_MUX_uxn_device_h_l307_c7_eeac
is_blit_done_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l307_c7_eeac_cond,
is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iftrue,
is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iffalse,
is_blit_done_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- tmp16_MUX_uxn_device_h_l307_c7_eeac
tmp16_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l307_c7_eeac_cond,
tmp16_MUX_uxn_device_h_l307_c7_eeac_iftrue,
tmp16_MUX_uxn_device_h_l307_c7_eeac_iffalse,
tmp16_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac
x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond,
x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue,
x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse,
x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- x_MUX_uxn_device_h_l307_c7_eeac
x_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l307_c7_eeac_cond,
x_MUX_uxn_device_h_l307_c7_eeac_iftrue,
x_MUX_uxn_device_h_l307_c7_eeac_iffalse,
x_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac
y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond,
y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue,
y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse,
y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- auto_length_MUX_uxn_device_h_l307_c7_eeac
auto_length_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l307_c7_eeac_cond,
auto_length_MUX_uxn_device_h_l307_c7_eeac_iftrue,
auto_length_MUX_uxn_device_h_l307_c7_eeac_iffalse,
auto_length_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- auto_advance_MUX_uxn_device_h_l307_c7_eeac
auto_advance_MUX_uxn_device_h_l307_c7_eeac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l307_c7_eeac_cond,
auto_advance_MUX_uxn_device_h_l307_c7_eeac_iftrue,
auto_advance_MUX_uxn_device_h_l307_c7_eeac_iffalse,
auto_advance_MUX_uxn_device_h_l307_c7_eeac_return_output);

-- BIN_OP_EQ_uxn_device_h_l312_c11_c935
BIN_OP_EQ_uxn_device_h_l312_c11_c935 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l312_c11_c935_left,
BIN_OP_EQ_uxn_device_h_l312_c11_c935_right,
BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_return_output);

-- ram_addr_MUX_uxn_device_h_l312_c7_1c96
ram_addr_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l312_c7_1c96_cond,
ram_addr_MUX_uxn_device_h_l312_c7_1c96_iftrue,
ram_addr_MUX_uxn_device_h_l312_c7_1c96_iffalse,
ram_addr_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- tmp16b_MUX_uxn_device_h_l312_c7_1c96
tmp16b_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l312_c7_1c96_cond,
tmp16b_MUX_uxn_device_h_l312_c7_1c96_iftrue,
tmp16b_MUX_uxn_device_h_l312_c7_1c96_iffalse,
tmp16b_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96
ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_cond,
ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue,
ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse,
ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- tmp12_MUX_uxn_device_h_l312_c7_1c96
tmp12_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l312_c7_1c96_cond,
tmp12_MUX_uxn_device_h_l312_c7_1c96_iftrue,
tmp12_MUX_uxn_device_h_l312_c7_1c96_iffalse,
tmp12_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- is_last_blit_MUX_uxn_device_h_l312_c7_1c96
is_last_blit_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l312_c7_1c96_cond,
is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iftrue,
is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iffalse,
is_last_blit_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- result_MUX_uxn_device_h_l312_c7_1c96
result_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l312_c7_1c96_cond,
result_MUX_uxn_device_h_l312_c7_1c96_iftrue,
result_MUX_uxn_device_h_l312_c7_1c96_iffalse,
result_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- y_MUX_uxn_device_h_l312_c7_1c96
y_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l312_c7_1c96_cond,
y_MUX_uxn_device_h_l312_c7_1c96_iftrue,
y_MUX_uxn_device_h_l312_c7_1c96_iffalse,
y_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- screen_blit_result_MUX_uxn_device_h_l312_c7_1c96
screen_blit_result_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_cond,
screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iftrue,
screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iffalse,
screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- tmp4_MUX_uxn_device_h_l312_c7_1c96
tmp4_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l312_c7_1c96_cond,
tmp4_MUX_uxn_device_h_l312_c7_1c96_iftrue,
tmp4_MUX_uxn_device_h_l312_c7_1c96_iffalse,
tmp4_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- is_blit_done_MUX_uxn_device_h_l312_c7_1c96
is_blit_done_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l312_c7_1c96_cond,
is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iftrue,
is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iffalse,
is_blit_done_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- tmp16_MUX_uxn_device_h_l312_c7_1c96
tmp16_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l312_c7_1c96_cond,
tmp16_MUX_uxn_device_h_l312_c7_1c96_iftrue,
tmp16_MUX_uxn_device_h_l312_c7_1c96_iffalse,
tmp16_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96
x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond,
x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue,
x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse,
x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- x_MUX_uxn_device_h_l312_c7_1c96
x_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l312_c7_1c96_cond,
x_MUX_uxn_device_h_l312_c7_1c96_iftrue,
x_MUX_uxn_device_h_l312_c7_1c96_iffalse,
x_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96
y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond,
y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue,
y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse,
y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- auto_length_MUX_uxn_device_h_l312_c7_1c96
auto_length_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l312_c7_1c96_cond,
auto_length_MUX_uxn_device_h_l312_c7_1c96_iftrue,
auto_length_MUX_uxn_device_h_l312_c7_1c96_iffalse,
auto_length_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- auto_advance_MUX_uxn_device_h_l312_c7_1c96
auto_advance_MUX_uxn_device_h_l312_c7_1c96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l312_c7_1c96_cond,
auto_advance_MUX_uxn_device_h_l312_c7_1c96_iftrue,
auto_advance_MUX_uxn_device_h_l312_c7_1c96_iffalse,
auto_advance_MUX_uxn_device_h_l312_c7_1c96_return_output);

-- BIN_OP_OR_uxn_device_h_l313_c3_563d
BIN_OP_OR_uxn_device_h_l313_c3_563d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l313_c3_563d_left,
BIN_OP_OR_uxn_device_h_l313_c3_563d_right,
BIN_OP_OR_uxn_device_h_l313_c3_563d_return_output);

-- BIN_OP_EQ_uxn_device_h_l322_c18_a813
BIN_OP_EQ_uxn_device_h_l322_c18_a813 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l322_c18_a813_left,
BIN_OP_EQ_uxn_device_h_l322_c18_a813_right,
BIN_OP_EQ_uxn_device_h_l322_c18_a813_return_output);

-- MUX_uxn_device_h_l322_c18_9dcb
MUX_uxn_device_h_l322_c18_9dcb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l322_c18_9dcb_cond,
MUX_uxn_device_h_l322_c18_9dcb_iftrue,
MUX_uxn_device_h_l322_c18_9dcb_iffalse,
MUX_uxn_device_h_l322_c18_9dcb_return_output);

-- MUX_uxn_device_h_l324_c19_d566
MUX_uxn_device_h_l324_c19_d566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l324_c19_d566_cond,
MUX_uxn_device_h_l324_c19_d566_iftrue,
MUX_uxn_device_h_l324_c19_d566_iffalse,
MUX_uxn_device_h_l324_c19_d566_return_output);

-- MUX_uxn_device_h_l325_c19_8f09
MUX_uxn_device_h_l325_c19_8f09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l325_c19_8f09_cond,
MUX_uxn_device_h_l325_c19_8f09_iftrue,
MUX_uxn_device_h_l325_c19_8f09_iffalse,
MUX_uxn_device_h_l325_c19_8f09_return_output);

-- MUX_uxn_device_h_l326_c39_4b72
MUX_uxn_device_h_l326_c39_4b72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l326_c39_4b72_cond,
MUX_uxn_device_h_l326_c39_4b72_iftrue,
MUX_uxn_device_h_l326_c39_4b72_iffalse,
MUX_uxn_device_h_l326_c39_4b72_return_output);

-- MUX_uxn_device_h_l326_c20_93e1
MUX_uxn_device_h_l326_c20_93e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l326_c20_93e1_cond,
MUX_uxn_device_h_l326_c20_93e1_iftrue,
MUX_uxn_device_h_l326_c20_93e1_iffalse,
MUX_uxn_device_h_l326_c20_93e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output);

-- ram_addr_MUX_uxn_device_h_l327_c3_daaa
ram_addr_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l327_c3_daaa_cond,
ram_addr_MUX_uxn_device_h_l327_c3_daaa_iftrue,
ram_addr_MUX_uxn_device_h_l327_c3_daaa_iffalse,
ram_addr_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- tmp16b_MUX_uxn_device_h_l327_c3_daaa
tmp16b_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l327_c3_daaa_cond,
tmp16b_MUX_uxn_device_h_l327_c3_daaa_iftrue,
tmp16b_MUX_uxn_device_h_l327_c3_daaa_iffalse,
tmp16b_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- is_last_blit_MUX_uxn_device_h_l327_c3_daaa
is_last_blit_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l327_c3_daaa_cond,
is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iftrue,
is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iffalse,
is_last_blit_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- result_MUX_uxn_device_h_l327_c3_daaa
result_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l327_c3_daaa_cond,
result_MUX_uxn_device_h_l327_c3_daaa_iftrue,
result_MUX_uxn_device_h_l327_c3_daaa_iffalse,
result_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- y_MUX_uxn_device_h_l327_c3_daaa
y_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l327_c3_daaa_cond,
y_MUX_uxn_device_h_l327_c3_daaa_iftrue,
y_MUX_uxn_device_h_l327_c3_daaa_iffalse,
y_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- screen_blit_result_MUX_uxn_device_h_l327_c3_daaa
screen_blit_result_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_cond,
screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iftrue,
screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iffalse,
screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- tmp4_MUX_uxn_device_h_l327_c3_daaa
tmp4_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l327_c3_daaa_cond,
tmp4_MUX_uxn_device_h_l327_c3_daaa_iftrue,
tmp4_MUX_uxn_device_h_l327_c3_daaa_iffalse,
tmp4_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- tmp16_MUX_uxn_device_h_l327_c3_daaa
tmp16_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l327_c3_daaa_cond,
tmp16_MUX_uxn_device_h_l327_c3_daaa_iftrue,
tmp16_MUX_uxn_device_h_l327_c3_daaa_iffalse,
tmp16_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- x_MUX_uxn_device_h_l327_c3_daaa
x_MUX_uxn_device_h_l327_c3_daaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l327_c3_daaa_cond,
x_MUX_uxn_device_h_l327_c3_daaa_iftrue,
x_MUX_uxn_device_h_l327_c3_daaa_iffalse,
x_MUX_uxn_device_h_l327_c3_daaa_return_output);

-- BIN_OP_EQ_uxn_device_h_l328_c8_fd31
BIN_OP_EQ_uxn_device_h_l328_c8_fd31 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l328_c8_fd31_left,
BIN_OP_EQ_uxn_device_h_l328_c8_fd31_right,
BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output);

-- ram_addr_MUX_uxn_device_h_l328_c4_f456
ram_addr_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l328_c4_f456_cond,
ram_addr_MUX_uxn_device_h_l328_c4_f456_iftrue,
ram_addr_MUX_uxn_device_h_l328_c4_f456_iffalse,
ram_addr_MUX_uxn_device_h_l328_c4_f456_return_output);

-- tmp16b_MUX_uxn_device_h_l328_c4_f456
tmp16b_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l328_c4_f456_cond,
tmp16b_MUX_uxn_device_h_l328_c4_f456_iftrue,
tmp16b_MUX_uxn_device_h_l328_c4_f456_iffalse,
tmp16b_MUX_uxn_device_h_l328_c4_f456_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_cond,
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_return_output);

-- result_u8_value_MUX_uxn_device_h_l328_c4_f456
result_u8_value_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l328_c4_f456_cond,
result_u8_value_MUX_uxn_device_h_l328_c4_f456_iftrue,
result_u8_value_MUX_uxn_device_h_l328_c4_f456_iffalse,
result_u8_value_MUX_uxn_device_h_l328_c4_f456_return_output);

-- result_u16_addr_MUX_uxn_device_h_l328_c4_f456
result_u16_addr_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l328_c4_f456_cond,
result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iftrue,
result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iffalse,
result_u16_addr_MUX_uxn_device_h_l328_c4_f456_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l328_c4_f456
result_is_vram_write_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_cond,
result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iftrue,
result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iffalse,
result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l328_c4_f456
result_is_deo_done_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_cond,
result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iftrue,
result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iffalse,
result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l328_c4_f456
result_device_ram_address_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_cond,
result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iftrue,
result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iffalse,
result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_return_output);

-- y_MUX_uxn_device_h_l328_c4_f456
y_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l328_c4_f456_cond,
y_MUX_uxn_device_h_l328_c4_f456_iftrue,
y_MUX_uxn_device_h_l328_c4_f456_iffalse,
y_MUX_uxn_device_h_l328_c4_f456_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_return_output);

-- tmp4_MUX_uxn_device_h_l328_c4_f456
tmp4_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l328_c4_f456_cond,
tmp4_MUX_uxn_device_h_l328_c4_f456_iftrue,
tmp4_MUX_uxn_device_h_l328_c4_f456_iffalse,
tmp4_MUX_uxn_device_h_l328_c4_f456_return_output);

-- tmp16_MUX_uxn_device_h_l328_c4_f456
tmp16_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l328_c4_f456_cond,
tmp16_MUX_uxn_device_h_l328_c4_f456_iftrue,
tmp16_MUX_uxn_device_h_l328_c4_f456_iffalse,
tmp16_MUX_uxn_device_h_l328_c4_f456_return_output);

-- x_MUX_uxn_device_h_l328_c4_f456
x_MUX_uxn_device_h_l328_c4_f456 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l328_c4_f456_cond,
x_MUX_uxn_device_h_l328_c4_f456_iftrue,
x_MUX_uxn_device_h_l328_c4_f456_iffalse,
x_MUX_uxn_device_h_l328_c4_f456_return_output);

-- BIN_OP_MINUS_uxn_device_h_l329_c23_7391
BIN_OP_MINUS_uxn_device_h_l329_c23_7391 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l329_c23_7391_left,
BIN_OP_MINUS_uxn_device_h_l329_c23_7391_right,
BIN_OP_MINUS_uxn_device_h_l329_c23_7391_return_output);

-- BIN_OP_PLUS_uxn_device_h_l329_c49_5123
BIN_OP_PLUS_uxn_device_h_l329_c49_5123 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l329_c49_5123_left,
BIN_OP_PLUS_uxn_device_h_l329_c49_5123_right,
BIN_OP_PLUS_uxn_device_h_l329_c49_5123_return_output);

-- MUX_uxn_device_h_l329_c13_d8bc
MUX_uxn_device_h_l329_c13_d8bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l329_c13_d8bc_cond,
MUX_uxn_device_h_l329_c13_d8bc_iftrue,
MUX_uxn_device_h_l329_c13_d8bc_iffalse,
MUX_uxn_device_h_l329_c13_d8bc_return_output);

-- BIN_OP_MINUS_uxn_device_h_l330_c24_bb92
BIN_OP_MINUS_uxn_device_h_l330_c24_bb92 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_left,
BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_right,
BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_return_output);

-- BIN_OP_PLUS_uxn_device_h_l330_c51_e997
BIN_OP_PLUS_uxn_device_h_l330_c51_e997 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l330_c51_e997_left,
BIN_OP_PLUS_uxn_device_h_l330_c51_e997_right,
BIN_OP_PLUS_uxn_device_h_l330_c51_e997_return_output);

-- MUX_uxn_device_h_l330_c14_592d
MUX_uxn_device_h_l330_c14_592d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l330_c14_592d_cond,
MUX_uxn_device_h_l330_c14_592d_iftrue,
MUX_uxn_device_h_l330_c14_592d_iffalse,
MUX_uxn_device_h_l330_c14_592d_return_output);

-- BIN_OP_MINUS_uxn_device_h_l331_c36_a76e
BIN_OP_MINUS_uxn_device_h_l331_c36_a76e : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_left,
BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_right,
BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2
BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_left,
BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_right,
BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_return_output);

-- MUX_uxn_device_h_l331_c26_acb2
MUX_uxn_device_h_l331_c26_acb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l331_c26_acb2_cond,
MUX_uxn_device_h_l331_c26_acb2_iftrue,
MUX_uxn_device_h_l331_c26_acb2_iffalse,
MUX_uxn_device_h_l331_c26_acb2_return_output);

-- MUX_uxn_device_h_l331_c10_1821
MUX_uxn_device_h_l331_c10_1821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l331_c10_1821_cond,
MUX_uxn_device_h_l331_c10_1821_iftrue,
MUX_uxn_device_h_l331_c10_1821_iffalse,
MUX_uxn_device_h_l331_c10_1821_return_output);

-- BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b
BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_left,
BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_right,
BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l332_c58_37fd
BIN_OP_PLUS_uxn_device_h_l332_c58_37fd : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_left,
BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_right,
BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_return_output);

-- MUX_uxn_device_h_l332_c26_899b
MUX_uxn_device_h_l332_c26_899b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l332_c26_899b_cond,
MUX_uxn_device_h_l332_c26_899b_iftrue,
MUX_uxn_device_h_l332_c26_899b_iffalse,
MUX_uxn_device_h_l332_c26_899b_return_output);

-- MUX_uxn_device_h_l332_c10_a2f0
MUX_uxn_device_h_l332_c10_a2f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l332_c10_a2f0_cond,
MUX_uxn_device_h_l332_c10_a2f0_iftrue,
MUX_uxn_device_h_l332_c10_a2f0_iffalse,
MUX_uxn_device_h_l332_c10_a2f0_return_output);

-- CONST_SR_8_uxn_device_h_l337_c33_070d
CONST_SR_8_uxn_device_h_l337_c33_070d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l337_c33_070d_x,
CONST_SR_8_uxn_device_h_l337_c33_070d_return_output);

-- BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f
BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f : entity work.BIN_OP_MINUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_left,
BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_right,
BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_return_output);

-- BIN_OP_EQ_uxn_device_h_l339_c13_f4ea
BIN_OP_EQ_uxn_device_h_l339_c13_f4ea : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_left,
BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_right,
BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output);

-- ram_addr_MUX_uxn_device_h_l339_c9_2726
ram_addr_MUX_uxn_device_h_l339_c9_2726 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l339_c9_2726_cond,
ram_addr_MUX_uxn_device_h_l339_c9_2726_iftrue,
ram_addr_MUX_uxn_device_h_l339_c9_2726_iffalse,
ram_addr_MUX_uxn_device_h_l339_c9_2726_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_cond,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_return_output);

-- result_u8_value_MUX_uxn_device_h_l339_c9_2726
result_u8_value_MUX_uxn_device_h_l339_c9_2726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l339_c9_2726_cond,
result_u8_value_MUX_uxn_device_h_l339_c9_2726_iftrue,
result_u8_value_MUX_uxn_device_h_l339_c9_2726_iffalse,
result_u8_value_MUX_uxn_device_h_l339_c9_2726_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l339_c9_2726
result_is_deo_done_MUX_uxn_device_h_l339_c9_2726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_cond,
result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iftrue,
result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iffalse,
result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l339_c9_2726
result_device_ram_address_MUX_uxn_device_h_l339_c9_2726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_cond,
result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iftrue,
result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iffalse,
result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_return_output);

-- tmp4_MUX_uxn_device_h_l339_c9_2726
tmp4_MUX_uxn_device_h_l339_c9_2726 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l339_c9_2726_cond,
tmp4_MUX_uxn_device_h_l339_c9_2726_iftrue,
tmp4_MUX_uxn_device_h_l339_c9_2726_iffalse,
tmp4_MUX_uxn_device_h_l339_c9_2726_return_output);

-- BIN_OP_MINUS_uxn_device_h_l344_c22_0766
BIN_OP_MINUS_uxn_device_h_l344_c22_0766 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l344_c22_0766_left,
BIN_OP_MINUS_uxn_device_h_l344_c22_0766_right,
BIN_OP_MINUS_uxn_device_h_l344_c22_0766_return_output);

-- BIN_OP_EQ_uxn_device_h_l344_c13_7d3b
BIN_OP_EQ_uxn_device_h_l344_c13_7d3b : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_left,
BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_right,
BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output);

-- ram_addr_MUX_uxn_device_h_l344_c9_4026
ram_addr_MUX_uxn_device_h_l344_c9_4026 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l344_c9_4026_cond,
ram_addr_MUX_uxn_device_h_l344_c9_4026_iftrue,
ram_addr_MUX_uxn_device_h_l344_c9_4026_iffalse,
ram_addr_MUX_uxn_device_h_l344_c9_4026_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_cond,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_return_output);

-- result_u8_value_MUX_uxn_device_h_l344_c9_4026
result_u8_value_MUX_uxn_device_h_l344_c9_4026 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l344_c9_4026_cond,
result_u8_value_MUX_uxn_device_h_l344_c9_4026_iftrue,
result_u8_value_MUX_uxn_device_h_l344_c9_4026_iffalse,
result_u8_value_MUX_uxn_device_h_l344_c9_4026_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l344_c9_4026
result_is_deo_done_MUX_uxn_device_h_l344_c9_4026 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_cond,
result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iftrue,
result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iffalse,
result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l344_c9_4026
result_device_ram_address_MUX_uxn_device_h_l344_c9_4026 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_cond,
result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iftrue,
result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iffalse,
result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_return_output);

-- tmp4_MUX_uxn_device_h_l344_c9_4026
tmp4_MUX_uxn_device_h_l344_c9_4026 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l344_c9_4026_cond,
tmp4_MUX_uxn_device_h_l344_c9_4026_iftrue,
tmp4_MUX_uxn_device_h_l344_c9_4026_iffalse,
tmp4_MUX_uxn_device_h_l344_c9_4026_return_output);

-- CONST_SR_8_uxn_device_h_l347_c33_2061
CONST_SR_8_uxn_device_h_l347_c33_2061 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l347_c33_2061_x,
CONST_SR_8_uxn_device_h_l347_c33_2061_return_output);

-- BIN_OP_MINUS_uxn_device_h_l349_c22_68cc
BIN_OP_MINUS_uxn_device_h_l349_c22_68cc : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_left,
BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_right,
BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_return_output);

-- BIN_OP_EQ_uxn_device_h_l349_c13_a6cc
BIN_OP_EQ_uxn_device_h_l349_c13_a6cc : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_left,
BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_right,
BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output);

-- ram_addr_MUX_uxn_device_h_l349_c9_1573
ram_addr_MUX_uxn_device_h_l349_c9_1573 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l349_c9_1573_cond,
ram_addr_MUX_uxn_device_h_l349_c9_1573_iftrue,
ram_addr_MUX_uxn_device_h_l349_c9_1573_iffalse,
ram_addr_MUX_uxn_device_h_l349_c9_1573_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_cond,
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_return_output);

-- result_u8_value_MUX_uxn_device_h_l349_c9_1573
result_u8_value_MUX_uxn_device_h_l349_c9_1573 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l349_c9_1573_cond,
result_u8_value_MUX_uxn_device_h_l349_c9_1573_iftrue,
result_u8_value_MUX_uxn_device_h_l349_c9_1573_iffalse,
result_u8_value_MUX_uxn_device_h_l349_c9_1573_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l349_c9_1573
result_is_deo_done_MUX_uxn_device_h_l349_c9_1573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_cond,
result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iftrue,
result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iffalse,
result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l349_c9_1573
result_device_ram_address_MUX_uxn_device_h_l349_c9_1573 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_cond,
result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iftrue,
result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iffalse,
result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_return_output);

-- tmp4_MUX_uxn_device_h_l349_c9_1573
tmp4_MUX_uxn_device_h_l349_c9_1573 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l349_c9_1573_cond,
tmp4_MUX_uxn_device_h_l349_c9_1573_iftrue,
tmp4_MUX_uxn_device_h_l349_c9_1573_iffalse,
tmp4_MUX_uxn_device_h_l349_c9_1573_return_output);

-- BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc
BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_left,
BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_right,
BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_return_output);

-- BIN_OP_EQ_uxn_device_h_l354_c13_a61e
BIN_OP_EQ_uxn_device_h_l354_c13_a61e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l354_c13_a61e_left,
BIN_OP_EQ_uxn_device_h_l354_c13_a61e_right,
BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output);

-- ram_addr_MUX_uxn_device_h_l354_c9_2ecf
ram_addr_MUX_uxn_device_h_l354_c9_2ecf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l354_c9_2ecf_cond,
ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iftrue,
ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iffalse,
ram_addr_MUX_uxn_device_h_l354_c9_2ecf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_cond,
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_return_output);

-- result_u8_value_MUX_uxn_device_h_l354_c9_2ecf
result_u8_value_MUX_uxn_device_h_l354_c9_2ecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_cond,
result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iftrue,
result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iffalse,
result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf
result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_cond,
result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf
result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_cond,
result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_return_output);

-- tmp4_MUX_uxn_device_h_l354_c9_2ecf
tmp4_MUX_uxn_device_h_l354_c9_2ecf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l354_c9_2ecf_cond,
tmp4_MUX_uxn_device_h_l354_c9_2ecf_iftrue,
tmp4_MUX_uxn_device_h_l354_c9_2ecf_iffalse,
tmp4_MUX_uxn_device_h_l354_c9_2ecf_return_output);

-- BIN_OP_PLUS_uxn_device_h_l355_c5_0f61
BIN_OP_PLUS_uxn_device_h_l355_c5_0f61 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_left,
BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_right,
BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_return_output);

-- CONST_SR_8_uxn_device_h_l358_c33_73b0
CONST_SR_8_uxn_device_h_l358_c33_73b0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l358_c33_73b0_x,
CONST_SR_8_uxn_device_h_l358_c33_73b0_return_output);

-- BIN_OP_MINUS_uxn_device_h_l360_c22_ba25
BIN_OP_MINUS_uxn_device_h_l360_c22_ba25 : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_left,
BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_right,
BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_return_output);

-- BIN_OP_EQ_uxn_device_h_l360_c13_fb96
BIN_OP_EQ_uxn_device_h_l360_c13_fb96 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l360_c13_fb96_left,
BIN_OP_EQ_uxn_device_h_l360_c13_fb96_right,
BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_return_output);

-- result_u8_value_MUX_uxn_device_h_l360_c9_858b
result_u8_value_MUX_uxn_device_h_l360_c9_858b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l360_c9_858b_cond,
result_u8_value_MUX_uxn_device_h_l360_c9_858b_iftrue,
result_u8_value_MUX_uxn_device_h_l360_c9_858b_iffalse,
result_u8_value_MUX_uxn_device_h_l360_c9_858b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l360_c9_858b
result_is_deo_done_MUX_uxn_device_h_l360_c9_858b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_cond,
result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l360_c9_858b
result_device_ram_address_MUX_uxn_device_h_l360_c9_858b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_cond,
result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_return_output);

-- tmp4_MUX_uxn_device_h_l360_c9_858b
tmp4_MUX_uxn_device_h_l360_c9_858b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l360_c9_858b_cond,
tmp4_MUX_uxn_device_h_l360_c9_858b_iftrue,
tmp4_MUX_uxn_device_h_l360_c9_858b_iffalse,
tmp4_MUX_uxn_device_h_l360_c9_858b_return_output);

-- BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c
BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_left,
BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_right,
BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_return_output);

-- BIN_OP_EQ_uxn_device_h_l365_c13_6917
BIN_OP_EQ_uxn_device_h_l365_c13_6917 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l365_c13_6917_left,
BIN_OP_EQ_uxn_device_h_l365_c13_6917_right,
BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_cond,
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35
result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_cond,
result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iftrue,
result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iffalse,
result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35
result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_cond,
result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iftrue,
result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iffalse,
result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_return_output);

-- tmp4_MUX_uxn_device_h_l365_c9_0b35
tmp4_MUX_uxn_device_h_l365_c9_0b35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l365_c9_0b35_cond,
tmp4_MUX_uxn_device_h_l365_c9_0b35_iftrue,
tmp4_MUX_uxn_device_h_l365_c9_0b35_iffalse,
tmp4_MUX_uxn_device_h_l365_c9_0b35_return_output);

-- BIN_OP_PLUS_uxn_device_h_l366_c5_a455
BIN_OP_PLUS_uxn_device_h_l366_c5_a455 : entity work.BIN_OP_PLUS_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l366_c5_a455_left,
BIN_OP_PLUS_uxn_device_h_l366_c5_a455_right,
BIN_OP_PLUS_uxn_device_h_l366_c5_a455_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_return_output);

-- screen_blit_result_MUX_uxn_device_h_l373_c4_c94e
screen_blit_result_MUX_uxn_device_h_l373_c4_c94e : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_cond,
screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iftrue,
screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iffalse,
screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output);

-- screen_2bpp_uxn_device_h_l374_c26_e332
screen_2bpp_uxn_device_h_l374_c26_e332 : entity work.screen_2bpp_0CLK_0d5dc7b6 port map (
clk,
screen_2bpp_uxn_device_h_l374_c26_e332_CLOCK_ENABLE,
screen_2bpp_uxn_device_h_l374_c26_e332_phase,
screen_2bpp_uxn_device_h_l374_c26_e332_x1,
screen_2bpp_uxn_device_h_l374_c26_e332_y1,
screen_2bpp_uxn_device_h_l374_c26_e332_color,
screen_2bpp_uxn_device_h_l374_c26_e332_fx,
screen_2bpp_uxn_device_h_l374_c26_e332_fy,
screen_2bpp_uxn_device_h_l374_c26_e332_ram_addr,
screen_2bpp_uxn_device_h_l374_c26_e332_previous_ram_read,
screen_2bpp_uxn_device_h_l374_c26_e332_return_output);

-- screen_1bpp_uxn_device_h_l376_c26_636b
screen_1bpp_uxn_device_h_l376_c26_636b : entity work.screen_1bpp_0CLK_13e364a0 port map (
clk,
screen_1bpp_uxn_device_h_l376_c26_636b_CLOCK_ENABLE,
screen_1bpp_uxn_device_h_l376_c26_636b_phase,
screen_1bpp_uxn_device_h_l376_c26_636b_x1,
screen_1bpp_uxn_device_h_l376_c26_636b_y1,
screen_1bpp_uxn_device_h_l376_c26_636b_color,
screen_1bpp_uxn_device_h_l376_c26_636b_fx,
screen_1bpp_uxn_device_h_l376_c26_636b_fy,
screen_1bpp_uxn_device_h_l376_c26_636b_ram_addr,
screen_1bpp_uxn_device_h_l376_c26_636b_previous_ram_read,
screen_1bpp_uxn_device_h_l376_c26_636b_return_output);

-- BIN_OP_EQ_uxn_device_h_l385_c19_c70b
BIN_OP_EQ_uxn_device_h_l385_c19_c70b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l385_c19_c70b_left,
BIN_OP_EQ_uxn_device_h_l385_c19_c70b_right,
BIN_OP_EQ_uxn_device_h_l385_c19_c70b_return_output);

-- MUX_uxn_device_h_l385_c19_c122
MUX_uxn_device_h_l385_c19_c122 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l385_c19_c122_cond,
MUX_uxn_device_h_l385_c19_c122_iftrue,
MUX_uxn_device_h_l385_c19_c122_iffalse,
MUX_uxn_device_h_l385_c19_c122_return_output);

-- BIN_OP_XOR_uxn_device_h_l388_c11_ec0e
BIN_OP_XOR_uxn_device_h_l388_c11_ec0e : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_left,
BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_right,
BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l388_c60_833e
BIN_OP_PLUS_uxn_device_h_l388_c60_833e : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l388_c60_833e_left,
BIN_OP_PLUS_uxn_device_h_l388_c60_833e_right,
BIN_OP_PLUS_uxn_device_h_l388_c60_833e_return_output);

-- MUX_uxn_device_h_l388_c11_7375
MUX_uxn_device_h_l388_c11_7375 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l388_c11_7375_cond,
MUX_uxn_device_h_l388_c11_7375_iftrue,
MUX_uxn_device_h_l388_c11_7375_iffalse,
MUX_uxn_device_h_l388_c11_7375_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0
CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_x,
CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_left,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_right,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output);



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
 BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_return_output,
 flip_y_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 ram_addr_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 flip_x_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 tmp16b_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 tmp12_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 result_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 y_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 color_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 tmp4_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 layer_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 tmp16_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 ctrl_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 x_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 auto_length_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 auto_advance_MUX_uxn_device_h_l270_c2_c6b9_return_output,
 BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 flip_y_MUX_uxn_device_h_l277_c7_b744_return_output,
 ram_addr_MUX_uxn_device_h_l277_c7_b744_return_output,
 flip_x_MUX_uxn_device_h_l277_c7_b744_return_output,
 tmp16b_MUX_uxn_device_h_l277_c7_b744_return_output,
 ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_return_output,
 tmp12_MUX_uxn_device_h_l277_c7_b744_return_output,
 ctrl_mode_MUX_uxn_device_h_l277_c7_b744_return_output,
 is_last_blit_MUX_uxn_device_h_l277_c7_b744_return_output,
 result_MUX_uxn_device_h_l277_c7_b744_return_output,
 y_MUX_uxn_device_h_l277_c7_b744_return_output,
 color_MUX_uxn_device_h_l277_c7_b744_return_output,
 screen_blit_result_MUX_uxn_device_h_l277_c7_b744_return_output,
 tmp4_MUX_uxn_device_h_l277_c7_b744_return_output,
 is_blit_done_MUX_uxn_device_h_l277_c7_b744_return_output,
 layer_MUX_uxn_device_h_l277_c7_b744_return_output,
 tmp16_MUX_uxn_device_h_l277_c7_b744_return_output,
 ctrl_MUX_uxn_device_h_l277_c7_b744_return_output,
 x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output,
 x_MUX_uxn_device_h_l277_c7_b744_return_output,
 y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output,
 auto_length_MUX_uxn_device_h_l277_c7_b744_return_output,
 auto_advance_MUX_uxn_device_h_l277_c7_b744_return_output,
 BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 flip_y_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 ram_addr_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 flip_x_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 tmp16b_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 tmp12_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 result_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 y_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 color_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 tmp4_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 layer_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 tmp16_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 ctrl_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 x_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 auto_length_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 auto_advance_MUX_uxn_device_h_l280_c7_4b5a_return_output,
 BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_return_output,
 flip_y_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 ram_addr_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 flip_x_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 tmp16b_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 tmp12_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 result_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 y_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 color_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 tmp4_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 layer_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 tmp16_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 ctrl_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 x_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 auto_length_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 auto_advance_MUX_uxn_device_h_l285_c7_5ad9_return_output,
 BIN_OP_OR_uxn_device_h_l286_c3_88db_return_output,
 BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_return_output,
 flip_y_MUX_uxn_device_h_l289_c7_66c7_return_output,
 ram_addr_MUX_uxn_device_h_l289_c7_66c7_return_output,
 flip_x_MUX_uxn_device_h_l289_c7_66c7_return_output,
 tmp16b_MUX_uxn_device_h_l289_c7_66c7_return_output,
 ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_return_output,
 tmp12_MUX_uxn_device_h_l289_c7_66c7_return_output,
 ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_return_output,
 is_last_blit_MUX_uxn_device_h_l289_c7_66c7_return_output,
 result_MUX_uxn_device_h_l289_c7_66c7_return_output,
 y_MUX_uxn_device_h_l289_c7_66c7_return_output,
 color_MUX_uxn_device_h_l289_c7_66c7_return_output,
 screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_return_output,
 tmp4_MUX_uxn_device_h_l289_c7_66c7_return_output,
 is_blit_done_MUX_uxn_device_h_l289_c7_66c7_return_output,
 layer_MUX_uxn_device_h_l289_c7_66c7_return_output,
 tmp16_MUX_uxn_device_h_l289_c7_66c7_return_output,
 ctrl_MUX_uxn_device_h_l289_c7_66c7_return_output,
 x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output,
 x_MUX_uxn_device_h_l289_c7_66c7_return_output,
 y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output,
 auto_length_MUX_uxn_device_h_l289_c7_66c7_return_output,
 auto_advance_MUX_uxn_device_h_l289_c7_66c7_return_output,
 BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_return_output,
 flip_y_MUX_uxn_device_h_l294_c7_3246_return_output,
 ram_addr_MUX_uxn_device_h_l294_c7_3246_return_output,
 flip_x_MUX_uxn_device_h_l294_c7_3246_return_output,
 tmp16b_MUX_uxn_device_h_l294_c7_3246_return_output,
 ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_return_output,
 tmp12_MUX_uxn_device_h_l294_c7_3246_return_output,
 ctrl_mode_MUX_uxn_device_h_l294_c7_3246_return_output,
 is_last_blit_MUX_uxn_device_h_l294_c7_3246_return_output,
 result_MUX_uxn_device_h_l294_c7_3246_return_output,
 y_MUX_uxn_device_h_l294_c7_3246_return_output,
 color_MUX_uxn_device_h_l294_c7_3246_return_output,
 screen_blit_result_MUX_uxn_device_h_l294_c7_3246_return_output,
 tmp4_MUX_uxn_device_h_l294_c7_3246_return_output,
 is_blit_done_MUX_uxn_device_h_l294_c7_3246_return_output,
 layer_MUX_uxn_device_h_l294_c7_3246_return_output,
 tmp16_MUX_uxn_device_h_l294_c7_3246_return_output,
 ctrl_MUX_uxn_device_h_l294_c7_3246_return_output,
 x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output,
 x_MUX_uxn_device_h_l294_c7_3246_return_output,
 y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output,
 auto_length_MUX_uxn_device_h_l294_c7_3246_return_output,
 auto_advance_MUX_uxn_device_h_l294_c7_3246_return_output,
 BIN_OP_OR_uxn_device_h_l295_c3_3e63_return_output,
 BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_return_output,
 flip_y_MUX_uxn_device_h_l298_c7_acf2_return_output,
 ram_addr_MUX_uxn_device_h_l298_c7_acf2_return_output,
 flip_x_MUX_uxn_device_h_l298_c7_acf2_return_output,
 tmp16b_MUX_uxn_device_h_l298_c7_acf2_return_output,
 ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_return_output,
 tmp12_MUX_uxn_device_h_l298_c7_acf2_return_output,
 ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_return_output,
 is_last_blit_MUX_uxn_device_h_l298_c7_acf2_return_output,
 result_MUX_uxn_device_h_l298_c7_acf2_return_output,
 y_MUX_uxn_device_h_l298_c7_acf2_return_output,
 color_MUX_uxn_device_h_l298_c7_acf2_return_output,
 screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_return_output,
 tmp4_MUX_uxn_device_h_l298_c7_acf2_return_output,
 is_blit_done_MUX_uxn_device_h_l298_c7_acf2_return_output,
 layer_MUX_uxn_device_h_l298_c7_acf2_return_output,
 tmp16_MUX_uxn_device_h_l298_c7_acf2_return_output,
 ctrl_MUX_uxn_device_h_l298_c7_acf2_return_output,
 x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output,
 x_MUX_uxn_device_h_l298_c7_acf2_return_output,
 y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output,
 auto_length_MUX_uxn_device_h_l298_c7_acf2_return_output,
 auto_advance_MUX_uxn_device_h_l298_c7_acf2_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_return_output,
 ram_addr_MUX_uxn_device_h_l307_c7_eeac_return_output,
 tmp16b_MUX_uxn_device_h_l307_c7_eeac_return_output,
 ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_return_output,
 tmp12_MUX_uxn_device_h_l307_c7_eeac_return_output,
 is_last_blit_MUX_uxn_device_h_l307_c7_eeac_return_output,
 result_MUX_uxn_device_h_l307_c7_eeac_return_output,
 y_MUX_uxn_device_h_l307_c7_eeac_return_output,
 screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_return_output,
 tmp4_MUX_uxn_device_h_l307_c7_eeac_return_output,
 is_blit_done_MUX_uxn_device_h_l307_c7_eeac_return_output,
 tmp16_MUX_uxn_device_h_l307_c7_eeac_return_output,
 x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output,
 x_MUX_uxn_device_h_l307_c7_eeac_return_output,
 y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output,
 auto_length_MUX_uxn_device_h_l307_c7_eeac_return_output,
 auto_advance_MUX_uxn_device_h_l307_c7_eeac_return_output,
 BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_return_output,
 ram_addr_MUX_uxn_device_h_l312_c7_1c96_return_output,
 tmp16b_MUX_uxn_device_h_l312_c7_1c96_return_output,
 ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_return_output,
 tmp12_MUX_uxn_device_h_l312_c7_1c96_return_output,
 is_last_blit_MUX_uxn_device_h_l312_c7_1c96_return_output,
 result_MUX_uxn_device_h_l312_c7_1c96_return_output,
 y_MUX_uxn_device_h_l312_c7_1c96_return_output,
 screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_return_output,
 tmp4_MUX_uxn_device_h_l312_c7_1c96_return_output,
 is_blit_done_MUX_uxn_device_h_l312_c7_1c96_return_output,
 tmp16_MUX_uxn_device_h_l312_c7_1c96_return_output,
 x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output,
 x_MUX_uxn_device_h_l312_c7_1c96_return_output,
 y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output,
 auto_length_MUX_uxn_device_h_l312_c7_1c96_return_output,
 auto_advance_MUX_uxn_device_h_l312_c7_1c96_return_output,
 BIN_OP_OR_uxn_device_h_l313_c3_563d_return_output,
 BIN_OP_EQ_uxn_device_h_l322_c18_a813_return_output,
 MUX_uxn_device_h_l322_c18_9dcb_return_output,
 MUX_uxn_device_h_l324_c19_d566_return_output,
 MUX_uxn_device_h_l325_c19_8f09_return_output,
 MUX_uxn_device_h_l326_c39_4b72_return_output,
 MUX_uxn_device_h_l326_c20_93e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output,
 ram_addr_MUX_uxn_device_h_l327_c3_daaa_return_output,
 tmp16b_MUX_uxn_device_h_l327_c3_daaa_return_output,
 is_last_blit_MUX_uxn_device_h_l327_c3_daaa_return_output,
 result_MUX_uxn_device_h_l327_c3_daaa_return_output,
 y_MUX_uxn_device_h_l327_c3_daaa_return_output,
 screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output,
 tmp4_MUX_uxn_device_h_l327_c3_daaa_return_output,
 tmp16_MUX_uxn_device_h_l327_c3_daaa_return_output,
 x_MUX_uxn_device_h_l327_c3_daaa_return_output,
 BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output,
 ram_addr_MUX_uxn_device_h_l328_c4_f456_return_output,
 tmp16b_MUX_uxn_device_h_l328_c4_f456_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_return_output,
 result_u8_value_MUX_uxn_device_h_l328_c4_f456_return_output,
 result_u16_addr_MUX_uxn_device_h_l328_c4_f456_return_output,
 result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_return_output,
 result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_return_output,
 result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_return_output,
 y_MUX_uxn_device_h_l328_c4_f456_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_return_output,
 tmp4_MUX_uxn_device_h_l328_c4_f456_return_output,
 tmp16_MUX_uxn_device_h_l328_c4_f456_return_output,
 x_MUX_uxn_device_h_l328_c4_f456_return_output,
 BIN_OP_MINUS_uxn_device_h_l329_c23_7391_return_output,
 BIN_OP_PLUS_uxn_device_h_l329_c49_5123_return_output,
 MUX_uxn_device_h_l329_c13_d8bc_return_output,
 BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_return_output,
 BIN_OP_PLUS_uxn_device_h_l330_c51_e997_return_output,
 MUX_uxn_device_h_l330_c14_592d_return_output,
 BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_return_output,
 BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_return_output,
 MUX_uxn_device_h_l331_c26_acb2_return_output,
 MUX_uxn_device_h_l331_c10_1821_return_output,
 BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_return_output,
 BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_return_output,
 MUX_uxn_device_h_l332_c26_899b_return_output,
 MUX_uxn_device_h_l332_c10_a2f0_return_output,
 CONST_SR_8_uxn_device_h_l337_c33_070d_return_output,
 BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_return_output,
 BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output,
 ram_addr_MUX_uxn_device_h_l339_c9_2726_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_return_output,
 result_u8_value_MUX_uxn_device_h_l339_c9_2726_return_output,
 result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_return_output,
 result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_return_output,
 tmp4_MUX_uxn_device_h_l339_c9_2726_return_output,
 BIN_OP_MINUS_uxn_device_h_l344_c22_0766_return_output,
 BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output,
 ram_addr_MUX_uxn_device_h_l344_c9_4026_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_return_output,
 result_u8_value_MUX_uxn_device_h_l344_c9_4026_return_output,
 result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_return_output,
 result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_return_output,
 tmp4_MUX_uxn_device_h_l344_c9_4026_return_output,
 CONST_SR_8_uxn_device_h_l347_c33_2061_return_output,
 BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_return_output,
 BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output,
 ram_addr_MUX_uxn_device_h_l349_c9_1573_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_return_output,
 result_u8_value_MUX_uxn_device_h_l349_c9_1573_return_output,
 result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_return_output,
 result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_return_output,
 tmp4_MUX_uxn_device_h_l349_c9_1573_return_output,
 BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_return_output,
 BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output,
 ram_addr_MUX_uxn_device_h_l354_c9_2ecf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_return_output,
 result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_return_output,
 tmp4_MUX_uxn_device_h_l354_c9_2ecf_return_output,
 BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_return_output,
 CONST_SR_8_uxn_device_h_l358_c33_73b0_return_output,
 BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_return_output,
 BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_return_output,
 result_u8_value_MUX_uxn_device_h_l360_c9_858b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_return_output,
 tmp4_MUX_uxn_device_h_l360_c9_858b_return_output,
 BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_return_output,
 BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_return_output,
 result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_return_output,
 result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_return_output,
 tmp4_MUX_uxn_device_h_l365_c9_0b35_return_output,
 BIN_OP_PLUS_uxn_device_h_l366_c5_a455_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_return_output,
 screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output,
 screen_2bpp_uxn_device_h_l374_c26_e332_return_output,
 screen_1bpp_uxn_device_h_l376_c26_636b_return_output,
 BIN_OP_EQ_uxn_device_h_l385_c19_c70b_return_output,
 MUX_uxn_device_h_l385_c19_c122_return_output,
 BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_return_output,
 BIN_OP_PLUS_uxn_device_h_l388_c60_833e_return_output,
 MUX_uxn_device_h_l388_c11_7375_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output,
 BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l270_c2_c6b9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l277_c7_b744_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c2_c6b9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l277_c7_b744_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l277_c7_b744_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l277_c7_b744_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_4b5a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_4b5a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l285_c7_5ad9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l285_c7_5ad9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l289_c7_66c7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l289_c7_66c7_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l289_c7_66c7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l289_c7_66c7_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l294_c7_3246_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l294_c7_3246_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l294_c7_3246_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l294_c7_3246_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l298_c7_acf2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l298_c7_acf2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l298_c7_acf2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l298_c7_acf2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_eeac_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l300_c15_7a09_return_output : unsigned(0 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l301_c11_d256_return_output : unsigned(0 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l302_c12_286b_return_output : unsigned(0 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l303_c12_dfca_return_output : unsigned(0 downto 0);
 variable VAR_uint8_3_0_uxn_device_h_l304_c11_df7b_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l307_c7_eeac_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l307_c7_eeac_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_eeac_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_1c96_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l312_c7_1c96_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_1c96_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l327_c3_daaa_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l315_c3_5dcf : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_daaa_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9dcb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9dcb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9dcb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c18_9dcb_return_output : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l323_c17_7ea4_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_d566_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l324_c19_d845_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_d566_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_d566_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l324_c19_d566_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_8f09_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l325_c19_3aa7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_8f09_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_8f09_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c19_8f09_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_93e1_cond : unsigned(0 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l326_c20_8311_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_93e1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_93e1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_4b72_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_4b72_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_4b72_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c39_4b72_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l326_c20_93e1_return_output : unsigned(15 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iffalse : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l327_c3_daaa_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7_uxn_device_h_l327_c3_daaa_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l327_c3_daaa_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l327_c3_daaa_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l327_c3_daaa_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_daaa_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_daaa_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l327_c3_daaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l334_c5_e801 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_f456_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_f456_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l328_c4_f456_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_d8bc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_d8bc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_d8bc_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c13_d8bc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_592d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_592d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_592d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l330_c14_592d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_1821_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_1821_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_1821_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_acb2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_acb2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_acb2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c26_acb2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l331_c10_1821_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_a2f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_a2f0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_a2f0_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_899b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_899b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_899b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c26_899b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c10_a2f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l337_c33_070d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l337_c33_070d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_8962_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_770b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l347_c33_2061_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l347_c33_2061_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l347_c23_d8cf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l352_c23_d681_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_uxn_device_h_l355_c5_585a : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l358_c33_73b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l358_c33_73b0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l358_c23_87c8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l360_c9_858b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l363_c23_dad9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l365_c9_0b35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l365_c9_0b35_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l366_c5_e2a1 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_return_output : unsigned(4 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_cond : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_phase : unsigned(11 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_x1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_y1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_color : unsigned(3 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_fx : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_fy : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l374_c26_e332_return_output : screen_blit_result_t;
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_phase : unsigned(11 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_x1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_y1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_color : unsigned(3 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_fx : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_fy : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l376_c26_636b_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l379_c4_1c9c : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l381_c27_834a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l382_c22_92a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l384_c22_8844_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_c122_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_c122_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_c122_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l385_c19_c122_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_7375_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_7375_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_7375_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c11_7375_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l295_l281_l308_l286_l313_l290_DUPLICATE_fc03_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l389_l388_DUPLICATE_84e7_return_output : unsigned(0 downto 0);
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
     VAR_MUX_uxn_device_h_l325_c19_8f09_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_iftrue := to_unsigned(9, 12);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iftrue := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_right := to_unsigned(8, 12);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l324_c19_d566_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_right := to_unsigned(4, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_right := to_unsigned(5, 3);
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_right := to_unsigned(2, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iftrue := to_unsigned(0, 1);
     VAR_result_u16_addr_uxn_device_h_l334_c5_e801 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_result_u16_addr_uxn_device_h_l334_c5_e801;
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iftrue := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_right := to_unsigned(0, 12);
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iftrue := to_unsigned(40, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iftrue := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l325_c19_8f09_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iftrue := to_unsigned(45, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_right := to_unsigned(3, 2);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l326_c39_4b72_iftrue := to_unsigned(16, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_right := to_unsigned(9, 12);
     VAR_MUX_uxn_device_h_l324_c19_d566_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iftrue := to_unsigned(41, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_right := to_unsigned(6, 3);
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_right := to_unsigned(2, 2);
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iftrue := to_unsigned(0, 1);
     VAR_tmp4_uxn_device_h_l315_c3_5dcf := resize(to_unsigned(0, 1), 4);
     VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_iftrue := VAR_tmp4_uxn_device_h_l315_c3_5dcf;
     VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_right := to_unsigned(1, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_right := to_unsigned(7, 12);
     VAR_MUX_uxn_device_h_l326_c39_4b72_iffalse := to_unsigned(8, 16);
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iftrue := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l385_c19_c122_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_right := to_unsigned(5, 12);
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_right := to_unsigned(3, 12);
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_right := to_unsigned(6, 12);
     VAR_MUX_uxn_device_h_l385_c19_c122_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l326_c20_93e1_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l379_c4_1c9c := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_device_h_l322_c18_9dcb_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_iftrue := auto_advance;
     VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_iftrue := auto_length;
     VAR_color_MUX_uxn_device_h_l270_c2_c6b9_iftrue := color;
     VAR_color_MUX_uxn_device_h_l277_c7_b744_iftrue := color;
     VAR_color_MUX_uxn_device_h_l280_c7_4b5a_iftrue := color;
     VAR_color_MUX_uxn_device_h_l285_c7_5ad9_iftrue := color;
     VAR_color_MUX_uxn_device_h_l289_c7_66c7_iftrue := color;
     VAR_color_MUX_uxn_device_h_l294_c7_3246_iftrue := color;
     VAR_color_MUX_uxn_device_h_l298_c7_acf2_iffalse := color;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_color := color;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_color := color;
     VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_iffalse := ctrl;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l326_c39_4b72_cond := ctrl_mode;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_cond := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iffalse := ctrl_mode;
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l329_c13_d8bc_cond := flip_x;
     VAR_MUX_uxn_device_h_l331_c26_acb2_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_iffalse := flip_x;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_fx := flip_x;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_fx := flip_x;
     VAR_MUX_uxn_device_h_l330_c14_592d_cond := flip_y;
     VAR_MUX_uxn_device_h_l332_c26_899b_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_iffalse := flip_y;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_fy := flip_y;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_fy := flip_y;
     VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_left := is_blit_done;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_cond := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iftrue := is_blit_done;
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_result_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_x_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_y_MUX_uxn_device_h_l327_c3_daaa_cond := is_blit_done;
     VAR_MUX_uxn_device_h_l331_c10_1821_cond := is_last_blit;
     VAR_MUX_uxn_device_h_l332_c10_a2f0_cond := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iftrue := is_last_blit;
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iftrue := is_last_blit;
     VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l277_c7_b744_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l289_c7_66c7_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l294_c7_3246_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l298_c7_acf2_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_right := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_left := VAR_phase;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_left := VAR_phase;
     VAR_MUX_uxn_device_h_l322_c18_9dcb_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_iftrue := VAR_previous_device_ram_read;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_previous_ram_read := VAR_previous_ram_read;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_left := ram_addr;
     VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iffalse := ram_addr;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_ram_addr := ram_addr;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_ram_addr := ram_addr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue := ram_addr_incr;
     VAR_result_MUX_uxn_device_h_l312_c7_1c96_iftrue := result;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iftrue := screen_blit_result;
     VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_left := tmp12;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_right := tmp12;
     VAR_MUX_uxn_device_h_l388_c11_7375_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_iftrue := tmp12;
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_left := tmp16;
     VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_left := tmp16;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_x1 := tmp16;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_x1 := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_iffalse := tmp16;
     VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_left := tmp16b;
     VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_left := tmp16b;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_y1 := tmp16b;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_y1 := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_iffalse := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_iffalse := tmp16b;
     VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_right := tmp4;
     VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_left := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_iffalse := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_iffalse := tmp4;
     VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_left := x;
     VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_left := x;
     VAR_MUX_uxn_device_h_l331_c10_1821_iffalse := x;
     VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_iftrue := x;
     VAR_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue := x;
     VAR_x_MUX_uxn_device_h_l277_c7_b744_iftrue := x;
     VAR_x_MUX_uxn_device_h_l289_c7_66c7_iftrue := x;
     VAR_x_MUX_uxn_device_h_l294_c7_3246_iftrue := x;
     VAR_x_MUX_uxn_device_h_l298_c7_acf2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l307_c7_eeac_iftrue := x;
     VAR_x_MUX_uxn_device_h_l312_c7_1c96_iftrue := x;
     VAR_x_MUX_uxn_device_h_l327_c3_daaa_iffalse := x;
     VAR_x_MUX_uxn_device_h_l328_c4_f456_iffalse := x;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue := x_sprite_incr;
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_left := y;
     VAR_CONST_SR_8_uxn_device_h_l347_c33_2061_x := y;
     VAR_MUX_uxn_device_h_l332_c10_a2f0_iffalse := y;
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_iftrue := y;
     VAR_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l277_c7_b744_iftrue := y;
     VAR_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l298_c7_acf2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l307_c7_eeac_iftrue := y;
     VAR_y_MUX_uxn_device_h_l312_c7_1c96_iftrue := y;
     VAR_y_MUX_uxn_device_h_l327_c3_daaa_iffalse := y;
     VAR_y_MUX_uxn_device_h_l328_c4_f456_iffalse := y;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue := y_sprite_incr;
     -- BIN_OP_EQ[uxn_device_h_l289_c11_0c80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l289_c11_0c80_left <= VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_left;
     BIN_OP_EQ_uxn_device_h_l289_c11_0c80_right <= VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output := BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l342_c23_770b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_770b_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_MINUS[uxn_device_h_l365_c22_4a0c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_left <= VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_left;
     BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_right <= VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_return_output := BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l328_c8_fd31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l328_c8_fd31_left <= VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_left;
     BIN_OP_EQ_uxn_device_h_l328_c8_fd31_right <= VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output := BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l360_c22_ba25] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_left <= VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_left;
     BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_right <= VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_return_output := BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_return_output;

     -- MUX[uxn_device_h_l326_c39_4b72] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l326_c39_4b72_cond <= VAR_MUX_uxn_device_h_l326_c39_4b72_cond;
     MUX_uxn_device_h_l326_c39_4b72_iftrue <= VAR_MUX_uxn_device_h_l326_c39_4b72_iftrue;
     MUX_uxn_device_h_l326_c39_4b72_iffalse <= VAR_MUX_uxn_device_h_l326_c39_4b72_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l326_c39_4b72_return_output := MUX_uxn_device_h_l326_c39_4b72_return_output;

     -- CONST_SR_8[uxn_device_h_l347_c33_2061] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l347_c33_2061_x <= VAR_CONST_SR_8_uxn_device_h_l347_c33_2061_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l347_c33_2061_return_output := CONST_SR_8_uxn_device_h_l347_c33_2061_return_output;

     -- uint8_5_5[uxn_device_h_l302_c12_286b] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l302_c12_286b_return_output := uint8_5_5(
     VAR_previous_device_ram_read);

     -- uint8_4_4[uxn_device_h_l303_c12_dfca] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l303_c12_dfca_return_output := uint8_4_4(
     VAR_previous_device_ram_read);

     -- BIN_OP_MINUS[uxn_device_h_l349_c22_68cc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_left <= VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_left;
     BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_right <= VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_return_output := BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l277_c11_acea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l277_c11_acea_left <= VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_left;
     BIN_OP_EQ_uxn_device_h_l277_c11_acea_right <= VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output := BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l360_c9_858b] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l360_c9_858b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l294_c11_1dc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_left <= VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_left;
     BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_right <= VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output := BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l295_l281_l308_l286_l313_l290_DUPLICATE_fc03 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l295_l281_l308_l286_l313_l290_DUPLICATE_fc03_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_MINUS[uxn_device_h_l354_c22_cbfc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_left <= VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_left;
     BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_right <= VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_return_output := BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l289_c7_66c7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l289_c7_66c7_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(47, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l294_c7_3246] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l294_c7_3246_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(44, 8));

     -- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_left <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_left;
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_right <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output := BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output;

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l365_c9_0b35] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l365_c9_0b35_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output := screen_blit_result.is_blit_done;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l307_c7_eeac] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l307_c7_eeac_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l298_c7_acf2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l298_c7_acf2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(45, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l280_c7_4b5a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_4b5a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- uint8_3_0[uxn_device_h_l304_c11_df7b] LATENCY=0
     VAR_uint8_3_0_uxn_device_h_l304_c11_df7b_return_output := uint8_3_0(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l285_c11_5494] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l285_c11_5494_left <= VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_left;
     BIN_OP_EQ_uxn_device_h_l285_c11_5494_right <= VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output := BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l328_c4_f456] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l328_c4_f456_return_output := result.is_vram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l285_c7_5ad9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l285_c7_5ad9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l277_c7_b744] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l277_c7_b744_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_EQ[uxn_device_h_l312_c11_c935] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l312_c11_c935_left <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_left;
     BIN_OP_EQ_uxn_device_h_l312_c11_c935_right <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output := BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l363_c23_dad9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l363_c23_dad9_return_output := CAST_TO_uint8_t_uint16_t(
     ram_addr);

     -- BIN_OP_EQ[uxn_device_h_l307_c11_e458] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c11_e458_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_left;
     BIN_OP_EQ_uxn_device_h_l307_c11_e458_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output := BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l366_c5_a455] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l366_c5_a455_left <= VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_left;
     BIN_OP_PLUS_uxn_device_h_l366_c5_a455_right <= VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_return_output := BIN_OP_PLUS_uxn_device_h_l366_c5_a455_return_output;

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l328_c4_f456] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l328_c4_f456_return_output := result.u16_addr;

     -- BIN_OP_EQ[uxn_device_h_l298_c11_be6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l298_c11_be6b_left <= VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_left;
     BIN_OP_EQ_uxn_device_h_l298_c11_be6b_right <= VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output := BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;

     -- uint8_6_6[uxn_device_h_l301_c11_d256] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l301_c11_d256_return_output := uint8_6_6(
     VAR_previous_device_ram_read);

     -- BIN_OP_MINUS[uxn_device_h_l344_c22_0766] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l344_c22_0766_left <= VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_left;
     BIN_OP_MINUS_uxn_device_h_l344_c22_0766_right <= VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_return_output := BIN_OP_MINUS_uxn_device_h_l344_c22_0766_return_output;

     -- BIN_OP_EQ[uxn_device_h_l280_c11_f982] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l280_c11_f982_left <= VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_left;
     BIN_OP_EQ_uxn_device_h_l280_c11_f982_right <= VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output := BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output := result.is_deo_done;

     -- BIN_OP_MINUS[uxn_device_h_l339_c22_0c0f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_left <= VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_left;
     BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_right <= VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_return_output := BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l322_c18_a813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l322_c18_a813_left <= VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_left;
     BIN_OP_EQ_uxn_device_h_l322_c18_a813_right <= VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_return_output := BIN_OP_EQ_uxn_device_h_l322_c18_a813_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l388_c60_833e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l388_c60_833e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_left;
     BIN_OP_PLUS_uxn_device_h_l388_c60_833e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_return_output := BIN_OP_PLUS_uxn_device_h_l388_c60_833e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l270_c6_1727] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l270_c6_1727_left <= VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_left;
     BIN_OP_EQ_uxn_device_h_l270_c6_1727_right <= VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output := BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l365_c9_0b35] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l365_c9_0b35_return_output := result.is_device_ram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l270_c2_c6b9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l270_c2_c6b9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- uint8_7_7[uxn_device_h_l300_c15_7a09] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l300_c15_7a09_return_output := uint8_7_7(
     VAR_previous_device_ram_read);

     -- CAST_TO_uint8_t[uxn_device_h_l352_c23_d681] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l352_c23_d681_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_color_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_result_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_x_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_y_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c6_1727_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_color_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_layer_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_result_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_x_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_y_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond := VAR_BIN_OP_EQ_uxn_device_h_l277_c11_acea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_color_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_y_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_f982_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_color_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_result_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_x_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_y_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond := VAR_BIN_OP_EQ_uxn_device_h_l285_c11_5494_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_color_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_layer_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_result_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_x_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_y_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l289_c11_0c80_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_color_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_layer_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_result_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_x_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_y_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond := VAR_BIN_OP_EQ_uxn_device_h_l294_c11_1dc9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_color_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_layer_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_result_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_x_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_y_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond := VAR_BIN_OP_EQ_uxn_device_h_l298_c11_be6b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_x_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_y_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_e458_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_x_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_y_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c935_return_output;
     VAR_MUX_uxn_device_h_l322_c18_9dcb_cond := VAR_BIN_OP_EQ_uxn_device_h_l322_c18_a813_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_x_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_y_MUX_uxn_device_h_l328_c4_f456_cond := VAR_BIN_OP_EQ_uxn_device_h_l328_c8_fd31_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_right := VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_0c0f_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_right := VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_0766_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_right := VAR_BIN_OP_MINUS_uxn_device_h_l349_c22_68cc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_right := VAR_BIN_OP_MINUS_uxn_device_h_l354_c22_cbfc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_right := VAR_BIN_OP_MINUS_uxn_device_h_l360_c22_ba25_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_right := VAR_BIN_OP_MINUS_uxn_device_h_l365_c22_4a0c_return_output;
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l376_l374_DUPLICATE_b48f_return_output;
     VAR_tmp4_uxn_device_h_l366_c5_e2a1 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l366_c5_a455_return_output, 4);
     VAR_MUX_uxn_device_h_l388_c11_7375_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l388_c60_833e_return_output, 12);
     VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l295_l281_l308_l286_l313_l290_DUPLICATE_fc03_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l295_l281_l308_l286_l313_l290_DUPLICATE_fc03_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l295_l281_l308_l286_l313_l290_DUPLICATE_fc03_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l295_l281_l308_l286_l313_l290_DUPLICATE_fc03_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_770b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l352_c23_d681_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l363_c23_dad9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_b0b9_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l365_l360_l349_l354_l344_l339_l328_DUPLICATE_6468_return_output;
     VAR_MUX_uxn_device_h_l326_c20_93e1_iftrue := VAR_MUX_uxn_device_h_l326_c39_4b72_return_output;
     VAR_result_MUX_uxn_device_h_l277_c7_b744_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l277_c7_b744_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_result_MUX_uxn_device_h_l289_c7_66c7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l289_c7_66c7_return_output;
     VAR_result_MUX_uxn_device_h_l294_c7_3246_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l294_c7_3246_return_output;
     VAR_result_MUX_uxn_device_h_l298_c7_acf2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l298_c7_acf2_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_eeac_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l307_c7_eeac_return_output;
     VAR_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l365_c9_0b35_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l365_c9_0b35_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l328_c4_f456_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l328_c4_f456_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l360_c9_858b_return_output;
     VAR_color_MUX_uxn_device_h_l298_c7_acf2_iftrue := VAR_uint8_3_0_uxn_device_h_l304_c11_df7b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_iftrue := VAR_uint8_4_4_uxn_device_h_l303_c12_dfca_return_output;
     VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_iftrue := VAR_uint8_5_5_uxn_device_h_l302_c12_286b_return_output;
     VAR_layer_MUX_uxn_device_h_l298_c7_acf2_iftrue := VAR_uint8_6_6_uxn_device_h_l301_c11_d256_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iftrue := VAR_uint8_7_7_uxn_device_h_l300_c15_7a09_return_output;
     VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_iftrue := VAR_tmp4_uxn_device_h_l366_c5_e2a1;
     -- BIN_OP_OR[uxn_device_h_l313_c3_563d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l313_c3_563d_left <= VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_left;
     BIN_OP_OR_uxn_device_h_l313_c3_563d_right <= VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_return_output := BIN_OP_OR_uxn_device_h_l313_c3_563d_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output := CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l365_c13_6917] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l365_c13_6917_left <= VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_left;
     BIN_OP_EQ_uxn_device_h_l365_c13_6917_right <= VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output := BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_cond;
     result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_return_output := result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- ctrl_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_cond;
     ctrl_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     ctrl_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_return_output := ctrl_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- BIN_OP_OR[uxn_device_h_l286_c3_88db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l286_c3_88db_left <= VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_left;
     BIN_OP_OR_uxn_device_h_l286_c3_88db_right <= VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_return_output := BIN_OP_OR_uxn_device_h_l286_c3_88db_return_output;

     -- MUX[uxn_device_h_l322_c18_9dcb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l322_c18_9dcb_cond <= VAR_MUX_uxn_device_h_l322_c18_9dcb_cond;
     MUX_uxn_device_h_l322_c18_9dcb_iftrue <= VAR_MUX_uxn_device_h_l322_c18_9dcb_iftrue;
     MUX_uxn_device_h_l322_c18_9dcb_iffalse <= VAR_MUX_uxn_device_h_l322_c18_9dcb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l322_c18_9dcb_return_output := MUX_uxn_device_h_l322_c18_9dcb_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l347_c23_d8cf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l347_c23_d8cf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l347_c33_2061_return_output);

     -- BIN_OP_EQ[uxn_device_h_l349_c13_a6cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_left <= VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_left;
     BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_right <= VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output := BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l354_c13_a61e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l354_c13_a61e_left <= VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_left;
     BIN_OP_EQ_uxn_device_h_l354_c13_a61e_right <= VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output := BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;

     -- BIN_OP_OR[uxn_device_h_l295_c3_3e63] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l295_c3_3e63_left <= VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_left;
     BIN_OP_OR_uxn_device_h_l295_c3_3e63_right <= VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_return_output := BIN_OP_OR_uxn_device_h_l295_c3_3e63_return_output;

     -- BIN_OP_EQ[uxn_device_h_l339_c13_f4ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_left <= VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_left;
     BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_right <= VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output := BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_cond;
     result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iftrue;
     result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_return_output := result_u16_addr_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- BIN_OP_EQ[uxn_device_h_l344_c13_7d3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_left <= VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_left;
     BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_right <= VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output := BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_cond;
     ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_return_output := ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- layer_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_layer_MUX_uxn_device_h_l298_c7_acf2_cond;
     layer_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_layer_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     layer_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_layer_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l298_c7_acf2_return_output := layer_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- color_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_color_MUX_uxn_device_h_l298_c7_acf2_cond;
     color_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_color_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     color_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_color_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l298_c7_acf2_return_output := color_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- flip_y_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_cond;
     flip_y_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     flip_y_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_return_output := flip_y_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- flip_x_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_cond;
     flip_x_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     flip_x_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_return_output := flip_x_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l360_c13_fb96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l360_c13_fb96_left <= VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_left;
     BIN_OP_EQ_uxn_device_h_l360_c13_fb96_right <= VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output := BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output;

     -- Submodule level 2
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_f4ea_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_7d3b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;
     VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_cond := VAR_BIN_OP_EQ_uxn_device_h_l349_c13_a6cc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;
     VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_cond := VAR_BIN_OP_EQ_uxn_device_h_l354_c13_a61e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output;
     VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_cond := VAR_BIN_OP_EQ_uxn_device_h_l360_c13_fb96_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output;
     VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c13_6917_return_output;
     VAR_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue := VAR_BIN_OP_OR_uxn_device_h_l286_c3_88db_return_output;
     VAR_y_MUX_uxn_device_h_l294_c7_3246_iftrue := VAR_BIN_OP_OR_uxn_device_h_l295_c3_3e63_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_iftrue := VAR_BIN_OP_OR_uxn_device_h_l313_c3_563d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l347_c23_d8cf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output;
     VAR_y_MUX_uxn_device_h_l289_c7_66c7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l309_l282_l291_DUPLICATE_65b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_MUX_uxn_device_h_l322_c18_9dcb_return_output;
     VAR_color_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_color_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_ctrl_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_flip_x_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_flip_y_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_layer_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_layer_MUX_uxn_device_h_l298_c7_acf2_return_output;
     -- flip_y_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_cond;
     flip_y_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_iftrue;
     flip_y_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_return_output := flip_y_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_cond;
     ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iftrue;
     ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_return_output := ctrl_mode_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- result_u8_value_MUX[uxn_device_h_l360_c9_858b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l360_c9_858b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_cond;
     result_u8_value_MUX_uxn_device_h_l360_c9_858b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_iftrue;
     result_u8_value_MUX_uxn_device_h_l360_c9_858b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_return_output := result_u8_value_MUX_uxn_device_h_l360_c9_858b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l365_c9_0b35] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_cond;
     result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_return_output := result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_return_output;

     -- uint8_1_1[uxn_device_h_l325_c19_3aa7] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l325_c19_3aa7_return_output := uint8_1_1(
     VAR_MUX_uxn_device_h_l322_c18_9dcb_return_output);

     -- tmp4_MUX[uxn_device_h_l365_c9_0b35] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l365_c9_0b35_cond <= VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_cond;
     tmp4_MUX_uxn_device_h_l365_c9_0b35_iftrue <= VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_iftrue;
     tmp4_MUX_uxn_device_h_l365_c9_0b35_iffalse <= VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_return_output := tmp4_MUX_uxn_device_h_l365_c9_0b35_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l365_c9_0b35] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_return_output;

     -- uint8_7_4[uxn_device_h_l323_c17_7ea4] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l323_c17_7ea4_return_output := uint8_7_4(
     VAR_MUX_uxn_device_h_l322_c18_9dcb_return_output);

     -- uint8_2_2[uxn_device_h_l326_c20_8311] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l326_c20_8311_return_output := uint8_2_2(
     VAR_MUX_uxn_device_h_l322_c18_9dcb_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- auto_advance_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_cond;
     auto_advance_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     auto_advance_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_return_output := auto_advance_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- flip_x_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_cond;
     flip_x_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_iftrue;
     flip_x_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_return_output := flip_x_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- color_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_color_MUX_uxn_device_h_l294_c7_3246_cond;
     color_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_color_MUX_uxn_device_h_l294_c7_3246_iftrue;
     color_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_color_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l294_c7_3246_return_output := color_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- layer_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_layer_MUX_uxn_device_h_l294_c7_3246_cond;
     layer_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_layer_MUX_uxn_device_h_l294_c7_3246_iftrue;
     layer_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_layer_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l294_c7_3246_return_output := layer_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- uint8_0_0[uxn_device_h_l324_c19_d845] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l324_c19_d845_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l322_c18_9dcb_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l365_c9_0b35] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_cond;
     result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_return_output := result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_return_output;

     -- ctrl_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_cond;
     ctrl_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_iftrue;
     ctrl_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_return_output := ctrl_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l365_c9_0b35] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_return_output := result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_auto_advance_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_color_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_color_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_ctrl_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_flip_x_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_flip_y_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_layer_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_layer_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l365_c9_0b35_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l365_c9_0b35_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l365_c9_0b35_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l360_c9_858b_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l365_c9_0b35_return_output;
     VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_iffalse := VAR_tmp4_MUX_uxn_device_h_l365_c9_0b35_return_output;
     VAR_MUX_uxn_device_h_l324_c19_d566_cond := VAR_uint8_0_0_uxn_device_h_l324_c19_d845_return_output;
     VAR_MUX_uxn_device_h_l325_c19_8f09_cond := VAR_uint8_1_1_uxn_device_h_l325_c19_3aa7_return_output;
     VAR_MUX_uxn_device_h_l326_c20_93e1_cond := VAR_uint8_2_2_uxn_device_h_l326_c20_8311_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_left := VAR_uint8_7_4_uxn_device_h_l323_c17_7ea4_return_output;
     VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_uint8_7_4_uxn_device_h_l323_c17_7ea4_return_output;
     -- flip_y_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_cond;
     flip_y_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     flip_y_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_return_output := flip_y_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- color_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_color_MUX_uxn_device_h_l289_c7_66c7_cond;
     color_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_color_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     color_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_color_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l289_c7_66c7_return_output := color_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- auto_length_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_cond;
     auto_length_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     auto_length_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_return_output := auto_length_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- MUX[uxn_device_h_l324_c19_d566] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l324_c19_d566_cond <= VAR_MUX_uxn_device_h_l324_c19_d566_cond;
     MUX_uxn_device_h_l324_c19_d566_iftrue <= VAR_MUX_uxn_device_h_l324_c19_d566_iftrue;
     MUX_uxn_device_h_l324_c19_d566_iffalse <= VAR_MUX_uxn_device_h_l324_c19_d566_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l324_c19_d566_return_output := MUX_uxn_device_h_l324_c19_d566_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l360_c9_858b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_return_output;

     -- auto_advance_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_cond;
     auto_advance_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     auto_advance_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_return_output := auto_advance_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l360_c9_858b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_cond;
     result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_return_output := result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_return_output;

     -- flip_x_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_cond;
     flip_x_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     flip_x_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_return_output := flip_x_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- MUX[uxn_device_h_l325_c19_8f09] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l325_c19_8f09_cond <= VAR_MUX_uxn_device_h_l325_c19_8f09_cond;
     MUX_uxn_device_h_l325_c19_8f09_iftrue <= VAR_MUX_uxn_device_h_l325_c19_8f09_iftrue;
     MUX_uxn_device_h_l325_c19_8f09_iffalse <= VAR_MUX_uxn_device_h_l325_c19_8f09_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l325_c19_8f09_return_output := MUX_uxn_device_h_l325_c19_8f09_return_output;

     -- ctrl_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_cond;
     ctrl_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     ctrl_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_return_output := ctrl_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l360_c9_858b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_cond;
     result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_return_output := result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_return_output;

     -- layer_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_layer_MUX_uxn_device_h_l289_c7_66c7_cond;
     layer_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_layer_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     layer_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_layer_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l289_c7_66c7_return_output := layer_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- tmp4_MUX[uxn_device_h_l360_c9_858b] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l360_c9_858b_cond <= VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_cond;
     tmp4_MUX_uxn_device_h_l360_c9_858b_iftrue <= VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_iftrue;
     tmp4_MUX_uxn_device_h_l360_c9_858b_iffalse <= VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_return_output := tmp4_MUX_uxn_device_h_l360_c9_858b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l385_c19_c70b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l385_c19_c70b_left <= VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_left;
     BIN_OP_EQ_uxn_device_h_l385_c19_c70b_right <= VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_return_output := BIN_OP_EQ_uxn_device_h_l385_c19_c70b_return_output;

     -- MUX[uxn_device_h_l326_c20_93e1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l326_c20_93e1_cond <= VAR_MUX_uxn_device_h_l326_c20_93e1_cond;
     MUX_uxn_device_h_l326_c20_93e1_iftrue <= VAR_MUX_uxn_device_h_l326_c20_93e1_iftrue;
     MUX_uxn_device_h_l326_c20_93e1_iffalse <= VAR_MUX_uxn_device_h_l326_c20_93e1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l326_c20_93e1_return_output := MUX_uxn_device_h_l326_c20_93e1_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_cond;
     ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_return_output := ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l360_c9_858b] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l385_c19_c122_cond := VAR_BIN_OP_EQ_uxn_device_h_l385_c19_c70b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_right := VAR_MUX_uxn_device_h_l324_c19_d566_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_right := VAR_MUX_uxn_device_h_l324_c19_d566_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_right := VAR_MUX_uxn_device_h_l324_c19_d566_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_right := VAR_MUX_uxn_device_h_l324_c19_d566_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_MUX_uxn_device_h_l324_c19_d566_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_right := VAR_MUX_uxn_device_h_l325_c19_8f09_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_right := VAR_MUX_uxn_device_h_l325_c19_8f09_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_right := VAR_MUX_uxn_device_h_l325_c19_8f09_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_right := VAR_MUX_uxn_device_h_l325_c19_8f09_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_MUX_uxn_device_h_l325_c19_8f09_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_right := VAR_MUX_uxn_device_h_l326_c20_93e1_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_MUX_uxn_device_h_l326_c20_93e1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_auto_length_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_color_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_color_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_ctrl_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_flip_x_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_flip_y_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_layer_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l360_c9_858b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l360_c9_858b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l360_c9_858b_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l360_c9_858b_return_output;
     VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_iffalse := VAR_tmp4_MUX_uxn_device_h_l360_c9_858b_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l330_c24_bb92] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_left <= VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_left;
     BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_right <= VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_return_output := BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l354_c9_2ecf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_cond;
     result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_return_output := result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond;
     y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output := y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- flip_y_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_cond;
     flip_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     flip_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_return_output := flip_y_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l332_c36_5b2b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_left <= VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_left;
     BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_right <= VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_return_output := BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- auto_length_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_cond;
     auto_length_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     auto_length_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_return_output := auto_length_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l329_c23_7391] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l329_c23_7391_left <= VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_left;
     BIN_OP_MINUS_uxn_device_h_l329_c23_7391_right <= VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_return_output := BIN_OP_MINUS_uxn_device_h_l329_c23_7391_return_output;

     -- tmp4_MUX[uxn_device_h_l354_c9_2ecf] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l354_c9_2ecf_cond <= VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_cond;
     tmp4_MUX_uxn_device_h_l354_c9_2ecf_iftrue <= VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_iftrue;
     tmp4_MUX_uxn_device_h_l354_c9_2ecf_iffalse <= VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_return_output := tmp4_MUX_uxn_device_h_l354_c9_2ecf_return_output;

     -- flip_x_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_cond;
     flip_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     flip_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_return_output := flip_x_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_cond;
     ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_return_output := ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l354_c9_2ecf] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_return_output;

     -- color_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_color_MUX_uxn_device_h_l285_c7_5ad9_cond;
     color_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_color_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     color_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_color_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l285_c7_5ad9_return_output := color_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- layer_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_cond;
     layer_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     layer_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_return_output := layer_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- auto_advance_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_cond;
     auto_advance_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     auto_advance_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_return_output := auto_advance_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l354_c9_2ecf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_cond;
     result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_return_output := result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l354_c9_2ecf] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_return_output := result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_return_output;

     -- MUX[uxn_device_h_l385_c19_c122] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l385_c19_c122_cond <= VAR_MUX_uxn_device_h_l385_c19_c122_cond;
     MUX_uxn_device_h_l385_c19_c122_iftrue <= VAR_MUX_uxn_device_h_l385_c19_c122_iftrue;
     MUX_uxn_device_h_l385_c19_c122_iffalse <= VAR_MUX_uxn_device_h_l385_c19_c122_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l385_c19_c122_return_output := MUX_uxn_device_h_l385_c19_c122_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l332_c58_37fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_left;
     BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_return_output := BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l331_c36_a76e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_left;
     BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_return_output := BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_cond;
     x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output := x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l329_c49_5123] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l329_c49_5123_left <= VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_left;
     BIN_OP_PLUS_uxn_device_h_l329_c49_5123_right <= VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_return_output := BIN_OP_PLUS_uxn_device_h_l329_c49_5123_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l355_c5_0f61] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_left <= VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_left;
     BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_right <= VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_return_output := BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_cond;
     ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_return_output := ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l331_c58_e2b2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_left <= VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_left;
     BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_right <= VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_return_output := BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_return_output;

     -- ctrl_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_cond;
     ctrl_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     ctrl_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_return_output := ctrl_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l330_c51_e997] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l330_c51_e997_left <= VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_left;
     BIN_OP_PLUS_uxn_device_h_l330_c51_e997_right <= VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_return_output := BIN_OP_PLUS_uxn_device_h_l330_c51_e997_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l329_c13_d8bc_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l329_c23_7391_return_output;
     VAR_MUX_uxn_device_h_l330_c14_592d_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l330_c24_bb92_return_output;
     VAR_MUX_uxn_device_h_l331_c26_acb2_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l331_c36_a76e_return_output;
     VAR_MUX_uxn_device_h_l332_c26_899b_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l332_c36_5b2b_return_output;
     VAR_MUX_uxn_device_h_l329_c13_d8bc_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l329_c49_5123_return_output, 16);
     VAR_MUX_uxn_device_h_l330_c14_592d_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l330_c51_e997_return_output, 16);
     VAR_MUX_uxn_device_h_l331_c26_acb2_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l331_c58_e2b2_return_output, 16);
     VAR_MUX_uxn_device_h_l332_c26_899b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l332_c58_37fd_return_output, 16);
     VAR_ram_addr_uxn_device_h_l355_c5_585a := resize(VAR_BIN_OP_PLUS_uxn_device_h_l355_c5_0f61_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iffalse := VAR_MUX_uxn_device_h_l385_c19_c122_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_auto_advance_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_auto_length_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_color_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_color_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_ctrl_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_flip_x_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_flip_y_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_layer_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l354_c9_2ecf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l354_c9_2ecf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l354_c9_2ecf_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l354_c9_2ecf_return_output;
     VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_iffalse := VAR_tmp4_MUX_uxn_device_h_l354_c9_2ecf_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_CONST_SR_8_uxn_device_h_l358_c33_73b0_x := VAR_ram_addr_uxn_device_h_l355_c5_585a;
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iftrue := VAR_ram_addr_uxn_device_h_l355_c5_585a;
     -- y_sprite_incr_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond;
     y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output := y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- CONST_SR_8[uxn_device_h_l358_c33_73b0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l358_c33_73b0_x <= VAR_CONST_SR_8_uxn_device_h_l358_c33_73b0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l358_c33_73b0_return_output := CONST_SR_8_uxn_device_h_l358_c33_73b0_return_output;

     -- MUX[uxn_device_h_l331_c26_acb2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l331_c26_acb2_cond <= VAR_MUX_uxn_device_h_l331_c26_acb2_cond;
     MUX_uxn_device_h_l331_c26_acb2_iftrue <= VAR_MUX_uxn_device_h_l331_c26_acb2_iftrue;
     MUX_uxn_device_h_l331_c26_acb2_iffalse <= VAR_MUX_uxn_device_h_l331_c26_acb2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l331_c26_acb2_return_output := MUX_uxn_device_h_l331_c26_acb2_return_output;

     -- flip_x_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_cond;
     flip_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     flip_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_return_output := flip_x_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_cond;
     x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output := x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- MUX[uxn_device_h_l332_c26_899b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l332_c26_899b_cond <= VAR_MUX_uxn_device_h_l332_c26_899b_cond;
     MUX_uxn_device_h_l332_c26_899b_iftrue <= VAR_MUX_uxn_device_h_l332_c26_899b_iftrue;
     MUX_uxn_device_h_l332_c26_899b_iffalse <= VAR_MUX_uxn_device_h_l332_c26_899b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l332_c26_899b_return_output := MUX_uxn_device_h_l332_c26_899b_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_cond;
     ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_return_output := ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- MUX[uxn_device_h_l330_c14_592d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l330_c14_592d_cond <= VAR_MUX_uxn_device_h_l330_c14_592d_cond;
     MUX_uxn_device_h_l330_c14_592d_iftrue <= VAR_MUX_uxn_device_h_l330_c14_592d_iftrue;
     MUX_uxn_device_h_l330_c14_592d_iffalse <= VAR_MUX_uxn_device_h_l330_c14_592d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l330_c14_592d_return_output := MUX_uxn_device_h_l330_c14_592d_return_output;

     -- ram_addr_MUX[uxn_device_h_l354_c9_2ecf] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l354_c9_2ecf_cond <= VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_cond;
     ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iftrue;
     ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_return_output := ram_addr_MUX_uxn_device_h_l354_c9_2ecf_return_output;

     -- auto_advance_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_cond;
     auto_advance_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_iftrue;
     auto_advance_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_return_output := auto_advance_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- is_last_blit_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_cond;
     is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_return_output := is_last_blit_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- auto_length_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_cond;
     auto_length_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     auto_length_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_return_output := auto_length_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- color_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_color_MUX_uxn_device_h_l280_c7_4b5a_cond;
     color_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_color_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     color_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_color_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l280_c7_4b5a_return_output := color_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- ctrl_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_cond;
     ctrl_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     ctrl_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_return_output := ctrl_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- MUX[uxn_device_h_l329_c13_d8bc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l329_c13_d8bc_cond <= VAR_MUX_uxn_device_h_l329_c13_d8bc_cond;
     MUX_uxn_device_h_l329_c13_d8bc_iftrue <= VAR_MUX_uxn_device_h_l329_c13_d8bc_iftrue;
     MUX_uxn_device_h_l329_c13_d8bc_iffalse <= VAR_MUX_uxn_device_h_l329_c13_d8bc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l329_c13_d8bc_return_output := MUX_uxn_device_h_l329_c13_d8bc_return_output;

     -- tmp4_MUX[uxn_device_h_l349_c9_1573] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l349_c9_1573_cond <= VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_cond;
     tmp4_MUX_uxn_device_h_l349_c9_1573_iftrue <= VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_iftrue;
     tmp4_MUX_uxn_device_h_l349_c9_1573_iffalse <= VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_return_output := tmp4_MUX_uxn_device_h_l349_c9_1573_return_output;

     -- flip_y_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_cond;
     flip_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     flip_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_return_output := flip_y_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l349_c9_1573] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_cond;
     result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_return_output := result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_return_output;

     -- layer_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_cond;
     layer_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     layer_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_return_output := layer_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l349_c9_1573] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_cond;
     result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_return_output := result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l349_c9_1573] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_return_output := result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l349_c9_1573] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_cond;
     ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_return_output := ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_MUX_uxn_device_h_l329_c13_d8bc_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_MUX_uxn_device_h_l330_c14_592d_return_output;
     VAR_MUX_uxn_device_h_l331_c10_1821_iftrue := VAR_MUX_uxn_device_h_l331_c26_acb2_return_output;
     VAR_MUX_uxn_device_h_l332_c10_a2f0_iftrue := VAR_MUX_uxn_device_h_l332_c26_899b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_auto_length_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_color_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_color_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_ctrl_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_flip_x_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_flip_y_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_layer_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_layer_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_iffalse := VAR_ram_addr_MUX_uxn_device_h_l354_c9_2ecf_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l349_c9_1573_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l349_c9_1573_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l349_c9_1573_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l349_c9_1573_return_output;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_iffalse := VAR_tmp4_MUX_uxn_device_h_l349_c9_1573_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l307_c7_eeac_return_output;
     -- ctrl_mode_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_cond;
     ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iftrue;
     ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_return_output := ctrl_mode_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- flip_y_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_cond;
     flip_y_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_iftrue;
     flip_y_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_return_output := flip_y_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- auto_length_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_cond;
     auto_length_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_iftrue;
     auto_length_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_return_output := auto_length_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- tmp4_MUX[uxn_device_h_l344_c9_4026] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l344_c9_4026_cond <= VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_cond;
     tmp4_MUX_uxn_device_h_l344_c9_4026_iftrue <= VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_iftrue;
     tmp4_MUX_uxn_device_h_l344_c9_4026_iffalse <= VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_return_output := tmp4_MUX_uxn_device_h_l344_c9_4026_return_output;

     -- auto_advance_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_cond;
     auto_advance_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     auto_advance_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_return_output := auto_advance_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- color_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_color_MUX_uxn_device_h_l277_c7_b744_cond;
     color_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_color_MUX_uxn_device_h_l277_c7_b744_iftrue;
     color_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_color_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l277_c7_b744_return_output := color_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- tmp16b_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_cond;
     tmp16b_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_iftrue;
     tmp16b_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_return_output := tmp16b_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- layer_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_layer_MUX_uxn_device_h_l277_c7_b744_cond;
     layer_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_layer_MUX_uxn_device_h_l277_c7_b744_iftrue;
     layer_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_layer_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l277_c7_b744_return_output := layer_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- flip_x_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_cond;
     flip_x_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_iftrue;
     flip_x_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_return_output := flip_x_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l344_c9_4026] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_return_output;

     -- MUX[uxn_device_h_l331_c10_1821] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l331_c10_1821_cond <= VAR_MUX_uxn_device_h_l331_c10_1821_cond;
     MUX_uxn_device_h_l331_c10_1821_iftrue <= VAR_MUX_uxn_device_h_l331_c10_1821_iftrue;
     MUX_uxn_device_h_l331_c10_1821_iffalse <= VAR_MUX_uxn_device_h_l331_c10_1821_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l331_c10_1821_return_output := MUX_uxn_device_h_l331_c10_1821_return_output;

     -- MUX[uxn_device_h_l332_c10_a2f0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l332_c10_a2f0_cond <= VAR_MUX_uxn_device_h_l332_c10_a2f0_cond;
     MUX_uxn_device_h_l332_c10_a2f0_iftrue <= VAR_MUX_uxn_device_h_l332_c10_a2f0_iftrue;
     MUX_uxn_device_h_l332_c10_a2f0_iffalse <= VAR_MUX_uxn_device_h_l332_c10_a2f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l332_c10_a2f0_return_output := MUX_uxn_device_h_l332_c10_a2f0_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond;
     y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output := y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- is_last_blit_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_cond;
     is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_return_output := is_last_blit_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l358_c23_87c8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l358_c23_87c8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l358_c33_73b0_return_output);

     -- result_device_ram_address_MUX[uxn_device_h_l344_c9_4026] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_cond;
     result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_return_output := result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l344_c9_4026] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_cond;
     result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_return_output := result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_cond;
     x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output := x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- ram_addr_MUX[uxn_device_h_l349_c9_1573] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l349_c9_1573_cond <= VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_cond;
     ram_addr_MUX_uxn_device_h_l349_c9_1573_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_iftrue;
     ram_addr_MUX_uxn_device_h_l349_c9_1573_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_return_output := ram_addr_MUX_uxn_device_h_l349_c9_1573_return_output;

     -- ctrl_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_cond;
     ctrl_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_iftrue;
     ctrl_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_return_output := ctrl_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- tmp16_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_cond;
     tmp16_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_iftrue;
     tmp16_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_return_output := tmp16_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_cond;
     ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_return_output := ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l344_c9_4026] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_return_output := result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l358_c23_87c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_CONST_SR_8_uxn_device_h_l337_c33_070d_x := VAR_MUX_uxn_device_h_l331_c10_1821_return_output;
     VAR_x_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_MUX_uxn_device_h_l331_c10_1821_return_output;
     VAR_y_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_MUX_uxn_device_h_l332_c10_a2f0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_auto_length_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_color_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_color_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_ctrl_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_flip_x_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_flip_y_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_layer_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_iffalse := VAR_ram_addr_MUX_uxn_device_h_l349_c9_1573_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_4026_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_4026_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_4026_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_4026_return_output;
     VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_tmp16_MUX_uxn_device_h_l328_c4_f456_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_tmp16b_MUX_uxn_device_h_l328_c4_f456_return_output;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_iffalse := VAR_tmp4_MUX_uxn_device_h_l344_c9_4026_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l298_c7_acf2_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l339_c9_2726] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_cond;
     result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_return_output := result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond;
     x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output := x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_cond;
     ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_return_output := ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- x_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_x_MUX_uxn_device_h_l328_c4_f456_cond;
     x_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_x_MUX_uxn_device_h_l328_c4_f456_iftrue;
     x_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_x_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l328_c4_f456_return_output := x_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- result_u8_value_MUX[uxn_device_h_l354_c9_2ecf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_cond <= VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_cond;
     result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iftrue;
     result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_return_output := result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_return_output;

     -- y_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_y_MUX_uxn_device_h_l328_c4_f456_cond;
     y_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_y_MUX_uxn_device_h_l328_c4_f456_iftrue;
     y_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_y_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l328_c4_f456_return_output := y_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- auto_advance_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_cond;
     auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_return_output := auto_advance_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- is_last_blit_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_cond;
     is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_return_output := is_last_blit_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- tmp16b_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_cond;
     tmp16b_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     tmp16b_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_return_output := tmp16b_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l339_c9_2726] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_return_output := result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_return_output;

     -- tmp4_MUX[uxn_device_h_l339_c9_2726] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l339_c9_2726_cond <= VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_cond;
     tmp4_MUX_uxn_device_h_l339_c9_2726_iftrue <= VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_iftrue;
     tmp4_MUX_uxn_device_h_l339_c9_2726_iffalse <= VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_return_output := tmp4_MUX_uxn_device_h_l339_c9_2726_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l339_c9_2726] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_cond;
     result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_return_output := result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_return_output;

     -- color_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_color_MUX_uxn_device_h_l270_c2_c6b9_cond;
     color_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_color_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     color_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_color_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l270_c2_c6b9_return_output := color_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- ram_addr_MUX[uxn_device_h_l344_c9_4026] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l344_c9_4026_cond <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_cond;
     ram_addr_MUX_uxn_device_h_l344_c9_4026_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_iftrue;
     ram_addr_MUX_uxn_device_h_l344_c9_4026_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_return_output := ram_addr_MUX_uxn_device_h_l344_c9_4026_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l339_c9_2726] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_return_output;

     -- CONST_SR_8[uxn_device_h_l337_c33_070d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l337_c33_070d_x <= VAR_CONST_SR_8_uxn_device_h_l337_c33_070d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l337_c33_070d_return_output := CONST_SR_8_uxn_device_h_l337_c33_070d_return_output;

     -- flip_x_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_cond;
     flip_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     flip_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_return_output := flip_x_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- layer_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_cond;
     layer_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     layer_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_return_output := layer_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- flip_y_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_cond;
     flip_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     flip_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_return_output := flip_y_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_cond;
     y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output := y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_cond;
     ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_return_output := ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- tmp16_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_cond;
     tmp16_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     tmp16_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_return_output := tmp16_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- auto_length_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_cond;
     auto_length_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     auto_length_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_return_output := auto_length_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- ctrl_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_cond;
     ctrl_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     ctrl_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_return_output := ctrl_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_auto_length_MUX_uxn_device_h_l289_c7_66c7_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l307_c7_eeac_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_iffalse := VAR_ram_addr_MUX_uxn_device_h_l344_c9_4026_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_2726_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_2726_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_2726_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l354_c9_2ecf_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_2726_return_output;
     VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_tmp16_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_tmp16b_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_tmp4_MUX_uxn_device_h_l339_c9_2726_return_output;
     VAR_x_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_x_MUX_uxn_device_h_l328_c4_f456_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_y_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_y_MUX_uxn_device_h_l328_c4_f456_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l294_c7_3246_return_output;
     -- ram_addr_incr_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_cond;
     ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_return_output := ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- result_u8_value_MUX[uxn_device_h_l349_c9_1573] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l349_c9_1573_cond <= VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_cond;
     result_u8_value_MUX_uxn_device_h_l349_c9_1573_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_iftrue;
     result_u8_value_MUX_uxn_device_h_l349_c9_1573_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_return_output := result_u8_value_MUX_uxn_device_h_l349_c9_1573_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_cond;
     result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_return_output := result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond;
     x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output := x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_cond;
     result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_return_output := result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- auto_advance_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_cond;
     auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_return_output := auto_advance_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- y_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_y_MUX_uxn_device_h_l327_c3_daaa_cond;
     y_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_y_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     y_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_y_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l327_c3_daaa_return_output := y_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_cond;
     y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output := y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- tmp16b_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_cond;
     tmp16b_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     tmp16b_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_return_output := tmp16b_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- ram_addr_MUX[uxn_device_h_l339_c9_2726] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l339_c9_2726_cond <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_cond;
     ram_addr_MUX_uxn_device_h_l339_c9_2726_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_iftrue;
     ram_addr_MUX_uxn_device_h_l339_c9_2726_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_return_output := ram_addr_MUX_uxn_device_h_l339_c9_2726_return_output;

     -- auto_length_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_cond;
     auto_length_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     auto_length_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_return_output := auto_length_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- tmp4_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_cond;
     tmp4_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_iftrue;
     tmp4_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_return_output := tmp4_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- tmp16_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_cond;
     tmp16_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     tmp16_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_return_output := tmp16_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_return_output := result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l337_c23_8962] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_8962_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l337_c33_070d_return_output);

     -- x_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_x_MUX_uxn_device_h_l327_c3_daaa_cond;
     x_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_x_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     x_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_x_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l327_c3_daaa_return_output := x_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- is_last_blit_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_cond;
     is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_return_output := is_last_blit_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_8962_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_auto_advance_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_auto_length_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_ram_addr_MUX_uxn_device_h_l339_c9_2726_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l349_c9_1573_return_output;
     VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_tmp16_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_tmp16b_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_tmp4_MUX_uxn_device_h_l328_c4_f456_return_output;
     VAR_x_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_x_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_y_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_y_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l289_c7_66c7_return_output;
     -- tmp16b_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_cond;
     tmp16b_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     tmp16b_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_return_output := tmp16b_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- tmp4_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_cond;
     tmp4_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     tmp4_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_return_output := tmp4_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- x_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_x_MUX_uxn_device_h_l312_c7_1c96_cond;
     x_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_x_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     x_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_x_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l312_c7_1c96_return_output := x_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_cond;
     ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output := ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond;
     y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output := y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- is_last_blit_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_cond;
     is_last_blit_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_iftrue;
     is_last_blit_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_return_output := is_last_blit_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_cond;
     x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output := x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l321_c1_3d5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_return_output;

     -- screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63[uxn_device_h_l327_c3_daaa] LATENCY=0
     VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l327_c3_daaa_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63(
     screen_blit_result,
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l328_c4_f456_return_output);

     -- tmp16_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_cond;
     tmp16_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     tmp16_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_return_output := tmp16_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- auto_length_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_cond;
     auto_length_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     auto_length_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_return_output := auto_length_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l344_c9_4026] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l344_c9_4026_cond <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_cond;
     result_u8_value_MUX_uxn_device_h_l344_c9_4026_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_iftrue;
     result_u8_value_MUX_uxn_device_h_l344_c9_4026_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_return_output := result_u8_value_MUX_uxn_device_h_l344_c9_4026_return_output;

     -- y_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_y_MUX_uxn_device_h_l312_c7_1c96_cond;
     y_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_y_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     y_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_y_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l312_c7_1c96_return_output := y_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- ram_addr_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_cond;
     ram_addr_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_iftrue;
     ram_addr_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_return_output := ram_addr_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- auto_advance_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_cond;
     auto_advance_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_iftrue;
     auto_advance_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_return_output := auto_advance_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_3d5a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_auto_length_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_ram_addr_MUX_uxn_device_h_l328_c4_f456_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l344_c9_4026_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l327_c3_daaa_return_output;
     VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_tmp16_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_tmp16b_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_tmp4_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_x_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_x_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_y_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_y_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     -- x_sprite_incr_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond;
     x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output := x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- ram_addr_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_cond;
     ram_addr_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     ram_addr_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_return_output := ram_addr_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- is_last_blit_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_cond;
     is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_return_output := is_last_blit_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- tmp4_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_cond;
     tmp4_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     tmp4_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_return_output := tmp4_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- tmp16_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_cond;
     tmp16_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     tmp16_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_return_output := tmp16_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_cond;
     ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output := ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l339_c9_2726] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l339_c9_2726_cond <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_cond;
     result_u8_value_MUX_uxn_device_h_l339_c9_2726_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_iftrue;
     result_u8_value_MUX_uxn_device_h_l339_c9_2726_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_return_output := result_u8_value_MUX_uxn_device_h_l339_c9_2726_return_output;

     -- x_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_x_MUX_uxn_device_h_l307_c7_eeac_cond;
     x_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_x_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     x_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_x_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l307_c7_eeac_return_output := x_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- tmp16b_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_cond;
     tmp16b_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     tmp16b_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_return_output := tmp16b_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- y_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_y_MUX_uxn_device_h_l307_c7_eeac_cond;
     y_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_y_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     y_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_y_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l307_c7_eeac_return_output := y_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- auto_advance_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_cond;
     auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_return_output := auto_advance_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l372_c1_bed8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output;

     -- auto_length_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_cond;
     auto_length_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_iftrue;
     auto_length_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_return_output := auto_length_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_cond;
     y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output := y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l372_c1_bed8_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_auto_length_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_ram_addr_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l339_c9_2726_return_output;
     VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_tmp16_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_tmp16b_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_tmp4_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_x_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_x_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_y_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_y_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_a6ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_return_output;

     -- auto_length_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_cond;
     auto_length_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     auto_length_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_return_output := auto_length_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l328_c4_f456] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l328_c4_f456_cond <= VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_cond;
     result_u8_value_MUX_uxn_device_h_l328_c4_f456_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_iftrue;
     result_u8_value_MUX_uxn_device_h_l328_c4_f456_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_return_output := result_u8_value_MUX_uxn_device_h_l328_c4_f456_return_output;

     -- ram_addr_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_cond;
     ram_addr_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     ram_addr_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_return_output := ram_addr_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- is_last_blit_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_cond;
     is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_return_output := is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- tmp4_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_cond;
     tmp4_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     tmp4_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_return_output := tmp4_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- tmp16b_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_cond;
     tmp16b_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_iftrue;
     tmp16b_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_return_output := tmp16b_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- x_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_x_MUX_uxn_device_h_l298_c7_acf2_cond;
     x_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_x_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     x_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_x_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l298_c7_acf2_return_output := x_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l373_c1_2f46] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond;
     x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output := x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- tmp16_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_cond;
     tmp16_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_iftrue;
     tmp16_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_return_output := tmp16_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- y_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_y_MUX_uxn_device_h_l298_c7_acf2_cond;
     y_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_y_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     y_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_y_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l298_c7_acf2_return_output := y_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_cond;
     ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_return_output := ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_cond;
     y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output := y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- Submodule level 12
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_a6ca_return_output;
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l373_c1_2f46_return_output;
     REG_VAR_auto_length := VAR_auto_length_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_ram_addr_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_tmp16_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_tmp16b_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_tmp4_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_x_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_x_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_y_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_y_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l277_c7_b744_return_output;
     -- ram_addr_incr_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_cond;
     ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output := ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- tmp16b_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_cond;
     tmp16b_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     tmp16b_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_return_output := tmp16b_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond;
     x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output := x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- ram_addr_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_cond;
     ram_addr_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     ram_addr_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_return_output := ram_addr_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_cond;
     y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output := y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- tmp4_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_cond;
     tmp4_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     tmp4_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_return_output := tmp4_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- tmp16_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_cond;
     tmp16_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     tmp16_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_return_output := tmp16_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7[uxn_device_h_l327_c3_daaa] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7_uxn_device_h_l327_c3_daaa_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39a7(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l328_c4_f456_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l328_c4_f456_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l328_c4_f456_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l328_c4_f456_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l328_c4_f456_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l328_c4_f456_return_output);

     -- x_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_x_MUX_uxn_device_h_l294_c7_3246_cond;
     x_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_x_MUX_uxn_device_h_l294_c7_3246_iftrue;
     x_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_x_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l294_c7_3246_return_output := x_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- y_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_y_MUX_uxn_device_h_l294_c7_3246_cond;
     y_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_y_MUX_uxn_device_h_l294_c7_3246_iftrue;
     y_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_y_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l294_c7_3246_return_output := y_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- screen_2bpp[uxn_device_h_l374_c26_e332] LATENCY=0
     -- Clock enable
     screen_2bpp_uxn_device_h_l374_c26_e332_CLOCK_ENABLE <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_CLOCK_ENABLE;
     -- Inputs
     screen_2bpp_uxn_device_h_l374_c26_e332_phase <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_phase;
     screen_2bpp_uxn_device_h_l374_c26_e332_x1 <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_x1;
     screen_2bpp_uxn_device_h_l374_c26_e332_y1 <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_y1;
     screen_2bpp_uxn_device_h_l374_c26_e332_color <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_color;
     screen_2bpp_uxn_device_h_l374_c26_e332_fx <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_fx;
     screen_2bpp_uxn_device_h_l374_c26_e332_fy <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_fy;
     screen_2bpp_uxn_device_h_l374_c26_e332_ram_addr <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_ram_addr;
     screen_2bpp_uxn_device_h_l374_c26_e332_previous_ram_read <= VAR_screen_2bpp_uxn_device_h_l374_c26_e332_previous_ram_read;
     -- Outputs
     VAR_screen_2bpp_uxn_device_h_l374_c26_e332_return_output := screen_2bpp_uxn_device_h_l374_c26_e332_return_output;

     -- screen_1bpp[uxn_device_h_l376_c26_636b] LATENCY=0
     -- Clock enable
     screen_1bpp_uxn_device_h_l376_c26_636b_CLOCK_ENABLE <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_CLOCK_ENABLE;
     -- Inputs
     screen_1bpp_uxn_device_h_l376_c26_636b_phase <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_phase;
     screen_1bpp_uxn_device_h_l376_c26_636b_x1 <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_x1;
     screen_1bpp_uxn_device_h_l376_c26_636b_y1 <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_y1;
     screen_1bpp_uxn_device_h_l376_c26_636b_color <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_color;
     screen_1bpp_uxn_device_h_l376_c26_636b_fx <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_fx;
     screen_1bpp_uxn_device_h_l376_c26_636b_fy <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_fy;
     screen_1bpp_uxn_device_h_l376_c26_636b_ram_addr <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_ram_addr;
     screen_1bpp_uxn_device_h_l376_c26_636b_previous_ram_read <= VAR_screen_1bpp_uxn_device_h_l376_c26_636b_previous_ram_read;
     -- Outputs
     VAR_screen_1bpp_uxn_device_h_l376_c26_636b_return_output := screen_1bpp_uxn_device_h_l376_c26_636b_return_output;

     -- is_last_blit_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_cond;
     is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_return_output := is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- Submodule level 13
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l307_c7_eeac_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_result_MUX_uxn_device_h_l327_c3_daaa_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7_uxn_device_h_l327_c3_daaa_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iffalse := VAR_screen_1bpp_uxn_device_h_l376_c26_636b_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iftrue := VAR_screen_2bpp_uxn_device_h_l374_c26_e332_return_output;
     VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_tmp16_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_tmp16b_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_tmp4_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_x_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_x_MUX_uxn_device_h_l294_c7_3246_return_output;
     REG_VAR_x_sprite_incr := VAR_x_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_y_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_y_MUX_uxn_device_h_l294_c7_3246_return_output;
     REG_VAR_y_sprite_incr := VAR_y_sprite_incr_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l373_c4_c94e] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_cond;
     screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iftrue;
     screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output := screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output;

     -- y_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_y_MUX_uxn_device_h_l289_c7_66c7_cond;
     y_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_y_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     y_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_y_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l289_c7_66c7_return_output := y_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- x_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_x_MUX_uxn_device_h_l289_c7_66c7_cond;
     x_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_x_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     x_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_x_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l289_c7_66c7_return_output := x_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- tmp16_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_cond;
     tmp16_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     tmp16_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_return_output := tmp16_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- tmp4_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_cond;
     tmp4_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_iftrue;
     tmp4_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_return_output := tmp4_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- tmp16b_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_cond;
     tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_return_output := tmp16b_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- ram_addr_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_cond;
     ram_addr_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     ram_addr_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_return_output := ram_addr_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- is_last_blit_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_cond;
     is_last_blit_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_iftrue;
     is_last_blit_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_return_output := is_last_blit_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- Submodule level 14
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_ram_addr_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_tmp16_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_tmp16b_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_tmp4_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_x_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_y_MUX_uxn_device_h_l289_c7_66c7_return_output;
     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l382_c22_92a9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l382_c22_92a9_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output.u16_addr;

     -- ram_addr_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_cond;
     ram_addr_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_iftrue;
     ram_addr_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_return_output := ram_addr_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l384_c22_8844] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l384_c22_8844_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output.u8_value;

     -- screen_blit_result_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_cond;
     screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output := screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- y_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_y_MUX_uxn_device_h_l285_c7_5ad9_cond;
     y_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_y_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     y_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_y_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l285_c7_5ad9_return_output := y_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- x_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_x_MUX_uxn_device_h_l285_c7_5ad9_cond;
     x_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_x_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     x_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_x_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l285_c7_5ad9_return_output := x_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- tmp16b_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_cond;
     tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_return_output := tmp16b_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- tmp4_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_cond;
     tmp4_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     tmp4_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_return_output := tmp4_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- tmp16_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_cond;
     tmp16_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     tmp16_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_return_output := tmp16_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- is_last_blit_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_cond;
     is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_return_output := is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l381_c27_834a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l381_c27_834a_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l373_c4_c94e_return_output.is_vram_write;

     -- Submodule level 15
     REG_VAR_is_last_blit := VAR_is_last_blit_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_ram_addr_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_tmp16_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_tmp16b_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_tmp4_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_x_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_y_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     -- tmp16_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_cond;
     tmp16_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_iftrue;
     tmp16_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_return_output := tmp16_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- x_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_x_MUX_uxn_device_h_l280_c7_4b5a_cond;
     x_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_x_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     x_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_x_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l280_c7_4b5a_return_output := x_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_cond;
     screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_return_output := screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- tmp4_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_cond;
     tmp4_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     tmp4_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_return_output := tmp4_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- tmp16b_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_cond;
     tmp16b_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_iftrue;
     tmp16b_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_return_output := tmp16b_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- ram_addr_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_cond;
     ram_addr_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     ram_addr_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_return_output := ram_addr_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- y_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_y_MUX_uxn_device_h_l280_c7_4b5a_cond;
     y_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_y_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     y_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_y_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l280_c7_4b5a_return_output := y_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l389_l388_DUPLICATE_84e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l389_l388_DUPLICATE_84e7_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c3_daaa_return_output.is_blit_done;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7[uxn_device_h_l327_c3_daaa] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l327_c3_daaa_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39b7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l379_c4_1c9c,
     to_unsigned(0, 1),
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l381_c27_834a_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l382_c22_92a9_return_output,
     layer,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l384_c22_8844_return_output);

     -- Submodule level 16
     VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_right := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l389_l388_DUPLICATE_84e7_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l389_l388_DUPLICATE_84e7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_result_MUX_uxn_device_h_l327_c3_daaa_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l327_c3_daaa_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_tmp16_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_tmp16b_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_tmp4_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_x_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_x_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_y_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_y_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     -- BIN_OP_XOR[uxn_device_h_l388_c11_ec0e] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_left <= VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_left;
     BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_right <= VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_return_output := BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_return_output;

     -- tmp16b_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_cond;
     tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_return_output := tmp16b_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- x_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_x_MUX_uxn_device_h_l277_c7_b744_cond;
     x_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_x_MUX_uxn_device_h_l277_c7_b744_iftrue;
     x_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_x_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l277_c7_b744_return_output := x_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- tmp4_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_cond;
     tmp4_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     tmp4_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_return_output := tmp4_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- tmp16_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_cond;
     tmp16_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     tmp16_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_return_output := tmp16_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- ram_addr_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_cond;
     ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_return_output := ram_addr_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- is_blit_done_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_cond;
     is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_return_output := is_blit_done_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- y_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_y_MUX_uxn_device_h_l277_c7_b744_cond;
     y_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_y_MUX_uxn_device_h_l277_c7_b744_iftrue;
     y_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_y_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l277_c7_b744_return_output := y_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- result_MUX[uxn_device_h_l327_c3_daaa] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l327_c3_daaa_cond <= VAR_result_MUX_uxn_device_h_l327_c3_daaa_cond;
     result_MUX_uxn_device_h_l327_c3_daaa_iftrue <= VAR_result_MUX_uxn_device_h_l327_c3_daaa_iftrue;
     result_MUX_uxn_device_h_l327_c3_daaa_iffalse <= VAR_result_MUX_uxn_device_h_l327_c3_daaa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l327_c3_daaa_return_output := result_MUX_uxn_device_h_l327_c3_daaa_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_cond;
     screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_return_output := screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- Submodule level 17
     VAR_MUX_uxn_device_h_l388_c11_7375_cond := VAR_BIN_OP_XOR_uxn_device_h_l388_c11_ec0e_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_result_MUX_uxn_device_h_l327_c3_daaa_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l307_c7_eeac_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     REG_VAR_tmp16b := VAR_tmp16b_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_tmp4_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_x_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_y_MUX_uxn_device_h_l277_c7_b744_return_output;
     -- tmp4_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_cond;
     tmp4_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_iftrue;
     tmp4_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_return_output := tmp4_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- y_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_y_MUX_uxn_device_h_l270_c2_c6b9_cond;
     y_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_y_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     y_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_y_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l270_c2_c6b9_return_output := y_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- result_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_result_MUX_uxn_device_h_l312_c7_1c96_cond;
     result_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_result_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     result_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_result_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l312_c7_1c96_return_output := result_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- MUX[uxn_device_h_l388_c11_7375] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l388_c11_7375_cond <= VAR_MUX_uxn_device_h_l388_c11_7375_cond;
     MUX_uxn_device_h_l388_c11_7375_iftrue <= VAR_MUX_uxn_device_h_l388_c11_7375_iftrue;
     MUX_uxn_device_h_l388_c11_7375_iffalse <= VAR_MUX_uxn_device_h_l388_c11_7375_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l388_c11_7375_return_output := MUX_uxn_device_h_l388_c11_7375_return_output;

     -- is_blit_done_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_cond;
     is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_return_output := is_blit_done_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_cond;
     screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_return_output := screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- x_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_x_MUX_uxn_device_h_l270_c2_c6b9_cond;
     x_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_x_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     x_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_x_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l270_c2_c6b9_return_output := x_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- ram_addr_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_cond;
     ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_return_output := ram_addr_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- Submodule level 18
     VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_iffalse := VAR_MUX_uxn_device_h_l388_c11_7375_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_ram_addr_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_result_MUX_uxn_device_h_l312_c7_1c96_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_tmp4_MUX_uxn_device_h_l277_c7_b744_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     -- tmp4_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_cond;
     tmp4_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     tmp4_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_return_output := tmp4_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_cond;
     screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iftrue;
     screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_return_output := screen_blit_result_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- tmp12_MUX[uxn_device_h_l312_c7_1c96] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l312_c7_1c96_cond <= VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_cond;
     tmp12_MUX_uxn_device_h_l312_c7_1c96_iftrue <= VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_iftrue;
     tmp12_MUX_uxn_device_h_l312_c7_1c96_iffalse <= VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_return_output := tmp12_MUX_uxn_device_h_l312_c7_1c96_return_output;

     -- ram_addr_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_cond;
     ram_addr_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_iftrue;
     ram_addr_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_return_output := ram_addr_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- result_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_result_MUX_uxn_device_h_l307_c7_eeac_cond;
     result_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_result_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     result_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_result_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l307_c7_eeac_return_output := result_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- is_blit_done_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_cond;
     is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_return_output := is_blit_done_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- Submodule level 19
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_result_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_result_MUX_uxn_device_h_l307_c7_eeac_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_iffalse := VAR_tmp12_MUX_uxn_device_h_l312_c7_1c96_return_output;
     REG_VAR_tmp4 := VAR_tmp4_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     -- tmp12_MUX[uxn_device_h_l307_c7_eeac] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l307_c7_eeac_cond <= VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_cond;
     tmp12_MUX_uxn_device_h_l307_c7_eeac_iftrue <= VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_iftrue;
     tmp12_MUX_uxn_device_h_l307_c7_eeac_iffalse <= VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_return_output := tmp12_MUX_uxn_device_h_l307_c7_eeac_return_output;

     -- result_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_result_MUX_uxn_device_h_l298_c7_acf2_cond;
     result_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_result_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     result_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_result_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l298_c7_acf2_return_output := result_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- is_blit_done_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_cond;
     is_blit_done_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_iftrue;
     is_blit_done_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_return_output := is_blit_done_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_cond;
     screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_return_output := screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- ram_addr_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_cond;
     ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_return_output := ram_addr_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- Submodule level 20
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l294_c7_3246_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_result_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_result_MUX_uxn_device_h_l298_c7_acf2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_iffalse := VAR_tmp12_MUX_uxn_device_h_l307_c7_eeac_return_output;
     -- tmp12_MUX[uxn_device_h_l298_c7_acf2] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l298_c7_acf2_cond <= VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_cond;
     tmp12_MUX_uxn_device_h_l298_c7_acf2_iftrue <= VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_iftrue;
     tmp12_MUX_uxn_device_h_l298_c7_acf2_iffalse <= VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_return_output := tmp12_MUX_uxn_device_h_l298_c7_acf2_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_cond;
     screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_return_output := screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- result_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_result_MUX_uxn_device_h_l294_c7_3246_cond;
     result_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_result_MUX_uxn_device_h_l294_c7_3246_iftrue;
     result_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_result_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l294_c7_3246_return_output := result_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- is_blit_done_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_cond;
     is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_return_output := is_blit_done_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- Submodule level 21
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_result_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_result_MUX_uxn_device_h_l294_c7_3246_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_iffalse := VAR_tmp12_MUX_uxn_device_h_l298_c7_acf2_return_output;
     -- is_blit_done_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_cond;
     is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_return_output := is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- tmp12_MUX[uxn_device_h_l294_c7_3246] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l294_c7_3246_cond <= VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_cond;
     tmp12_MUX_uxn_device_h_l294_c7_3246_iftrue <= VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_iftrue;
     tmp12_MUX_uxn_device_h_l294_c7_3246_iffalse <= VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_return_output := tmp12_MUX_uxn_device_h_l294_c7_3246_return_output;

     -- result_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_result_MUX_uxn_device_h_l289_c7_66c7_cond;
     result_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_result_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     result_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_result_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l289_c7_66c7_return_output := result_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_cond;
     screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_return_output := screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- Submodule level 22
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_result_MUX_uxn_device_h_l289_c7_66c7_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_iffalse := VAR_tmp12_MUX_uxn_device_h_l294_c7_3246_return_output;
     -- tmp12_MUX[uxn_device_h_l289_c7_66c7] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l289_c7_66c7_cond <= VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_cond;
     tmp12_MUX_uxn_device_h_l289_c7_66c7_iftrue <= VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_iftrue;
     tmp12_MUX_uxn_device_h_l289_c7_66c7_iffalse <= VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_return_output := tmp12_MUX_uxn_device_h_l289_c7_66c7_return_output;

     -- is_blit_done_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_cond;
     is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_return_output := is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_cond;
     screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iftrue;
     screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_return_output := screen_blit_result_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- result_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_result_MUX_uxn_device_h_l285_c7_5ad9_cond;
     result_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_result_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     result_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_result_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l285_c7_5ad9_return_output := result_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- Submodule level 23
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_result_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_iffalse := VAR_tmp12_MUX_uxn_device_h_l289_c7_66c7_return_output;
     -- result_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_result_MUX_uxn_device_h_l280_c7_4b5a_cond;
     result_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_result_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     result_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_result_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l280_c7_4b5a_return_output := result_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- is_blit_done_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_cond;
     is_blit_done_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_iftrue;
     is_blit_done_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_return_output := is_blit_done_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- tmp12_MUX[uxn_device_h_l285_c7_5ad9] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l285_c7_5ad9_cond <= VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_cond;
     tmp12_MUX_uxn_device_h_l285_c7_5ad9_iftrue <= VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_iftrue;
     tmp12_MUX_uxn_device_h_l285_c7_5ad9_iffalse <= VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_return_output := tmp12_MUX_uxn_device_h_l285_c7_5ad9_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_cond;
     screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_return_output := screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- Submodule level 24
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_result_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_result_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     REG_VAR_screen_blit_result := VAR_screen_blit_result_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_iffalse := VAR_tmp12_MUX_uxn_device_h_l285_c7_5ad9_return_output;
     -- is_blit_done_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_cond;
     is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_return_output := is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- tmp12_MUX[uxn_device_h_l280_c7_4b5a] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l280_c7_4b5a_cond <= VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_cond;
     tmp12_MUX_uxn_device_h_l280_c7_4b5a_iftrue <= VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_iftrue;
     tmp12_MUX_uxn_device_h_l280_c7_4b5a_iffalse <= VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_return_output := tmp12_MUX_uxn_device_h_l280_c7_4b5a_return_output;

     -- result_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_result_MUX_uxn_device_h_l277_c7_b744_cond;
     result_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_result_MUX_uxn_device_h_l277_c7_b744_iftrue;
     result_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_result_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l277_c7_b744_return_output := result_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- Submodule level 25
     REG_VAR_is_blit_done := VAR_is_blit_done_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_result_MUX_uxn_device_h_l277_c7_b744_return_output;
     VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_iffalse := VAR_tmp12_MUX_uxn_device_h_l280_c7_4b5a_return_output;
     -- tmp12_MUX[uxn_device_h_l277_c7_b744] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l277_c7_b744_cond <= VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_cond;
     tmp12_MUX_uxn_device_h_l277_c7_b744_iftrue <= VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_iftrue;
     tmp12_MUX_uxn_device_h_l277_c7_b744_iffalse <= VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_return_output := tmp12_MUX_uxn_device_h_l277_c7_b744_return_output;

     -- result_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_result_MUX_uxn_device_h_l270_c2_c6b9_cond;
     result_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_result_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     result_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_result_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l270_c2_c6b9_return_output := result_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- Submodule level 26
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l270_c2_c6b9_return_output;
     VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_iffalse := VAR_tmp12_MUX_uxn_device_h_l277_c7_b744_return_output;
     -- tmp12_MUX[uxn_device_h_l270_c2_c6b9] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l270_c2_c6b9_cond <= VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_cond;
     tmp12_MUX_uxn_device_h_l270_c2_c6b9_iftrue <= VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_iftrue;
     tmp12_MUX_uxn_device_h_l270_c2_c6b9_iffalse <= VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_return_output := tmp12_MUX_uxn_device_h_l270_c2_c6b9_return_output;

     -- Submodule level 27
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_device_h_l270_c2_c6b9_return_output;
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
