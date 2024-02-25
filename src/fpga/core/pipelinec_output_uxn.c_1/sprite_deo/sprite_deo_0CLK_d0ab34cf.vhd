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
-- Submodules: 303
entity sprite_deo_0CLK_d0ab34cf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end sprite_deo_0CLK_d0ab34cf;
architecture arch of sprite_deo_0CLK_d0ab34cf is
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
signal tmp12 : unsigned(11 downto 0) := to_unsigned(0, 12);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8b : unsigned(7 downto 0) := to_unsigned(0, 8);
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
signal REG_COMB_tmp12 : unsigned(11 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_tmp8b : unsigned(7 downto 0);
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
-- BIN_OP_EQ[uxn_device_h_l231_c6_f0cd]
signal BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l238_c7_5dc9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l231_c2_3fd6]
signal tmp8_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l231_c2_3fd6]
signal tmp8b_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l231_c2_3fd6]
signal screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_return_output : screen_blit_result_t;

-- flip_y_MUX[uxn_device_h_l231_c2_3fd6]
signal flip_y_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l231_c2_3fd6]
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l231_c2_3fd6]
signal auto_length_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(3 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l231_c2_3fd6]
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l231_c2_3fd6]
signal ram_addr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l231_c2_3fd6]
signal x_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l231_c2_3fd6]
signal color_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l231_c2_3fd6]
signal y_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l231_c2_3fd6]
signal ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l231_c2_3fd6]
signal result_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l231_c2_3fd6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l231_c2_3fd6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l231_c2_3fd6_return_output : device_out_result_t;

-- x_sprite_incr_MUX[uxn_device_h_l231_c2_3fd6]
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l231_c2_3fd6]
signal flip_x_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);

-- is_blit_done_MUX[uxn_device_h_l231_c2_3fd6]
signal is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l231_c2_3fd6]
signal layer_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l231_c2_3fd6]
signal ctrl_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l231_c2_3fd6]
signal auto_advance_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l231_c2_3fd6]
signal tmp12_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l231_c2_3fd6]
signal is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l231_c2_3fd6]
signal tmp4_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l238_c11_f916]
signal BIN_OP_EQ_uxn_device_h_l238_c11_f916_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l238_c11_f916_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l241_c7_1d64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l238_c7_5dc9]
signal tmp8_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l238_c7_5dc9]
signal tmp8b_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l238_c7_5dc9]
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_return_output : screen_blit_result_t;

-- flip_y_MUX[uxn_device_h_l238_c7_5dc9]
signal flip_y_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l238_c7_5dc9]
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l238_c7_5dc9]
signal auto_length_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(3 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l238_c7_5dc9]
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l238_c7_5dc9]
signal ram_addr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l238_c7_5dc9]
signal x_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l238_c7_5dc9]
signal color_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l238_c7_5dc9]
signal y_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l238_c7_5dc9]
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l238_c7_5dc9]
signal result_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l238_c7_5dc9_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l238_c7_5dc9_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l238_c7_5dc9_return_output : device_out_result_t;

-- x_sprite_incr_MUX[uxn_device_h_l238_c7_5dc9]
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l238_c7_5dc9]
signal flip_x_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);

-- is_blit_done_MUX[uxn_device_h_l238_c7_5dc9]
signal is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l238_c7_5dc9]
signal layer_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l238_c7_5dc9]
signal ctrl_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l238_c7_5dc9]
signal auto_advance_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l238_c7_5dc9]
signal tmp12_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l238_c7_5dc9]
signal is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l238_c7_5dc9]
signal tmp4_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l241_c11_5efb]
signal BIN_OP_EQ_uxn_device_h_l241_c11_5efb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l241_c11_5efb_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l245_c7_5ed1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l241_c7_1d64]
signal tmp8_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l241_c7_1d64]
signal tmp8b_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l241_c7_1d64]
signal screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_return_output : screen_blit_result_t;

-- flip_y_MUX[uxn_device_h_l241_c7_1d64]
signal flip_y_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l241_c7_1d64]
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l241_c7_1d64]
signal auto_length_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(3 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l241_c7_1d64]
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l241_c7_1d64]
signal ram_addr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l241_c7_1d64]
signal x_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l241_c7_1d64]
signal color_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l241_c7_1d64]
signal y_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l241_c7_1d64]
signal ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l241_c7_1d64]
signal result_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l241_c7_1d64_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l241_c7_1d64_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l241_c7_1d64_return_output : device_out_result_t;

-- x_sprite_incr_MUX[uxn_device_h_l241_c7_1d64]
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l241_c7_1d64]
signal flip_x_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);

-- is_blit_done_MUX[uxn_device_h_l241_c7_1d64]
signal is_blit_done_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l241_c7_1d64]
signal layer_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l241_c7_1d64]
signal ctrl_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l241_c7_1d64]
signal auto_advance_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l241_c7_1d64]
signal tmp12_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l241_c7_1d64]
signal is_last_blit_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l241_c7_1d64]
signal tmp4_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l245_c11_4b44]
signal BIN_OP_EQ_uxn_device_h_l245_c11_4b44_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l245_c11_4b44_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l249_c7_6d57]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l245_c7_5ed1]
signal tmp8_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l245_c7_5ed1]
signal tmp8b_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l245_c7_5ed1]
signal screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_return_output : screen_blit_result_t;

-- flip_y_MUX[uxn_device_h_l245_c7_5ed1]
signal flip_y_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l245_c7_5ed1]
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l245_c7_5ed1]
signal auto_length_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(3 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l245_c7_5ed1]
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l245_c7_5ed1]
signal ram_addr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l245_c7_5ed1]
signal x_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l245_c7_5ed1]
signal color_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l245_c7_5ed1]
signal y_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l245_c7_5ed1]
signal ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l245_c7_5ed1]
signal result_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l245_c7_5ed1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l245_c7_5ed1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l245_c7_5ed1_return_output : device_out_result_t;

-- x_sprite_incr_MUX[uxn_device_h_l245_c7_5ed1]
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l245_c7_5ed1]
signal flip_x_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);

-- is_blit_done_MUX[uxn_device_h_l245_c7_5ed1]
signal is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l245_c7_5ed1]
signal layer_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l245_c7_5ed1]
signal ctrl_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l245_c7_5ed1]
signal auto_advance_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l245_c7_5ed1]
signal tmp12_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l245_c7_5ed1]
signal is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l245_c7_5ed1]
signal tmp4_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l249_c11_44ed]
signal BIN_OP_EQ_uxn_device_h_l249_c11_44ed_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l249_c11_44ed_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l258_c7_f69d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l249_c7_6d57]
signal tmp8_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l249_c7_6d57]
signal tmp8b_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l249_c7_6d57]
signal screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_return_output : screen_blit_result_t;

-- flip_y_MUX[uxn_device_h_l249_c7_6d57]
signal flip_y_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l249_c7_6d57]
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l249_c7_6d57]
signal auto_length_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(3 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l249_c7_6d57]
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l249_c7_6d57]
signal ram_addr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l249_c7_6d57]
signal x_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l249_c7_6d57]
signal color_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l249_c7_6d57]
signal y_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l249_c7_6d57]
signal ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l249_c7_6d57]
signal result_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l249_c7_6d57_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l249_c7_6d57_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l249_c7_6d57_return_output : device_out_result_t;

-- x_sprite_incr_MUX[uxn_device_h_l249_c7_6d57]
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l249_c7_6d57]
signal flip_x_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);

-- is_blit_done_MUX[uxn_device_h_l249_c7_6d57]
signal is_blit_done_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l249_c7_6d57]
signal layer_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l249_c7_6d57]
signal ctrl_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l249_c7_6d57]
signal auto_advance_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l249_c7_6d57]
signal tmp12_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l249_c7_6d57]
signal is_last_blit_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l249_c7_6d57]
signal tmp4_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(3 downto 0);

-- CONST_SR_7[uxn_device_h_l252_c25_b137]
signal CONST_SR_7_uxn_device_h_l252_c25_b137_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l252_c25_b137_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l253_c21_2209]
signal CONST_SR_6_uxn_device_h_l253_c21_2209_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l253_c21_2209_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l254_c22_76c3]
signal CONST_SR_5_uxn_device_h_l254_c22_76c3_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l254_c22_76c3_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l255_c22_7663]
signal CONST_SR_4_uxn_device_h_l255_c22_7663_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l255_c22_7663_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l258_c11_4207]
signal BIN_OP_EQ_uxn_device_h_l258_c11_4207_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l258_c11_4207_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l263_c7_86eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l258_c7_f69d]
signal tmp8_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l258_c7_f69d]
signal tmp8b_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l258_c7_f69d]
signal screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l258_c7_f69d]
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l258_c7_f69d]
signal auto_length_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(3 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l258_c7_f69d]
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l258_c7_f69d]
signal ram_addr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l258_c7_f69d]
signal x_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l258_c7_f69d]
signal y_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l258_c7_f69d]
signal result_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l258_c7_f69d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l258_c7_f69d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l258_c7_f69d_return_output : device_out_result_t;

-- x_sprite_incr_MUX[uxn_device_h_l258_c7_f69d]
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);

-- is_blit_done_MUX[uxn_device_h_l258_c7_f69d]
signal is_blit_done_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l258_c7_f69d]
signal auto_advance_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l258_c7_f69d]
signal tmp12_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l258_c7_f69d]
signal is_last_blit_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l258_c7_f69d]
signal tmp4_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l263_c11_71e8]
signal BIN_OP_EQ_uxn_device_h_l263_c11_71e8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l263_c11_71e8_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l272_c1_c236]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l263_c7_86eb]
signal tmp8_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l263_c7_86eb]
signal tmp8b_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l263_c7_86eb]
signal screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l263_c7_86eb]
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l263_c7_86eb]
signal auto_length_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(3 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l263_c7_86eb]
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l263_c7_86eb]
signal ram_addr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l263_c7_86eb]
signal x_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l263_c7_86eb]
signal y_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l263_c7_86eb]
signal result_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l263_c7_86eb_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l263_c7_86eb_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l263_c7_86eb_return_output : device_out_result_t;

-- x_sprite_incr_MUX[uxn_device_h_l263_c7_86eb]
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);

-- is_blit_done_MUX[uxn_device_h_l263_c7_86eb]
signal is_blit_done_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l263_c7_86eb]
signal auto_advance_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l263_c7_86eb]
signal tmp12_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l263_c7_86eb]
signal is_last_blit_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l263_c7_86eb]
signal tmp4_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l273_c18_34b1]
signal BIN_OP_EQ_uxn_device_h_l273_c18_34b1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l273_c18_34b1_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l273_c18_34b1_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l273_c18_7299]
signal MUX_uxn_device_h_l273_c18_7299_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l273_c18_7299_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l273_c18_7299_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l273_c18_7299_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l275_c19_9dff]
signal MUX_uxn_device_h_l275_c19_9dff_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l275_c19_9dff_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l275_c19_9dff_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l275_c19_9dff_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l276_c19_526f]
signal MUX_uxn_device_h_l276_c19_526f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l276_c19_526f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l276_c19_526f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l276_c19_526f_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l277_c39_6505]
signal MUX_uxn_device_h_l277_c39_6505_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l277_c39_6505_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c39_6505_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c39_6505_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l277_c20_bc8a]
signal MUX_uxn_device_h_l277_c20_bc8a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l277_c20_bc8a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c20_bc8a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c20_bc8a_return_output : unsigned(15 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l326_c1_18c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l278_c3_d3cc]
signal tmp8_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l278_c3_d3cc]
signal tmp8b_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l278_c3_d3cc]
signal screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output : screen_blit_result_t;

-- ram_addr_MUX[uxn_device_h_l278_c3_d3cc]
signal ram_addr_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l278_c3_d3cc]
signal x_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l278_c3_d3cc]
signal y_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_device_h_l278_c3_d3cc]
signal result_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l278_c3_d3cc_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l278_c3_d3cc_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l278_c3_d3cc_return_output : device_out_result_t;

-- is_last_blit_MUX[uxn_device_h_l278_c3_d3cc]
signal is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l278_c3_d3cc]
signal tmp4_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l279_c8_9ecd]
signal BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l279_c4_4947]
signal tmp8_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l279_c4_4947]
signal tmp8b_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l279_c4_4947]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l279_c4_4947]
signal ram_addr_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l279_c4_4947]
signal x_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l279_c4_4947]
signal y_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l279_c4_4947]
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l279_c4_4947]
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l279_c4_4947]
signal result_u8_value_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l279_c4_4947]
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l279_c4_4947]
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l279_c4_4947]
signal result_u16_addr_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l279_c4_4947]
signal tmp4_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(3 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l280_c22_b423]
signal BIN_OP_MINUS_uxn_device_h_l280_c22_b423_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l280_c22_b423_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l280_c22_b423_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l280_c47_8833]
signal BIN_OP_PLUS_uxn_device_h_l280_c47_8833_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l280_c47_8833_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l280_c47_8833_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l280_c12_12d1]
signal MUX_uxn_device_h_l280_c12_12d1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l280_c12_12d1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l280_c12_12d1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l280_c12_12d1_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l281_c23_93ee]
signal BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l281_c49_745e]
signal BIN_OP_PLUS_uxn_device_h_l281_c49_745e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l281_c49_745e_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l281_c49_745e_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l281_c13_1644]
signal MUX_uxn_device_h_l281_c13_1644_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l281_c13_1644_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l281_c13_1644_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l281_c13_1644_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l282_c36_8009]
signal BIN_OP_MINUS_uxn_device_h_l282_c36_8009_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l282_c36_8009_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l282_c36_8009_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l282_c58_52fa]
signal BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l282_c26_2bdc]
signal MUX_uxn_device_h_l282_c26_2bdc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l282_c26_2bdc_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c26_2bdc_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c26_2bdc_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l282_c10_0b53]
signal MUX_uxn_device_h_l282_c10_0b53_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l282_c10_0b53_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c10_0b53_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c10_0b53_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l283_c36_2d74]
signal BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l283_c58_b8b4]
signal BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l283_c26_aa53]
signal MUX_uxn_device_h_l283_c26_aa53_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l283_c26_aa53_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c26_aa53_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c26_aa53_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l283_c10_e9e2]
signal MUX_uxn_device_h_l283_c10_e9e2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l283_c10_e9e2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c10_e9e2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c10_e9e2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l290_c22_caaf]
signal BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l290_c13_472f]
signal BIN_OP_EQ_uxn_device_h_l290_c13_472f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l290_c13_472f_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l290_c9_d961]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l290_c9_d961]
signal ram_addr_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l290_c9_d961]
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l290_c9_d961]
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l290_c9_d961]
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l290_c9_d961]
signal result_u8_value_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l290_c9_d961]
signal tmp4_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l295_c22_dbbe]
signal BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l295_c13_206a]
signal BIN_OP_EQ_uxn_device_h_l295_c13_206a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l295_c13_206a_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l295_c9_7fab]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l295_c9_7fab]
signal ram_addr_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l295_c9_7fab]
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l295_c9_7fab]
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l295_c9_7fab]
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l295_c9_7fab]
signal result_u8_value_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l295_c9_7fab]
signal tmp4_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l299_c22_55f5]
signal BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l299_c13_5629]
signal BIN_OP_EQ_uxn_device_h_l299_c13_5629_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l299_c13_5629_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l299_c9_5162]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l299_c9_5162]
signal ram_addr_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l299_c9_5162]
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l299_c9_5162]
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l299_c9_5162]
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l299_c9_5162]
signal result_u8_value_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l299_c9_5162]
signal tmp4_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l303_c22_802a]
signal BIN_OP_PLUS_uxn_device_h_l303_c22_802a_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l303_c22_802a_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l303_c22_802a_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l303_c13_5d64]
signal BIN_OP_EQ_uxn_device_h_l303_c13_5d64_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l303_c13_5d64_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l303_c9_7bb2]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l303_c9_7bb2]
signal ram_addr_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l303_c9_7bb2]
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l303_c9_7bb2]
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l303_c9_7bb2]
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l303_c9_7bb2]
signal result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l303_c9_7bb2]
signal tmp4_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l307_c22_480d]
signal BIN_OP_PLUS_uxn_device_h_l307_c22_480d_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l307_c22_480d_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l307_c22_480d_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l307_c13_3fa3]
signal BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l307_c9_8ccc]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l307_c9_8ccc]
signal ram_addr_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l307_c9_8ccc]
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l307_c9_8ccc]
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l307_c9_8ccc]
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l307_c9_8ccc]
signal result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l307_c9_8ccc]
signal tmp4_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l309_c5_a791]
signal BIN_OP_PLUS_uxn_device_h_l309_c5_a791_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l309_c5_a791_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l309_c5_a791_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l312_c33_02f4]
signal CONST_SR_8_uxn_device_h_l312_c33_02f4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l312_c33_02f4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l314_c22_d664]
signal BIN_OP_PLUS_uxn_device_h_l314_c22_d664_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l314_c22_d664_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l314_c22_d664_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l314_c13_e704]
signal BIN_OP_EQ_uxn_device_h_l314_c13_e704_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l314_c13_e704_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l314_c9_6636]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l314_c9_6636]
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l314_c9_6636]
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l314_c9_6636]
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l314_c9_6636]
signal result_u8_value_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l314_c9_6636]
signal tmp4_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l319_c22_e602]
signal BIN_OP_PLUS_uxn_device_h_l319_c22_e602_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l319_c22_e602_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l319_c22_e602_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l319_c13_f277]
signal BIN_OP_EQ_uxn_device_h_l319_c13_f277_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l319_c13_f277_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l319_c9_20c1]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l319_c9_20c1]
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l319_c9_20c1]
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l319_c9_20c1]
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l319_c9_20c1]
signal tmp4_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l320_c5_3f9c]
signal BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_left : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_return_output : unsigned(4 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l327_c1_64fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l329_c1_641f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l327_c4_c6d1]
signal screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output : screen_blit_result_t;

-- screen_2bpp[uxn_device_h_l328_c26_23be]
signal screen_2bpp_uxn_device_h_l328_c26_23be_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_phase : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_x1 : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_y1 : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_color : unsigned(3 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_fx : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_fy : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_ram_addr : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_previous_ram_read : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_23be_return_output : screen_blit_result_t;

-- screen_1bpp[uxn_device_h_l330_c26_276f]
signal screen_1bpp_uxn_device_h_l330_c26_276f_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_phase : unsigned(11 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_x1 : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_y1 : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_color : unsigned(3 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_fx : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_fy : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_ram_addr : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_previous_ram_read : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_276f_return_output : screen_blit_result_t;

-- BIN_OP_EQ[uxn_device_h_l339_c19_781a]
signal BIN_OP_EQ_uxn_device_h_l339_c19_781a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c19_781a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c19_781a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l339_c19_d350]
signal MUX_uxn_device_h_l339_c19_d350_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l339_c19_d350_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l339_c19_d350_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l339_c19_d350_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_device_h_l342_c11_8c41]
signal BIN_OP_XOR_uxn_device_h_l342_c11_8c41_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l342_c11_8c41_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l342_c11_8c41_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l342_c60_51e3]
signal BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_return_output : unsigned(12 downto 0);

-- MUX[uxn_device_h_l342_c11_9721]
signal MUX_uxn_device_h_l342_c11_9721_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l342_c11_9721_iftrue : unsigned(11 downto 0);
signal MUX_uxn_device_h_l342_c11_9721_iffalse : unsigned(11 downto 0);
signal MUX_uxn_device_h_l342_c11_9721_return_output : unsigned(11 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12
signal CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output : unsigned(11 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.u16_addr := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l231_c6_f0cd
BIN_OP_EQ_uxn_device_h_l231_c6_f0cd : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_left,
BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_right,
BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- tmp8_MUX_uxn_device_h_l231_c2_3fd6
tmp8_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l231_c2_3fd6_cond,
tmp8_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
tmp8_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
tmp8_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- tmp8b_MUX_uxn_device_h_l231_c2_3fd6
tmp8b_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l231_c2_3fd6_cond,
tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
tmp8b_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6
screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_cond,
screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- flip_y_MUX_uxn_device_h_l231_c2_3fd6
flip_y_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l231_c2_3fd6_cond,
flip_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
flip_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
flip_y_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6
ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_cond,
ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- auto_length_MUX_uxn_device_h_l231_c2_3fd6
auto_length_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l231_c2_3fd6_cond,
auto_length_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
auto_length_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
auto_length_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6
y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond,
y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- ram_addr_MUX_uxn_device_h_l231_c2_3fd6
ram_addr_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l231_c2_3fd6_cond,
ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
ram_addr_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- x_MUX_uxn_device_h_l231_c2_3fd6
x_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l231_c2_3fd6_cond,
x_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
x_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
x_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- color_MUX_uxn_device_h_l231_c2_3fd6
color_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l231_c2_3fd6_cond,
color_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
color_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
color_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- y_MUX_uxn_device_h_l231_c2_3fd6
y_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l231_c2_3fd6_cond,
y_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
y_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
y_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6
ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_cond,
ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- result_MUX_uxn_device_h_l231_c2_3fd6
result_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l231_c2_3fd6_cond,
result_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
result_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
result_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6
x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond,
x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- flip_x_MUX_uxn_device_h_l231_c2_3fd6
flip_x_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l231_c2_3fd6_cond,
flip_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
flip_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
flip_x_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- is_blit_done_MUX_uxn_device_h_l231_c2_3fd6
is_blit_done_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_cond,
is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- layer_MUX_uxn_device_h_l231_c2_3fd6
layer_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l231_c2_3fd6_cond,
layer_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
layer_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
layer_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- ctrl_MUX_uxn_device_h_l231_c2_3fd6
ctrl_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l231_c2_3fd6_cond,
ctrl_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
ctrl_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
ctrl_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- auto_advance_MUX_uxn_device_h_l231_c2_3fd6
auto_advance_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l231_c2_3fd6_cond,
auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
auto_advance_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- tmp12_MUX_uxn_device_h_l231_c2_3fd6
tmp12_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l231_c2_3fd6_cond,
tmp12_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
tmp12_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
tmp12_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- is_last_blit_MUX_uxn_device_h_l231_c2_3fd6
is_last_blit_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_cond,
is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- tmp4_MUX_uxn_device_h_l231_c2_3fd6
tmp4_MUX_uxn_device_h_l231_c2_3fd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l231_c2_3fd6_cond,
tmp4_MUX_uxn_device_h_l231_c2_3fd6_iftrue,
tmp4_MUX_uxn_device_h_l231_c2_3fd6_iffalse,
tmp4_MUX_uxn_device_h_l231_c2_3fd6_return_output);

-- BIN_OP_EQ_uxn_device_h_l238_c11_f916
BIN_OP_EQ_uxn_device_h_l238_c11_f916 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l238_c11_f916_left,
BIN_OP_EQ_uxn_device_h_l238_c11_f916_right,
BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- tmp8_MUX_uxn_device_h_l238_c7_5dc9
tmp8_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l238_c7_5dc9_cond,
tmp8_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
tmp8_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
tmp8_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- tmp8b_MUX_uxn_device_h_l238_c7_5dc9
tmp8b_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l238_c7_5dc9_cond,
tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
tmp8b_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9
screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_cond,
screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- flip_y_MUX_uxn_device_h_l238_c7_5dc9
flip_y_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l238_c7_5dc9_cond,
flip_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
flip_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
flip_y_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9
ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_cond,
ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- auto_length_MUX_uxn_device_h_l238_c7_5dc9
auto_length_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l238_c7_5dc9_cond,
auto_length_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
auto_length_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
auto_length_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9
y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond,
y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- ram_addr_MUX_uxn_device_h_l238_c7_5dc9
ram_addr_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l238_c7_5dc9_cond,
ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
ram_addr_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- x_MUX_uxn_device_h_l238_c7_5dc9
x_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l238_c7_5dc9_cond,
x_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
x_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
x_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- color_MUX_uxn_device_h_l238_c7_5dc9
color_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l238_c7_5dc9_cond,
color_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
color_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
color_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- y_MUX_uxn_device_h_l238_c7_5dc9
y_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l238_c7_5dc9_cond,
y_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
y_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
y_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9
ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_cond,
ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- result_MUX_uxn_device_h_l238_c7_5dc9
result_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l238_c7_5dc9_cond,
result_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
result_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
result_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9
x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond,
x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- flip_x_MUX_uxn_device_h_l238_c7_5dc9
flip_x_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l238_c7_5dc9_cond,
flip_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
flip_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
flip_x_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- is_blit_done_MUX_uxn_device_h_l238_c7_5dc9
is_blit_done_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_cond,
is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- layer_MUX_uxn_device_h_l238_c7_5dc9
layer_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l238_c7_5dc9_cond,
layer_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
layer_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
layer_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- ctrl_MUX_uxn_device_h_l238_c7_5dc9
ctrl_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l238_c7_5dc9_cond,
ctrl_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
ctrl_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
ctrl_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- auto_advance_MUX_uxn_device_h_l238_c7_5dc9
auto_advance_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l238_c7_5dc9_cond,
auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
auto_advance_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- tmp12_MUX_uxn_device_h_l238_c7_5dc9
tmp12_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l238_c7_5dc9_cond,
tmp12_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
tmp12_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
tmp12_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- is_last_blit_MUX_uxn_device_h_l238_c7_5dc9
is_last_blit_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_cond,
is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- tmp4_MUX_uxn_device_h_l238_c7_5dc9
tmp4_MUX_uxn_device_h_l238_c7_5dc9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l238_c7_5dc9_cond,
tmp4_MUX_uxn_device_h_l238_c7_5dc9_iftrue,
tmp4_MUX_uxn_device_h_l238_c7_5dc9_iffalse,
tmp4_MUX_uxn_device_h_l238_c7_5dc9_return_output);

-- BIN_OP_EQ_uxn_device_h_l241_c11_5efb
BIN_OP_EQ_uxn_device_h_l241_c11_5efb : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l241_c11_5efb_left,
BIN_OP_EQ_uxn_device_h_l241_c11_5efb_right,
BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- tmp8_MUX_uxn_device_h_l241_c7_1d64
tmp8_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l241_c7_1d64_cond,
tmp8_MUX_uxn_device_h_l241_c7_1d64_iftrue,
tmp8_MUX_uxn_device_h_l241_c7_1d64_iffalse,
tmp8_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- tmp8b_MUX_uxn_device_h_l241_c7_1d64
tmp8b_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l241_c7_1d64_cond,
tmp8b_MUX_uxn_device_h_l241_c7_1d64_iftrue,
tmp8b_MUX_uxn_device_h_l241_c7_1d64_iffalse,
tmp8b_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- screen_blit_result_MUX_uxn_device_h_l241_c7_1d64
screen_blit_result_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_cond,
screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iftrue,
screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iffalse,
screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- flip_y_MUX_uxn_device_h_l241_c7_1d64
flip_y_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l241_c7_1d64_cond,
flip_y_MUX_uxn_device_h_l241_c7_1d64_iftrue,
flip_y_MUX_uxn_device_h_l241_c7_1d64_iffalse,
flip_y_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64
ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_cond,
ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue,
ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse,
ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- auto_length_MUX_uxn_device_h_l241_c7_1d64
auto_length_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l241_c7_1d64_cond,
auto_length_MUX_uxn_device_h_l241_c7_1d64_iftrue,
auto_length_MUX_uxn_device_h_l241_c7_1d64_iffalse,
auto_length_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64
y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond,
y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue,
y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse,
y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- ram_addr_MUX_uxn_device_h_l241_c7_1d64
ram_addr_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l241_c7_1d64_cond,
ram_addr_MUX_uxn_device_h_l241_c7_1d64_iftrue,
ram_addr_MUX_uxn_device_h_l241_c7_1d64_iffalse,
ram_addr_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- x_MUX_uxn_device_h_l241_c7_1d64
x_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l241_c7_1d64_cond,
x_MUX_uxn_device_h_l241_c7_1d64_iftrue,
x_MUX_uxn_device_h_l241_c7_1d64_iffalse,
x_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- color_MUX_uxn_device_h_l241_c7_1d64
color_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l241_c7_1d64_cond,
color_MUX_uxn_device_h_l241_c7_1d64_iftrue,
color_MUX_uxn_device_h_l241_c7_1d64_iffalse,
color_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- y_MUX_uxn_device_h_l241_c7_1d64
y_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l241_c7_1d64_cond,
y_MUX_uxn_device_h_l241_c7_1d64_iftrue,
y_MUX_uxn_device_h_l241_c7_1d64_iffalse,
y_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- ctrl_mode_MUX_uxn_device_h_l241_c7_1d64
ctrl_mode_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_cond,
ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iftrue,
ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iffalse,
ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- result_MUX_uxn_device_h_l241_c7_1d64
result_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l241_c7_1d64_cond,
result_MUX_uxn_device_h_l241_c7_1d64_iftrue,
result_MUX_uxn_device_h_l241_c7_1d64_iffalse,
result_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64
x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond,
x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue,
x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse,
x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- flip_x_MUX_uxn_device_h_l241_c7_1d64
flip_x_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l241_c7_1d64_cond,
flip_x_MUX_uxn_device_h_l241_c7_1d64_iftrue,
flip_x_MUX_uxn_device_h_l241_c7_1d64_iffalse,
flip_x_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- is_blit_done_MUX_uxn_device_h_l241_c7_1d64
is_blit_done_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l241_c7_1d64_cond,
is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iftrue,
is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iffalse,
is_blit_done_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- layer_MUX_uxn_device_h_l241_c7_1d64
layer_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l241_c7_1d64_cond,
layer_MUX_uxn_device_h_l241_c7_1d64_iftrue,
layer_MUX_uxn_device_h_l241_c7_1d64_iffalse,
layer_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- ctrl_MUX_uxn_device_h_l241_c7_1d64
ctrl_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l241_c7_1d64_cond,
ctrl_MUX_uxn_device_h_l241_c7_1d64_iftrue,
ctrl_MUX_uxn_device_h_l241_c7_1d64_iffalse,
ctrl_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- auto_advance_MUX_uxn_device_h_l241_c7_1d64
auto_advance_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l241_c7_1d64_cond,
auto_advance_MUX_uxn_device_h_l241_c7_1d64_iftrue,
auto_advance_MUX_uxn_device_h_l241_c7_1d64_iffalse,
auto_advance_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- tmp12_MUX_uxn_device_h_l241_c7_1d64
tmp12_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l241_c7_1d64_cond,
tmp12_MUX_uxn_device_h_l241_c7_1d64_iftrue,
tmp12_MUX_uxn_device_h_l241_c7_1d64_iffalse,
tmp12_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- is_last_blit_MUX_uxn_device_h_l241_c7_1d64
is_last_blit_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l241_c7_1d64_cond,
is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iftrue,
is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iffalse,
is_last_blit_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- tmp4_MUX_uxn_device_h_l241_c7_1d64
tmp4_MUX_uxn_device_h_l241_c7_1d64 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l241_c7_1d64_cond,
tmp4_MUX_uxn_device_h_l241_c7_1d64_iftrue,
tmp4_MUX_uxn_device_h_l241_c7_1d64_iffalse,
tmp4_MUX_uxn_device_h_l241_c7_1d64_return_output);

-- BIN_OP_EQ_uxn_device_h_l245_c11_4b44
BIN_OP_EQ_uxn_device_h_l245_c11_4b44 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l245_c11_4b44_left,
BIN_OP_EQ_uxn_device_h_l245_c11_4b44_right,
BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- tmp8_MUX_uxn_device_h_l245_c7_5ed1
tmp8_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l245_c7_5ed1_cond,
tmp8_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
tmp8_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
tmp8_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- tmp8b_MUX_uxn_device_h_l245_c7_5ed1
tmp8b_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l245_c7_5ed1_cond,
tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
tmp8b_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1
screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_cond,
screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- flip_y_MUX_uxn_device_h_l245_c7_5ed1
flip_y_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l245_c7_5ed1_cond,
flip_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
flip_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
flip_y_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1
ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_cond,
ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- auto_length_MUX_uxn_device_h_l245_c7_5ed1
auto_length_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l245_c7_5ed1_cond,
auto_length_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
auto_length_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
auto_length_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1
y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond,
y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- ram_addr_MUX_uxn_device_h_l245_c7_5ed1
ram_addr_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l245_c7_5ed1_cond,
ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
ram_addr_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- x_MUX_uxn_device_h_l245_c7_5ed1
x_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l245_c7_5ed1_cond,
x_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
x_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
x_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- color_MUX_uxn_device_h_l245_c7_5ed1
color_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l245_c7_5ed1_cond,
color_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
color_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
color_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- y_MUX_uxn_device_h_l245_c7_5ed1
y_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l245_c7_5ed1_cond,
y_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
y_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
y_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1
ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_cond,
ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- result_MUX_uxn_device_h_l245_c7_5ed1
result_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l245_c7_5ed1_cond,
result_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
result_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
result_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1
x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond,
x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- flip_x_MUX_uxn_device_h_l245_c7_5ed1
flip_x_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l245_c7_5ed1_cond,
flip_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
flip_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
flip_x_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- is_blit_done_MUX_uxn_device_h_l245_c7_5ed1
is_blit_done_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_cond,
is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- layer_MUX_uxn_device_h_l245_c7_5ed1
layer_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l245_c7_5ed1_cond,
layer_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
layer_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
layer_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- ctrl_MUX_uxn_device_h_l245_c7_5ed1
ctrl_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l245_c7_5ed1_cond,
ctrl_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
ctrl_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
ctrl_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- auto_advance_MUX_uxn_device_h_l245_c7_5ed1
auto_advance_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l245_c7_5ed1_cond,
auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
auto_advance_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- tmp12_MUX_uxn_device_h_l245_c7_5ed1
tmp12_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l245_c7_5ed1_cond,
tmp12_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
tmp12_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
tmp12_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- is_last_blit_MUX_uxn_device_h_l245_c7_5ed1
is_last_blit_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_cond,
is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- tmp4_MUX_uxn_device_h_l245_c7_5ed1
tmp4_MUX_uxn_device_h_l245_c7_5ed1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l245_c7_5ed1_cond,
tmp4_MUX_uxn_device_h_l245_c7_5ed1_iftrue,
tmp4_MUX_uxn_device_h_l245_c7_5ed1_iffalse,
tmp4_MUX_uxn_device_h_l245_c7_5ed1_return_output);

-- BIN_OP_EQ_uxn_device_h_l249_c11_44ed
BIN_OP_EQ_uxn_device_h_l249_c11_44ed : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l249_c11_44ed_left,
BIN_OP_EQ_uxn_device_h_l249_c11_44ed_right,
BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- tmp8_MUX_uxn_device_h_l249_c7_6d57
tmp8_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l249_c7_6d57_cond,
tmp8_MUX_uxn_device_h_l249_c7_6d57_iftrue,
tmp8_MUX_uxn_device_h_l249_c7_6d57_iffalse,
tmp8_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- tmp8b_MUX_uxn_device_h_l249_c7_6d57
tmp8b_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l249_c7_6d57_cond,
tmp8b_MUX_uxn_device_h_l249_c7_6d57_iftrue,
tmp8b_MUX_uxn_device_h_l249_c7_6d57_iffalse,
tmp8b_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- screen_blit_result_MUX_uxn_device_h_l249_c7_6d57
screen_blit_result_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_cond,
screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iftrue,
screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iffalse,
screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- flip_y_MUX_uxn_device_h_l249_c7_6d57
flip_y_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l249_c7_6d57_cond,
flip_y_MUX_uxn_device_h_l249_c7_6d57_iftrue,
flip_y_MUX_uxn_device_h_l249_c7_6d57_iffalse,
flip_y_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57
ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_cond,
ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue,
ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse,
ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- auto_length_MUX_uxn_device_h_l249_c7_6d57
auto_length_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l249_c7_6d57_cond,
auto_length_MUX_uxn_device_h_l249_c7_6d57_iftrue,
auto_length_MUX_uxn_device_h_l249_c7_6d57_iffalse,
auto_length_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57
y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond,
y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue,
y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse,
y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- ram_addr_MUX_uxn_device_h_l249_c7_6d57
ram_addr_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l249_c7_6d57_cond,
ram_addr_MUX_uxn_device_h_l249_c7_6d57_iftrue,
ram_addr_MUX_uxn_device_h_l249_c7_6d57_iffalse,
ram_addr_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- x_MUX_uxn_device_h_l249_c7_6d57
x_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l249_c7_6d57_cond,
x_MUX_uxn_device_h_l249_c7_6d57_iftrue,
x_MUX_uxn_device_h_l249_c7_6d57_iffalse,
x_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- color_MUX_uxn_device_h_l249_c7_6d57
color_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l249_c7_6d57_cond,
color_MUX_uxn_device_h_l249_c7_6d57_iftrue,
color_MUX_uxn_device_h_l249_c7_6d57_iffalse,
color_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- y_MUX_uxn_device_h_l249_c7_6d57
y_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l249_c7_6d57_cond,
y_MUX_uxn_device_h_l249_c7_6d57_iftrue,
y_MUX_uxn_device_h_l249_c7_6d57_iffalse,
y_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- ctrl_mode_MUX_uxn_device_h_l249_c7_6d57
ctrl_mode_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_cond,
ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iftrue,
ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iffalse,
ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- result_MUX_uxn_device_h_l249_c7_6d57
result_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l249_c7_6d57_cond,
result_MUX_uxn_device_h_l249_c7_6d57_iftrue,
result_MUX_uxn_device_h_l249_c7_6d57_iffalse,
result_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57
x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond,
x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue,
x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse,
x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- flip_x_MUX_uxn_device_h_l249_c7_6d57
flip_x_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l249_c7_6d57_cond,
flip_x_MUX_uxn_device_h_l249_c7_6d57_iftrue,
flip_x_MUX_uxn_device_h_l249_c7_6d57_iffalse,
flip_x_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- is_blit_done_MUX_uxn_device_h_l249_c7_6d57
is_blit_done_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l249_c7_6d57_cond,
is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iftrue,
is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iffalse,
is_blit_done_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- layer_MUX_uxn_device_h_l249_c7_6d57
layer_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l249_c7_6d57_cond,
layer_MUX_uxn_device_h_l249_c7_6d57_iftrue,
layer_MUX_uxn_device_h_l249_c7_6d57_iffalse,
layer_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- ctrl_MUX_uxn_device_h_l249_c7_6d57
ctrl_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l249_c7_6d57_cond,
ctrl_MUX_uxn_device_h_l249_c7_6d57_iftrue,
ctrl_MUX_uxn_device_h_l249_c7_6d57_iffalse,
ctrl_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- auto_advance_MUX_uxn_device_h_l249_c7_6d57
auto_advance_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l249_c7_6d57_cond,
auto_advance_MUX_uxn_device_h_l249_c7_6d57_iftrue,
auto_advance_MUX_uxn_device_h_l249_c7_6d57_iffalse,
auto_advance_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- tmp12_MUX_uxn_device_h_l249_c7_6d57
tmp12_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l249_c7_6d57_cond,
tmp12_MUX_uxn_device_h_l249_c7_6d57_iftrue,
tmp12_MUX_uxn_device_h_l249_c7_6d57_iffalse,
tmp12_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- is_last_blit_MUX_uxn_device_h_l249_c7_6d57
is_last_blit_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l249_c7_6d57_cond,
is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iftrue,
is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iffalse,
is_last_blit_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- tmp4_MUX_uxn_device_h_l249_c7_6d57
tmp4_MUX_uxn_device_h_l249_c7_6d57 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l249_c7_6d57_cond,
tmp4_MUX_uxn_device_h_l249_c7_6d57_iftrue,
tmp4_MUX_uxn_device_h_l249_c7_6d57_iffalse,
tmp4_MUX_uxn_device_h_l249_c7_6d57_return_output);

-- CONST_SR_7_uxn_device_h_l252_c25_b137
CONST_SR_7_uxn_device_h_l252_c25_b137 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l252_c25_b137_x,
CONST_SR_7_uxn_device_h_l252_c25_b137_return_output);

-- CONST_SR_6_uxn_device_h_l253_c21_2209
CONST_SR_6_uxn_device_h_l253_c21_2209 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l253_c21_2209_x,
CONST_SR_6_uxn_device_h_l253_c21_2209_return_output);

-- CONST_SR_5_uxn_device_h_l254_c22_76c3
CONST_SR_5_uxn_device_h_l254_c22_76c3 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l254_c22_76c3_x,
CONST_SR_5_uxn_device_h_l254_c22_76c3_return_output);

-- CONST_SR_4_uxn_device_h_l255_c22_7663
CONST_SR_4_uxn_device_h_l255_c22_7663 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l255_c22_7663_x,
CONST_SR_4_uxn_device_h_l255_c22_7663_return_output);

-- BIN_OP_EQ_uxn_device_h_l258_c11_4207
BIN_OP_EQ_uxn_device_h_l258_c11_4207 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l258_c11_4207_left,
BIN_OP_EQ_uxn_device_h_l258_c11_4207_right,
BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- tmp8_MUX_uxn_device_h_l258_c7_f69d
tmp8_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l258_c7_f69d_cond,
tmp8_MUX_uxn_device_h_l258_c7_f69d_iftrue,
tmp8_MUX_uxn_device_h_l258_c7_f69d_iffalse,
tmp8_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- tmp8b_MUX_uxn_device_h_l258_c7_f69d
tmp8b_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l258_c7_f69d_cond,
tmp8b_MUX_uxn_device_h_l258_c7_f69d_iftrue,
tmp8b_MUX_uxn_device_h_l258_c7_f69d_iffalse,
tmp8b_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- screen_blit_result_MUX_uxn_device_h_l258_c7_f69d
screen_blit_result_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_cond,
screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iftrue,
screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iffalse,
screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d
ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_cond,
ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue,
ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse,
ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- auto_length_MUX_uxn_device_h_l258_c7_f69d
auto_length_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l258_c7_f69d_cond,
auto_length_MUX_uxn_device_h_l258_c7_f69d_iftrue,
auto_length_MUX_uxn_device_h_l258_c7_f69d_iffalse,
auto_length_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d
y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond,
y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue,
y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse,
y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- ram_addr_MUX_uxn_device_h_l258_c7_f69d
ram_addr_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l258_c7_f69d_cond,
ram_addr_MUX_uxn_device_h_l258_c7_f69d_iftrue,
ram_addr_MUX_uxn_device_h_l258_c7_f69d_iffalse,
ram_addr_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- x_MUX_uxn_device_h_l258_c7_f69d
x_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l258_c7_f69d_cond,
x_MUX_uxn_device_h_l258_c7_f69d_iftrue,
x_MUX_uxn_device_h_l258_c7_f69d_iffalse,
x_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- y_MUX_uxn_device_h_l258_c7_f69d
y_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l258_c7_f69d_cond,
y_MUX_uxn_device_h_l258_c7_f69d_iftrue,
y_MUX_uxn_device_h_l258_c7_f69d_iffalse,
y_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- result_MUX_uxn_device_h_l258_c7_f69d
result_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l258_c7_f69d_cond,
result_MUX_uxn_device_h_l258_c7_f69d_iftrue,
result_MUX_uxn_device_h_l258_c7_f69d_iffalse,
result_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d
x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond,
x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue,
x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse,
x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- is_blit_done_MUX_uxn_device_h_l258_c7_f69d
is_blit_done_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l258_c7_f69d_cond,
is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iftrue,
is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iffalse,
is_blit_done_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- auto_advance_MUX_uxn_device_h_l258_c7_f69d
auto_advance_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l258_c7_f69d_cond,
auto_advance_MUX_uxn_device_h_l258_c7_f69d_iftrue,
auto_advance_MUX_uxn_device_h_l258_c7_f69d_iffalse,
auto_advance_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- tmp12_MUX_uxn_device_h_l258_c7_f69d
tmp12_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l258_c7_f69d_cond,
tmp12_MUX_uxn_device_h_l258_c7_f69d_iftrue,
tmp12_MUX_uxn_device_h_l258_c7_f69d_iffalse,
tmp12_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- is_last_blit_MUX_uxn_device_h_l258_c7_f69d
is_last_blit_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l258_c7_f69d_cond,
is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iftrue,
is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iffalse,
is_last_blit_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- tmp4_MUX_uxn_device_h_l258_c7_f69d
tmp4_MUX_uxn_device_h_l258_c7_f69d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l258_c7_f69d_cond,
tmp4_MUX_uxn_device_h_l258_c7_f69d_iftrue,
tmp4_MUX_uxn_device_h_l258_c7_f69d_iffalse,
tmp4_MUX_uxn_device_h_l258_c7_f69d_return_output);

-- BIN_OP_EQ_uxn_device_h_l263_c11_71e8
BIN_OP_EQ_uxn_device_h_l263_c11_71e8 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l263_c11_71e8_left,
BIN_OP_EQ_uxn_device_h_l263_c11_71e8_right,
BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_return_output);

-- tmp8_MUX_uxn_device_h_l263_c7_86eb
tmp8_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l263_c7_86eb_cond,
tmp8_MUX_uxn_device_h_l263_c7_86eb_iftrue,
tmp8_MUX_uxn_device_h_l263_c7_86eb_iffalse,
tmp8_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- tmp8b_MUX_uxn_device_h_l263_c7_86eb
tmp8b_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l263_c7_86eb_cond,
tmp8b_MUX_uxn_device_h_l263_c7_86eb_iftrue,
tmp8b_MUX_uxn_device_h_l263_c7_86eb_iffalse,
tmp8b_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- screen_blit_result_MUX_uxn_device_h_l263_c7_86eb
screen_blit_result_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_cond,
screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iftrue,
screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iffalse,
screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb
ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_cond,
ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue,
ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse,
ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- auto_length_MUX_uxn_device_h_l263_c7_86eb
auto_length_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l263_c7_86eb_cond,
auto_length_MUX_uxn_device_h_l263_c7_86eb_iftrue,
auto_length_MUX_uxn_device_h_l263_c7_86eb_iffalse,
auto_length_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb
y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond,
y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue,
y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse,
y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- ram_addr_MUX_uxn_device_h_l263_c7_86eb
ram_addr_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l263_c7_86eb_cond,
ram_addr_MUX_uxn_device_h_l263_c7_86eb_iftrue,
ram_addr_MUX_uxn_device_h_l263_c7_86eb_iffalse,
ram_addr_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- x_MUX_uxn_device_h_l263_c7_86eb
x_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l263_c7_86eb_cond,
x_MUX_uxn_device_h_l263_c7_86eb_iftrue,
x_MUX_uxn_device_h_l263_c7_86eb_iffalse,
x_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- y_MUX_uxn_device_h_l263_c7_86eb
y_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l263_c7_86eb_cond,
y_MUX_uxn_device_h_l263_c7_86eb_iftrue,
y_MUX_uxn_device_h_l263_c7_86eb_iffalse,
y_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- result_MUX_uxn_device_h_l263_c7_86eb
result_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l263_c7_86eb_cond,
result_MUX_uxn_device_h_l263_c7_86eb_iftrue,
result_MUX_uxn_device_h_l263_c7_86eb_iffalse,
result_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb
x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond,
x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue,
x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse,
x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- is_blit_done_MUX_uxn_device_h_l263_c7_86eb
is_blit_done_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l263_c7_86eb_cond,
is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iftrue,
is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iffalse,
is_blit_done_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- auto_advance_MUX_uxn_device_h_l263_c7_86eb
auto_advance_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l263_c7_86eb_cond,
auto_advance_MUX_uxn_device_h_l263_c7_86eb_iftrue,
auto_advance_MUX_uxn_device_h_l263_c7_86eb_iffalse,
auto_advance_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- tmp12_MUX_uxn_device_h_l263_c7_86eb
tmp12_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l263_c7_86eb_cond,
tmp12_MUX_uxn_device_h_l263_c7_86eb_iftrue,
tmp12_MUX_uxn_device_h_l263_c7_86eb_iffalse,
tmp12_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- is_last_blit_MUX_uxn_device_h_l263_c7_86eb
is_last_blit_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l263_c7_86eb_cond,
is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iftrue,
is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iffalse,
is_last_blit_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- tmp4_MUX_uxn_device_h_l263_c7_86eb
tmp4_MUX_uxn_device_h_l263_c7_86eb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l263_c7_86eb_cond,
tmp4_MUX_uxn_device_h_l263_c7_86eb_iftrue,
tmp4_MUX_uxn_device_h_l263_c7_86eb_iffalse,
tmp4_MUX_uxn_device_h_l263_c7_86eb_return_output);

-- BIN_OP_EQ_uxn_device_h_l273_c18_34b1
BIN_OP_EQ_uxn_device_h_l273_c18_34b1 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l273_c18_34b1_left,
BIN_OP_EQ_uxn_device_h_l273_c18_34b1_right,
BIN_OP_EQ_uxn_device_h_l273_c18_34b1_return_output);

-- MUX_uxn_device_h_l273_c18_7299
MUX_uxn_device_h_l273_c18_7299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l273_c18_7299_cond,
MUX_uxn_device_h_l273_c18_7299_iftrue,
MUX_uxn_device_h_l273_c18_7299_iffalse,
MUX_uxn_device_h_l273_c18_7299_return_output);

-- MUX_uxn_device_h_l275_c19_9dff
MUX_uxn_device_h_l275_c19_9dff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l275_c19_9dff_cond,
MUX_uxn_device_h_l275_c19_9dff_iftrue,
MUX_uxn_device_h_l275_c19_9dff_iffalse,
MUX_uxn_device_h_l275_c19_9dff_return_output);

-- MUX_uxn_device_h_l276_c19_526f
MUX_uxn_device_h_l276_c19_526f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l276_c19_526f_cond,
MUX_uxn_device_h_l276_c19_526f_iftrue,
MUX_uxn_device_h_l276_c19_526f_iffalse,
MUX_uxn_device_h_l276_c19_526f_return_output);

-- MUX_uxn_device_h_l277_c39_6505
MUX_uxn_device_h_l277_c39_6505 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l277_c39_6505_cond,
MUX_uxn_device_h_l277_c39_6505_iftrue,
MUX_uxn_device_h_l277_c39_6505_iffalse,
MUX_uxn_device_h_l277_c39_6505_return_output);

-- MUX_uxn_device_h_l277_c20_bc8a
MUX_uxn_device_h_l277_c20_bc8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l277_c20_bc8a_cond,
MUX_uxn_device_h_l277_c20_bc8a_iftrue,
MUX_uxn_device_h_l277_c20_bc8a_iffalse,
MUX_uxn_device_h_l277_c20_bc8a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output);

-- tmp8_MUX_uxn_device_h_l278_c3_d3cc
tmp8_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l278_c3_d3cc_cond,
tmp8_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
tmp8_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
tmp8_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- tmp8b_MUX_uxn_device_h_l278_c3_d3cc
tmp8b_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l278_c3_d3cc_cond,
tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
tmp8b_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc
screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_cond,
screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- ram_addr_MUX_uxn_device_h_l278_c3_d3cc
ram_addr_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l278_c3_d3cc_cond,
ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
ram_addr_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- x_MUX_uxn_device_h_l278_c3_d3cc
x_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l278_c3_d3cc_cond,
x_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
x_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
x_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- y_MUX_uxn_device_h_l278_c3_d3cc
y_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l278_c3_d3cc_cond,
y_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
y_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
y_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- result_MUX_uxn_device_h_l278_c3_d3cc
result_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l278_c3_d3cc_cond,
result_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
result_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
result_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- is_last_blit_MUX_uxn_device_h_l278_c3_d3cc
is_last_blit_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_cond,
is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- tmp4_MUX_uxn_device_h_l278_c3_d3cc
tmp4_MUX_uxn_device_h_l278_c3_d3cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l278_c3_d3cc_cond,
tmp4_MUX_uxn_device_h_l278_c3_d3cc_iftrue,
tmp4_MUX_uxn_device_h_l278_c3_d3cc_iffalse,
tmp4_MUX_uxn_device_h_l278_c3_d3cc_return_output);

-- BIN_OP_EQ_uxn_device_h_l279_c8_9ecd
BIN_OP_EQ_uxn_device_h_l279_c8_9ecd : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_left,
BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_right,
BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output);

-- tmp8_MUX_uxn_device_h_l279_c4_4947
tmp8_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l279_c4_4947_cond,
tmp8_MUX_uxn_device_h_l279_c4_4947_iftrue,
tmp8_MUX_uxn_device_h_l279_c4_4947_iffalse,
tmp8_MUX_uxn_device_h_l279_c4_4947_return_output);

-- tmp8b_MUX_uxn_device_h_l279_c4_4947
tmp8b_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l279_c4_4947_cond,
tmp8b_MUX_uxn_device_h_l279_c4_4947_iftrue,
tmp8b_MUX_uxn_device_h_l279_c4_4947_iffalse,
tmp8b_MUX_uxn_device_h_l279_c4_4947_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_return_output);

-- ram_addr_MUX_uxn_device_h_l279_c4_4947
ram_addr_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l279_c4_4947_cond,
ram_addr_MUX_uxn_device_h_l279_c4_4947_iftrue,
ram_addr_MUX_uxn_device_h_l279_c4_4947_iffalse,
ram_addr_MUX_uxn_device_h_l279_c4_4947_return_output);

-- x_MUX_uxn_device_h_l279_c4_4947
x_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l279_c4_4947_cond,
x_MUX_uxn_device_h_l279_c4_4947_iftrue,
x_MUX_uxn_device_h_l279_c4_4947_iffalse,
x_MUX_uxn_device_h_l279_c4_4947_return_output);

-- y_MUX_uxn_device_h_l279_c4_4947
y_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l279_c4_4947_cond,
y_MUX_uxn_device_h_l279_c4_4947_iftrue,
y_MUX_uxn_device_h_l279_c4_4947_iffalse,
y_MUX_uxn_device_h_l279_c4_4947_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_cond,
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l279_c4_4947
result_device_ram_address_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_cond,
result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iftrue,
result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iffalse,
result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_return_output);

-- result_u8_value_MUX_uxn_device_h_l279_c4_4947
result_u8_value_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l279_c4_4947_cond,
result_u8_value_MUX_uxn_device_h_l279_c4_4947_iftrue,
result_u8_value_MUX_uxn_device_h_l279_c4_4947_iffalse,
result_u8_value_MUX_uxn_device_h_l279_c4_4947_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l279_c4_4947
result_is_vram_write_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_cond,
result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iftrue,
result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iffalse,
result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l279_c4_4947
result_is_deo_done_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_cond,
result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iftrue,
result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iffalse,
result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_return_output);

-- result_u16_addr_MUX_uxn_device_h_l279_c4_4947
result_u16_addr_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l279_c4_4947_cond,
result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iftrue,
result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iffalse,
result_u16_addr_MUX_uxn_device_h_l279_c4_4947_return_output);

-- tmp4_MUX_uxn_device_h_l279_c4_4947
tmp4_MUX_uxn_device_h_l279_c4_4947 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l279_c4_4947_cond,
tmp4_MUX_uxn_device_h_l279_c4_4947_iftrue,
tmp4_MUX_uxn_device_h_l279_c4_4947_iffalse,
tmp4_MUX_uxn_device_h_l279_c4_4947_return_output);

-- BIN_OP_MINUS_uxn_device_h_l280_c22_b423
BIN_OP_MINUS_uxn_device_h_l280_c22_b423 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l280_c22_b423_left,
BIN_OP_MINUS_uxn_device_h_l280_c22_b423_right,
BIN_OP_MINUS_uxn_device_h_l280_c22_b423_return_output);

-- BIN_OP_PLUS_uxn_device_h_l280_c47_8833
BIN_OP_PLUS_uxn_device_h_l280_c47_8833 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l280_c47_8833_left,
BIN_OP_PLUS_uxn_device_h_l280_c47_8833_right,
BIN_OP_PLUS_uxn_device_h_l280_c47_8833_return_output);

-- MUX_uxn_device_h_l280_c12_12d1
MUX_uxn_device_h_l280_c12_12d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l280_c12_12d1_cond,
MUX_uxn_device_h_l280_c12_12d1_iftrue,
MUX_uxn_device_h_l280_c12_12d1_iffalse,
MUX_uxn_device_h_l280_c12_12d1_return_output);

-- BIN_OP_MINUS_uxn_device_h_l281_c23_93ee
BIN_OP_MINUS_uxn_device_h_l281_c23_93ee : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_left,
BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_right,
BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_return_output);

-- BIN_OP_PLUS_uxn_device_h_l281_c49_745e
BIN_OP_PLUS_uxn_device_h_l281_c49_745e : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l281_c49_745e_left,
BIN_OP_PLUS_uxn_device_h_l281_c49_745e_right,
BIN_OP_PLUS_uxn_device_h_l281_c49_745e_return_output);

-- MUX_uxn_device_h_l281_c13_1644
MUX_uxn_device_h_l281_c13_1644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l281_c13_1644_cond,
MUX_uxn_device_h_l281_c13_1644_iftrue,
MUX_uxn_device_h_l281_c13_1644_iffalse,
MUX_uxn_device_h_l281_c13_1644_return_output);

-- BIN_OP_MINUS_uxn_device_h_l282_c36_8009
BIN_OP_MINUS_uxn_device_h_l282_c36_8009 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l282_c36_8009_left,
BIN_OP_MINUS_uxn_device_h_l282_c36_8009_right,
BIN_OP_MINUS_uxn_device_h_l282_c36_8009_return_output);

-- BIN_OP_PLUS_uxn_device_h_l282_c58_52fa
BIN_OP_PLUS_uxn_device_h_l282_c58_52fa : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_left,
BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_right,
BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_return_output);

-- MUX_uxn_device_h_l282_c26_2bdc
MUX_uxn_device_h_l282_c26_2bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l282_c26_2bdc_cond,
MUX_uxn_device_h_l282_c26_2bdc_iftrue,
MUX_uxn_device_h_l282_c26_2bdc_iffalse,
MUX_uxn_device_h_l282_c26_2bdc_return_output);

-- MUX_uxn_device_h_l282_c10_0b53
MUX_uxn_device_h_l282_c10_0b53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l282_c10_0b53_cond,
MUX_uxn_device_h_l282_c10_0b53_iftrue,
MUX_uxn_device_h_l282_c10_0b53_iffalse,
MUX_uxn_device_h_l282_c10_0b53_return_output);

-- BIN_OP_MINUS_uxn_device_h_l283_c36_2d74
BIN_OP_MINUS_uxn_device_h_l283_c36_2d74 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_left,
BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_right,
BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_return_output);

-- BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4
BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_left,
BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_right,
BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_return_output);

-- MUX_uxn_device_h_l283_c26_aa53
MUX_uxn_device_h_l283_c26_aa53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l283_c26_aa53_cond,
MUX_uxn_device_h_l283_c26_aa53_iftrue,
MUX_uxn_device_h_l283_c26_aa53_iffalse,
MUX_uxn_device_h_l283_c26_aa53_return_output);

-- MUX_uxn_device_h_l283_c10_e9e2
MUX_uxn_device_h_l283_c10_e9e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l283_c10_e9e2_cond,
MUX_uxn_device_h_l283_c10_e9e2_iftrue,
MUX_uxn_device_h_l283_c10_e9e2_iffalse,
MUX_uxn_device_h_l283_c10_e9e2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l290_c22_caaf
BIN_OP_PLUS_uxn_device_h_l290_c22_caaf : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_left,
BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_right,
BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_return_output);

-- BIN_OP_EQ_uxn_device_h_l290_c13_472f
BIN_OP_EQ_uxn_device_h_l290_c13_472f : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l290_c13_472f_left,
BIN_OP_EQ_uxn_device_h_l290_c13_472f_right,
BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_return_output);

-- ram_addr_MUX_uxn_device_h_l290_c9_d961
ram_addr_MUX_uxn_device_h_l290_c9_d961 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l290_c9_d961_cond,
ram_addr_MUX_uxn_device_h_l290_c9_d961_iftrue,
ram_addr_MUX_uxn_device_h_l290_c9_d961_iffalse,
ram_addr_MUX_uxn_device_h_l290_c9_d961_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_cond,
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l290_c9_d961
result_is_deo_done_MUX_uxn_device_h_l290_c9_d961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_cond,
result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iftrue,
result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iffalse,
result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l290_c9_d961
result_device_ram_address_MUX_uxn_device_h_l290_c9_d961 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_cond,
result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iftrue,
result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iffalse,
result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_return_output);

-- result_u8_value_MUX_uxn_device_h_l290_c9_d961
result_u8_value_MUX_uxn_device_h_l290_c9_d961 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l290_c9_d961_cond,
result_u8_value_MUX_uxn_device_h_l290_c9_d961_iftrue,
result_u8_value_MUX_uxn_device_h_l290_c9_d961_iffalse,
result_u8_value_MUX_uxn_device_h_l290_c9_d961_return_output);

-- tmp4_MUX_uxn_device_h_l290_c9_d961
tmp4_MUX_uxn_device_h_l290_c9_d961 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l290_c9_d961_cond,
tmp4_MUX_uxn_device_h_l290_c9_d961_iftrue,
tmp4_MUX_uxn_device_h_l290_c9_d961_iffalse,
tmp4_MUX_uxn_device_h_l290_c9_d961_return_output);

-- BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe
BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe : entity work.BIN_OP_PLUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_left,
BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_right,
BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_return_output);

-- BIN_OP_EQ_uxn_device_h_l295_c13_206a
BIN_OP_EQ_uxn_device_h_l295_c13_206a : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l295_c13_206a_left,
BIN_OP_EQ_uxn_device_h_l295_c13_206a_right,
BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_return_output);

-- ram_addr_MUX_uxn_device_h_l295_c9_7fab
ram_addr_MUX_uxn_device_h_l295_c9_7fab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l295_c9_7fab_cond,
ram_addr_MUX_uxn_device_h_l295_c9_7fab_iftrue,
ram_addr_MUX_uxn_device_h_l295_c9_7fab_iffalse,
ram_addr_MUX_uxn_device_h_l295_c9_7fab_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_cond,
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab
result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_cond,
result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iftrue,
result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iffalse,
result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab
result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_cond,
result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iftrue,
result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iffalse,
result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_return_output);

-- result_u8_value_MUX_uxn_device_h_l295_c9_7fab
result_u8_value_MUX_uxn_device_h_l295_c9_7fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l295_c9_7fab_cond,
result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iftrue,
result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iffalse,
result_u8_value_MUX_uxn_device_h_l295_c9_7fab_return_output);

-- tmp4_MUX_uxn_device_h_l295_c9_7fab
tmp4_MUX_uxn_device_h_l295_c9_7fab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l295_c9_7fab_cond,
tmp4_MUX_uxn_device_h_l295_c9_7fab_iftrue,
tmp4_MUX_uxn_device_h_l295_c9_7fab_iffalse,
tmp4_MUX_uxn_device_h_l295_c9_7fab_return_output);

-- BIN_OP_PLUS_uxn_device_h_l299_c22_55f5
BIN_OP_PLUS_uxn_device_h_l299_c22_55f5 : entity work.BIN_OP_PLUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_left,
BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_right,
BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_return_output);

-- BIN_OP_EQ_uxn_device_h_l299_c13_5629
BIN_OP_EQ_uxn_device_h_l299_c13_5629 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l299_c13_5629_left,
BIN_OP_EQ_uxn_device_h_l299_c13_5629_right,
BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_return_output);

-- ram_addr_MUX_uxn_device_h_l299_c9_5162
ram_addr_MUX_uxn_device_h_l299_c9_5162 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l299_c9_5162_cond,
ram_addr_MUX_uxn_device_h_l299_c9_5162_iftrue,
ram_addr_MUX_uxn_device_h_l299_c9_5162_iffalse,
ram_addr_MUX_uxn_device_h_l299_c9_5162_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_cond,
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l299_c9_5162
result_is_deo_done_MUX_uxn_device_h_l299_c9_5162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_cond,
result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iftrue,
result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iffalse,
result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l299_c9_5162
result_device_ram_address_MUX_uxn_device_h_l299_c9_5162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_cond,
result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iftrue,
result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iffalse,
result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_return_output);

-- result_u8_value_MUX_uxn_device_h_l299_c9_5162
result_u8_value_MUX_uxn_device_h_l299_c9_5162 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l299_c9_5162_cond,
result_u8_value_MUX_uxn_device_h_l299_c9_5162_iftrue,
result_u8_value_MUX_uxn_device_h_l299_c9_5162_iffalse,
result_u8_value_MUX_uxn_device_h_l299_c9_5162_return_output);

-- tmp4_MUX_uxn_device_h_l299_c9_5162
tmp4_MUX_uxn_device_h_l299_c9_5162 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l299_c9_5162_cond,
tmp4_MUX_uxn_device_h_l299_c9_5162_iftrue,
tmp4_MUX_uxn_device_h_l299_c9_5162_iffalse,
tmp4_MUX_uxn_device_h_l299_c9_5162_return_output);

-- BIN_OP_PLUS_uxn_device_h_l303_c22_802a
BIN_OP_PLUS_uxn_device_h_l303_c22_802a : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l303_c22_802a_left,
BIN_OP_PLUS_uxn_device_h_l303_c22_802a_right,
BIN_OP_PLUS_uxn_device_h_l303_c22_802a_return_output);

-- BIN_OP_EQ_uxn_device_h_l303_c13_5d64
BIN_OP_EQ_uxn_device_h_l303_c13_5d64 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l303_c13_5d64_left,
BIN_OP_EQ_uxn_device_h_l303_c13_5d64_right,
BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_return_output);

-- ram_addr_MUX_uxn_device_h_l303_c9_7bb2
ram_addr_MUX_uxn_device_h_l303_c9_7bb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l303_c9_7bb2_cond,
ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iftrue,
ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iffalse,
ram_addr_MUX_uxn_device_h_l303_c9_7bb2_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_cond,
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2
result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_cond,
result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2
result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_cond,
result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_return_output);

-- result_u8_value_MUX_uxn_device_h_l303_c9_7bb2
result_u8_value_MUX_uxn_device_h_l303_c9_7bb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_cond,
result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iftrue,
result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iffalse,
result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_return_output);

-- tmp4_MUX_uxn_device_h_l303_c9_7bb2
tmp4_MUX_uxn_device_h_l303_c9_7bb2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l303_c9_7bb2_cond,
tmp4_MUX_uxn_device_h_l303_c9_7bb2_iftrue,
tmp4_MUX_uxn_device_h_l303_c9_7bb2_iffalse,
tmp4_MUX_uxn_device_h_l303_c9_7bb2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l307_c22_480d
BIN_OP_PLUS_uxn_device_h_l307_c22_480d : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l307_c22_480d_left,
BIN_OP_PLUS_uxn_device_h_l307_c22_480d_right,
BIN_OP_PLUS_uxn_device_h_l307_c22_480d_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c13_3fa3
BIN_OP_EQ_uxn_device_h_l307_c13_3fa3 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_left,
BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_right,
BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_return_output);

-- ram_addr_MUX_uxn_device_h_l307_c9_8ccc
ram_addr_MUX_uxn_device_h_l307_c9_8ccc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l307_c9_8ccc_cond,
ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iftrue,
ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iffalse,
ram_addr_MUX_uxn_device_h_l307_c9_8ccc_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_cond,
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc
result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_cond,
result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc
result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_cond,
result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_return_output);

-- result_u8_value_MUX_uxn_device_h_l307_c9_8ccc
result_u8_value_MUX_uxn_device_h_l307_c9_8ccc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_cond,
result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iftrue,
result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iffalse,
result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_return_output);

-- tmp4_MUX_uxn_device_h_l307_c9_8ccc
tmp4_MUX_uxn_device_h_l307_c9_8ccc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l307_c9_8ccc_cond,
tmp4_MUX_uxn_device_h_l307_c9_8ccc_iftrue,
tmp4_MUX_uxn_device_h_l307_c9_8ccc_iffalse,
tmp4_MUX_uxn_device_h_l307_c9_8ccc_return_output);

-- BIN_OP_PLUS_uxn_device_h_l309_c5_a791
BIN_OP_PLUS_uxn_device_h_l309_c5_a791 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l309_c5_a791_left,
BIN_OP_PLUS_uxn_device_h_l309_c5_a791_right,
BIN_OP_PLUS_uxn_device_h_l309_c5_a791_return_output);

-- CONST_SR_8_uxn_device_h_l312_c33_02f4
CONST_SR_8_uxn_device_h_l312_c33_02f4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l312_c33_02f4_x,
CONST_SR_8_uxn_device_h_l312_c33_02f4_return_output);

-- BIN_OP_PLUS_uxn_device_h_l314_c22_d664
BIN_OP_PLUS_uxn_device_h_l314_c22_d664 : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l314_c22_d664_left,
BIN_OP_PLUS_uxn_device_h_l314_c22_d664_right,
BIN_OP_PLUS_uxn_device_h_l314_c22_d664_return_output);

-- BIN_OP_EQ_uxn_device_h_l314_c13_e704
BIN_OP_EQ_uxn_device_h_l314_c13_e704 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l314_c13_e704_left,
BIN_OP_EQ_uxn_device_h_l314_c13_e704_right,
BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_cond,
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l314_c9_6636
result_is_deo_done_MUX_uxn_device_h_l314_c9_6636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_cond,
result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iftrue,
result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iffalse,
result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l314_c9_6636
result_device_ram_address_MUX_uxn_device_h_l314_c9_6636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_cond,
result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iftrue,
result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iffalse,
result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_return_output);

-- result_u8_value_MUX_uxn_device_h_l314_c9_6636
result_u8_value_MUX_uxn_device_h_l314_c9_6636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l314_c9_6636_cond,
result_u8_value_MUX_uxn_device_h_l314_c9_6636_iftrue,
result_u8_value_MUX_uxn_device_h_l314_c9_6636_iffalse,
result_u8_value_MUX_uxn_device_h_l314_c9_6636_return_output);

-- tmp4_MUX_uxn_device_h_l314_c9_6636
tmp4_MUX_uxn_device_h_l314_c9_6636 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l314_c9_6636_cond,
tmp4_MUX_uxn_device_h_l314_c9_6636_iftrue,
tmp4_MUX_uxn_device_h_l314_c9_6636_iffalse,
tmp4_MUX_uxn_device_h_l314_c9_6636_return_output);

-- BIN_OP_PLUS_uxn_device_h_l319_c22_e602
BIN_OP_PLUS_uxn_device_h_l319_c22_e602 : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l319_c22_e602_left,
BIN_OP_PLUS_uxn_device_h_l319_c22_e602_right,
BIN_OP_PLUS_uxn_device_h_l319_c22_e602_return_output);

-- BIN_OP_EQ_uxn_device_h_l319_c13_f277
BIN_OP_EQ_uxn_device_h_l319_c13_f277 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l319_c13_f277_left,
BIN_OP_EQ_uxn_device_h_l319_c13_f277_right,
BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_cond,
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1
result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_cond,
result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1
result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_cond,
result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_return_output);

-- tmp4_MUX_uxn_device_h_l319_c9_20c1
tmp4_MUX_uxn_device_h_l319_c9_20c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l319_c9_20c1_cond,
tmp4_MUX_uxn_device_h_l319_c9_20c1_iftrue,
tmp4_MUX_uxn_device_h_l319_c9_20c1_iffalse,
tmp4_MUX_uxn_device_h_l319_c9_20c1_return_output);

-- BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c
BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c : entity work.BIN_OP_PLUS_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_left,
BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_right,
BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_return_output);

-- screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1
screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_cond,
screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iftrue,
screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iffalse,
screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output);

-- screen_2bpp_uxn_device_h_l328_c26_23be
screen_2bpp_uxn_device_h_l328_c26_23be : entity work.screen_2bpp_0CLK_29be10e5 port map (
clk,
screen_2bpp_uxn_device_h_l328_c26_23be_CLOCK_ENABLE,
screen_2bpp_uxn_device_h_l328_c26_23be_phase,
screen_2bpp_uxn_device_h_l328_c26_23be_x1,
screen_2bpp_uxn_device_h_l328_c26_23be_y1,
screen_2bpp_uxn_device_h_l328_c26_23be_color,
screen_2bpp_uxn_device_h_l328_c26_23be_fx,
screen_2bpp_uxn_device_h_l328_c26_23be_fy,
screen_2bpp_uxn_device_h_l328_c26_23be_ram_addr,
screen_2bpp_uxn_device_h_l328_c26_23be_previous_ram_read,
screen_2bpp_uxn_device_h_l328_c26_23be_return_output);

-- screen_1bpp_uxn_device_h_l330_c26_276f
screen_1bpp_uxn_device_h_l330_c26_276f : entity work.screen_1bpp_0CLK_f5a95d24 port map (
clk,
screen_1bpp_uxn_device_h_l330_c26_276f_CLOCK_ENABLE,
screen_1bpp_uxn_device_h_l330_c26_276f_phase,
screen_1bpp_uxn_device_h_l330_c26_276f_x1,
screen_1bpp_uxn_device_h_l330_c26_276f_y1,
screen_1bpp_uxn_device_h_l330_c26_276f_color,
screen_1bpp_uxn_device_h_l330_c26_276f_fx,
screen_1bpp_uxn_device_h_l330_c26_276f_fy,
screen_1bpp_uxn_device_h_l330_c26_276f_ram_addr,
screen_1bpp_uxn_device_h_l330_c26_276f_previous_ram_read,
screen_1bpp_uxn_device_h_l330_c26_276f_return_output);

-- BIN_OP_EQ_uxn_device_h_l339_c19_781a
BIN_OP_EQ_uxn_device_h_l339_c19_781a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l339_c19_781a_left,
BIN_OP_EQ_uxn_device_h_l339_c19_781a_right,
BIN_OP_EQ_uxn_device_h_l339_c19_781a_return_output);

-- MUX_uxn_device_h_l339_c19_d350
MUX_uxn_device_h_l339_c19_d350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l339_c19_d350_cond,
MUX_uxn_device_h_l339_c19_d350_iftrue,
MUX_uxn_device_h_l339_c19_d350_iffalse,
MUX_uxn_device_h_l339_c19_d350_return_output);

-- BIN_OP_XOR_uxn_device_h_l342_c11_8c41
BIN_OP_XOR_uxn_device_h_l342_c11_8c41 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_device_h_l342_c11_8c41_left,
BIN_OP_XOR_uxn_device_h_l342_c11_8c41_right,
BIN_OP_XOR_uxn_device_h_l342_c11_8c41_return_output);

-- BIN_OP_PLUS_uxn_device_h_l342_c60_51e3
BIN_OP_PLUS_uxn_device_h_l342_c60_51e3 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_left,
BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_right,
BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_return_output);

-- MUX_uxn_device_h_l342_c11_9721
MUX_uxn_device_h_l342_c11_9721 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l342_c11_9721_cond,
MUX_uxn_device_h_l342_c11_9721_iftrue,
MUX_uxn_device_h_l342_c11_9721_iffalse,
MUX_uxn_device_h_l342_c11_9721_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12
CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_x,
CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_left,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_right,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_left,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_right,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output);



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
 tmp12,
 ctrl,
 auto_advance,
 tmp8,
 tmp8b,
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
 BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 tmp8_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 tmp8b_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 flip_y_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 auto_length_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 ram_addr_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 x_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 color_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 y_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 result_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 flip_x_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 layer_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 ctrl_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 auto_advance_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 tmp12_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 tmp4_MUX_uxn_device_h_l231_c2_3fd6_return_output,
 BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_return_output,
 tmp8_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 tmp8b_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 flip_y_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 auto_length_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 ram_addr_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 x_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 color_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 y_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 result_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 flip_x_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 layer_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 ctrl_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 auto_advance_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 tmp12_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 tmp4_MUX_uxn_device_h_l238_c7_5dc9_return_output,
 BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 tmp8_MUX_uxn_device_h_l241_c7_1d64_return_output,
 tmp8b_MUX_uxn_device_h_l241_c7_1d64_return_output,
 screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_return_output,
 flip_y_MUX_uxn_device_h_l241_c7_1d64_return_output,
 ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_return_output,
 auto_length_MUX_uxn_device_h_l241_c7_1d64_return_output,
 y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output,
 ram_addr_MUX_uxn_device_h_l241_c7_1d64_return_output,
 x_MUX_uxn_device_h_l241_c7_1d64_return_output,
 color_MUX_uxn_device_h_l241_c7_1d64_return_output,
 y_MUX_uxn_device_h_l241_c7_1d64_return_output,
 ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_return_output,
 result_MUX_uxn_device_h_l241_c7_1d64_return_output,
 x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output,
 flip_x_MUX_uxn_device_h_l241_c7_1d64_return_output,
 is_blit_done_MUX_uxn_device_h_l241_c7_1d64_return_output,
 layer_MUX_uxn_device_h_l241_c7_1d64_return_output,
 ctrl_MUX_uxn_device_h_l241_c7_1d64_return_output,
 auto_advance_MUX_uxn_device_h_l241_c7_1d64_return_output,
 tmp12_MUX_uxn_device_h_l241_c7_1d64_return_output,
 is_last_blit_MUX_uxn_device_h_l241_c7_1d64_return_output,
 tmp4_MUX_uxn_device_h_l241_c7_1d64_return_output,
 BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_return_output,
 tmp8_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 tmp8b_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 flip_y_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 auto_length_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 ram_addr_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 x_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 color_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 y_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 result_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 flip_x_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 layer_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 ctrl_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 auto_advance_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 tmp12_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 tmp4_MUX_uxn_device_h_l245_c7_5ed1_return_output,
 BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_return_output,
 tmp8_MUX_uxn_device_h_l249_c7_6d57_return_output,
 tmp8b_MUX_uxn_device_h_l249_c7_6d57_return_output,
 screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_return_output,
 flip_y_MUX_uxn_device_h_l249_c7_6d57_return_output,
 ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_return_output,
 auto_length_MUX_uxn_device_h_l249_c7_6d57_return_output,
 y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output,
 ram_addr_MUX_uxn_device_h_l249_c7_6d57_return_output,
 x_MUX_uxn_device_h_l249_c7_6d57_return_output,
 color_MUX_uxn_device_h_l249_c7_6d57_return_output,
 y_MUX_uxn_device_h_l249_c7_6d57_return_output,
 ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_return_output,
 result_MUX_uxn_device_h_l249_c7_6d57_return_output,
 x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output,
 flip_x_MUX_uxn_device_h_l249_c7_6d57_return_output,
 is_blit_done_MUX_uxn_device_h_l249_c7_6d57_return_output,
 layer_MUX_uxn_device_h_l249_c7_6d57_return_output,
 ctrl_MUX_uxn_device_h_l249_c7_6d57_return_output,
 auto_advance_MUX_uxn_device_h_l249_c7_6d57_return_output,
 tmp12_MUX_uxn_device_h_l249_c7_6d57_return_output,
 is_last_blit_MUX_uxn_device_h_l249_c7_6d57_return_output,
 tmp4_MUX_uxn_device_h_l249_c7_6d57_return_output,
 CONST_SR_7_uxn_device_h_l252_c25_b137_return_output,
 CONST_SR_6_uxn_device_h_l253_c21_2209_return_output,
 CONST_SR_5_uxn_device_h_l254_c22_76c3_return_output,
 CONST_SR_4_uxn_device_h_l255_c22_7663_return_output,
 BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_return_output,
 tmp8_MUX_uxn_device_h_l258_c7_f69d_return_output,
 tmp8b_MUX_uxn_device_h_l258_c7_f69d_return_output,
 screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_return_output,
 ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_return_output,
 auto_length_MUX_uxn_device_h_l258_c7_f69d_return_output,
 y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output,
 ram_addr_MUX_uxn_device_h_l258_c7_f69d_return_output,
 x_MUX_uxn_device_h_l258_c7_f69d_return_output,
 y_MUX_uxn_device_h_l258_c7_f69d_return_output,
 result_MUX_uxn_device_h_l258_c7_f69d_return_output,
 x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output,
 is_blit_done_MUX_uxn_device_h_l258_c7_f69d_return_output,
 auto_advance_MUX_uxn_device_h_l258_c7_f69d_return_output,
 tmp12_MUX_uxn_device_h_l258_c7_f69d_return_output,
 is_last_blit_MUX_uxn_device_h_l258_c7_f69d_return_output,
 tmp4_MUX_uxn_device_h_l258_c7_f69d_return_output,
 BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_return_output,
 tmp8_MUX_uxn_device_h_l263_c7_86eb_return_output,
 tmp8b_MUX_uxn_device_h_l263_c7_86eb_return_output,
 screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_return_output,
 ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_return_output,
 auto_length_MUX_uxn_device_h_l263_c7_86eb_return_output,
 y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output,
 ram_addr_MUX_uxn_device_h_l263_c7_86eb_return_output,
 x_MUX_uxn_device_h_l263_c7_86eb_return_output,
 y_MUX_uxn_device_h_l263_c7_86eb_return_output,
 result_MUX_uxn_device_h_l263_c7_86eb_return_output,
 x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output,
 is_blit_done_MUX_uxn_device_h_l263_c7_86eb_return_output,
 auto_advance_MUX_uxn_device_h_l263_c7_86eb_return_output,
 tmp12_MUX_uxn_device_h_l263_c7_86eb_return_output,
 is_last_blit_MUX_uxn_device_h_l263_c7_86eb_return_output,
 tmp4_MUX_uxn_device_h_l263_c7_86eb_return_output,
 BIN_OP_EQ_uxn_device_h_l273_c18_34b1_return_output,
 MUX_uxn_device_h_l273_c18_7299_return_output,
 MUX_uxn_device_h_l275_c19_9dff_return_output,
 MUX_uxn_device_h_l276_c19_526f_return_output,
 MUX_uxn_device_h_l277_c39_6505_return_output,
 MUX_uxn_device_h_l277_c20_bc8a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output,
 tmp8_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 tmp8b_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 ram_addr_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 x_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 y_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 result_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 tmp4_MUX_uxn_device_h_l278_c3_d3cc_return_output,
 BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output,
 tmp8_MUX_uxn_device_h_l279_c4_4947_return_output,
 tmp8b_MUX_uxn_device_h_l279_c4_4947_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_return_output,
 ram_addr_MUX_uxn_device_h_l279_c4_4947_return_output,
 x_MUX_uxn_device_h_l279_c4_4947_return_output,
 y_MUX_uxn_device_h_l279_c4_4947_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_return_output,
 result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_return_output,
 result_u8_value_MUX_uxn_device_h_l279_c4_4947_return_output,
 result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_return_output,
 result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_return_output,
 result_u16_addr_MUX_uxn_device_h_l279_c4_4947_return_output,
 tmp4_MUX_uxn_device_h_l279_c4_4947_return_output,
 BIN_OP_MINUS_uxn_device_h_l280_c22_b423_return_output,
 BIN_OP_PLUS_uxn_device_h_l280_c47_8833_return_output,
 MUX_uxn_device_h_l280_c12_12d1_return_output,
 BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_return_output,
 BIN_OP_PLUS_uxn_device_h_l281_c49_745e_return_output,
 MUX_uxn_device_h_l281_c13_1644_return_output,
 BIN_OP_MINUS_uxn_device_h_l282_c36_8009_return_output,
 BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_return_output,
 MUX_uxn_device_h_l282_c26_2bdc_return_output,
 MUX_uxn_device_h_l282_c10_0b53_return_output,
 BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_return_output,
 BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_return_output,
 MUX_uxn_device_h_l283_c26_aa53_return_output,
 MUX_uxn_device_h_l283_c10_e9e2_return_output,
 BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_return_output,
 BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_return_output,
 ram_addr_MUX_uxn_device_h_l290_c9_d961_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_return_output,
 result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_return_output,
 result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_return_output,
 result_u8_value_MUX_uxn_device_h_l290_c9_d961_return_output,
 tmp4_MUX_uxn_device_h_l290_c9_d961_return_output,
 BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_return_output,
 BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_return_output,
 ram_addr_MUX_uxn_device_h_l295_c9_7fab_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_return_output,
 result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_return_output,
 result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_return_output,
 result_u8_value_MUX_uxn_device_h_l295_c9_7fab_return_output,
 tmp4_MUX_uxn_device_h_l295_c9_7fab_return_output,
 BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_return_output,
 BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_return_output,
 ram_addr_MUX_uxn_device_h_l299_c9_5162_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_return_output,
 result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_return_output,
 result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_return_output,
 result_u8_value_MUX_uxn_device_h_l299_c9_5162_return_output,
 tmp4_MUX_uxn_device_h_l299_c9_5162_return_output,
 BIN_OP_PLUS_uxn_device_h_l303_c22_802a_return_output,
 BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_return_output,
 ram_addr_MUX_uxn_device_h_l303_c9_7bb2_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_return_output,
 result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_return_output,
 tmp4_MUX_uxn_device_h_l303_c9_7bb2_return_output,
 BIN_OP_PLUS_uxn_device_h_l307_c22_480d_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_return_output,
 ram_addr_MUX_uxn_device_h_l307_c9_8ccc_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_return_output,
 result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_return_output,
 tmp4_MUX_uxn_device_h_l307_c9_8ccc_return_output,
 BIN_OP_PLUS_uxn_device_h_l309_c5_a791_return_output,
 CONST_SR_8_uxn_device_h_l312_c33_02f4_return_output,
 BIN_OP_PLUS_uxn_device_h_l314_c22_d664_return_output,
 BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_return_output,
 result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_return_output,
 result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_return_output,
 result_u8_value_MUX_uxn_device_h_l314_c9_6636_return_output,
 tmp4_MUX_uxn_device_h_l314_c9_6636_return_output,
 BIN_OP_PLUS_uxn_device_h_l319_c22_e602_return_output,
 BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_return_output,
 tmp4_MUX_uxn_device_h_l319_c9_20c1_return_output,
 BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_return_output,
 screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output,
 screen_2bpp_uxn_device_h_l328_c26_23be_return_output,
 screen_1bpp_uxn_device_h_l330_c26_276f_return_output,
 BIN_OP_EQ_uxn_device_h_l339_c19_781a_return_output,
 MUX_uxn_device_h_l339_c19_d350_return_output,
 BIN_OP_XOR_uxn_device_h_l342_c11_8c41_return_output,
 BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_return_output,
 MUX_uxn_device_h_l342_c11_9721_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output,
 BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output,
 BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l231_c2_3fd6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_5dc9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l231_c2_3fd6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l238_c7_5dc9_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c7_1d64_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l241_c7_1d64_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l241_c7_1d64_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c7_1d64_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l245_c7_5ed1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l245_c7_5ed1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l249_c7_6d57_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l249_c7_6d57_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l249_c7_6d57_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l249_c7_6d57_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l258_c7_f69d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l251_c11_0592_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l252_c25_b137_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l252_c25_b137_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l252_c15_8b8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l253_c21_2209_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l253_c21_2209_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l253_c11_9825_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l254_c22_76c3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l254_c22_76c3_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l254_c12_14c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l255_c22_7663_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l255_c22_7663_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l255_c12_e587_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l258_c7_f69d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l258_c7_f69d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l258_c7_f69d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l263_c7_86eb_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_uxn_device_h_l267_c3_bea8 : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_uxn_device_h_l268_c3_3cdd : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l263_c7_86eb_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l263_c7_86eb_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l278_c3_d3cc_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l266_c3_823a : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_7299_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_7299_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_7299_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_7299_return_output : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l274_c17_d8c3_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_9dff_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l275_c19_5795_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_9dff_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_9dff_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_9dff_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_526f_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l276_c19_e98a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_526f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_526f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_526f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_bc8a_cond : unsigned(0 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l277_c20_4e22_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_bc8a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_bc8a_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_6505_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_6505_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_6505_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_6505_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_bc8a_return_output : unsigned(15 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l278_c3_d3cc_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f_uxn_device_h_l278_c3_d3cc_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l278_c3_d3cc_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l285_c5_351e : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_12d1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_12d1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_12d1_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_12d1_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_1644_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_1644_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_1644_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_1644_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_0b53_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_0b53_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_0b53_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_2bdc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_2bdc_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_2bdc_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_2bdc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_0b53_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_e9e2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_e9e2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_e9e2_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_aa53_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_aa53_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_aa53_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_aa53_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_e9e2_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l288_c23_fd68_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l293_c23_97f5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_uxn_device_h_l309_c5_b7fb : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l312_c33_02f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l312_c33_02f4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l312_c23_70fc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l317_c23_8e87_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l320_c5_7830 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_return_output : unsigned(4 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_cond : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_phase : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_x1 : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_y1 : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_color : unsigned(3 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_fx : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_fy : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_23be_return_output : screen_blit_result_t;
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_phase : unsigned(11 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_x1 : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_y1 : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_color : unsigned(3 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_fx : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_fy : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_276f_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l333_c4_a9a2 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l335_c27_22a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l336_c22_9409_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l338_c22_2666_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_d350_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_d350_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_d350_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_d350_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_9721_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_9721_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_9721_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_9721_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l308_l246_l259_DUPLICATE_da5a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_f584_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_3f28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_404a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_d6a7_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ram_addr : unsigned(15 downto 0);
variable REG_VAR_ram_addr_incr : unsigned(15 downto 0);
variable REG_VAR_tmp12 : unsigned(11 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_tmp8b : unsigned(7 downto 0);
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
  REG_VAR_tmp12 := tmp12;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_tmp8b := tmp8b;
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
     VAR_tmp4_uxn_device_h_l266_c3_823a := resize(to_unsigned(0, 1), 4);
     VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_iftrue := VAR_tmp4_uxn_device_h_l266_c3_823a;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_right := to_unsigned(3, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l339_c19_d350_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iftrue := to_unsigned(44, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iftrue := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l276_c19_526f_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iftrue := to_unsigned(0, 1);
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_right := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iftrue := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_right := to_unsigned(3, 2);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_right := to_unsigned(5, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l276_c19_526f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l339_c19_d350_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_right := to_unsigned(2, 2);
     VAR_MUX_uxn_device_h_l277_c39_6505_iftrue := to_unsigned(16, 16);
     VAR_MUX_uxn_device_h_l277_c20_bc8a_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_right := to_unsigned(1, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_right := to_unsigned(7, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iftrue := to_unsigned(44, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iftrue := to_unsigned(43, 8);
     VAR_result_u16_addr_uxn_device_h_l285_c5_351e := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_result_u16_addr_uxn_device_h_l285_c5_351e;
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iftrue := to_unsigned(45, 8);
     VAR_result_device_ram_address_uxn_device_h_l333_c4_a9a2 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_right := to_unsigned(6, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l275_c19_9dff_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l275_c19_9dff_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iftrue := to_unsigned(45, 8);
     VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_iftrue := to_unsigned(7, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_right := to_unsigned(0, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_right := to_unsigned(2, 12);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_right := to_unsigned(4, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l277_c39_6505_iffalse := to_unsigned(8, 16);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_device_h_l273_c18_7299_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_iftrue := auto_advance;
     VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_iftrue := auto_length;
     VAR_color_MUX_uxn_device_h_l231_c2_3fd6_iftrue := color;
     VAR_color_MUX_uxn_device_h_l238_c7_5dc9_iftrue := color;
     VAR_color_MUX_uxn_device_h_l241_c7_1d64_iftrue := color;
     VAR_color_MUX_uxn_device_h_l245_c7_5ed1_iftrue := color;
     VAR_color_MUX_uxn_device_h_l249_c7_6d57_iffalse := color;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_color := color;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_color := color;
     VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_iffalse := ctrl;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l277_c39_6505_cond := ctrl_mode;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_cond := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iffalse := ctrl_mode;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l280_c12_12d1_cond := flip_x;
     VAR_MUX_uxn_device_h_l282_c26_2bdc_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_iffalse := flip_x;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_fx := flip_x;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_fx := flip_x;
     VAR_MUX_uxn_device_h_l281_c13_1644_cond := flip_y;
     VAR_MUX_uxn_device_h_l283_c26_aa53_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_iffalse := flip_y;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_fy := flip_y;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_fy := flip_y;
     VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_left := is_blit_done;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_cond := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iftrue := is_blit_done;
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_result_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_x_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_y_MUX_uxn_device_h_l278_c3_d3cc_cond := is_blit_done;
     VAR_MUX_uxn_device_h_l282_c10_0b53_cond := is_last_blit;
     VAR_MUX_uxn_device_h_l283_c10_e9e2_cond := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iftrue := is_last_blit;
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iftrue := is_last_blit;
     VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l241_c7_1d64_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l249_c7_6d57_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_left := VAR_phase;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l255_c22_7663_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l254_c22_76c3_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l253_c21_2209_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l252_c25_b137_x := VAR_previous_device_ram_read;
     VAR_MUX_uxn_device_h_l273_c18_7299_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_iftrue := VAR_previous_device_ram_read;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_previous_ram_read := VAR_previous_ram_read;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iffalse := ram_addr;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_ram_addr := ram_addr;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_ram_addr := ram_addr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue := ram_addr_incr;
     VAR_result_MUX_uxn_device_h_l263_c7_86eb_iftrue := result;
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iftrue := screen_blit_result;
     VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_right := tmp12;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_right := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_left := tmp12;
     VAR_MUX_uxn_device_h_l342_c11_9721_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_iftrue := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_right := tmp4;
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_left := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_iffalse := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_iffalse := tmp4;
     VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_left := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_left := tmp8;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_x1 := tmp8;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_x1 := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_iffalse := tmp8;
     VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_left := tmp8b;
     VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_left := tmp8b;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_y1 := tmp8b;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_y1 := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iffalse := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_iffalse := tmp8b;
     VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_left := x;
     VAR_MUX_uxn_device_h_l282_c10_0b53_iffalse := x;
     VAR_tmp8_uxn_device_h_l267_c3_bea8 := resize(x, 8);
     VAR_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue := x;
     VAR_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue := x;
     VAR_x_MUX_uxn_device_h_l249_c7_6d57_iftrue := x;
     VAR_x_MUX_uxn_device_h_l258_c7_f69d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l263_c7_86eb_iftrue := x;
     VAR_x_MUX_uxn_device_h_l278_c3_d3cc_iffalse := x;
     VAR_x_MUX_uxn_device_h_l279_c4_4947_iffalse := x;
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue := x_sprite_incr;
     VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_left := y;
     VAR_MUX_uxn_device_h_l283_c10_e9e2_iffalse := y;
     VAR_tmp8b_uxn_device_h_l268_c3_3cdd := resize(y, 8);
     VAR_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l241_c7_1d64_iftrue := y;
     VAR_y_MUX_uxn_device_h_l249_c7_6d57_iftrue := y;
     VAR_y_MUX_uxn_device_h_l258_c7_f69d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l263_c7_86eb_iftrue := y;
     VAR_y_MUX_uxn_device_h_l278_c3_d3cc_iffalse := y;
     VAR_y_MUX_uxn_device_h_l279_c4_4947_iffalse := y;
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue := y_sprite_incr;
     VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_iftrue := VAR_tmp8_uxn_device_h_l267_c3_bea8;
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_iftrue := VAR_tmp8b_uxn_device_h_l268_c3_3cdd;
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output := screen_blit_result.is_blit_done;

     -- BIN_OP_EQ[uxn_device_h_l231_c6_f0cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_left <= VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_left;
     BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_right <= VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output := BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output := result.is_deo_done;

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l279_c4_4947] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l279_c4_4947_return_output := result.u16_addr;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l308_l246_l259_DUPLICATE_da5a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l308_l246_l259_DUPLICATE_da5a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_f584 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_f584_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_device_h_l320_c5_3f9c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_left;
     BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_return_output := BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l342_c60_51e3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_left <= VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_left;
     BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_right <= VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_return_output := BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l273_c18_34b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l273_c18_34b1_left <= VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_left;
     BIN_OP_EQ_uxn_device_h_l273_c18_34b1_right <= VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_return_output := BIN_OP_EQ_uxn_device_h_l273_c18_34b1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l314_c22_d664] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l314_c22_d664_left <= VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_left;
     BIN_OP_PLUS_uxn_device_h_l314_c22_d664_right <= VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_return_output := BIN_OP_PLUS_uxn_device_h_l314_c22_d664_return_output;

     -- CONST_SR_5[uxn_device_h_l254_c22_76c3] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l254_c22_76c3_x <= VAR_CONST_SR_5_uxn_device_h_l254_c22_76c3_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l254_c22_76c3_return_output := CONST_SR_5_uxn_device_h_l254_c22_76c3_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_3f28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_3f28_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l258_c11_4207] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l258_c11_4207_left <= VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_left;
     BIN_OP_EQ_uxn_device_h_l258_c11_4207_right <= VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output := BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l317_c23_8e87] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l317_c23_8e87_return_output := CAST_TO_uint8_t_uint16_t(
     ram_addr);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l238_c7_5dc9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l238_c7_5dc9_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_left <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_left;
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_right <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output := BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l231_c2_3fd6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l231_c2_3fd6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(41, 8),
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_device_h_l279_c8_9ecd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_left <= VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_left;
     BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_right <= VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output := BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l299_c22_55f5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_left <= VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_left;
     BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_right <= VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_return_output := BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l249_c7_6d57] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l249_c7_6d57_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(45, 8));

     -- BIN_OP_PLUS[uxn_device_h_l307_c22_480d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l307_c22_480d_left <= VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_left;
     BIN_OP_PLUS_uxn_device_h_l307_c22_480d_right <= VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_return_output := BIN_OP_PLUS_uxn_device_h_l307_c22_480d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l295_c22_dbbe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_left <= VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_left;
     BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_right <= VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_return_output := BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l290_c22_caaf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_left <= VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_left;
     BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_right <= VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_return_output := BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l249_c11_44ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l249_c11_44ed_left <= VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_left;
     BIN_OP_EQ_uxn_device_h_l249_c11_44ed_right <= VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output := BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_404a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_404a_return_output := result.device_ram_address;

     -- MUX[uxn_device_h_l277_c39_6505] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l277_c39_6505_cond <= VAR_MUX_uxn_device_h_l277_c39_6505_cond;
     MUX_uxn_device_h_l277_c39_6505_iftrue <= VAR_MUX_uxn_device_h_l277_c39_6505_iftrue;
     MUX_uxn_device_h_l277_c39_6505_iffalse <= VAR_MUX_uxn_device_h_l277_c39_6505_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l277_c39_6505_return_output := MUX_uxn_device_h_l277_c39_6505_return_output;

     -- CONST_SR_4[uxn_device_h_l255_c22_7663] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l255_c22_7663_x <= VAR_CONST_SR_4_uxn_device_h_l255_c22_7663_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l255_c22_7663_return_output := CONST_SR_4_uxn_device_h_l255_c22_7663_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l293_c23_97f5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l293_c23_97f5_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_SR_7[uxn_device_h_l252_c25_b137] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l252_c25_b137_x <= VAR_CONST_SR_7_uxn_device_h_l252_c25_b137_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l252_c25_b137_return_output := CONST_SR_7_uxn_device_h_l252_c25_b137_return_output;

     -- BIN_OP_EQ[uxn_device_h_l245_c11_4b44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l245_c11_4b44_left <= VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_left;
     BIN_OP_EQ_uxn_device_h_l245_c11_4b44_right <= VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output := BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;

     -- CONST_SR_6[uxn_device_h_l253_c21_2209] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l253_c21_2209_x <= VAR_CONST_SR_6_uxn_device_h_l253_c21_2209_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l253_c21_2209_return_output := CONST_SR_6_uxn_device_h_l253_c21_2209_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l279_c4_4947] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l279_c4_4947_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_device_h_l319_c22_e602] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l319_c22_e602_left <= VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_left;
     BIN_OP_PLUS_uxn_device_h_l319_c22_e602_right <= VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_return_output := BIN_OP_PLUS_uxn_device_h_l319_c22_e602_return_output;

     -- BIN_OP_EQ[uxn_device_h_l238_c11_f916] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l238_c11_f916_left <= VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_left;
     BIN_OP_EQ_uxn_device_h_l238_c11_f916_right <= VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output := BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;

     -- BIN_OP_EQ[uxn_device_h_l263_c11_71e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l263_c11_71e8_left <= VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_left;
     BIN_OP_EQ_uxn_device_h_l263_c11_71e8_right <= VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output := BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l303_c22_802a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l303_c22_802a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_left;
     BIN_OP_PLUS_uxn_device_h_l303_c22_802a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_return_output := BIN_OP_PLUS_uxn_device_h_l303_c22_802a_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l251_c11_0592] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l251_c11_0592_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l241_c11_5efb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l241_c11_5efb_left <= VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_left;
     BIN_OP_EQ_uxn_device_h_l241_c11_5efb_right <= VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output := BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l241_c7_1d64] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l241_c7_1d64_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(47, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l245_c7_5ed1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l245_c7_5ed1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(44, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l258_c7_f69d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l258_c7_f69d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_color_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_result_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_x_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_y_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_f0cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_color_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_result_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_x_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_y_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_f916_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_color_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_layer_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_result_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_x_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_y_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_5efb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_color_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_result_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_x_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_y_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_4b44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_color_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_layer_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_result_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_x_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_y_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_44ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_result_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_x_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_y_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_4207_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_result_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_x_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_y_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_71e8_return_output;
     VAR_MUX_uxn_device_h_l273_c18_7299_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c18_34b1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_x_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_y_MUX_uxn_device_h_l279_c4_4947_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_9ecd_return_output;
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_phase := resize(VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_83ad_return_output, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_right := VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_caaf_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_right := VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_dbbe_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_right := VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_55f5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_right := VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_802a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_right := VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_480d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_right := VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_d664_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_right := VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e602_return_output;
     VAR_tmp4_uxn_device_h_l320_c5_7830 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_3f9c_return_output, 4);
     VAR_MUX_uxn_device_h_l342_c11_9721_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_51e3_return_output, 12);
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l308_l246_l259_DUPLICATE_da5a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l308_l246_l259_DUPLICATE_da5a_return_output;
     VAR_x_MUX_uxn_device_h_l241_c7_1d64_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l308_l246_l259_DUPLICATE_da5a_return_output;
     VAR_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l308_l246_l259_DUPLICATE_da5a_return_output;
     VAR_color_MUX_uxn_device_h_l249_c7_6d57_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l251_c11_0592_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l293_c23_97f5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l317_c23_8e87_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_90cb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_3f28_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_3f28_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_0a45_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_404a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_404a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_f584_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_f584_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_f584_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_f584_return_output;
     VAR_MUX_uxn_device_h_l277_c20_bc8a_iftrue := VAR_MUX_uxn_device_h_l277_c39_6505_return_output;
     VAR_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_result_MUX_uxn_device_h_l241_c7_1d64_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l241_c7_1d64_return_output;
     VAR_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_result_MUX_uxn_device_h_l249_c7_6d57_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l249_c7_6d57_return_output;
     VAR_result_MUX_uxn_device_h_l258_c7_f69d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l258_c7_f69d_return_output;
     VAR_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l279_c4_4947_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l279_c4_4947_return_output;
     VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_iftrue := VAR_tmp4_uxn_device_h_l320_c5_7830;
     -- BIN_OP_EQ[uxn_device_h_l299_c13_5629] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l299_c13_5629_left <= VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_left;
     BIN_OP_EQ_uxn_device_h_l299_c13_5629_right <= VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output := BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;

     -- color_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_color_MUX_uxn_device_h_l249_c7_6d57_cond;
     color_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_color_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     color_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_color_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l249_c7_6d57_return_output := color_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l303_c13_5d64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l303_c13_5d64_left <= VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_left;
     BIN_OP_EQ_uxn_device_h_l303_c13_5d64_right <= VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output := BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;

     -- MUX[uxn_device_h_l273_c18_7299] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l273_c18_7299_cond <= VAR_MUX_uxn_device_h_l273_c18_7299_cond;
     MUX_uxn_device_h_l273_c18_7299_iftrue <= VAR_MUX_uxn_device_h_l273_c18_7299_iftrue;
     MUX_uxn_device_h_l273_c18_7299_iffalse <= VAR_MUX_uxn_device_h_l273_c18_7299_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l273_c18_7299_return_output := MUX_uxn_device_h_l273_c18_7299_return_output;

     -- BIN_OP_EQ[uxn_device_h_l314_c13_e704] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l314_c13_e704_left <= VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_left;
     BIN_OP_EQ_uxn_device_h_l314_c13_e704_right <= VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output := BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l252_c15_8b8a] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l252_c15_8b8a_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l252_c25_b137_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l255_c12_e587] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l255_c12_e587_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l255_c22_7663_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l253_c11_9825] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l253_c11_9825_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l253_c21_2209_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_cond;
     result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_return_output := result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- ctrl_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_cond;
     ctrl_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     ctrl_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_return_output := ctrl_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- BIN_OP_EQ[uxn_device_h_l295_c13_206a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l295_c13_206a_left <= VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_left;
     BIN_OP_EQ_uxn_device_h_l295_c13_206a_right <= VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output := BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l307_c13_3fa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_left;
     BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output := BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_cond;
     result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iftrue;
     result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_return_output := result_u16_addr_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l254_c12_14c2] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l254_c12_14c2_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l254_c22_76c3_return_output);

     -- BIN_OP_EQ[uxn_device_h_l319_c13_f277] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l319_c13_f277_left <= VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_left;
     BIN_OP_EQ_uxn_device_h_l319_c13_f277_right <= VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output := BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output;

     -- BIN_OP_EQ[uxn_device_h_l290_c13_472f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l290_c13_472f_left <= VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_left;
     BIN_OP_EQ_uxn_device_h_l290_c13_472f_right <= VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output := BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output := CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output;

     -- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b LATENCY=0
     -- Inputs
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_left <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_left;
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_right <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_right;
     -- Outputs
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output := BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output;

     -- Submodule level 2
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;
     VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_472f_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_206a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;
     VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_5629_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;
     VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_5d64_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_3fa3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output;
     VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_e704_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output;
     VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_f277_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_left := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_845b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l252_c15_8b8a_return_output;
     VAR_layer_MUX_uxn_device_h_l249_c7_6d57_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l253_c11_9825_return_output;
     VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l254_c12_14c2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l255_c12_e587_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_6a12_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_MUX_uxn_device_h_l273_c18_7299_return_output;
     VAR_color_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_color_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_ctrl_MUX_uxn_device_h_l249_c7_6d57_return_output;
     -- flip_x_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_cond;
     flip_x_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     flip_x_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_return_output := flip_x_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- uint8_0_0[uxn_device_h_l275_c19_5795] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l275_c19_5795_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l273_c18_7299_return_output);

     -- color_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_color_MUX_uxn_device_h_l245_c7_5ed1_cond;
     color_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_color_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     color_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_color_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l245_c7_5ed1_return_output := color_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_cond;
     ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_return_output := ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- uint8_1_1[uxn_device_h_l276_c19_e98a] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l276_c19_e98a_return_output := uint8_1_1(
     VAR_MUX_uxn_device_h_l273_c18_7299_return_output);

     -- auto_advance_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_cond;
     auto_advance_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     auto_advance_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_return_output := auto_advance_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- flip_y_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_cond;
     flip_y_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     flip_y_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_return_output := flip_y_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l319_c9_20c1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_cond;
     result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_return_output := result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_return_output;

     -- ctrl_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_cond;
     ctrl_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     ctrl_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_return_output := ctrl_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- uint8_2_2[uxn_device_h_l277_c20_4e22] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l277_c20_4e22_return_output := uint8_2_2(
     VAR_MUX_uxn_device_h_l273_c18_7299_return_output);

     -- result_u8_value_MUX[uxn_device_h_l314_c9_6636] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l314_c9_6636_cond <= VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_cond;
     result_u8_value_MUX_uxn_device_h_l314_c9_6636_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_iftrue;
     result_u8_value_MUX_uxn_device_h_l314_c9_6636_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_return_output := result_u8_value_MUX_uxn_device_h_l314_c9_6636_return_output;

     -- layer_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_layer_MUX_uxn_device_h_l249_c7_6d57_cond;
     layer_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_layer_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     layer_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_layer_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l249_c7_6d57_return_output := layer_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- uint8_7_4[uxn_device_h_l274_c17_d8c3] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l274_c17_d8c3_return_output := uint8_7_4(
     VAR_MUX_uxn_device_h_l273_c18_7299_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l319_c9_20c1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_cond;
     result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_return_output := result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l319_c9_20c1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_return_output := result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- tmp4_MUX[uxn_device_h_l319_c9_20c1] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l319_c9_20c1_cond <= VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_cond;
     tmp4_MUX_uxn_device_h_l319_c9_20c1_iftrue <= VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_iftrue;
     tmp4_MUX_uxn_device_h_l319_c9_20c1_iffalse <= VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_return_output := tmp4_MUX_uxn_device_h_l319_c9_20c1_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l319_c9_20c1] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_color_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_color_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_ctrl_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_flip_x_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_flip_y_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_layer_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_20c1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_20c1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_20c1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l314_c9_6636_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_20c1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_iffalse := VAR_tmp4_MUX_uxn_device_h_l319_c9_20c1_return_output;
     VAR_MUX_uxn_device_h_l275_c19_9dff_cond := VAR_uint8_0_0_uxn_device_h_l275_c19_5795_return_output;
     VAR_MUX_uxn_device_h_l276_c19_526f_cond := VAR_uint8_1_1_uxn_device_h_l276_c19_e98a_return_output;
     VAR_MUX_uxn_device_h_l277_c20_bc8a_cond := VAR_uint8_2_2_uxn_device_h_l277_c20_4e22_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_left := VAR_uint8_7_4_uxn_device_h_l274_c17_d8c3_return_output;
     VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_uint8_7_4_uxn_device_h_l274_c17_d8c3_return_output;
     -- result_is_device_ram_write_MUX[uxn_device_h_l314_c9_6636] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_return_output := result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_return_output;

     -- BIN_OP_EQ[uxn_device_h_l339_c19_781a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l339_c19_781a_left <= VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_left;
     BIN_OP_EQ_uxn_device_h_l339_c19_781a_right <= VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_return_output := BIN_OP_EQ_uxn_device_h_l339_c19_781a_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l314_c9_6636] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_return_output;

     -- auto_advance_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_cond;
     auto_advance_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     auto_advance_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_return_output := auto_advance_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l314_c9_6636] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_cond;
     result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_return_output := result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_return_output;

     -- MUX[uxn_device_h_l275_c19_9dff] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l275_c19_9dff_cond <= VAR_MUX_uxn_device_h_l275_c19_9dff_cond;
     MUX_uxn_device_h_l275_c19_9dff_iftrue <= VAR_MUX_uxn_device_h_l275_c19_9dff_iftrue;
     MUX_uxn_device_h_l275_c19_9dff_iffalse <= VAR_MUX_uxn_device_h_l275_c19_9dff_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l275_c19_9dff_return_output := MUX_uxn_device_h_l275_c19_9dff_return_output;

     -- flip_x_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_cond;
     flip_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     flip_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_return_output := flip_x_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- color_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_color_MUX_uxn_device_h_l241_c7_1d64_cond;
     color_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_color_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     color_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_color_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l241_c7_1d64_return_output := color_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l314_c9_6636] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_cond;
     result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_return_output := result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_return_output;

     -- MUX[uxn_device_h_l276_c19_526f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l276_c19_526f_cond <= VAR_MUX_uxn_device_h_l276_c19_526f_cond;
     MUX_uxn_device_h_l276_c19_526f_iftrue <= VAR_MUX_uxn_device_h_l276_c19_526f_iftrue;
     MUX_uxn_device_h_l276_c19_526f_iffalse <= VAR_MUX_uxn_device_h_l276_c19_526f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l276_c19_526f_return_output := MUX_uxn_device_h_l276_c19_526f_return_output;

     -- layer_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_cond;
     layer_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     layer_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_return_output := layer_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- ctrl_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_cond;
     ctrl_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     ctrl_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_return_output := ctrl_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- auto_length_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_cond;
     auto_length_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     auto_length_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_return_output := auto_length_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_cond;
     ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_return_output := ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- flip_y_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_cond;
     flip_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     flip_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_return_output := flip_y_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- MUX[uxn_device_h_l277_c20_bc8a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l277_c20_bc8a_cond <= VAR_MUX_uxn_device_h_l277_c20_bc8a_cond;
     MUX_uxn_device_h_l277_c20_bc8a_iftrue <= VAR_MUX_uxn_device_h_l277_c20_bc8a_iftrue;
     MUX_uxn_device_h_l277_c20_bc8a_iffalse <= VAR_MUX_uxn_device_h_l277_c20_bc8a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l277_c20_bc8a_return_output := MUX_uxn_device_h_l277_c20_bc8a_return_output;

     -- tmp4_MUX[uxn_device_h_l314_c9_6636] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l314_c9_6636_cond <= VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_cond;
     tmp4_MUX_uxn_device_h_l314_c9_6636_iftrue <= VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_iftrue;
     tmp4_MUX_uxn_device_h_l314_c9_6636_iffalse <= VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_return_output := tmp4_MUX_uxn_device_h_l314_c9_6636_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l339_c19_d350_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c19_781a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_right := VAR_MUX_uxn_device_h_l275_c19_9dff_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_right := VAR_MUX_uxn_device_h_l275_c19_9dff_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_right := VAR_MUX_uxn_device_h_l275_c19_9dff_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_right := VAR_MUX_uxn_device_h_l275_c19_9dff_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_MUX_uxn_device_h_l275_c19_9dff_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_right := VAR_MUX_uxn_device_h_l276_c19_526f_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_right := VAR_MUX_uxn_device_h_l276_c19_526f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_right := VAR_MUX_uxn_device_h_l276_c19_526f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_right := VAR_MUX_uxn_device_h_l276_c19_526f_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_MUX_uxn_device_h_l276_c19_526f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_right := VAR_MUX_uxn_device_h_l277_c20_bc8a_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_MUX_uxn_device_h_l277_c20_bc8a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_auto_advance_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_auto_length_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_color_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_color_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_ctrl_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_flip_x_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_flip_y_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_layer_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_layer_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_6636_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_6636_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_6636_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_6636_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_iffalse := VAR_tmp4_MUX_uxn_device_h_l314_c9_6636_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l281_c49_745e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l281_c49_745e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_left;
     BIN_OP_PLUS_uxn_device_h_l281_c49_745e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_return_output := BIN_OP_PLUS_uxn_device_h_l281_c49_745e_return_output;

     -- flip_y_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_cond;
     flip_y_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     flip_y_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_return_output := flip_y_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l283_c58_b8b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_left <= VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_left;
     BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_right <= VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_return_output := BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l283_c36_2d74] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_left <= VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_left;
     BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_right <= VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_return_output := BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_return_output;

     -- color_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_color_MUX_uxn_device_h_l238_c7_5dc9_cond;
     color_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_color_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     color_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_color_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l238_c7_5dc9_return_output := color_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- ctrl_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_cond;
     ctrl_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     ctrl_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_return_output := ctrl_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- auto_length_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_cond;
     auto_length_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     auto_length_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_return_output := auto_length_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l282_c36_8009] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l282_c36_8009_left <= VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_left;
     BIN_OP_MINUS_uxn_device_h_l282_c36_8009_right <= VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_return_output := BIN_OP_MINUS_uxn_device_h_l282_c36_8009_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l307_c9_8ccc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_cond;
     result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_return_output := result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l280_c47_8833] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l280_c47_8833_left <= VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_left;
     BIN_OP_PLUS_uxn_device_h_l280_c47_8833_right <= VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_return_output := BIN_OP_PLUS_uxn_device_h_l280_c47_8833_return_output;

     -- flip_x_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_cond;
     flip_x_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     flip_x_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_return_output := flip_x_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_cond;
     ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_return_output := ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l307_c9_8ccc] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_return_output;

     -- layer_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_layer_MUX_uxn_device_h_l241_c7_1d64_cond;
     layer_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_layer_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     layer_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_layer_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l241_c7_1d64_return_output := layer_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- MUX[uxn_device_h_l339_c19_d350] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l339_c19_d350_cond <= VAR_MUX_uxn_device_h_l339_c19_d350_cond;
     MUX_uxn_device_h_l339_c19_d350_iftrue <= VAR_MUX_uxn_device_h_l339_c19_d350_iftrue;
     MUX_uxn_device_h_l339_c19_d350_iffalse <= VAR_MUX_uxn_device_h_l339_c19_d350_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l339_c19_d350_return_output := MUX_uxn_device_h_l339_c19_d350_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond;
     y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output := y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l281_c23_93ee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_left <= VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_left;
     BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_right <= VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_return_output := BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l282_c58_52fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_left <= VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_left;
     BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_right <= VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_return_output := BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l307_c9_8ccc] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_return_output := result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_return_output;

     -- auto_advance_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_cond;
     auto_advance_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     auto_advance_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_return_output := auto_advance_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_cond;
     x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output := x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l309_c5_a791] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l309_c5_a791_left <= VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_left;
     BIN_OP_PLUS_uxn_device_h_l309_c5_a791_right <= VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_return_output := BIN_OP_PLUS_uxn_device_h_l309_c5_a791_return_output;

     -- tmp4_MUX[uxn_device_h_l307_c9_8ccc] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l307_c9_8ccc_cond <= VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_cond;
     tmp4_MUX_uxn_device_h_l307_c9_8ccc_iftrue <= VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_iftrue;
     tmp4_MUX_uxn_device_h_l307_c9_8ccc_iffalse <= VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_return_output := tmp4_MUX_uxn_device_h_l307_c9_8ccc_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_cond;
     ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_return_output := ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l307_c9_8ccc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_cond;
     result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_return_output := result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l280_c22_b423] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l280_c22_b423_left <= VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_left;
     BIN_OP_MINUS_uxn_device_h_l280_c22_b423_right <= VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_return_output := BIN_OP_MINUS_uxn_device_h_l280_c22_b423_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l280_c12_12d1_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_b423_return_output;
     VAR_MUX_uxn_device_h_l281_c13_1644_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_93ee_return_output;
     VAR_MUX_uxn_device_h_l282_c26_2bdc_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_8009_return_output;
     VAR_MUX_uxn_device_h_l283_c26_aa53_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_2d74_return_output;
     VAR_MUX_uxn_device_h_l280_c12_12d1_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_8833_return_output, 8);
     VAR_MUX_uxn_device_h_l281_c13_1644_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_745e_return_output, 8);
     VAR_MUX_uxn_device_h_l282_c26_2bdc_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_52fa_return_output, 16);
     VAR_MUX_uxn_device_h_l283_c26_aa53_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_b8b4_return_output, 16);
     VAR_ram_addr_uxn_device_h_l309_c5_b7fb := resize(VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_a791_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iffalse := VAR_MUX_uxn_device_h_l339_c19_d350_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_auto_advance_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_auto_length_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_color_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_color_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_ctrl_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_flip_x_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_flip_y_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_layer_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_8ccc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_8ccc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_8ccc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_8ccc_return_output;
     VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_iffalse := VAR_tmp4_MUX_uxn_device_h_l307_c9_8ccc_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_CONST_SR_8_uxn_device_h_l312_c33_02f4_x := VAR_ram_addr_uxn_device_h_l309_c5_b7fb;
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iftrue := VAR_ram_addr_uxn_device_h_l309_c5_b7fb;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- color_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_color_MUX_uxn_device_h_l231_c2_3fd6_cond;
     color_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_color_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     color_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_color_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l231_c2_3fd6_return_output := color_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- layer_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_cond;
     layer_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     layer_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_return_output := layer_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- ram_addr_MUX[uxn_device_h_l307_c9_8ccc] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l307_c9_8ccc_cond <= VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_cond;
     ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iftrue;
     ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_return_output := ram_addr_MUX_uxn_device_h_l307_c9_8ccc_return_output;

     -- MUX[uxn_device_h_l283_c26_aa53] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l283_c26_aa53_cond <= VAR_MUX_uxn_device_h_l283_c26_aa53_cond;
     MUX_uxn_device_h_l283_c26_aa53_iftrue <= VAR_MUX_uxn_device_h_l283_c26_aa53_iftrue;
     MUX_uxn_device_h_l283_c26_aa53_iffalse <= VAR_MUX_uxn_device_h_l283_c26_aa53_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l283_c26_aa53_return_output := MUX_uxn_device_h_l283_c26_aa53_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond;
     y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output := y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- flip_y_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_cond;
     flip_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     flip_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_return_output := flip_y_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l303_c9_7bb2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_cond;
     result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_return_output := result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_return_output;

     -- tmp4_MUX[uxn_device_h_l303_c9_7bb2] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l303_c9_7bb2_cond <= VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_cond;
     tmp4_MUX_uxn_device_h_l303_c9_7bb2_iftrue <= VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_iftrue;
     tmp4_MUX_uxn_device_h_l303_c9_7bb2_iffalse <= VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_return_output := tmp4_MUX_uxn_device_h_l303_c9_7bb2_return_output;

     -- auto_length_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_cond;
     auto_length_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     auto_length_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_return_output := auto_length_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- MUX[uxn_device_h_l281_c13_1644] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l281_c13_1644_cond <= VAR_MUX_uxn_device_h_l281_c13_1644_cond;
     MUX_uxn_device_h_l281_c13_1644_iftrue <= VAR_MUX_uxn_device_h_l281_c13_1644_iftrue;
     MUX_uxn_device_h_l281_c13_1644_iffalse <= VAR_MUX_uxn_device_h_l281_c13_1644_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l281_c13_1644_return_output := MUX_uxn_device_h_l281_c13_1644_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l303_c9_7bb2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_cond;
     result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_return_output := result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_return_output;

     -- is_last_blit_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_cond;
     is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_return_output := is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- auto_advance_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_cond;
     auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_return_output := auto_advance_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- MUX[uxn_device_h_l280_c12_12d1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l280_c12_12d1_cond <= VAR_MUX_uxn_device_h_l280_c12_12d1_cond;
     MUX_uxn_device_h_l280_c12_12d1_iftrue <= VAR_MUX_uxn_device_h_l280_c12_12d1_iftrue;
     MUX_uxn_device_h_l280_c12_12d1_iffalse <= VAR_MUX_uxn_device_h_l280_c12_12d1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l280_c12_12d1_return_output := MUX_uxn_device_h_l280_c12_12d1_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_cond;
     x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output := x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l303_c9_7bb2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_return_output := result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_return_output;

     -- MUX[uxn_device_h_l282_c26_2bdc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l282_c26_2bdc_cond <= VAR_MUX_uxn_device_h_l282_c26_2bdc_cond;
     MUX_uxn_device_h_l282_c26_2bdc_iftrue <= VAR_MUX_uxn_device_h_l282_c26_2bdc_iftrue;
     MUX_uxn_device_h_l282_c26_2bdc_iffalse <= VAR_MUX_uxn_device_h_l282_c26_2bdc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l282_c26_2bdc_return_output := MUX_uxn_device_h_l282_c26_2bdc_return_output;

     -- ctrl_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_cond;
     ctrl_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     ctrl_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_return_output := ctrl_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- CONST_SR_8[uxn_device_h_l312_c33_02f4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l312_c33_02f4_x <= VAR_CONST_SR_8_uxn_device_h_l312_c33_02f4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l312_c33_02f4_return_output := CONST_SR_8_uxn_device_h_l312_c33_02f4_return_output;

     -- flip_x_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_cond;
     flip_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     flip_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_return_output := flip_x_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_cond;
     ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_return_output := ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l303_c9_7bb2] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_cond;
     ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_return_output := ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_MUX_uxn_device_h_l280_c12_12d1_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_MUX_uxn_device_h_l281_c13_1644_return_output;
     VAR_MUX_uxn_device_h_l282_c10_0b53_iftrue := VAR_MUX_uxn_device_h_l282_c26_2bdc_return_output;
     VAR_MUX_uxn_device_h_l283_c10_e9e2_iftrue := VAR_MUX_uxn_device_h_l283_c26_aa53_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_auto_advance_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_auto_length_MUX_uxn_device_h_l249_c7_6d57_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_flip_x_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_flip_y_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_layer_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l307_c9_8ccc_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_7bb2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_7bb2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_7bb2_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_7bb2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_iffalse := VAR_tmp4_MUX_uxn_device_h_l303_c9_7bb2_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_f69d_return_output;
     -- CAST_TO_uint8_t[uxn_device_h_l312_c23_70fc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l312_c23_70fc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l312_c33_02f4_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l299_c9_5162] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_return_output := result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_return_output;

     -- tmp4_MUX[uxn_device_h_l299_c9_5162] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l299_c9_5162_cond <= VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_cond;
     tmp4_MUX_uxn_device_h_l299_c9_5162_iftrue <= VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_iftrue;
     tmp4_MUX_uxn_device_h_l299_c9_5162_iffalse <= VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_return_output := tmp4_MUX_uxn_device_h_l299_c9_5162_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond;
     x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output := x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- MUX[uxn_device_h_l282_c10_0b53] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l282_c10_0b53_cond <= VAR_MUX_uxn_device_h_l282_c10_0b53_cond;
     MUX_uxn_device_h_l282_c10_0b53_iftrue <= VAR_MUX_uxn_device_h_l282_c10_0b53_iftrue;
     MUX_uxn_device_h_l282_c10_0b53_iffalse <= VAR_MUX_uxn_device_h_l282_c10_0b53_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l282_c10_0b53_return_output := MUX_uxn_device_h_l282_c10_0b53_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_cond;
     y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output := y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- ram_addr_MUX[uxn_device_h_l303_c9_7bb2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l303_c9_7bb2_cond <= VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_cond;
     ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iftrue;
     ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_return_output := ram_addr_MUX_uxn_device_h_l303_c9_7bb2_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l299_c9_5162] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_return_output;

     -- tmp8b_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_cond;
     tmp8b_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_iftrue;
     tmp8b_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_return_output := tmp8b_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- tmp8_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_cond;
     tmp8_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_iftrue;
     tmp8_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_return_output := tmp8_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l299_c9_5162] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_cond;
     result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_return_output := result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_return_output;

     -- flip_y_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_cond;
     flip_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     flip_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_return_output := flip_y_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l299_c9_5162] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_cond;
     result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_return_output := result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_return_output;

     -- layer_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_cond;
     layer_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     layer_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_return_output := layer_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- flip_x_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_cond;
     flip_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     flip_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_return_output := flip_x_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- MUX[uxn_device_h_l283_c10_e9e2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l283_c10_e9e2_cond <= VAR_MUX_uxn_device_h_l283_c10_e9e2_cond;
     MUX_uxn_device_h_l283_c10_e9e2_iftrue <= VAR_MUX_uxn_device_h_l283_c10_e9e2_iftrue;
     MUX_uxn_device_h_l283_c10_e9e2_iffalse <= VAR_MUX_uxn_device_h_l283_c10_e9e2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l283_c10_e9e2_return_output := MUX_uxn_device_h_l283_c10_e9e2_return_output;

     -- auto_advance_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_cond;
     auto_advance_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     auto_advance_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_return_output := auto_advance_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_cond;
     ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_return_output := ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- is_last_blit_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_cond;
     is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_return_output := is_last_blit_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_cond;
     ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_return_output := ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- auto_length_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_cond;
     auto_length_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     auto_length_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_return_output := auto_length_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l312_c23_70fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_x_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_MUX_uxn_device_h_l282_c10_0b53_return_output;
     VAR_y_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_MUX_uxn_device_h_l283_c10_e9e2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_auto_length_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l263_c7_86eb_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_iffalse := VAR_ram_addr_MUX_uxn_device_h_l303_c9_7bb2_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_5162_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_5162_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_5162_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_5162_return_output;
     VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_iffalse := VAR_tmp4_MUX_uxn_device_h_l299_c9_5162_return_output;
     VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_tmp8_MUX_uxn_device_h_l279_c4_4947_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_tmp8b_MUX_uxn_device_h_l279_c4_4947_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_6d57_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l272_c1_c236] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_return_output;

     -- auto_length_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_cond;
     auto_length_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     auto_length_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_return_output := auto_length_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- y_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_y_MUX_uxn_device_h_l279_c4_4947_cond;
     y_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_y_MUX_uxn_device_h_l279_c4_4947_iftrue;
     y_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_y_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l279_c4_4947_return_output := y_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l295_c9_7fab] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_return_output := result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_return_output;

     -- tmp8b_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_cond;
     tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_return_output := tmp8b_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- auto_advance_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_cond;
     auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_return_output := auto_advance_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l295_c9_7fab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_cond;
     result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_return_output := result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond;
     y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output := y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- is_last_blit_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_cond;
     is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_return_output := is_last_blit_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l295_c9_7fab] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_return_output;

     -- tmp4_MUX[uxn_device_h_l295_c9_7fab] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l295_c9_7fab_cond <= VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_cond;
     tmp4_MUX_uxn_device_h_l295_c9_7fab_iftrue <= VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_iftrue;
     tmp4_MUX_uxn_device_h_l295_c9_7fab_iffalse <= VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_return_output := tmp4_MUX_uxn_device_h_l295_c9_7fab_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_cond;
     ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output := ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- ram_addr_MUX[uxn_device_h_l299_c9_5162] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l299_c9_5162_cond <= VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_cond;
     ram_addr_MUX_uxn_device_h_l299_c9_5162_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_iftrue;
     ram_addr_MUX_uxn_device_h_l299_c9_5162_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_return_output := ram_addr_MUX_uxn_device_h_l299_c9_5162_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l288_c23_fd68] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l288_c23_fd68_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_device_h_l282_c10_0b53_return_output);

     -- x_sprite_incr_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_cond;
     x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output := x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- tmp8_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_cond;
     tmp8_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     tmp8_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_return_output := tmp8_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- result_u8_value_MUX[uxn_device_h_l307_c9_8ccc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_cond <= VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_cond;
     result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iftrue;
     result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_return_output := result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l295_c9_7fab] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_cond;
     result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_return_output := result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_return_output;

     -- x_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_x_MUX_uxn_device_h_l279_c4_4947_cond;
     x_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_x_MUX_uxn_device_h_l279_c4_4947_iftrue;
     x_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_x_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l279_c4_4947_return_output := x_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l288_c23_fd68_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_c236_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_auto_length_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_iffalse := VAR_ram_addr_MUX_uxn_device_h_l299_c9_5162_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_7fab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_7fab_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_7fab_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l307_c9_8ccc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_7fab_return_output;
     VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_iffalse := VAR_tmp4_MUX_uxn_device_h_l295_c9_7fab_return_output;
     VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_tmp8_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_tmp8b_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_x_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_x_MUX_uxn_device_h_l279_c4_4947_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_y_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_y_MUX_uxn_device_h_l279_c4_4947_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l290_c9_d961] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_cond;
     result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_return_output := result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_return_output;

     -- y_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_y_MUX_uxn_device_h_l278_c3_d3cc_cond;
     y_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_y_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     y_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_y_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l278_c3_d3cc_return_output := y_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- tmp8_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_cond;
     tmp8_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     tmp8_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_return_output := tmp8_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- x_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_x_MUX_uxn_device_h_l278_c3_d3cc_cond;
     x_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_x_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     x_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_x_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l278_c3_d3cc_return_output := x_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l326_c1_18c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l303_c9_7bb2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_cond <= VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_cond;
     result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iftrue;
     result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_return_output := result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_return_output;

     -- ram_addr_MUX[uxn_device_h_l295_c9_7fab] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l295_c9_7fab_cond <= VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_cond;
     ram_addr_MUX_uxn_device_h_l295_c9_7fab_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_iftrue;
     ram_addr_MUX_uxn_device_h_l295_c9_7fab_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_return_output := ram_addr_MUX_uxn_device_h_l295_c9_7fab_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l290_c9_d961] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_return_output := result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_return_output;

     -- tmp4_MUX[uxn_device_h_l290_c9_d961] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l290_c9_d961_cond <= VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_cond;
     tmp4_MUX_uxn_device_h_l290_c9_d961_iftrue <= VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_iftrue;
     tmp4_MUX_uxn_device_h_l290_c9_d961_iffalse <= VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_return_output := tmp4_MUX_uxn_device_h_l290_c9_d961_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l290_c9_d961] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_cond;
     result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_return_output := result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond;
     x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output := x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- auto_advance_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_cond;
     auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_return_output := auto_advance_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_cond;
     y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output := y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- tmp8b_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_cond;
     tmp8b_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     tmp8b_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_return_output := tmp8b_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_cond;
     ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_return_output := ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- auto_length_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_cond;
     auto_length_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     auto_length_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_return_output := auto_length_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l290_c9_d961] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_return_output;

     -- is_last_blit_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_cond;
     is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_return_output := is_last_blit_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_18c4_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_auto_length_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_iffalse := VAR_ram_addr_MUX_uxn_device_h_l295_c9_7fab_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_d961_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_d961_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_d961_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l303_c9_7bb2_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_d961_return_output;
     VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_tmp4_MUX_uxn_device_h_l290_c9_d961_return_output;
     VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_tmp8_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_tmp8b_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_x_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_x_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_y_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_y_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_1d64_return_output;
     -- ram_addr_MUX[uxn_device_h_l290_c9_d961] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l290_c9_d961_cond <= VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_cond;
     ram_addr_MUX_uxn_device_h_l290_c9_d961_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_iftrue;
     ram_addr_MUX_uxn_device_h_l290_c9_d961_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_return_output := ram_addr_MUX_uxn_device_h_l290_c9_d961_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_cond;
     result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_return_output := result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_cond;
     ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output := ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_return_output := result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond;
     x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output := x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l329_c1_641f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_return_output;

     -- tmp8_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_cond;
     tmp8_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     tmp8_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_return_output := tmp8_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- tmp4_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_cond;
     tmp4_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_iftrue;
     tmp4_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_return_output := tmp4_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l327_c1_64fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_return_output;

     -- is_last_blit_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_cond;
     is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_return_output := is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- tmp8b_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_cond;
     tmp8b_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     tmp8b_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_return_output := tmp8b_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- auto_length_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_cond;
     auto_length_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     auto_length_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_return_output := auto_length_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_cond;
     result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_return_output := result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- x_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_x_MUX_uxn_device_h_l263_c7_86eb_cond;
     x_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_x_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     x_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_x_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l263_c7_86eb_return_output := x_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- y_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_y_MUX_uxn_device_h_l263_c7_86eb_cond;
     y_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_y_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     y_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_y_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l263_c7_86eb_return_output := y_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_cond;
     y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output := y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l299_c9_5162] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l299_c9_5162_cond <= VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_cond;
     result_u8_value_MUX_uxn_device_h_l299_c9_5162_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_iftrue;
     result_u8_value_MUX_uxn_device_h_l299_c9_5162_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_return_output := result_u8_value_MUX_uxn_device_h_l299_c9_5162_return_output;

     -- Submodule level 10
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_641f_return_output;
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_64fa_return_output;
     REG_VAR_auto_length := VAR_auto_length_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_ram_addr_MUX_uxn_device_h_l290_c9_d961_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l299_c9_5162_return_output;
     VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_tmp4_MUX_uxn_device_h_l279_c4_4947_return_output;
     VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_tmp8_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_tmp8b_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_x_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_x_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_y_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_y_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     -- screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63[uxn_device_h_l278_c3_d3cc] LATENCY=0
     VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l278_c3_d3cc_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63(
     screen_blit_result,
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_4947_return_output);

     -- screen_1bpp[uxn_device_h_l330_c26_276f] LATENCY=0
     -- Clock enable
     screen_1bpp_uxn_device_h_l330_c26_276f_CLOCK_ENABLE <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_CLOCK_ENABLE;
     -- Inputs
     screen_1bpp_uxn_device_h_l330_c26_276f_phase <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_phase;
     screen_1bpp_uxn_device_h_l330_c26_276f_x1 <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_x1;
     screen_1bpp_uxn_device_h_l330_c26_276f_y1 <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_y1;
     screen_1bpp_uxn_device_h_l330_c26_276f_color <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_color;
     screen_1bpp_uxn_device_h_l330_c26_276f_fx <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_fx;
     screen_1bpp_uxn_device_h_l330_c26_276f_fy <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_fy;
     screen_1bpp_uxn_device_h_l330_c26_276f_ram_addr <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_ram_addr;
     screen_1bpp_uxn_device_h_l330_c26_276f_previous_ram_read <= VAR_screen_1bpp_uxn_device_h_l330_c26_276f_previous_ram_read;
     -- Outputs
     VAR_screen_1bpp_uxn_device_h_l330_c26_276f_return_output := screen_1bpp_uxn_device_h_l330_c26_276f_return_output;

     -- is_last_blit_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_cond;
     is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_return_output := is_last_blit_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond;
     x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output := x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- screen_2bpp[uxn_device_h_l328_c26_23be] LATENCY=0
     -- Clock enable
     screen_2bpp_uxn_device_h_l328_c26_23be_CLOCK_ENABLE <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_CLOCK_ENABLE;
     -- Inputs
     screen_2bpp_uxn_device_h_l328_c26_23be_phase <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_phase;
     screen_2bpp_uxn_device_h_l328_c26_23be_x1 <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_x1;
     screen_2bpp_uxn_device_h_l328_c26_23be_y1 <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_y1;
     screen_2bpp_uxn_device_h_l328_c26_23be_color <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_color;
     screen_2bpp_uxn_device_h_l328_c26_23be_fx <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_fx;
     screen_2bpp_uxn_device_h_l328_c26_23be_fy <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_fy;
     screen_2bpp_uxn_device_h_l328_c26_23be_ram_addr <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_ram_addr;
     screen_2bpp_uxn_device_h_l328_c26_23be_previous_ram_read <= VAR_screen_2bpp_uxn_device_h_l328_c26_23be_previous_ram_read;
     -- Outputs
     VAR_screen_2bpp_uxn_device_h_l328_c26_23be_return_output := screen_2bpp_uxn_device_h_l328_c26_23be_return_output;

     -- result_u8_value_MUX[uxn_device_h_l295_c9_7fab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l295_c9_7fab_cond <= VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_cond;
     result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iftrue;
     result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_return_output := result_u8_value_MUX_uxn_device_h_l295_c9_7fab_return_output;

     -- y_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_y_MUX_uxn_device_h_l258_c7_f69d_cond;
     y_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_y_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     y_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_y_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l258_c7_f69d_return_output := y_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- ram_addr_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_cond;
     ram_addr_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_iftrue;
     ram_addr_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_return_output := ram_addr_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- tmp4_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_cond;
     tmp4_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     tmp4_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_return_output := tmp4_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_cond;
     y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output := y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_cond;
     ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output := ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- tmp8_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_cond;
     tmp8_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     tmp8_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_return_output := tmp8_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- tmp8b_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_cond;
     tmp8b_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     tmp8b_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_return_output := tmp8b_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- x_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_x_MUX_uxn_device_h_l258_c7_f69d_cond;
     x_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_x_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     x_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_x_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l258_c7_f69d_return_output := x_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- Submodule level 11
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_ram_addr_MUX_uxn_device_h_l279_c4_4947_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l295_c9_7fab_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iffalse := VAR_screen_1bpp_uxn_device_h_l330_c26_276f_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iftrue := VAR_screen_2bpp_uxn_device_h_l328_c26_23be_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_tmp4_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_tmp8_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_tmp8b_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_x_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_x_MUX_uxn_device_h_l258_c7_f69d_return_output;
     REG_VAR_x_sprite_incr := VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_y_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_y_MUX_uxn_device_h_l258_c7_f69d_return_output;
     REG_VAR_y_sprite_incr := VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     -- is_last_blit_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_cond;
     is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_return_output := is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l327_c4_c6d1] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_cond;
     screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iftrue;
     screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output := screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output;

     -- ram_addr_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_cond;
     ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_return_output := ram_addr_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- x_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_x_MUX_uxn_device_h_l249_c7_6d57_cond;
     x_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_x_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     x_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_x_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l249_c7_6d57_return_output := x_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- y_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_y_MUX_uxn_device_h_l249_c7_6d57_cond;
     y_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_y_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     y_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_y_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l249_c7_6d57_return_output := y_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- tmp8_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_cond;
     tmp8_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     tmp8_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_return_output := tmp8_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- result_u8_value_MUX[uxn_device_h_l290_c9_d961] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l290_c9_d961_cond <= VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_cond;
     result_u8_value_MUX_uxn_device_h_l290_c9_d961_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_iftrue;
     result_u8_value_MUX_uxn_device_h_l290_c9_d961_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_return_output := result_u8_value_MUX_uxn_device_h_l290_c9_d961_return_output;

     -- tmp4_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_cond;
     tmp4_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     tmp4_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_return_output := tmp4_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- tmp8b_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_cond;
     tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_return_output := tmp8b_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- Submodule level 12
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l290_c9_d961_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_tmp4_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_tmp8_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_tmp8b_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_x_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_y_MUX_uxn_device_h_l249_c7_6d57_return_output;
     -- tmp8_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_cond;
     tmp8_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     tmp8_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_return_output := tmp8_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- ram_addr_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_cond;
     ram_addr_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     ram_addr_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_return_output := ram_addr_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l336_c22_9409] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l336_c22_9409_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output.u16_addr;

     -- x_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_x_MUX_uxn_device_h_l245_c7_5ed1_cond;
     x_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_x_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     x_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_x_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l245_c7_5ed1_return_output := x_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- y_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_y_MUX_uxn_device_h_l245_c7_5ed1_cond;
     y_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_y_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     y_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_y_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l245_c7_5ed1_return_output := y_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- tmp4_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_cond;
     tmp4_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     tmp4_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_return_output := tmp4_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_cond;
     screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output := screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- tmp8b_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_cond;
     tmp8b_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     tmp8b_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_return_output := tmp8b_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- is_last_blit_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_cond;
     is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_return_output := is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l338_c22_2666] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l338_c22_2666_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l335_c27_22a1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l335_c27_22a1_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_c6d1_return_output.is_vram_write;

     -- result_u8_value_MUX[uxn_device_h_l279_c4_4947] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l279_c4_4947_cond <= VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_cond;
     result_u8_value_MUX_uxn_device_h_l279_c4_4947_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_iftrue;
     result_u8_value_MUX_uxn_device_h_l279_c4_4947_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_return_output := result_u8_value_MUX_uxn_device_h_l279_c4_4947_return_output;

     -- Submodule level 13
     REG_VAR_is_last_blit := VAR_is_last_blit_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_ram_addr_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_tmp4_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_tmp8_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_tmp8b_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_x_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_x_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_y_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_y_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_d6a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_d6a7_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_d3cc_return_output.is_blit_done;

     -- tmp8b_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_cond;
     tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_return_output := tmp8b_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- x_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_x_MUX_uxn_device_h_l241_c7_1d64_cond;
     x_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_x_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     x_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_x_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l241_c7_1d64_return_output := x_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- tmp4_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_cond;
     tmp4_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     tmp4_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_return_output := tmp4_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_cond;
     screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_return_output := screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- tmp8_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_cond;
     tmp8_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     tmp8_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_return_output := tmp8_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7[uxn_device_h_l278_c3_d3cc] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l278_c3_d3cc_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39b7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l333_c4_a9a2,
     to_unsigned(0, 1),
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l335_c27_22a1_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l336_c22_9409_return_output,
     layer,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l338_c22_2666_return_output);

     -- ram_addr_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_cond;
     ram_addr_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     ram_addr_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_return_output := ram_addr_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f[uxn_device_h_l278_c3_d3cc] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f_uxn_device_h_l278_c3_d3cc_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_4947_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_4947_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_4947_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_4947_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_4947_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_4947_return_output);

     -- y_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_y_MUX_uxn_device_h_l241_c7_1d64_cond;
     y_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_y_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     y_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_y_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l241_c7_1d64_return_output := y_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- Submodule level 14
     VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_right := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_d6a7_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_d6a7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_ram_addr_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_tmp4_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_tmp8_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_tmp8b_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_x_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_y_MUX_uxn_device_h_l241_c7_1d64_return_output;
     -- ram_addr_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_cond;
     ram_addr_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     ram_addr_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_return_output := ram_addr_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- x_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_x_MUX_uxn_device_h_l238_c7_5dc9_cond;
     x_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_x_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     x_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_x_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l238_c7_5dc9_return_output := x_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- is_blit_done_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_cond;
     is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_return_output := is_blit_done_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- BIN_OP_XOR[uxn_device_h_l342_c11_8c41] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_device_h_l342_c11_8c41_left <= VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_left;
     BIN_OP_XOR_uxn_device_h_l342_c11_8c41_right <= VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_return_output := BIN_OP_XOR_uxn_device_h_l342_c11_8c41_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_cond;
     screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_return_output := screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- y_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_y_MUX_uxn_device_h_l238_c7_5dc9_cond;
     y_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_y_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     y_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_y_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l238_c7_5dc9_return_output := y_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_MUX[uxn_device_h_l278_c3_d3cc] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l278_c3_d3cc_cond <= VAR_result_MUX_uxn_device_h_l278_c3_d3cc_cond;
     result_MUX_uxn_device_h_l278_c3_d3cc_iftrue <= VAR_result_MUX_uxn_device_h_l278_c3_d3cc_iftrue;
     result_MUX_uxn_device_h_l278_c3_d3cc_iffalse <= VAR_result_MUX_uxn_device_h_l278_c3_d3cc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l278_c3_d3cc_return_output := result_MUX_uxn_device_h_l278_c3_d3cc_return_output;

     -- tmp4_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_cond;
     tmp4_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     tmp4_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_return_output := tmp4_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- tmp8_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_cond;
     tmp8_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     tmp8_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_return_output := tmp8_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- tmp8b_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_cond;
     tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_return_output := tmp8b_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_device_h_l342_c11_9721_cond := VAR_BIN_OP_XOR_uxn_device_h_l342_c11_8c41_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_ram_addr_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_result_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_result_MUX_uxn_device_h_l278_c3_d3cc_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_tmp4_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     REG_VAR_tmp8b := VAR_tmp8b_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_x_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_y_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     -- x_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_x_MUX_uxn_device_h_l231_c2_3fd6_cond;
     x_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_x_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     x_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_x_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l231_c2_3fd6_return_output := x_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_cond;
     screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_return_output := screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- y_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_y_MUX_uxn_device_h_l231_c2_3fd6_cond;
     y_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_y_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     y_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_y_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l231_c2_3fd6_return_output := y_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- MUX[uxn_device_h_l342_c11_9721] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l342_c11_9721_cond <= VAR_MUX_uxn_device_h_l342_c11_9721_cond;
     MUX_uxn_device_h_l342_c11_9721_iftrue <= VAR_MUX_uxn_device_h_l342_c11_9721_iftrue;
     MUX_uxn_device_h_l342_c11_9721_iffalse <= VAR_MUX_uxn_device_h_l342_c11_9721_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l342_c11_9721_return_output := MUX_uxn_device_h_l342_c11_9721_return_output;

     -- result_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_result_MUX_uxn_device_h_l263_c7_86eb_cond;
     result_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_result_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     result_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_result_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l263_c7_86eb_return_output := result_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- ram_addr_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_cond;
     ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_return_output := ram_addr_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- is_blit_done_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_cond;
     is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_return_output := is_blit_done_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- tmp4_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_cond;
     tmp4_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     tmp4_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_return_output := tmp4_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- Submodule level 16
     VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_iffalse := VAR_MUX_uxn_device_h_l342_c11_9721_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_ram_addr_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_result_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_result_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_tmp4_MUX_uxn_device_h_l241_c7_1d64_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     -- tmp4_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_cond;
     tmp4_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     tmp4_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_return_output := tmp4_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- ram_addr_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_cond;
     ram_addr_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     ram_addr_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_return_output := ram_addr_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_cond;
     screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_return_output := screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- result_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_result_MUX_uxn_device_h_l258_c7_f69d_cond;
     result_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_result_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     result_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_result_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l258_c7_f69d_return_output := result_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- tmp12_MUX[uxn_device_h_l263_c7_86eb] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l263_c7_86eb_cond <= VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_cond;
     tmp12_MUX_uxn_device_h_l263_c7_86eb_iftrue <= VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_iftrue;
     tmp12_MUX_uxn_device_h_l263_c7_86eb_iffalse <= VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_return_output := tmp12_MUX_uxn_device_h_l263_c7_86eb_return_output;

     -- is_blit_done_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_cond;
     is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_return_output := is_blit_done_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- Submodule level 17
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_ram_addr_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_result_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_result_MUX_uxn_device_h_l258_c7_f69d_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_iffalse := VAR_tmp12_MUX_uxn_device_h_l263_c7_86eb_return_output;
     VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_tmp4_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_cond;
     screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_return_output := screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- result_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_result_MUX_uxn_device_h_l249_c7_6d57_cond;
     result_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_result_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     result_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_result_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l249_c7_6d57_return_output := result_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- ram_addr_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_cond;
     ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_return_output := ram_addr_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- tmp4_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_cond;
     tmp4_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     tmp4_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_return_output := tmp4_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- is_blit_done_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_cond;
     is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_return_output := is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- tmp12_MUX[uxn_device_h_l258_c7_f69d] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l258_c7_f69d_cond <= VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_cond;
     tmp12_MUX_uxn_device_h_l258_c7_f69d_iftrue <= VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_iftrue;
     tmp12_MUX_uxn_device_h_l258_c7_f69d_iffalse <= VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_return_output := tmp12_MUX_uxn_device_h_l258_c7_f69d_return_output;

     -- Submodule level 18
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_result_MUX_uxn_device_h_l249_c7_6d57_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_1d64_return_output;
     VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_iffalse := VAR_tmp12_MUX_uxn_device_h_l258_c7_f69d_return_output;
     REG_VAR_tmp4 := VAR_tmp4_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     -- is_blit_done_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_cond;
     is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_return_output := is_blit_done_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- ram_addr_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_cond;
     ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_return_output := ram_addr_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_cond;
     screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_return_output := screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_result_MUX_uxn_device_h_l245_c7_5ed1_cond;
     result_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_result_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     result_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_result_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l245_c7_5ed1_return_output := result_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- tmp12_MUX[uxn_device_h_l249_c7_6d57] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l249_c7_6d57_cond <= VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_cond;
     tmp12_MUX_uxn_device_h_l249_c7_6d57_iftrue <= VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_iftrue;
     tmp12_MUX_uxn_device_h_l249_c7_6d57_iffalse <= VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_return_output := tmp12_MUX_uxn_device_h_l249_c7_6d57_return_output;

     -- Submodule level 19
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l241_c7_1d64_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_result_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_result_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_iffalse := VAR_tmp12_MUX_uxn_device_h_l249_c7_6d57_return_output;
     -- result_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_result_MUX_uxn_device_h_l241_c7_1d64_cond;
     result_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_result_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     result_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_result_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l241_c7_1d64_return_output := result_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_cond;
     screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_return_output := screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- tmp12_MUX[uxn_device_h_l245_c7_5ed1] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l245_c7_5ed1_cond <= VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_cond;
     tmp12_MUX_uxn_device_h_l245_c7_5ed1_iftrue <= VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_iftrue;
     tmp12_MUX_uxn_device_h_l245_c7_5ed1_iffalse <= VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_return_output := tmp12_MUX_uxn_device_h_l245_c7_5ed1_return_output;

     -- is_blit_done_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_cond;
     is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_return_output := is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- Submodule level 20
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_result_MUX_uxn_device_h_l241_c7_1d64_return_output;
     REG_VAR_screen_blit_result := VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_iffalse := VAR_tmp12_MUX_uxn_device_h_l245_c7_5ed1_return_output;
     -- tmp12_MUX[uxn_device_h_l241_c7_1d64] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l241_c7_1d64_cond <= VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_cond;
     tmp12_MUX_uxn_device_h_l241_c7_1d64_iftrue <= VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_iftrue;
     tmp12_MUX_uxn_device_h_l241_c7_1d64_iffalse <= VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_return_output := tmp12_MUX_uxn_device_h_l241_c7_1d64_return_output;

     -- result_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_result_MUX_uxn_device_h_l238_c7_5dc9_cond;
     result_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_result_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     result_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_result_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l238_c7_5dc9_return_output := result_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- is_blit_done_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_cond;
     is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_return_output := is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- Submodule level 21
     REG_VAR_is_blit_done := VAR_is_blit_done_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_result_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_iffalse := VAR_tmp12_MUX_uxn_device_h_l241_c7_1d64_return_output;
     -- tmp12_MUX[uxn_device_h_l238_c7_5dc9] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l238_c7_5dc9_cond <= VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_cond;
     tmp12_MUX_uxn_device_h_l238_c7_5dc9_iftrue <= VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_iftrue;
     tmp12_MUX_uxn_device_h_l238_c7_5dc9_iffalse <= VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_return_output := tmp12_MUX_uxn_device_h_l238_c7_5dc9_return_output;

     -- result_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_result_MUX_uxn_device_h_l231_c2_3fd6_cond;
     result_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_result_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     result_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_result_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l231_c2_3fd6_return_output := result_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- Submodule level 22
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_iffalse := VAR_tmp12_MUX_uxn_device_h_l238_c7_5dc9_return_output;
     -- tmp12_MUX[uxn_device_h_l231_c2_3fd6] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l231_c2_3fd6_cond <= VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_cond;
     tmp12_MUX_uxn_device_h_l231_c2_3fd6_iftrue <= VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_iftrue;
     tmp12_MUX_uxn_device_h_l231_c2_3fd6_iffalse <= VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_return_output := tmp12_MUX_uxn_device_h_l231_c2_3fd6_return_output;

     -- Submodule level 23
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_device_h_l231_c2_3fd6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ram_addr <= REG_VAR_ram_addr;
REG_COMB_ram_addr_incr <= REG_VAR_ram_addr_incr;
REG_COMB_tmp12 <= REG_VAR_tmp12;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_tmp8b <= REG_VAR_tmp8b;
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
     tmp12 <= REG_COMB_tmp12;
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     tmp8 <= REG_COMB_tmp8;
     tmp8b <= REG_COMB_tmp8b;
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
