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
-- BIN_OP_EQ[uxn_device_h_l231_c6_363b]
signal BIN_OP_EQ_uxn_device_h_l231_c6_363b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c6_363b_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l238_c7_5455]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l231_c2_e548]
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l231_c2_e548]
signal auto_advance_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l231_c2_e548]
signal screen_blit_result_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l231_c2_e548_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l231_c2_e548]
signal tmp8_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l231_c2_e548]
signal tmp12_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(11 downto 0);

-- flip_x_MUX[uxn_device_h_l231_c2_e548]
signal flip_x_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l231_c2_e548]
signal x_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l231_c2_e548]
signal is_blit_done_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l231_c2_e548]
signal tmp4_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l231_c2_e548]
signal result_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l231_c2_e548_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l231_c2_e548_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l231_c2_e548_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l231_c2_e548]
signal y_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l231_c2_e548]
signal flip_y_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l231_c2_e548]
signal layer_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l231_c2_e548]
signal ram_addr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l231_c2_e548]
signal ctrl_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l231_c2_e548]
signal auto_length_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l231_c2_e548]
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l231_c2_e548]
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l231_c2_e548]
signal tmp8b_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l231_c2_e548]
signal ctrl_mode_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l231_c2_e548]
signal is_last_blit_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l231_c2_e548]
signal color_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l238_c11_b78c]
signal BIN_OP_EQ_uxn_device_h_l238_c11_b78c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l238_c11_b78c_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l241_c7_5b88]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l238_c7_5455]
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l238_c7_5455]
signal auto_advance_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l238_c7_5455]
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l238_c7_5455_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l238_c7_5455]
signal tmp8_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l238_c7_5455]
signal tmp12_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(11 downto 0);

-- flip_x_MUX[uxn_device_h_l238_c7_5455]
signal flip_x_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l238_c7_5455]
signal x_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l238_c7_5455]
signal is_blit_done_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l238_c7_5455]
signal tmp4_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l238_c7_5455]
signal result_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l238_c7_5455_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l238_c7_5455_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l238_c7_5455_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l238_c7_5455]
signal y_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l238_c7_5455]
signal flip_y_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l238_c7_5455]
signal layer_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l238_c7_5455]
signal ram_addr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l238_c7_5455]
signal ctrl_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l238_c7_5455]
signal auto_length_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l238_c7_5455]
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l238_c7_5455]
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l238_c7_5455]
signal tmp8b_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l238_c7_5455]
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l238_c7_5455]
signal is_last_blit_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l238_c7_5455]
signal color_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l241_c11_1cf0]
signal BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l245_c7_e465]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l241_c7_5b88]
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l241_c7_5b88]
signal auto_advance_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l241_c7_5b88]
signal screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l241_c7_5b88]
signal tmp8_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l241_c7_5b88]
signal tmp12_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(11 downto 0);

-- flip_x_MUX[uxn_device_h_l241_c7_5b88]
signal flip_x_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l241_c7_5b88]
signal x_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l241_c7_5b88]
signal is_blit_done_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l241_c7_5b88]
signal tmp4_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l241_c7_5b88]
signal result_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l241_c7_5b88_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l241_c7_5b88_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l241_c7_5b88_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l241_c7_5b88]
signal y_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l241_c7_5b88]
signal flip_y_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l241_c7_5b88]
signal layer_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l241_c7_5b88]
signal ram_addr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l241_c7_5b88]
signal ctrl_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l241_c7_5b88]
signal auto_length_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l241_c7_5b88]
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l241_c7_5b88]
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l241_c7_5b88]
signal tmp8b_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l241_c7_5b88]
signal ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l241_c7_5b88]
signal is_last_blit_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l241_c7_5b88]
signal color_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l245_c11_d97d]
signal BIN_OP_EQ_uxn_device_h_l245_c11_d97d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l245_c11_d97d_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l249_c7_644d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l245_c7_e465]
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l245_c7_e465]
signal auto_advance_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l245_c7_e465]
signal screen_blit_result_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l245_c7_e465_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l245_c7_e465]
signal tmp8_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l245_c7_e465]
signal tmp12_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(11 downto 0);

-- flip_x_MUX[uxn_device_h_l245_c7_e465]
signal flip_x_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l245_c7_e465]
signal x_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l245_c7_e465]
signal is_blit_done_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l245_c7_e465]
signal tmp4_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l245_c7_e465]
signal result_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l245_c7_e465_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l245_c7_e465_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l245_c7_e465_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l245_c7_e465]
signal y_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l245_c7_e465]
signal flip_y_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l245_c7_e465]
signal layer_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l245_c7_e465]
signal ram_addr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l245_c7_e465]
signal ctrl_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l245_c7_e465]
signal auto_length_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l245_c7_e465]
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l245_c7_e465]
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l245_c7_e465]
signal tmp8b_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l245_c7_e465]
signal ctrl_mode_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l245_c7_e465]
signal is_last_blit_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l245_c7_e465]
signal color_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l249_c11_fb78]
signal BIN_OP_EQ_uxn_device_h_l249_c11_fb78_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l249_c11_fb78_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l258_c7_1b01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l249_c7_644d]
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l249_c7_644d]
signal auto_advance_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l249_c7_644d]
signal screen_blit_result_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l249_c7_644d_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l249_c7_644d]
signal tmp8_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l249_c7_644d]
signal tmp12_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(11 downto 0);

-- flip_x_MUX[uxn_device_h_l249_c7_644d]
signal flip_x_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l249_c7_644d]
signal x_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l249_c7_644d]
signal is_blit_done_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l249_c7_644d]
signal tmp4_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l249_c7_644d]
signal result_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l249_c7_644d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l249_c7_644d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l249_c7_644d_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l249_c7_644d]
signal y_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);

-- flip_y_MUX[uxn_device_h_l249_c7_644d]
signal flip_y_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l249_c7_644d]
signal layer_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l249_c7_644d]
signal ram_addr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);

-- ctrl_MUX[uxn_device_h_l249_c7_644d]
signal ctrl_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);

-- auto_length_MUX[uxn_device_h_l249_c7_644d]
signal auto_length_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l249_c7_644d]
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l249_c7_644d]
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l249_c7_644d]
signal tmp8b_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l249_c7_644d]
signal ctrl_mode_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l249_c7_644d]
signal is_last_blit_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l249_c7_644d]
signal color_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(3 downto 0);

-- CONST_SR_7[uxn_device_h_l252_c25_b454]
signal CONST_SR_7_uxn_device_h_l252_c25_b454_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l252_c25_b454_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l253_c21_a1e2]
signal CONST_SR_6_uxn_device_h_l253_c21_a1e2_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l253_c21_a1e2_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l254_c22_fc05]
signal CONST_SR_5_uxn_device_h_l254_c22_fc05_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l254_c22_fc05_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l255_c22_a884]
signal CONST_SR_4_uxn_device_h_l255_c22_a884_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l255_c22_a884_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l258_c11_79e8]
signal BIN_OP_EQ_uxn_device_h_l258_c11_79e8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l258_c11_79e8_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l263_c7_caca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l258_c7_1b01]
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l258_c7_1b01]
signal auto_advance_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l258_c7_1b01]
signal screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l258_c7_1b01]
signal tmp8_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l258_c7_1b01]
signal tmp12_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l258_c7_1b01]
signal x_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l258_c7_1b01]
signal is_blit_done_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l258_c7_1b01]
signal tmp4_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l258_c7_1b01]
signal result_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l258_c7_1b01_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l258_c7_1b01_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l258_c7_1b01_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l258_c7_1b01]
signal y_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l258_c7_1b01]
signal ram_addr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l258_c7_1b01]
signal auto_length_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l258_c7_1b01]
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l258_c7_1b01]
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l258_c7_1b01]
signal tmp8b_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);

-- is_last_blit_MUX[uxn_device_h_l258_c7_1b01]
signal is_last_blit_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l263_c11_cb09]
signal BIN_OP_EQ_uxn_device_h_l263_c11_cb09_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l263_c11_cb09_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l272_c1_9add]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_return_output : unsigned(0 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l263_c7_caca]
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l263_c7_caca]
signal auto_advance_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l263_c7_caca]
signal screen_blit_result_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l263_c7_caca_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l263_c7_caca]
signal tmp8_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);

-- tmp12_MUX[uxn_device_h_l263_c7_caca]
signal tmp12_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(11 downto 0);

-- x_MUX[uxn_device_h_l263_c7_caca]
signal x_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l263_c7_caca]
signal is_blit_done_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l263_c7_caca]
signal tmp4_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l263_c7_caca]
signal result_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l263_c7_caca_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l263_c7_caca_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l263_c7_caca_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l263_c7_caca]
signal y_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l263_c7_caca]
signal ram_addr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l263_c7_caca]
signal auto_length_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(3 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l263_c7_caca]
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l263_c7_caca]
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l263_c7_caca]
signal tmp8b_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);

-- is_last_blit_MUX[uxn_device_h_l263_c7_caca]
signal is_last_blit_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l273_c18_d5e5]
signal BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l273_c18_d37f]
signal MUX_uxn_device_h_l273_c18_d37f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l273_c18_d37f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l273_c18_d37f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l273_c18_d37f_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l275_c19_6ae9]
signal MUX_uxn_device_h_l275_c19_6ae9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l275_c19_6ae9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l275_c19_6ae9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l275_c19_6ae9_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l276_c19_c30f]
signal MUX_uxn_device_h_l276_c19_c30f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l276_c19_c30f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l276_c19_c30f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l276_c19_c30f_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l277_c39_72f3]
signal MUX_uxn_device_h_l277_c39_72f3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l277_c39_72f3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c39_72f3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c39_72f3_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l277_c20_66c1]
signal MUX_uxn_device_h_l277_c20_66c1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l277_c20_66c1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c20_66c1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l277_c20_66c1_return_output : unsigned(15 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l326_c1_2c3a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l278_c3_34c4]
signal screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output : screen_blit_result_t;

-- tmp8_MUX[uxn_device_h_l278_c3_34c4]
signal tmp8_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l278_c3_34c4]
signal x_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l278_c3_34c4]
signal tmp4_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(3 downto 0);

-- result_MUX[uxn_device_h_l278_c3_34c4]
signal result_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l278_c3_34c4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l278_c3_34c4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l278_c3_34c4_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l278_c3_34c4]
signal y_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l278_c3_34c4]
signal ram_addr_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(15 downto 0);

-- tmp8b_MUX[uxn_device_h_l278_c3_34c4]
signal tmp8b_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(7 downto 0);

-- is_last_blit_MUX[uxn_device_h_l278_c3_34c4]
signal is_last_blit_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l279_c8_c59d]
signal BIN_OP_EQ_uxn_device_h_l279_c8_c59d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c8_c59d_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l279_c4_d221]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l279_c4_d221]
signal tmp8_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l279_c4_d221]
signal x_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l279_c4_d221]
signal tmp4_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_device_h_l279_c4_d221]
signal result_u8_value_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l279_c4_d221]
signal result_u16_addr_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l279_c4_d221]
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l279_c4_d221]
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l279_c4_d221]
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l279_c4_d221]
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l279_c4_d221]
signal y_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l279_c4_d221]
signal ram_addr_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);

-- tmp8b_MUX[uxn_device_h_l279_c4_d221]
signal tmp8b_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l280_c22_457f]
signal BIN_OP_MINUS_uxn_device_h_l280_c22_457f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l280_c22_457f_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l280_c22_457f_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l280_c47_9736]
signal BIN_OP_PLUS_uxn_device_h_l280_c47_9736_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l280_c47_9736_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l280_c47_9736_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l280_c12_8e0f]
signal MUX_uxn_device_h_l280_c12_8e0f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l280_c12_8e0f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l280_c12_8e0f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l280_c12_8e0f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l281_c23_0cf6]
signal BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l281_c49_47f6]
signal BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l281_c13_6ce2]
signal MUX_uxn_device_h_l281_c13_6ce2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l281_c13_6ce2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l281_c13_6ce2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l281_c13_6ce2_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l282_c36_4b97]
signal BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l282_c58_8722]
signal BIN_OP_PLUS_uxn_device_h_l282_c58_8722_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l282_c58_8722_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l282_c58_8722_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l282_c26_3238]
signal MUX_uxn_device_h_l282_c26_3238_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l282_c26_3238_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c26_3238_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c26_3238_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l282_c10_2c1a]
signal MUX_uxn_device_h_l282_c10_2c1a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l282_c10_2c1a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c10_2c1a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l282_c10_2c1a_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l283_c36_fd1a]
signal BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l283_c58_ddba]
signal BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l283_c26_dad8]
signal MUX_uxn_device_h_l283_c26_dad8_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l283_c26_dad8_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c26_dad8_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c26_dad8_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l283_c10_aa5b]
signal MUX_uxn_device_h_l283_c10_aa5b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l283_c10_aa5b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c10_aa5b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l283_c10_aa5b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l290_c22_6743]
signal BIN_OP_PLUS_uxn_device_h_l290_c22_6743_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l290_c22_6743_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l290_c22_6743_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l290_c13_a4c2]
signal BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l290_c9_8fec]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l290_c9_8fec]
signal tmp4_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_device_h_l290_c9_8fec]
signal result_u8_value_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l290_c9_8fec]
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l290_c9_8fec]
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l290_c9_8fec]
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l290_c9_8fec]
signal ram_addr_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l295_c22_4113]
signal BIN_OP_PLUS_uxn_device_h_l295_c22_4113_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l295_c22_4113_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l295_c22_4113_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l295_c13_08d1]
signal BIN_OP_EQ_uxn_device_h_l295_c13_08d1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l295_c13_08d1_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l295_c9_9323]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l295_c9_9323]
signal tmp4_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_device_h_l295_c9_9323]
signal result_u8_value_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l295_c9_9323]
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l295_c9_9323]
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l295_c9_9323]
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l295_c9_9323]
signal ram_addr_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l299_c22_791a]
signal BIN_OP_PLUS_uxn_device_h_l299_c22_791a_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l299_c22_791a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l299_c22_791a_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l299_c13_aab8]
signal BIN_OP_EQ_uxn_device_h_l299_c13_aab8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l299_c13_aab8_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l299_c9_174d]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l299_c9_174d]
signal tmp4_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_device_h_l299_c9_174d]
signal result_u8_value_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l299_c9_174d]
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l299_c9_174d]
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l299_c9_174d]
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l299_c9_174d]
signal ram_addr_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l303_c22_ff80]
signal BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l303_c13_8b54]
signal BIN_OP_EQ_uxn_device_h_l303_c13_8b54_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l303_c13_8b54_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l303_c9_33f1]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l303_c9_33f1]
signal tmp4_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_device_h_l303_c9_33f1]
signal result_u8_value_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l303_c9_33f1]
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l303_c9_33f1]
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l303_c9_33f1]
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l303_c9_33f1]
signal ram_addr_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l307_c22_0b0a]
signal BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l307_c13_2400]
signal BIN_OP_EQ_uxn_device_h_l307_c13_2400_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c13_2400_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l307_c9_0b84]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l307_c9_0b84]
signal tmp4_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_device_h_l307_c9_0b84]
signal result_u8_value_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l307_c9_0b84]
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l307_c9_0b84]
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l307_c9_0b84]
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l307_c9_0b84]
signal ram_addr_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l309_c5_0d57]
signal BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l312_c33_41c7]
signal CONST_SR_8_uxn_device_h_l312_c33_41c7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l312_c33_41c7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l314_c22_0ed4]
signal BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l314_c13_599a]
signal BIN_OP_EQ_uxn_device_h_l314_c13_599a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l314_c13_599a_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l314_c9_d2c5]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l314_c9_d2c5]
signal tmp4_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_device_h_l314_c9_d2c5]
signal result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l314_c9_d2c5]
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l314_c9_d2c5]
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l314_c9_d2c5]
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l319_c22_e7c7]
signal BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_return_output : unsigned(12 downto 0);

-- BIN_OP_EQ[uxn_device_h_l319_c13_4c4d]
signal BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_right : unsigned(12 downto 0);
signal BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output : unsigned(0 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l319_c9_7c66]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l319_c9_7c66]
signal tmp4_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(3 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l319_c9_7c66]
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l319_c9_7c66]
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l319_c9_7c66]
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l320_c5_95fd]
signal BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_left : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_return_output : unsigned(4 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l327_c1_02f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l329_c1_67de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l327_c4_deb8]
signal screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output : screen_blit_result_t;

-- screen_2bpp[uxn_device_h_l328_c26_9600]
signal screen_2bpp_uxn_device_h_l328_c26_9600_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_phase : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_x1 : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_y1 : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_color : unsigned(3 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_fx : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_fy : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_ram_addr : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_previous_ram_read : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l328_c26_9600_return_output : screen_blit_result_t;

-- screen_1bpp[uxn_device_h_l330_c26_cfa4]
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_phase : unsigned(11 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_x1 : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_y1 : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_color : unsigned(3 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_fx : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_fy : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_ram_addr : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_previous_ram_read : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l330_c26_cfa4_return_output : screen_blit_result_t;

-- BIN_OP_EQ[uxn_device_h_l339_c19_e8fd]
signal BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l339_c19_4202]
signal MUX_uxn_device_h_l339_c19_4202_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l339_c19_4202_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l339_c19_4202_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l339_c19_4202_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_device_h_l342_c11_a928]
signal BIN_OP_XOR_uxn_device_h_l342_c11_a928_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l342_c11_a928_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l342_c11_a928_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l342_c60_2fab]
signal BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_return_output : unsigned(12 downto 0);

-- MUX[uxn_device_h_l342_c11_96c2]
signal MUX_uxn_device_h_l342_c11_96c2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l342_c11_96c2_iftrue : unsigned(11 downto 0);
signal MUX_uxn_device_h_l342_c11_96c2_iffalse : unsigned(11 downto 0);
signal MUX_uxn_device_h_l342_c11_96c2_return_output : unsigned(11 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb
signal CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output : unsigned(11 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_1;
      base.u16_addr := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l231_c6_363b
BIN_OP_EQ_uxn_device_h_l231_c6_363b : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l231_c6_363b_left,
BIN_OP_EQ_uxn_device_h_l231_c6_363b_right,
BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l231_c2_e548
x_sprite_incr_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond,
x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue,
x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse,
x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output);

-- auto_advance_MUX_uxn_device_h_l231_c2_e548
auto_advance_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l231_c2_e548_cond,
auto_advance_MUX_uxn_device_h_l231_c2_e548_iftrue,
auto_advance_MUX_uxn_device_h_l231_c2_e548_iffalse,
auto_advance_MUX_uxn_device_h_l231_c2_e548_return_output);

-- screen_blit_result_MUX_uxn_device_h_l231_c2_e548
screen_blit_result_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l231_c2_e548_cond,
screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iftrue,
screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iffalse,
screen_blit_result_MUX_uxn_device_h_l231_c2_e548_return_output);

-- tmp8_MUX_uxn_device_h_l231_c2_e548
tmp8_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l231_c2_e548_cond,
tmp8_MUX_uxn_device_h_l231_c2_e548_iftrue,
tmp8_MUX_uxn_device_h_l231_c2_e548_iffalse,
tmp8_MUX_uxn_device_h_l231_c2_e548_return_output);

-- tmp12_MUX_uxn_device_h_l231_c2_e548
tmp12_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l231_c2_e548_cond,
tmp12_MUX_uxn_device_h_l231_c2_e548_iftrue,
tmp12_MUX_uxn_device_h_l231_c2_e548_iffalse,
tmp12_MUX_uxn_device_h_l231_c2_e548_return_output);

-- flip_x_MUX_uxn_device_h_l231_c2_e548
flip_x_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l231_c2_e548_cond,
flip_x_MUX_uxn_device_h_l231_c2_e548_iftrue,
flip_x_MUX_uxn_device_h_l231_c2_e548_iffalse,
flip_x_MUX_uxn_device_h_l231_c2_e548_return_output);

-- x_MUX_uxn_device_h_l231_c2_e548
x_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l231_c2_e548_cond,
x_MUX_uxn_device_h_l231_c2_e548_iftrue,
x_MUX_uxn_device_h_l231_c2_e548_iffalse,
x_MUX_uxn_device_h_l231_c2_e548_return_output);

-- is_blit_done_MUX_uxn_device_h_l231_c2_e548
is_blit_done_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l231_c2_e548_cond,
is_blit_done_MUX_uxn_device_h_l231_c2_e548_iftrue,
is_blit_done_MUX_uxn_device_h_l231_c2_e548_iffalse,
is_blit_done_MUX_uxn_device_h_l231_c2_e548_return_output);

-- tmp4_MUX_uxn_device_h_l231_c2_e548
tmp4_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l231_c2_e548_cond,
tmp4_MUX_uxn_device_h_l231_c2_e548_iftrue,
tmp4_MUX_uxn_device_h_l231_c2_e548_iffalse,
tmp4_MUX_uxn_device_h_l231_c2_e548_return_output);

-- result_MUX_uxn_device_h_l231_c2_e548
result_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l231_c2_e548_cond,
result_MUX_uxn_device_h_l231_c2_e548_iftrue,
result_MUX_uxn_device_h_l231_c2_e548_iffalse,
result_MUX_uxn_device_h_l231_c2_e548_return_output);

-- y_MUX_uxn_device_h_l231_c2_e548
y_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l231_c2_e548_cond,
y_MUX_uxn_device_h_l231_c2_e548_iftrue,
y_MUX_uxn_device_h_l231_c2_e548_iffalse,
y_MUX_uxn_device_h_l231_c2_e548_return_output);

-- flip_y_MUX_uxn_device_h_l231_c2_e548
flip_y_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l231_c2_e548_cond,
flip_y_MUX_uxn_device_h_l231_c2_e548_iftrue,
flip_y_MUX_uxn_device_h_l231_c2_e548_iffalse,
flip_y_MUX_uxn_device_h_l231_c2_e548_return_output);

-- layer_MUX_uxn_device_h_l231_c2_e548
layer_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l231_c2_e548_cond,
layer_MUX_uxn_device_h_l231_c2_e548_iftrue,
layer_MUX_uxn_device_h_l231_c2_e548_iffalse,
layer_MUX_uxn_device_h_l231_c2_e548_return_output);

-- ram_addr_MUX_uxn_device_h_l231_c2_e548
ram_addr_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l231_c2_e548_cond,
ram_addr_MUX_uxn_device_h_l231_c2_e548_iftrue,
ram_addr_MUX_uxn_device_h_l231_c2_e548_iffalse,
ram_addr_MUX_uxn_device_h_l231_c2_e548_return_output);

-- ctrl_MUX_uxn_device_h_l231_c2_e548
ctrl_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l231_c2_e548_cond,
ctrl_MUX_uxn_device_h_l231_c2_e548_iftrue,
ctrl_MUX_uxn_device_h_l231_c2_e548_iffalse,
ctrl_MUX_uxn_device_h_l231_c2_e548_return_output);

-- auto_length_MUX_uxn_device_h_l231_c2_e548
auto_length_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l231_c2_e548_cond,
auto_length_MUX_uxn_device_h_l231_c2_e548_iftrue,
auto_length_MUX_uxn_device_h_l231_c2_e548_iffalse,
auto_length_MUX_uxn_device_h_l231_c2_e548_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l231_c2_e548
ram_addr_incr_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_cond,
ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iftrue,
ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iffalse,
ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l231_c2_e548
y_sprite_incr_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond,
y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue,
y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse,
y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output);

-- tmp8b_MUX_uxn_device_h_l231_c2_e548
tmp8b_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l231_c2_e548_cond,
tmp8b_MUX_uxn_device_h_l231_c2_e548_iftrue,
tmp8b_MUX_uxn_device_h_l231_c2_e548_iffalse,
tmp8b_MUX_uxn_device_h_l231_c2_e548_return_output);

-- ctrl_mode_MUX_uxn_device_h_l231_c2_e548
ctrl_mode_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l231_c2_e548_cond,
ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iftrue,
ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iffalse,
ctrl_mode_MUX_uxn_device_h_l231_c2_e548_return_output);

-- is_last_blit_MUX_uxn_device_h_l231_c2_e548
is_last_blit_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l231_c2_e548_cond,
is_last_blit_MUX_uxn_device_h_l231_c2_e548_iftrue,
is_last_blit_MUX_uxn_device_h_l231_c2_e548_iffalse,
is_last_blit_MUX_uxn_device_h_l231_c2_e548_return_output);

-- color_MUX_uxn_device_h_l231_c2_e548
color_MUX_uxn_device_h_l231_c2_e548 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l231_c2_e548_cond,
color_MUX_uxn_device_h_l231_c2_e548_iftrue,
color_MUX_uxn_device_h_l231_c2_e548_iffalse,
color_MUX_uxn_device_h_l231_c2_e548_return_output);

-- BIN_OP_EQ_uxn_device_h_l238_c11_b78c
BIN_OP_EQ_uxn_device_h_l238_c11_b78c : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l238_c11_b78c_left,
BIN_OP_EQ_uxn_device_h_l238_c11_b78c_right,
BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l238_c7_5455
x_sprite_incr_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond,
x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue,
x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse,
x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output);

-- auto_advance_MUX_uxn_device_h_l238_c7_5455
auto_advance_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l238_c7_5455_cond,
auto_advance_MUX_uxn_device_h_l238_c7_5455_iftrue,
auto_advance_MUX_uxn_device_h_l238_c7_5455_iffalse,
auto_advance_MUX_uxn_device_h_l238_c7_5455_return_output);

-- screen_blit_result_MUX_uxn_device_h_l238_c7_5455
screen_blit_result_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l238_c7_5455_cond,
screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iftrue,
screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iffalse,
screen_blit_result_MUX_uxn_device_h_l238_c7_5455_return_output);

-- tmp8_MUX_uxn_device_h_l238_c7_5455
tmp8_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l238_c7_5455_cond,
tmp8_MUX_uxn_device_h_l238_c7_5455_iftrue,
tmp8_MUX_uxn_device_h_l238_c7_5455_iffalse,
tmp8_MUX_uxn_device_h_l238_c7_5455_return_output);

-- tmp12_MUX_uxn_device_h_l238_c7_5455
tmp12_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l238_c7_5455_cond,
tmp12_MUX_uxn_device_h_l238_c7_5455_iftrue,
tmp12_MUX_uxn_device_h_l238_c7_5455_iffalse,
tmp12_MUX_uxn_device_h_l238_c7_5455_return_output);

-- flip_x_MUX_uxn_device_h_l238_c7_5455
flip_x_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l238_c7_5455_cond,
flip_x_MUX_uxn_device_h_l238_c7_5455_iftrue,
flip_x_MUX_uxn_device_h_l238_c7_5455_iffalse,
flip_x_MUX_uxn_device_h_l238_c7_5455_return_output);

-- x_MUX_uxn_device_h_l238_c7_5455
x_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l238_c7_5455_cond,
x_MUX_uxn_device_h_l238_c7_5455_iftrue,
x_MUX_uxn_device_h_l238_c7_5455_iffalse,
x_MUX_uxn_device_h_l238_c7_5455_return_output);

-- is_blit_done_MUX_uxn_device_h_l238_c7_5455
is_blit_done_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l238_c7_5455_cond,
is_blit_done_MUX_uxn_device_h_l238_c7_5455_iftrue,
is_blit_done_MUX_uxn_device_h_l238_c7_5455_iffalse,
is_blit_done_MUX_uxn_device_h_l238_c7_5455_return_output);

-- tmp4_MUX_uxn_device_h_l238_c7_5455
tmp4_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l238_c7_5455_cond,
tmp4_MUX_uxn_device_h_l238_c7_5455_iftrue,
tmp4_MUX_uxn_device_h_l238_c7_5455_iffalse,
tmp4_MUX_uxn_device_h_l238_c7_5455_return_output);

-- result_MUX_uxn_device_h_l238_c7_5455
result_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l238_c7_5455_cond,
result_MUX_uxn_device_h_l238_c7_5455_iftrue,
result_MUX_uxn_device_h_l238_c7_5455_iffalse,
result_MUX_uxn_device_h_l238_c7_5455_return_output);

-- y_MUX_uxn_device_h_l238_c7_5455
y_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l238_c7_5455_cond,
y_MUX_uxn_device_h_l238_c7_5455_iftrue,
y_MUX_uxn_device_h_l238_c7_5455_iffalse,
y_MUX_uxn_device_h_l238_c7_5455_return_output);

-- flip_y_MUX_uxn_device_h_l238_c7_5455
flip_y_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l238_c7_5455_cond,
flip_y_MUX_uxn_device_h_l238_c7_5455_iftrue,
flip_y_MUX_uxn_device_h_l238_c7_5455_iffalse,
flip_y_MUX_uxn_device_h_l238_c7_5455_return_output);

-- layer_MUX_uxn_device_h_l238_c7_5455
layer_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l238_c7_5455_cond,
layer_MUX_uxn_device_h_l238_c7_5455_iftrue,
layer_MUX_uxn_device_h_l238_c7_5455_iffalse,
layer_MUX_uxn_device_h_l238_c7_5455_return_output);

-- ram_addr_MUX_uxn_device_h_l238_c7_5455
ram_addr_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l238_c7_5455_cond,
ram_addr_MUX_uxn_device_h_l238_c7_5455_iftrue,
ram_addr_MUX_uxn_device_h_l238_c7_5455_iffalse,
ram_addr_MUX_uxn_device_h_l238_c7_5455_return_output);

-- ctrl_MUX_uxn_device_h_l238_c7_5455
ctrl_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l238_c7_5455_cond,
ctrl_MUX_uxn_device_h_l238_c7_5455_iftrue,
ctrl_MUX_uxn_device_h_l238_c7_5455_iffalse,
ctrl_MUX_uxn_device_h_l238_c7_5455_return_output);

-- auto_length_MUX_uxn_device_h_l238_c7_5455
auto_length_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l238_c7_5455_cond,
auto_length_MUX_uxn_device_h_l238_c7_5455_iftrue,
auto_length_MUX_uxn_device_h_l238_c7_5455_iffalse,
auto_length_MUX_uxn_device_h_l238_c7_5455_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l238_c7_5455
ram_addr_incr_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_cond,
ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iftrue,
ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iffalse,
ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l238_c7_5455
y_sprite_incr_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond,
y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue,
y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse,
y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output);

-- tmp8b_MUX_uxn_device_h_l238_c7_5455
tmp8b_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l238_c7_5455_cond,
tmp8b_MUX_uxn_device_h_l238_c7_5455_iftrue,
tmp8b_MUX_uxn_device_h_l238_c7_5455_iffalse,
tmp8b_MUX_uxn_device_h_l238_c7_5455_return_output);

-- ctrl_mode_MUX_uxn_device_h_l238_c7_5455
ctrl_mode_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l238_c7_5455_cond,
ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iftrue,
ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iffalse,
ctrl_mode_MUX_uxn_device_h_l238_c7_5455_return_output);

-- is_last_blit_MUX_uxn_device_h_l238_c7_5455
is_last_blit_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l238_c7_5455_cond,
is_last_blit_MUX_uxn_device_h_l238_c7_5455_iftrue,
is_last_blit_MUX_uxn_device_h_l238_c7_5455_iffalse,
is_last_blit_MUX_uxn_device_h_l238_c7_5455_return_output);

-- color_MUX_uxn_device_h_l238_c7_5455
color_MUX_uxn_device_h_l238_c7_5455 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l238_c7_5455_cond,
color_MUX_uxn_device_h_l238_c7_5455_iftrue,
color_MUX_uxn_device_h_l238_c7_5455_iffalse,
color_MUX_uxn_device_h_l238_c7_5455_return_output);

-- BIN_OP_EQ_uxn_device_h_l241_c11_1cf0
BIN_OP_EQ_uxn_device_h_l241_c11_1cf0 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_left,
BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_right,
BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88
x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond,
x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue,
x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse,
x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- auto_advance_MUX_uxn_device_h_l241_c7_5b88
auto_advance_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l241_c7_5b88_cond,
auto_advance_MUX_uxn_device_h_l241_c7_5b88_iftrue,
auto_advance_MUX_uxn_device_h_l241_c7_5b88_iffalse,
auto_advance_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- screen_blit_result_MUX_uxn_device_h_l241_c7_5b88
screen_blit_result_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_cond,
screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iftrue,
screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iffalse,
screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- tmp8_MUX_uxn_device_h_l241_c7_5b88
tmp8_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l241_c7_5b88_cond,
tmp8_MUX_uxn_device_h_l241_c7_5b88_iftrue,
tmp8_MUX_uxn_device_h_l241_c7_5b88_iffalse,
tmp8_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- tmp12_MUX_uxn_device_h_l241_c7_5b88
tmp12_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l241_c7_5b88_cond,
tmp12_MUX_uxn_device_h_l241_c7_5b88_iftrue,
tmp12_MUX_uxn_device_h_l241_c7_5b88_iffalse,
tmp12_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- flip_x_MUX_uxn_device_h_l241_c7_5b88
flip_x_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l241_c7_5b88_cond,
flip_x_MUX_uxn_device_h_l241_c7_5b88_iftrue,
flip_x_MUX_uxn_device_h_l241_c7_5b88_iffalse,
flip_x_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- x_MUX_uxn_device_h_l241_c7_5b88
x_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l241_c7_5b88_cond,
x_MUX_uxn_device_h_l241_c7_5b88_iftrue,
x_MUX_uxn_device_h_l241_c7_5b88_iffalse,
x_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- is_blit_done_MUX_uxn_device_h_l241_c7_5b88
is_blit_done_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l241_c7_5b88_cond,
is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iftrue,
is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iffalse,
is_blit_done_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- tmp4_MUX_uxn_device_h_l241_c7_5b88
tmp4_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l241_c7_5b88_cond,
tmp4_MUX_uxn_device_h_l241_c7_5b88_iftrue,
tmp4_MUX_uxn_device_h_l241_c7_5b88_iffalse,
tmp4_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- result_MUX_uxn_device_h_l241_c7_5b88
result_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l241_c7_5b88_cond,
result_MUX_uxn_device_h_l241_c7_5b88_iftrue,
result_MUX_uxn_device_h_l241_c7_5b88_iffalse,
result_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- y_MUX_uxn_device_h_l241_c7_5b88
y_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l241_c7_5b88_cond,
y_MUX_uxn_device_h_l241_c7_5b88_iftrue,
y_MUX_uxn_device_h_l241_c7_5b88_iffalse,
y_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- flip_y_MUX_uxn_device_h_l241_c7_5b88
flip_y_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l241_c7_5b88_cond,
flip_y_MUX_uxn_device_h_l241_c7_5b88_iftrue,
flip_y_MUX_uxn_device_h_l241_c7_5b88_iffalse,
flip_y_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- layer_MUX_uxn_device_h_l241_c7_5b88
layer_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l241_c7_5b88_cond,
layer_MUX_uxn_device_h_l241_c7_5b88_iftrue,
layer_MUX_uxn_device_h_l241_c7_5b88_iffalse,
layer_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- ram_addr_MUX_uxn_device_h_l241_c7_5b88
ram_addr_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l241_c7_5b88_cond,
ram_addr_MUX_uxn_device_h_l241_c7_5b88_iftrue,
ram_addr_MUX_uxn_device_h_l241_c7_5b88_iffalse,
ram_addr_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- ctrl_MUX_uxn_device_h_l241_c7_5b88
ctrl_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l241_c7_5b88_cond,
ctrl_MUX_uxn_device_h_l241_c7_5b88_iftrue,
ctrl_MUX_uxn_device_h_l241_c7_5b88_iffalse,
ctrl_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- auto_length_MUX_uxn_device_h_l241_c7_5b88
auto_length_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l241_c7_5b88_cond,
auto_length_MUX_uxn_device_h_l241_c7_5b88_iftrue,
auto_length_MUX_uxn_device_h_l241_c7_5b88_iffalse,
auto_length_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88
ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_cond,
ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue,
ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse,
ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88
y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond,
y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue,
y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse,
y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- tmp8b_MUX_uxn_device_h_l241_c7_5b88
tmp8b_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l241_c7_5b88_cond,
tmp8b_MUX_uxn_device_h_l241_c7_5b88_iftrue,
tmp8b_MUX_uxn_device_h_l241_c7_5b88_iffalse,
tmp8b_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- ctrl_mode_MUX_uxn_device_h_l241_c7_5b88
ctrl_mode_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_cond,
ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iftrue,
ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iffalse,
ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- is_last_blit_MUX_uxn_device_h_l241_c7_5b88
is_last_blit_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l241_c7_5b88_cond,
is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iftrue,
is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iffalse,
is_last_blit_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- color_MUX_uxn_device_h_l241_c7_5b88
color_MUX_uxn_device_h_l241_c7_5b88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l241_c7_5b88_cond,
color_MUX_uxn_device_h_l241_c7_5b88_iftrue,
color_MUX_uxn_device_h_l241_c7_5b88_iffalse,
color_MUX_uxn_device_h_l241_c7_5b88_return_output);

-- BIN_OP_EQ_uxn_device_h_l245_c11_d97d
BIN_OP_EQ_uxn_device_h_l245_c11_d97d : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l245_c11_d97d_left,
BIN_OP_EQ_uxn_device_h_l245_c11_d97d_right,
BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l245_c7_e465
x_sprite_incr_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond,
x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue,
x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse,
x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output);

-- auto_advance_MUX_uxn_device_h_l245_c7_e465
auto_advance_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l245_c7_e465_cond,
auto_advance_MUX_uxn_device_h_l245_c7_e465_iftrue,
auto_advance_MUX_uxn_device_h_l245_c7_e465_iffalse,
auto_advance_MUX_uxn_device_h_l245_c7_e465_return_output);

-- screen_blit_result_MUX_uxn_device_h_l245_c7_e465
screen_blit_result_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l245_c7_e465_cond,
screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iftrue,
screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iffalse,
screen_blit_result_MUX_uxn_device_h_l245_c7_e465_return_output);

-- tmp8_MUX_uxn_device_h_l245_c7_e465
tmp8_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l245_c7_e465_cond,
tmp8_MUX_uxn_device_h_l245_c7_e465_iftrue,
tmp8_MUX_uxn_device_h_l245_c7_e465_iffalse,
tmp8_MUX_uxn_device_h_l245_c7_e465_return_output);

-- tmp12_MUX_uxn_device_h_l245_c7_e465
tmp12_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l245_c7_e465_cond,
tmp12_MUX_uxn_device_h_l245_c7_e465_iftrue,
tmp12_MUX_uxn_device_h_l245_c7_e465_iffalse,
tmp12_MUX_uxn_device_h_l245_c7_e465_return_output);

-- flip_x_MUX_uxn_device_h_l245_c7_e465
flip_x_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l245_c7_e465_cond,
flip_x_MUX_uxn_device_h_l245_c7_e465_iftrue,
flip_x_MUX_uxn_device_h_l245_c7_e465_iffalse,
flip_x_MUX_uxn_device_h_l245_c7_e465_return_output);

-- x_MUX_uxn_device_h_l245_c7_e465
x_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l245_c7_e465_cond,
x_MUX_uxn_device_h_l245_c7_e465_iftrue,
x_MUX_uxn_device_h_l245_c7_e465_iffalse,
x_MUX_uxn_device_h_l245_c7_e465_return_output);

-- is_blit_done_MUX_uxn_device_h_l245_c7_e465
is_blit_done_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l245_c7_e465_cond,
is_blit_done_MUX_uxn_device_h_l245_c7_e465_iftrue,
is_blit_done_MUX_uxn_device_h_l245_c7_e465_iffalse,
is_blit_done_MUX_uxn_device_h_l245_c7_e465_return_output);

-- tmp4_MUX_uxn_device_h_l245_c7_e465
tmp4_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l245_c7_e465_cond,
tmp4_MUX_uxn_device_h_l245_c7_e465_iftrue,
tmp4_MUX_uxn_device_h_l245_c7_e465_iffalse,
tmp4_MUX_uxn_device_h_l245_c7_e465_return_output);

-- result_MUX_uxn_device_h_l245_c7_e465
result_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l245_c7_e465_cond,
result_MUX_uxn_device_h_l245_c7_e465_iftrue,
result_MUX_uxn_device_h_l245_c7_e465_iffalse,
result_MUX_uxn_device_h_l245_c7_e465_return_output);

-- y_MUX_uxn_device_h_l245_c7_e465
y_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l245_c7_e465_cond,
y_MUX_uxn_device_h_l245_c7_e465_iftrue,
y_MUX_uxn_device_h_l245_c7_e465_iffalse,
y_MUX_uxn_device_h_l245_c7_e465_return_output);

-- flip_y_MUX_uxn_device_h_l245_c7_e465
flip_y_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l245_c7_e465_cond,
flip_y_MUX_uxn_device_h_l245_c7_e465_iftrue,
flip_y_MUX_uxn_device_h_l245_c7_e465_iffalse,
flip_y_MUX_uxn_device_h_l245_c7_e465_return_output);

-- layer_MUX_uxn_device_h_l245_c7_e465
layer_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l245_c7_e465_cond,
layer_MUX_uxn_device_h_l245_c7_e465_iftrue,
layer_MUX_uxn_device_h_l245_c7_e465_iffalse,
layer_MUX_uxn_device_h_l245_c7_e465_return_output);

-- ram_addr_MUX_uxn_device_h_l245_c7_e465
ram_addr_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l245_c7_e465_cond,
ram_addr_MUX_uxn_device_h_l245_c7_e465_iftrue,
ram_addr_MUX_uxn_device_h_l245_c7_e465_iffalse,
ram_addr_MUX_uxn_device_h_l245_c7_e465_return_output);

-- ctrl_MUX_uxn_device_h_l245_c7_e465
ctrl_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l245_c7_e465_cond,
ctrl_MUX_uxn_device_h_l245_c7_e465_iftrue,
ctrl_MUX_uxn_device_h_l245_c7_e465_iffalse,
ctrl_MUX_uxn_device_h_l245_c7_e465_return_output);

-- auto_length_MUX_uxn_device_h_l245_c7_e465
auto_length_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l245_c7_e465_cond,
auto_length_MUX_uxn_device_h_l245_c7_e465_iftrue,
auto_length_MUX_uxn_device_h_l245_c7_e465_iffalse,
auto_length_MUX_uxn_device_h_l245_c7_e465_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l245_c7_e465
ram_addr_incr_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_cond,
ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iftrue,
ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iffalse,
ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l245_c7_e465
y_sprite_incr_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond,
y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue,
y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse,
y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output);

-- tmp8b_MUX_uxn_device_h_l245_c7_e465
tmp8b_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l245_c7_e465_cond,
tmp8b_MUX_uxn_device_h_l245_c7_e465_iftrue,
tmp8b_MUX_uxn_device_h_l245_c7_e465_iffalse,
tmp8b_MUX_uxn_device_h_l245_c7_e465_return_output);

-- ctrl_mode_MUX_uxn_device_h_l245_c7_e465
ctrl_mode_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l245_c7_e465_cond,
ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iftrue,
ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iffalse,
ctrl_mode_MUX_uxn_device_h_l245_c7_e465_return_output);

-- is_last_blit_MUX_uxn_device_h_l245_c7_e465
is_last_blit_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l245_c7_e465_cond,
is_last_blit_MUX_uxn_device_h_l245_c7_e465_iftrue,
is_last_blit_MUX_uxn_device_h_l245_c7_e465_iffalse,
is_last_blit_MUX_uxn_device_h_l245_c7_e465_return_output);

-- color_MUX_uxn_device_h_l245_c7_e465
color_MUX_uxn_device_h_l245_c7_e465 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l245_c7_e465_cond,
color_MUX_uxn_device_h_l245_c7_e465_iftrue,
color_MUX_uxn_device_h_l245_c7_e465_iffalse,
color_MUX_uxn_device_h_l245_c7_e465_return_output);

-- BIN_OP_EQ_uxn_device_h_l249_c11_fb78
BIN_OP_EQ_uxn_device_h_l249_c11_fb78 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l249_c11_fb78_left,
BIN_OP_EQ_uxn_device_h_l249_c11_fb78_right,
BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l249_c7_644d
x_sprite_incr_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond,
x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue,
x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse,
x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output);

-- auto_advance_MUX_uxn_device_h_l249_c7_644d
auto_advance_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l249_c7_644d_cond,
auto_advance_MUX_uxn_device_h_l249_c7_644d_iftrue,
auto_advance_MUX_uxn_device_h_l249_c7_644d_iffalse,
auto_advance_MUX_uxn_device_h_l249_c7_644d_return_output);

-- screen_blit_result_MUX_uxn_device_h_l249_c7_644d
screen_blit_result_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l249_c7_644d_cond,
screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iftrue,
screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iffalse,
screen_blit_result_MUX_uxn_device_h_l249_c7_644d_return_output);

-- tmp8_MUX_uxn_device_h_l249_c7_644d
tmp8_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l249_c7_644d_cond,
tmp8_MUX_uxn_device_h_l249_c7_644d_iftrue,
tmp8_MUX_uxn_device_h_l249_c7_644d_iffalse,
tmp8_MUX_uxn_device_h_l249_c7_644d_return_output);

-- tmp12_MUX_uxn_device_h_l249_c7_644d
tmp12_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l249_c7_644d_cond,
tmp12_MUX_uxn_device_h_l249_c7_644d_iftrue,
tmp12_MUX_uxn_device_h_l249_c7_644d_iffalse,
tmp12_MUX_uxn_device_h_l249_c7_644d_return_output);

-- flip_x_MUX_uxn_device_h_l249_c7_644d
flip_x_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l249_c7_644d_cond,
flip_x_MUX_uxn_device_h_l249_c7_644d_iftrue,
flip_x_MUX_uxn_device_h_l249_c7_644d_iffalse,
flip_x_MUX_uxn_device_h_l249_c7_644d_return_output);

-- x_MUX_uxn_device_h_l249_c7_644d
x_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l249_c7_644d_cond,
x_MUX_uxn_device_h_l249_c7_644d_iftrue,
x_MUX_uxn_device_h_l249_c7_644d_iffalse,
x_MUX_uxn_device_h_l249_c7_644d_return_output);

-- is_blit_done_MUX_uxn_device_h_l249_c7_644d
is_blit_done_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l249_c7_644d_cond,
is_blit_done_MUX_uxn_device_h_l249_c7_644d_iftrue,
is_blit_done_MUX_uxn_device_h_l249_c7_644d_iffalse,
is_blit_done_MUX_uxn_device_h_l249_c7_644d_return_output);

-- tmp4_MUX_uxn_device_h_l249_c7_644d
tmp4_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l249_c7_644d_cond,
tmp4_MUX_uxn_device_h_l249_c7_644d_iftrue,
tmp4_MUX_uxn_device_h_l249_c7_644d_iffalse,
tmp4_MUX_uxn_device_h_l249_c7_644d_return_output);

-- result_MUX_uxn_device_h_l249_c7_644d
result_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l249_c7_644d_cond,
result_MUX_uxn_device_h_l249_c7_644d_iftrue,
result_MUX_uxn_device_h_l249_c7_644d_iffalse,
result_MUX_uxn_device_h_l249_c7_644d_return_output);

-- y_MUX_uxn_device_h_l249_c7_644d
y_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l249_c7_644d_cond,
y_MUX_uxn_device_h_l249_c7_644d_iftrue,
y_MUX_uxn_device_h_l249_c7_644d_iffalse,
y_MUX_uxn_device_h_l249_c7_644d_return_output);

-- flip_y_MUX_uxn_device_h_l249_c7_644d
flip_y_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l249_c7_644d_cond,
flip_y_MUX_uxn_device_h_l249_c7_644d_iftrue,
flip_y_MUX_uxn_device_h_l249_c7_644d_iffalse,
flip_y_MUX_uxn_device_h_l249_c7_644d_return_output);

-- layer_MUX_uxn_device_h_l249_c7_644d
layer_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l249_c7_644d_cond,
layer_MUX_uxn_device_h_l249_c7_644d_iftrue,
layer_MUX_uxn_device_h_l249_c7_644d_iffalse,
layer_MUX_uxn_device_h_l249_c7_644d_return_output);

-- ram_addr_MUX_uxn_device_h_l249_c7_644d
ram_addr_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l249_c7_644d_cond,
ram_addr_MUX_uxn_device_h_l249_c7_644d_iftrue,
ram_addr_MUX_uxn_device_h_l249_c7_644d_iffalse,
ram_addr_MUX_uxn_device_h_l249_c7_644d_return_output);

-- ctrl_MUX_uxn_device_h_l249_c7_644d
ctrl_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l249_c7_644d_cond,
ctrl_MUX_uxn_device_h_l249_c7_644d_iftrue,
ctrl_MUX_uxn_device_h_l249_c7_644d_iffalse,
ctrl_MUX_uxn_device_h_l249_c7_644d_return_output);

-- auto_length_MUX_uxn_device_h_l249_c7_644d
auto_length_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l249_c7_644d_cond,
auto_length_MUX_uxn_device_h_l249_c7_644d_iftrue,
auto_length_MUX_uxn_device_h_l249_c7_644d_iffalse,
auto_length_MUX_uxn_device_h_l249_c7_644d_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l249_c7_644d
ram_addr_incr_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_cond,
ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iftrue,
ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iffalse,
ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l249_c7_644d
y_sprite_incr_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond,
y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue,
y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse,
y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output);

-- tmp8b_MUX_uxn_device_h_l249_c7_644d
tmp8b_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l249_c7_644d_cond,
tmp8b_MUX_uxn_device_h_l249_c7_644d_iftrue,
tmp8b_MUX_uxn_device_h_l249_c7_644d_iffalse,
tmp8b_MUX_uxn_device_h_l249_c7_644d_return_output);

-- ctrl_mode_MUX_uxn_device_h_l249_c7_644d
ctrl_mode_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l249_c7_644d_cond,
ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iftrue,
ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iffalse,
ctrl_mode_MUX_uxn_device_h_l249_c7_644d_return_output);

-- is_last_blit_MUX_uxn_device_h_l249_c7_644d
is_last_blit_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l249_c7_644d_cond,
is_last_blit_MUX_uxn_device_h_l249_c7_644d_iftrue,
is_last_blit_MUX_uxn_device_h_l249_c7_644d_iffalse,
is_last_blit_MUX_uxn_device_h_l249_c7_644d_return_output);

-- color_MUX_uxn_device_h_l249_c7_644d
color_MUX_uxn_device_h_l249_c7_644d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l249_c7_644d_cond,
color_MUX_uxn_device_h_l249_c7_644d_iftrue,
color_MUX_uxn_device_h_l249_c7_644d_iffalse,
color_MUX_uxn_device_h_l249_c7_644d_return_output);

-- CONST_SR_7_uxn_device_h_l252_c25_b454
CONST_SR_7_uxn_device_h_l252_c25_b454 : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l252_c25_b454_x,
CONST_SR_7_uxn_device_h_l252_c25_b454_return_output);

-- CONST_SR_6_uxn_device_h_l253_c21_a1e2
CONST_SR_6_uxn_device_h_l253_c21_a1e2 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l253_c21_a1e2_x,
CONST_SR_6_uxn_device_h_l253_c21_a1e2_return_output);

-- CONST_SR_5_uxn_device_h_l254_c22_fc05
CONST_SR_5_uxn_device_h_l254_c22_fc05 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l254_c22_fc05_x,
CONST_SR_5_uxn_device_h_l254_c22_fc05_return_output);

-- CONST_SR_4_uxn_device_h_l255_c22_a884
CONST_SR_4_uxn_device_h_l255_c22_a884 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l255_c22_a884_x,
CONST_SR_4_uxn_device_h_l255_c22_a884_return_output);

-- BIN_OP_EQ_uxn_device_h_l258_c11_79e8
BIN_OP_EQ_uxn_device_h_l258_c11_79e8 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l258_c11_79e8_left,
BIN_OP_EQ_uxn_device_h_l258_c11_79e8_right,
BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01
x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond,
x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue,
x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse,
x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- auto_advance_MUX_uxn_device_h_l258_c7_1b01
auto_advance_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l258_c7_1b01_cond,
auto_advance_MUX_uxn_device_h_l258_c7_1b01_iftrue,
auto_advance_MUX_uxn_device_h_l258_c7_1b01_iffalse,
auto_advance_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- screen_blit_result_MUX_uxn_device_h_l258_c7_1b01
screen_blit_result_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_cond,
screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iftrue,
screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iffalse,
screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- tmp8_MUX_uxn_device_h_l258_c7_1b01
tmp8_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l258_c7_1b01_cond,
tmp8_MUX_uxn_device_h_l258_c7_1b01_iftrue,
tmp8_MUX_uxn_device_h_l258_c7_1b01_iffalse,
tmp8_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- tmp12_MUX_uxn_device_h_l258_c7_1b01
tmp12_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l258_c7_1b01_cond,
tmp12_MUX_uxn_device_h_l258_c7_1b01_iftrue,
tmp12_MUX_uxn_device_h_l258_c7_1b01_iffalse,
tmp12_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- x_MUX_uxn_device_h_l258_c7_1b01
x_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l258_c7_1b01_cond,
x_MUX_uxn_device_h_l258_c7_1b01_iftrue,
x_MUX_uxn_device_h_l258_c7_1b01_iffalse,
x_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- is_blit_done_MUX_uxn_device_h_l258_c7_1b01
is_blit_done_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l258_c7_1b01_cond,
is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iftrue,
is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iffalse,
is_blit_done_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- tmp4_MUX_uxn_device_h_l258_c7_1b01
tmp4_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l258_c7_1b01_cond,
tmp4_MUX_uxn_device_h_l258_c7_1b01_iftrue,
tmp4_MUX_uxn_device_h_l258_c7_1b01_iffalse,
tmp4_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- result_MUX_uxn_device_h_l258_c7_1b01
result_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l258_c7_1b01_cond,
result_MUX_uxn_device_h_l258_c7_1b01_iftrue,
result_MUX_uxn_device_h_l258_c7_1b01_iffalse,
result_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- y_MUX_uxn_device_h_l258_c7_1b01
y_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l258_c7_1b01_cond,
y_MUX_uxn_device_h_l258_c7_1b01_iftrue,
y_MUX_uxn_device_h_l258_c7_1b01_iffalse,
y_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- ram_addr_MUX_uxn_device_h_l258_c7_1b01
ram_addr_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l258_c7_1b01_cond,
ram_addr_MUX_uxn_device_h_l258_c7_1b01_iftrue,
ram_addr_MUX_uxn_device_h_l258_c7_1b01_iffalse,
ram_addr_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- auto_length_MUX_uxn_device_h_l258_c7_1b01
auto_length_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l258_c7_1b01_cond,
auto_length_MUX_uxn_device_h_l258_c7_1b01_iftrue,
auto_length_MUX_uxn_device_h_l258_c7_1b01_iffalse,
auto_length_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01
ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_cond,
ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue,
ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse,
ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01
y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond,
y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue,
y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse,
y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- tmp8b_MUX_uxn_device_h_l258_c7_1b01
tmp8b_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l258_c7_1b01_cond,
tmp8b_MUX_uxn_device_h_l258_c7_1b01_iftrue,
tmp8b_MUX_uxn_device_h_l258_c7_1b01_iffalse,
tmp8b_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- is_last_blit_MUX_uxn_device_h_l258_c7_1b01
is_last_blit_MUX_uxn_device_h_l258_c7_1b01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l258_c7_1b01_cond,
is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iftrue,
is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iffalse,
is_last_blit_MUX_uxn_device_h_l258_c7_1b01_return_output);

-- BIN_OP_EQ_uxn_device_h_l263_c11_cb09
BIN_OP_EQ_uxn_device_h_l263_c11_cb09 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l263_c11_cb09_left,
BIN_OP_EQ_uxn_device_h_l263_c11_cb09_right,
BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l263_c7_caca
x_sprite_incr_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond,
x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue,
x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse,
x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output);

-- auto_advance_MUX_uxn_device_h_l263_c7_caca
auto_advance_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l263_c7_caca_cond,
auto_advance_MUX_uxn_device_h_l263_c7_caca_iftrue,
auto_advance_MUX_uxn_device_h_l263_c7_caca_iffalse,
auto_advance_MUX_uxn_device_h_l263_c7_caca_return_output);

-- screen_blit_result_MUX_uxn_device_h_l263_c7_caca
screen_blit_result_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l263_c7_caca_cond,
screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iftrue,
screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iffalse,
screen_blit_result_MUX_uxn_device_h_l263_c7_caca_return_output);

-- tmp8_MUX_uxn_device_h_l263_c7_caca
tmp8_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l263_c7_caca_cond,
tmp8_MUX_uxn_device_h_l263_c7_caca_iftrue,
tmp8_MUX_uxn_device_h_l263_c7_caca_iffalse,
tmp8_MUX_uxn_device_h_l263_c7_caca_return_output);

-- tmp12_MUX_uxn_device_h_l263_c7_caca
tmp12_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l263_c7_caca_cond,
tmp12_MUX_uxn_device_h_l263_c7_caca_iftrue,
tmp12_MUX_uxn_device_h_l263_c7_caca_iffalse,
tmp12_MUX_uxn_device_h_l263_c7_caca_return_output);

-- x_MUX_uxn_device_h_l263_c7_caca
x_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l263_c7_caca_cond,
x_MUX_uxn_device_h_l263_c7_caca_iftrue,
x_MUX_uxn_device_h_l263_c7_caca_iffalse,
x_MUX_uxn_device_h_l263_c7_caca_return_output);

-- is_blit_done_MUX_uxn_device_h_l263_c7_caca
is_blit_done_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l263_c7_caca_cond,
is_blit_done_MUX_uxn_device_h_l263_c7_caca_iftrue,
is_blit_done_MUX_uxn_device_h_l263_c7_caca_iffalse,
is_blit_done_MUX_uxn_device_h_l263_c7_caca_return_output);

-- tmp4_MUX_uxn_device_h_l263_c7_caca
tmp4_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l263_c7_caca_cond,
tmp4_MUX_uxn_device_h_l263_c7_caca_iftrue,
tmp4_MUX_uxn_device_h_l263_c7_caca_iffalse,
tmp4_MUX_uxn_device_h_l263_c7_caca_return_output);

-- result_MUX_uxn_device_h_l263_c7_caca
result_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l263_c7_caca_cond,
result_MUX_uxn_device_h_l263_c7_caca_iftrue,
result_MUX_uxn_device_h_l263_c7_caca_iffalse,
result_MUX_uxn_device_h_l263_c7_caca_return_output);

-- y_MUX_uxn_device_h_l263_c7_caca
y_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l263_c7_caca_cond,
y_MUX_uxn_device_h_l263_c7_caca_iftrue,
y_MUX_uxn_device_h_l263_c7_caca_iffalse,
y_MUX_uxn_device_h_l263_c7_caca_return_output);

-- ram_addr_MUX_uxn_device_h_l263_c7_caca
ram_addr_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l263_c7_caca_cond,
ram_addr_MUX_uxn_device_h_l263_c7_caca_iftrue,
ram_addr_MUX_uxn_device_h_l263_c7_caca_iffalse,
ram_addr_MUX_uxn_device_h_l263_c7_caca_return_output);

-- auto_length_MUX_uxn_device_h_l263_c7_caca
auto_length_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l263_c7_caca_cond,
auto_length_MUX_uxn_device_h_l263_c7_caca_iftrue,
auto_length_MUX_uxn_device_h_l263_c7_caca_iffalse,
auto_length_MUX_uxn_device_h_l263_c7_caca_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l263_c7_caca
ram_addr_incr_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_cond,
ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iftrue,
ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iffalse,
ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l263_c7_caca
y_sprite_incr_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond,
y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue,
y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse,
y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output);

-- tmp8b_MUX_uxn_device_h_l263_c7_caca
tmp8b_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l263_c7_caca_cond,
tmp8b_MUX_uxn_device_h_l263_c7_caca_iftrue,
tmp8b_MUX_uxn_device_h_l263_c7_caca_iffalse,
tmp8b_MUX_uxn_device_h_l263_c7_caca_return_output);

-- is_last_blit_MUX_uxn_device_h_l263_c7_caca
is_last_blit_MUX_uxn_device_h_l263_c7_caca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l263_c7_caca_cond,
is_last_blit_MUX_uxn_device_h_l263_c7_caca_iftrue,
is_last_blit_MUX_uxn_device_h_l263_c7_caca_iffalse,
is_last_blit_MUX_uxn_device_h_l263_c7_caca_return_output);

-- BIN_OP_EQ_uxn_device_h_l273_c18_d5e5
BIN_OP_EQ_uxn_device_h_l273_c18_d5e5 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_left,
BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_right,
BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_return_output);

-- MUX_uxn_device_h_l273_c18_d37f
MUX_uxn_device_h_l273_c18_d37f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l273_c18_d37f_cond,
MUX_uxn_device_h_l273_c18_d37f_iftrue,
MUX_uxn_device_h_l273_c18_d37f_iffalse,
MUX_uxn_device_h_l273_c18_d37f_return_output);

-- MUX_uxn_device_h_l275_c19_6ae9
MUX_uxn_device_h_l275_c19_6ae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l275_c19_6ae9_cond,
MUX_uxn_device_h_l275_c19_6ae9_iftrue,
MUX_uxn_device_h_l275_c19_6ae9_iffalse,
MUX_uxn_device_h_l275_c19_6ae9_return_output);

-- MUX_uxn_device_h_l276_c19_c30f
MUX_uxn_device_h_l276_c19_c30f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l276_c19_c30f_cond,
MUX_uxn_device_h_l276_c19_c30f_iftrue,
MUX_uxn_device_h_l276_c19_c30f_iffalse,
MUX_uxn_device_h_l276_c19_c30f_return_output);

-- MUX_uxn_device_h_l277_c39_72f3
MUX_uxn_device_h_l277_c39_72f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l277_c39_72f3_cond,
MUX_uxn_device_h_l277_c39_72f3_iftrue,
MUX_uxn_device_h_l277_c39_72f3_iffalse,
MUX_uxn_device_h_l277_c39_72f3_return_output);

-- MUX_uxn_device_h_l277_c20_66c1
MUX_uxn_device_h_l277_c20_66c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l277_c20_66c1_cond,
MUX_uxn_device_h_l277_c20_66c1_iftrue,
MUX_uxn_device_h_l277_c20_66c1_iffalse,
MUX_uxn_device_h_l277_c20_66c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output);

-- screen_blit_result_MUX_uxn_device_h_l278_c3_34c4
screen_blit_result_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_cond,
screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iftrue,
screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iffalse,
screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- tmp8_MUX_uxn_device_h_l278_c3_34c4
tmp8_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l278_c3_34c4_cond,
tmp8_MUX_uxn_device_h_l278_c3_34c4_iftrue,
tmp8_MUX_uxn_device_h_l278_c3_34c4_iffalse,
tmp8_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- x_MUX_uxn_device_h_l278_c3_34c4
x_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l278_c3_34c4_cond,
x_MUX_uxn_device_h_l278_c3_34c4_iftrue,
x_MUX_uxn_device_h_l278_c3_34c4_iffalse,
x_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- tmp4_MUX_uxn_device_h_l278_c3_34c4
tmp4_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l278_c3_34c4_cond,
tmp4_MUX_uxn_device_h_l278_c3_34c4_iftrue,
tmp4_MUX_uxn_device_h_l278_c3_34c4_iffalse,
tmp4_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- result_MUX_uxn_device_h_l278_c3_34c4
result_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l278_c3_34c4_cond,
result_MUX_uxn_device_h_l278_c3_34c4_iftrue,
result_MUX_uxn_device_h_l278_c3_34c4_iffalse,
result_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- y_MUX_uxn_device_h_l278_c3_34c4
y_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l278_c3_34c4_cond,
y_MUX_uxn_device_h_l278_c3_34c4_iftrue,
y_MUX_uxn_device_h_l278_c3_34c4_iffalse,
y_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- ram_addr_MUX_uxn_device_h_l278_c3_34c4
ram_addr_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l278_c3_34c4_cond,
ram_addr_MUX_uxn_device_h_l278_c3_34c4_iftrue,
ram_addr_MUX_uxn_device_h_l278_c3_34c4_iffalse,
ram_addr_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- tmp8b_MUX_uxn_device_h_l278_c3_34c4
tmp8b_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l278_c3_34c4_cond,
tmp8b_MUX_uxn_device_h_l278_c3_34c4_iftrue,
tmp8b_MUX_uxn_device_h_l278_c3_34c4_iffalse,
tmp8b_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- is_last_blit_MUX_uxn_device_h_l278_c3_34c4
is_last_blit_MUX_uxn_device_h_l278_c3_34c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l278_c3_34c4_cond,
is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iftrue,
is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iffalse,
is_last_blit_MUX_uxn_device_h_l278_c3_34c4_return_output);

-- BIN_OP_EQ_uxn_device_h_l279_c8_c59d
BIN_OP_EQ_uxn_device_h_l279_c8_c59d : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l279_c8_c59d_left,
BIN_OP_EQ_uxn_device_h_l279_c8_c59d_right,
BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_return_output);

-- tmp8_MUX_uxn_device_h_l279_c4_d221
tmp8_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l279_c4_d221_cond,
tmp8_MUX_uxn_device_h_l279_c4_d221_iftrue,
tmp8_MUX_uxn_device_h_l279_c4_d221_iffalse,
tmp8_MUX_uxn_device_h_l279_c4_d221_return_output);

-- x_MUX_uxn_device_h_l279_c4_d221
x_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l279_c4_d221_cond,
x_MUX_uxn_device_h_l279_c4_d221_iftrue,
x_MUX_uxn_device_h_l279_c4_d221_iffalse,
x_MUX_uxn_device_h_l279_c4_d221_return_output);

-- tmp4_MUX_uxn_device_h_l279_c4_d221
tmp4_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l279_c4_d221_cond,
tmp4_MUX_uxn_device_h_l279_c4_d221_iftrue,
tmp4_MUX_uxn_device_h_l279_c4_d221_iffalse,
tmp4_MUX_uxn_device_h_l279_c4_d221_return_output);

-- result_u8_value_MUX_uxn_device_h_l279_c4_d221
result_u8_value_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l279_c4_d221_cond,
result_u8_value_MUX_uxn_device_h_l279_c4_d221_iftrue,
result_u8_value_MUX_uxn_device_h_l279_c4_d221_iffalse,
result_u8_value_MUX_uxn_device_h_l279_c4_d221_return_output);

-- result_u16_addr_MUX_uxn_device_h_l279_c4_d221
result_u16_addr_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l279_c4_d221_cond,
result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iftrue,
result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iffalse,
result_u16_addr_MUX_uxn_device_h_l279_c4_d221_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l279_c4_d221
result_is_deo_done_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_cond,
result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iftrue,
result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iffalse,
result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l279_c4_d221
result_is_vram_write_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_cond,
result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iftrue,
result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iffalse,
result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l279_c4_d221
result_device_ram_address_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_cond,
result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iftrue,
result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iffalse,
result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_cond,
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_return_output);

-- y_MUX_uxn_device_h_l279_c4_d221
y_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l279_c4_d221_cond,
y_MUX_uxn_device_h_l279_c4_d221_iftrue,
y_MUX_uxn_device_h_l279_c4_d221_iffalse,
y_MUX_uxn_device_h_l279_c4_d221_return_output);

-- ram_addr_MUX_uxn_device_h_l279_c4_d221
ram_addr_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l279_c4_d221_cond,
ram_addr_MUX_uxn_device_h_l279_c4_d221_iftrue,
ram_addr_MUX_uxn_device_h_l279_c4_d221_iffalse,
ram_addr_MUX_uxn_device_h_l279_c4_d221_return_output);

-- tmp8b_MUX_uxn_device_h_l279_c4_d221
tmp8b_MUX_uxn_device_h_l279_c4_d221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l279_c4_d221_cond,
tmp8b_MUX_uxn_device_h_l279_c4_d221_iftrue,
tmp8b_MUX_uxn_device_h_l279_c4_d221_iffalse,
tmp8b_MUX_uxn_device_h_l279_c4_d221_return_output);

-- BIN_OP_MINUS_uxn_device_h_l280_c22_457f
BIN_OP_MINUS_uxn_device_h_l280_c22_457f : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l280_c22_457f_left,
BIN_OP_MINUS_uxn_device_h_l280_c22_457f_right,
BIN_OP_MINUS_uxn_device_h_l280_c22_457f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l280_c47_9736
BIN_OP_PLUS_uxn_device_h_l280_c47_9736 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l280_c47_9736_left,
BIN_OP_PLUS_uxn_device_h_l280_c47_9736_right,
BIN_OP_PLUS_uxn_device_h_l280_c47_9736_return_output);

-- MUX_uxn_device_h_l280_c12_8e0f
MUX_uxn_device_h_l280_c12_8e0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l280_c12_8e0f_cond,
MUX_uxn_device_h_l280_c12_8e0f_iftrue,
MUX_uxn_device_h_l280_c12_8e0f_iffalse,
MUX_uxn_device_h_l280_c12_8e0f_return_output);

-- BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6
BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_left,
BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_right,
BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l281_c49_47f6
BIN_OP_PLUS_uxn_device_h_l281_c49_47f6 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_left,
BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_right,
BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_return_output);

-- MUX_uxn_device_h_l281_c13_6ce2
MUX_uxn_device_h_l281_c13_6ce2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l281_c13_6ce2_cond,
MUX_uxn_device_h_l281_c13_6ce2_iftrue,
MUX_uxn_device_h_l281_c13_6ce2_iffalse,
MUX_uxn_device_h_l281_c13_6ce2_return_output);

-- BIN_OP_MINUS_uxn_device_h_l282_c36_4b97
BIN_OP_MINUS_uxn_device_h_l282_c36_4b97 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_left,
BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_right,
BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_return_output);

-- BIN_OP_PLUS_uxn_device_h_l282_c58_8722
BIN_OP_PLUS_uxn_device_h_l282_c58_8722 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l282_c58_8722_left,
BIN_OP_PLUS_uxn_device_h_l282_c58_8722_right,
BIN_OP_PLUS_uxn_device_h_l282_c58_8722_return_output);

-- MUX_uxn_device_h_l282_c26_3238
MUX_uxn_device_h_l282_c26_3238 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l282_c26_3238_cond,
MUX_uxn_device_h_l282_c26_3238_iftrue,
MUX_uxn_device_h_l282_c26_3238_iffalse,
MUX_uxn_device_h_l282_c26_3238_return_output);

-- MUX_uxn_device_h_l282_c10_2c1a
MUX_uxn_device_h_l282_c10_2c1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l282_c10_2c1a_cond,
MUX_uxn_device_h_l282_c10_2c1a_iftrue,
MUX_uxn_device_h_l282_c10_2c1a_iffalse,
MUX_uxn_device_h_l282_c10_2c1a_return_output);

-- BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a
BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_left,
BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_right,
BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l283_c58_ddba
BIN_OP_PLUS_uxn_device_h_l283_c58_ddba : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_left,
BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_right,
BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_return_output);

-- MUX_uxn_device_h_l283_c26_dad8
MUX_uxn_device_h_l283_c26_dad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l283_c26_dad8_cond,
MUX_uxn_device_h_l283_c26_dad8_iftrue,
MUX_uxn_device_h_l283_c26_dad8_iffalse,
MUX_uxn_device_h_l283_c26_dad8_return_output);

-- MUX_uxn_device_h_l283_c10_aa5b
MUX_uxn_device_h_l283_c10_aa5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l283_c10_aa5b_cond,
MUX_uxn_device_h_l283_c10_aa5b_iftrue,
MUX_uxn_device_h_l283_c10_aa5b_iffalse,
MUX_uxn_device_h_l283_c10_aa5b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l290_c22_6743
BIN_OP_PLUS_uxn_device_h_l290_c22_6743 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l290_c22_6743_left,
BIN_OP_PLUS_uxn_device_h_l290_c22_6743_right,
BIN_OP_PLUS_uxn_device_h_l290_c22_6743_return_output);

-- BIN_OP_EQ_uxn_device_h_l290_c13_a4c2
BIN_OP_EQ_uxn_device_h_l290_c13_a4c2 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_left,
BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_right,
BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_return_output);

-- tmp4_MUX_uxn_device_h_l290_c9_8fec
tmp4_MUX_uxn_device_h_l290_c9_8fec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l290_c9_8fec_cond,
tmp4_MUX_uxn_device_h_l290_c9_8fec_iftrue,
tmp4_MUX_uxn_device_h_l290_c9_8fec_iffalse,
tmp4_MUX_uxn_device_h_l290_c9_8fec_return_output);

-- result_u8_value_MUX_uxn_device_h_l290_c9_8fec
result_u8_value_MUX_uxn_device_h_l290_c9_8fec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l290_c9_8fec_cond,
result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iftrue,
result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iffalse,
result_u8_value_MUX_uxn_device_h_l290_c9_8fec_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec
result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_cond,
result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iftrue,
result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iffalse,
result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_cond,
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec
result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_cond,
result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iftrue,
result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iffalse,
result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_return_output);

-- ram_addr_MUX_uxn_device_h_l290_c9_8fec
ram_addr_MUX_uxn_device_h_l290_c9_8fec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l290_c9_8fec_cond,
ram_addr_MUX_uxn_device_h_l290_c9_8fec_iftrue,
ram_addr_MUX_uxn_device_h_l290_c9_8fec_iffalse,
ram_addr_MUX_uxn_device_h_l290_c9_8fec_return_output);

-- BIN_OP_PLUS_uxn_device_h_l295_c22_4113
BIN_OP_PLUS_uxn_device_h_l295_c22_4113 : entity work.BIN_OP_PLUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l295_c22_4113_left,
BIN_OP_PLUS_uxn_device_h_l295_c22_4113_right,
BIN_OP_PLUS_uxn_device_h_l295_c22_4113_return_output);

-- BIN_OP_EQ_uxn_device_h_l295_c13_08d1
BIN_OP_EQ_uxn_device_h_l295_c13_08d1 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l295_c13_08d1_left,
BIN_OP_EQ_uxn_device_h_l295_c13_08d1_right,
BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_return_output);

-- tmp4_MUX_uxn_device_h_l295_c9_9323
tmp4_MUX_uxn_device_h_l295_c9_9323 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l295_c9_9323_cond,
tmp4_MUX_uxn_device_h_l295_c9_9323_iftrue,
tmp4_MUX_uxn_device_h_l295_c9_9323_iffalse,
tmp4_MUX_uxn_device_h_l295_c9_9323_return_output);

-- result_u8_value_MUX_uxn_device_h_l295_c9_9323
result_u8_value_MUX_uxn_device_h_l295_c9_9323 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l295_c9_9323_cond,
result_u8_value_MUX_uxn_device_h_l295_c9_9323_iftrue,
result_u8_value_MUX_uxn_device_h_l295_c9_9323_iffalse,
result_u8_value_MUX_uxn_device_h_l295_c9_9323_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l295_c9_9323
result_device_ram_address_MUX_uxn_device_h_l295_c9_9323 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_cond,
result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iftrue,
result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iffalse,
result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_cond,
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l295_c9_9323
result_is_deo_done_MUX_uxn_device_h_l295_c9_9323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_cond,
result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iftrue,
result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iffalse,
result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_return_output);

-- ram_addr_MUX_uxn_device_h_l295_c9_9323
ram_addr_MUX_uxn_device_h_l295_c9_9323 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l295_c9_9323_cond,
ram_addr_MUX_uxn_device_h_l295_c9_9323_iftrue,
ram_addr_MUX_uxn_device_h_l295_c9_9323_iffalse,
ram_addr_MUX_uxn_device_h_l295_c9_9323_return_output);

-- BIN_OP_PLUS_uxn_device_h_l299_c22_791a
BIN_OP_PLUS_uxn_device_h_l299_c22_791a : entity work.BIN_OP_PLUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l299_c22_791a_left,
BIN_OP_PLUS_uxn_device_h_l299_c22_791a_right,
BIN_OP_PLUS_uxn_device_h_l299_c22_791a_return_output);

-- BIN_OP_EQ_uxn_device_h_l299_c13_aab8
BIN_OP_EQ_uxn_device_h_l299_c13_aab8 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l299_c13_aab8_left,
BIN_OP_EQ_uxn_device_h_l299_c13_aab8_right,
BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_return_output);

-- tmp4_MUX_uxn_device_h_l299_c9_174d
tmp4_MUX_uxn_device_h_l299_c9_174d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l299_c9_174d_cond,
tmp4_MUX_uxn_device_h_l299_c9_174d_iftrue,
tmp4_MUX_uxn_device_h_l299_c9_174d_iffalse,
tmp4_MUX_uxn_device_h_l299_c9_174d_return_output);

-- result_u8_value_MUX_uxn_device_h_l299_c9_174d
result_u8_value_MUX_uxn_device_h_l299_c9_174d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l299_c9_174d_cond,
result_u8_value_MUX_uxn_device_h_l299_c9_174d_iftrue,
result_u8_value_MUX_uxn_device_h_l299_c9_174d_iffalse,
result_u8_value_MUX_uxn_device_h_l299_c9_174d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l299_c9_174d
result_device_ram_address_MUX_uxn_device_h_l299_c9_174d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_cond,
result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l299_c9_174d
result_is_deo_done_MUX_uxn_device_h_l299_c9_174d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_cond,
result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_return_output);

-- ram_addr_MUX_uxn_device_h_l299_c9_174d
ram_addr_MUX_uxn_device_h_l299_c9_174d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l299_c9_174d_cond,
ram_addr_MUX_uxn_device_h_l299_c9_174d_iftrue,
ram_addr_MUX_uxn_device_h_l299_c9_174d_iffalse,
ram_addr_MUX_uxn_device_h_l299_c9_174d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l303_c22_ff80
BIN_OP_PLUS_uxn_device_h_l303_c22_ff80 : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_left,
BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_right,
BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_return_output);

-- BIN_OP_EQ_uxn_device_h_l303_c13_8b54
BIN_OP_EQ_uxn_device_h_l303_c13_8b54 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l303_c13_8b54_left,
BIN_OP_EQ_uxn_device_h_l303_c13_8b54_right,
BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_return_output);

-- tmp4_MUX_uxn_device_h_l303_c9_33f1
tmp4_MUX_uxn_device_h_l303_c9_33f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l303_c9_33f1_cond,
tmp4_MUX_uxn_device_h_l303_c9_33f1_iftrue,
tmp4_MUX_uxn_device_h_l303_c9_33f1_iffalse,
tmp4_MUX_uxn_device_h_l303_c9_33f1_return_output);

-- result_u8_value_MUX_uxn_device_h_l303_c9_33f1
result_u8_value_MUX_uxn_device_h_l303_c9_33f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l303_c9_33f1_cond,
result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iftrue,
result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iffalse,
result_u8_value_MUX_uxn_device_h_l303_c9_33f1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1
result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_cond,
result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_cond,
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1
result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_cond,
result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_return_output);

-- ram_addr_MUX_uxn_device_h_l303_c9_33f1
ram_addr_MUX_uxn_device_h_l303_c9_33f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l303_c9_33f1_cond,
ram_addr_MUX_uxn_device_h_l303_c9_33f1_iftrue,
ram_addr_MUX_uxn_device_h_l303_c9_33f1_iffalse,
ram_addr_MUX_uxn_device_h_l303_c9_33f1_return_output);

-- BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a
BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_left,
BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_right,
BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c13_2400
BIN_OP_EQ_uxn_device_h_l307_c13_2400 : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c13_2400_left,
BIN_OP_EQ_uxn_device_h_l307_c13_2400_right,
BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_return_output);

-- tmp4_MUX_uxn_device_h_l307_c9_0b84
tmp4_MUX_uxn_device_h_l307_c9_0b84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l307_c9_0b84_cond,
tmp4_MUX_uxn_device_h_l307_c9_0b84_iftrue,
tmp4_MUX_uxn_device_h_l307_c9_0b84_iffalse,
tmp4_MUX_uxn_device_h_l307_c9_0b84_return_output);

-- result_u8_value_MUX_uxn_device_h_l307_c9_0b84
result_u8_value_MUX_uxn_device_h_l307_c9_0b84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l307_c9_0b84_cond,
result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iftrue,
result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iffalse,
result_u8_value_MUX_uxn_device_h_l307_c9_0b84_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84
result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_cond,
result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iftrue,
result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iffalse,
result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_cond,
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84
result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_cond,
result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iftrue,
result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iffalse,
result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_return_output);

-- ram_addr_MUX_uxn_device_h_l307_c9_0b84
ram_addr_MUX_uxn_device_h_l307_c9_0b84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l307_c9_0b84_cond,
ram_addr_MUX_uxn_device_h_l307_c9_0b84_iftrue,
ram_addr_MUX_uxn_device_h_l307_c9_0b84_iffalse,
ram_addr_MUX_uxn_device_h_l307_c9_0b84_return_output);

-- BIN_OP_PLUS_uxn_device_h_l309_c5_0d57
BIN_OP_PLUS_uxn_device_h_l309_c5_0d57 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_left,
BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_right,
BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_return_output);

-- CONST_SR_8_uxn_device_h_l312_c33_41c7
CONST_SR_8_uxn_device_h_l312_c33_41c7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l312_c33_41c7_x,
CONST_SR_8_uxn_device_h_l312_c33_41c7_return_output);

-- BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4
BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4 : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_left,
BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_right,
BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_return_output);

-- BIN_OP_EQ_uxn_device_h_l314_c13_599a
BIN_OP_EQ_uxn_device_h_l314_c13_599a : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l314_c13_599a_left,
BIN_OP_EQ_uxn_device_h_l314_c13_599a_right,
BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_return_output);

-- tmp4_MUX_uxn_device_h_l314_c9_d2c5
tmp4_MUX_uxn_device_h_l314_c9_d2c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l314_c9_d2c5_cond,
tmp4_MUX_uxn_device_h_l314_c9_d2c5_iftrue,
tmp4_MUX_uxn_device_h_l314_c9_d2c5_iffalse,
tmp4_MUX_uxn_device_h_l314_c9_d2c5_return_output);

-- result_u8_value_MUX_uxn_device_h_l314_c9_d2c5
result_u8_value_MUX_uxn_device_h_l314_c9_d2c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_cond,
result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iftrue,
result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iffalse,
result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5
result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_cond,
result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_cond,
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5
result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_cond,
result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7
BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7 : entity work.BIN_OP_PLUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_left,
BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_right,
BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_return_output);

-- BIN_OP_EQ_uxn_device_h_l319_c13_4c4d
BIN_OP_EQ_uxn_device_h_l319_c13_4c4d : entity work.BIN_OP_EQ_uint12_t_uint13_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_left,
BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_right,
BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_return_output);

-- tmp4_MUX_uxn_device_h_l319_c9_7c66
tmp4_MUX_uxn_device_h_l319_c9_7c66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l319_c9_7c66_cond,
tmp4_MUX_uxn_device_h_l319_c9_7c66_iftrue,
tmp4_MUX_uxn_device_h_l319_c9_7c66_iffalse,
tmp4_MUX_uxn_device_h_l319_c9_7c66_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66
result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_cond,
result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iftrue,
result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iffalse,
result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_cond,
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66
result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_cond,
result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iftrue,
result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iffalse,
result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_return_output);

-- BIN_OP_PLUS_uxn_device_h_l320_c5_95fd
BIN_OP_PLUS_uxn_device_h_l320_c5_95fd : entity work.BIN_OP_PLUS_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_left,
BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_right,
BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_return_output);

-- screen_blit_result_MUX_uxn_device_h_l327_c4_deb8
screen_blit_result_MUX_uxn_device_h_l327_c4_deb8 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_cond,
screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iftrue,
screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iffalse,
screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output);

-- screen_2bpp_uxn_device_h_l328_c26_9600
screen_2bpp_uxn_device_h_l328_c26_9600 : entity work.screen_2bpp_0CLK_29be10e5 port map (
clk,
screen_2bpp_uxn_device_h_l328_c26_9600_CLOCK_ENABLE,
screen_2bpp_uxn_device_h_l328_c26_9600_phase,
screen_2bpp_uxn_device_h_l328_c26_9600_x1,
screen_2bpp_uxn_device_h_l328_c26_9600_y1,
screen_2bpp_uxn_device_h_l328_c26_9600_color,
screen_2bpp_uxn_device_h_l328_c26_9600_fx,
screen_2bpp_uxn_device_h_l328_c26_9600_fy,
screen_2bpp_uxn_device_h_l328_c26_9600_ram_addr,
screen_2bpp_uxn_device_h_l328_c26_9600_previous_ram_read,
screen_2bpp_uxn_device_h_l328_c26_9600_return_output);

-- screen_1bpp_uxn_device_h_l330_c26_cfa4
screen_1bpp_uxn_device_h_l330_c26_cfa4 : entity work.screen_1bpp_0CLK_f5a95d24 port map (
clk,
screen_1bpp_uxn_device_h_l330_c26_cfa4_CLOCK_ENABLE,
screen_1bpp_uxn_device_h_l330_c26_cfa4_phase,
screen_1bpp_uxn_device_h_l330_c26_cfa4_x1,
screen_1bpp_uxn_device_h_l330_c26_cfa4_y1,
screen_1bpp_uxn_device_h_l330_c26_cfa4_color,
screen_1bpp_uxn_device_h_l330_c26_cfa4_fx,
screen_1bpp_uxn_device_h_l330_c26_cfa4_fy,
screen_1bpp_uxn_device_h_l330_c26_cfa4_ram_addr,
screen_1bpp_uxn_device_h_l330_c26_cfa4_previous_ram_read,
screen_1bpp_uxn_device_h_l330_c26_cfa4_return_output);

-- BIN_OP_EQ_uxn_device_h_l339_c19_e8fd
BIN_OP_EQ_uxn_device_h_l339_c19_e8fd : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_left,
BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_right,
BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_return_output);

-- MUX_uxn_device_h_l339_c19_4202
MUX_uxn_device_h_l339_c19_4202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l339_c19_4202_cond,
MUX_uxn_device_h_l339_c19_4202_iftrue,
MUX_uxn_device_h_l339_c19_4202_iffalse,
MUX_uxn_device_h_l339_c19_4202_return_output);

-- BIN_OP_XOR_uxn_device_h_l342_c11_a928
BIN_OP_XOR_uxn_device_h_l342_c11_a928 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_device_h_l342_c11_a928_left,
BIN_OP_XOR_uxn_device_h_l342_c11_a928_right,
BIN_OP_XOR_uxn_device_h_l342_c11_a928_return_output);

-- BIN_OP_PLUS_uxn_device_h_l342_c60_2fab
BIN_OP_PLUS_uxn_device_h_l342_c60_2fab : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_left,
BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_right,
BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_return_output);

-- MUX_uxn_device_h_l342_c11_96c2
MUX_uxn_device_h_l342_c11_96c2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l342_c11_96c2_cond,
MUX_uxn_device_h_l342_c11_96c2_iftrue,
MUX_uxn_device_h_l342_c11_96c2_iffalse,
MUX_uxn_device_h_l342_c11_96c2_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb
CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_x,
CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_left,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_right,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_left,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_right,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output);



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
 BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_return_output,
 x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output,
 auto_advance_MUX_uxn_device_h_l231_c2_e548_return_output,
 screen_blit_result_MUX_uxn_device_h_l231_c2_e548_return_output,
 tmp8_MUX_uxn_device_h_l231_c2_e548_return_output,
 tmp12_MUX_uxn_device_h_l231_c2_e548_return_output,
 flip_x_MUX_uxn_device_h_l231_c2_e548_return_output,
 x_MUX_uxn_device_h_l231_c2_e548_return_output,
 is_blit_done_MUX_uxn_device_h_l231_c2_e548_return_output,
 tmp4_MUX_uxn_device_h_l231_c2_e548_return_output,
 result_MUX_uxn_device_h_l231_c2_e548_return_output,
 y_MUX_uxn_device_h_l231_c2_e548_return_output,
 flip_y_MUX_uxn_device_h_l231_c2_e548_return_output,
 layer_MUX_uxn_device_h_l231_c2_e548_return_output,
 ram_addr_MUX_uxn_device_h_l231_c2_e548_return_output,
 ctrl_MUX_uxn_device_h_l231_c2_e548_return_output,
 auto_length_MUX_uxn_device_h_l231_c2_e548_return_output,
 ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_return_output,
 y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output,
 tmp8b_MUX_uxn_device_h_l231_c2_e548_return_output,
 ctrl_mode_MUX_uxn_device_h_l231_c2_e548_return_output,
 is_last_blit_MUX_uxn_device_h_l231_c2_e548_return_output,
 color_MUX_uxn_device_h_l231_c2_e548_return_output,
 BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_return_output,
 x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output,
 auto_advance_MUX_uxn_device_h_l238_c7_5455_return_output,
 screen_blit_result_MUX_uxn_device_h_l238_c7_5455_return_output,
 tmp8_MUX_uxn_device_h_l238_c7_5455_return_output,
 tmp12_MUX_uxn_device_h_l238_c7_5455_return_output,
 flip_x_MUX_uxn_device_h_l238_c7_5455_return_output,
 x_MUX_uxn_device_h_l238_c7_5455_return_output,
 is_blit_done_MUX_uxn_device_h_l238_c7_5455_return_output,
 tmp4_MUX_uxn_device_h_l238_c7_5455_return_output,
 result_MUX_uxn_device_h_l238_c7_5455_return_output,
 y_MUX_uxn_device_h_l238_c7_5455_return_output,
 flip_y_MUX_uxn_device_h_l238_c7_5455_return_output,
 layer_MUX_uxn_device_h_l238_c7_5455_return_output,
 ram_addr_MUX_uxn_device_h_l238_c7_5455_return_output,
 ctrl_MUX_uxn_device_h_l238_c7_5455_return_output,
 auto_length_MUX_uxn_device_h_l238_c7_5455_return_output,
 ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_return_output,
 y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output,
 tmp8b_MUX_uxn_device_h_l238_c7_5455_return_output,
 ctrl_mode_MUX_uxn_device_h_l238_c7_5455_return_output,
 is_last_blit_MUX_uxn_device_h_l238_c7_5455_return_output,
 color_MUX_uxn_device_h_l238_c7_5455_return_output,
 BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_return_output,
 x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output,
 auto_advance_MUX_uxn_device_h_l241_c7_5b88_return_output,
 screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_return_output,
 tmp8_MUX_uxn_device_h_l241_c7_5b88_return_output,
 tmp12_MUX_uxn_device_h_l241_c7_5b88_return_output,
 flip_x_MUX_uxn_device_h_l241_c7_5b88_return_output,
 x_MUX_uxn_device_h_l241_c7_5b88_return_output,
 is_blit_done_MUX_uxn_device_h_l241_c7_5b88_return_output,
 tmp4_MUX_uxn_device_h_l241_c7_5b88_return_output,
 result_MUX_uxn_device_h_l241_c7_5b88_return_output,
 y_MUX_uxn_device_h_l241_c7_5b88_return_output,
 flip_y_MUX_uxn_device_h_l241_c7_5b88_return_output,
 layer_MUX_uxn_device_h_l241_c7_5b88_return_output,
 ram_addr_MUX_uxn_device_h_l241_c7_5b88_return_output,
 ctrl_MUX_uxn_device_h_l241_c7_5b88_return_output,
 auto_length_MUX_uxn_device_h_l241_c7_5b88_return_output,
 ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_return_output,
 y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output,
 tmp8b_MUX_uxn_device_h_l241_c7_5b88_return_output,
 ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_return_output,
 is_last_blit_MUX_uxn_device_h_l241_c7_5b88_return_output,
 color_MUX_uxn_device_h_l241_c7_5b88_return_output,
 BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_return_output,
 x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output,
 auto_advance_MUX_uxn_device_h_l245_c7_e465_return_output,
 screen_blit_result_MUX_uxn_device_h_l245_c7_e465_return_output,
 tmp8_MUX_uxn_device_h_l245_c7_e465_return_output,
 tmp12_MUX_uxn_device_h_l245_c7_e465_return_output,
 flip_x_MUX_uxn_device_h_l245_c7_e465_return_output,
 x_MUX_uxn_device_h_l245_c7_e465_return_output,
 is_blit_done_MUX_uxn_device_h_l245_c7_e465_return_output,
 tmp4_MUX_uxn_device_h_l245_c7_e465_return_output,
 result_MUX_uxn_device_h_l245_c7_e465_return_output,
 y_MUX_uxn_device_h_l245_c7_e465_return_output,
 flip_y_MUX_uxn_device_h_l245_c7_e465_return_output,
 layer_MUX_uxn_device_h_l245_c7_e465_return_output,
 ram_addr_MUX_uxn_device_h_l245_c7_e465_return_output,
 ctrl_MUX_uxn_device_h_l245_c7_e465_return_output,
 auto_length_MUX_uxn_device_h_l245_c7_e465_return_output,
 ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_return_output,
 y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output,
 tmp8b_MUX_uxn_device_h_l245_c7_e465_return_output,
 ctrl_mode_MUX_uxn_device_h_l245_c7_e465_return_output,
 is_last_blit_MUX_uxn_device_h_l245_c7_e465_return_output,
 color_MUX_uxn_device_h_l245_c7_e465_return_output,
 BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_return_output,
 x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output,
 auto_advance_MUX_uxn_device_h_l249_c7_644d_return_output,
 screen_blit_result_MUX_uxn_device_h_l249_c7_644d_return_output,
 tmp8_MUX_uxn_device_h_l249_c7_644d_return_output,
 tmp12_MUX_uxn_device_h_l249_c7_644d_return_output,
 flip_x_MUX_uxn_device_h_l249_c7_644d_return_output,
 x_MUX_uxn_device_h_l249_c7_644d_return_output,
 is_blit_done_MUX_uxn_device_h_l249_c7_644d_return_output,
 tmp4_MUX_uxn_device_h_l249_c7_644d_return_output,
 result_MUX_uxn_device_h_l249_c7_644d_return_output,
 y_MUX_uxn_device_h_l249_c7_644d_return_output,
 flip_y_MUX_uxn_device_h_l249_c7_644d_return_output,
 layer_MUX_uxn_device_h_l249_c7_644d_return_output,
 ram_addr_MUX_uxn_device_h_l249_c7_644d_return_output,
 ctrl_MUX_uxn_device_h_l249_c7_644d_return_output,
 auto_length_MUX_uxn_device_h_l249_c7_644d_return_output,
 ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_return_output,
 y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output,
 tmp8b_MUX_uxn_device_h_l249_c7_644d_return_output,
 ctrl_mode_MUX_uxn_device_h_l249_c7_644d_return_output,
 is_last_blit_MUX_uxn_device_h_l249_c7_644d_return_output,
 color_MUX_uxn_device_h_l249_c7_644d_return_output,
 CONST_SR_7_uxn_device_h_l252_c25_b454_return_output,
 CONST_SR_6_uxn_device_h_l253_c21_a1e2_return_output,
 CONST_SR_5_uxn_device_h_l254_c22_fc05_return_output,
 CONST_SR_4_uxn_device_h_l255_c22_a884_return_output,
 BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_return_output,
 x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output,
 auto_advance_MUX_uxn_device_h_l258_c7_1b01_return_output,
 screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_return_output,
 tmp8_MUX_uxn_device_h_l258_c7_1b01_return_output,
 tmp12_MUX_uxn_device_h_l258_c7_1b01_return_output,
 x_MUX_uxn_device_h_l258_c7_1b01_return_output,
 is_blit_done_MUX_uxn_device_h_l258_c7_1b01_return_output,
 tmp4_MUX_uxn_device_h_l258_c7_1b01_return_output,
 result_MUX_uxn_device_h_l258_c7_1b01_return_output,
 y_MUX_uxn_device_h_l258_c7_1b01_return_output,
 ram_addr_MUX_uxn_device_h_l258_c7_1b01_return_output,
 auto_length_MUX_uxn_device_h_l258_c7_1b01_return_output,
 ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_return_output,
 y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output,
 tmp8b_MUX_uxn_device_h_l258_c7_1b01_return_output,
 is_last_blit_MUX_uxn_device_h_l258_c7_1b01_return_output,
 BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_return_output,
 x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output,
 auto_advance_MUX_uxn_device_h_l263_c7_caca_return_output,
 screen_blit_result_MUX_uxn_device_h_l263_c7_caca_return_output,
 tmp8_MUX_uxn_device_h_l263_c7_caca_return_output,
 tmp12_MUX_uxn_device_h_l263_c7_caca_return_output,
 x_MUX_uxn_device_h_l263_c7_caca_return_output,
 is_blit_done_MUX_uxn_device_h_l263_c7_caca_return_output,
 tmp4_MUX_uxn_device_h_l263_c7_caca_return_output,
 result_MUX_uxn_device_h_l263_c7_caca_return_output,
 y_MUX_uxn_device_h_l263_c7_caca_return_output,
 ram_addr_MUX_uxn_device_h_l263_c7_caca_return_output,
 auto_length_MUX_uxn_device_h_l263_c7_caca_return_output,
 ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_return_output,
 y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output,
 tmp8b_MUX_uxn_device_h_l263_c7_caca_return_output,
 is_last_blit_MUX_uxn_device_h_l263_c7_caca_return_output,
 BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_return_output,
 MUX_uxn_device_h_l273_c18_d37f_return_output,
 MUX_uxn_device_h_l275_c19_6ae9_return_output,
 MUX_uxn_device_h_l276_c19_c30f_return_output,
 MUX_uxn_device_h_l277_c39_72f3_return_output,
 MUX_uxn_device_h_l277_c20_66c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output,
 screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output,
 tmp8_MUX_uxn_device_h_l278_c3_34c4_return_output,
 x_MUX_uxn_device_h_l278_c3_34c4_return_output,
 tmp4_MUX_uxn_device_h_l278_c3_34c4_return_output,
 result_MUX_uxn_device_h_l278_c3_34c4_return_output,
 y_MUX_uxn_device_h_l278_c3_34c4_return_output,
 ram_addr_MUX_uxn_device_h_l278_c3_34c4_return_output,
 tmp8b_MUX_uxn_device_h_l278_c3_34c4_return_output,
 is_last_blit_MUX_uxn_device_h_l278_c3_34c4_return_output,
 BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_return_output,
 tmp8_MUX_uxn_device_h_l279_c4_d221_return_output,
 x_MUX_uxn_device_h_l279_c4_d221_return_output,
 tmp4_MUX_uxn_device_h_l279_c4_d221_return_output,
 result_u8_value_MUX_uxn_device_h_l279_c4_d221_return_output,
 result_u16_addr_MUX_uxn_device_h_l279_c4_d221_return_output,
 result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_return_output,
 result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_return_output,
 result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_return_output,
 y_MUX_uxn_device_h_l279_c4_d221_return_output,
 ram_addr_MUX_uxn_device_h_l279_c4_d221_return_output,
 tmp8b_MUX_uxn_device_h_l279_c4_d221_return_output,
 BIN_OP_MINUS_uxn_device_h_l280_c22_457f_return_output,
 BIN_OP_PLUS_uxn_device_h_l280_c47_9736_return_output,
 MUX_uxn_device_h_l280_c12_8e0f_return_output,
 BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_return_output,
 BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_return_output,
 MUX_uxn_device_h_l281_c13_6ce2_return_output,
 BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_return_output,
 BIN_OP_PLUS_uxn_device_h_l282_c58_8722_return_output,
 MUX_uxn_device_h_l282_c26_3238_return_output,
 MUX_uxn_device_h_l282_c10_2c1a_return_output,
 BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_return_output,
 BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_return_output,
 MUX_uxn_device_h_l283_c26_dad8_return_output,
 MUX_uxn_device_h_l283_c10_aa5b_return_output,
 BIN_OP_PLUS_uxn_device_h_l290_c22_6743_return_output,
 BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_return_output,
 tmp4_MUX_uxn_device_h_l290_c9_8fec_return_output,
 result_u8_value_MUX_uxn_device_h_l290_c9_8fec_return_output,
 result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_return_output,
 result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_return_output,
 ram_addr_MUX_uxn_device_h_l290_c9_8fec_return_output,
 BIN_OP_PLUS_uxn_device_h_l295_c22_4113_return_output,
 BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_return_output,
 tmp4_MUX_uxn_device_h_l295_c9_9323_return_output,
 result_u8_value_MUX_uxn_device_h_l295_c9_9323_return_output,
 result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_return_output,
 result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_return_output,
 ram_addr_MUX_uxn_device_h_l295_c9_9323_return_output,
 BIN_OP_PLUS_uxn_device_h_l299_c22_791a_return_output,
 BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_return_output,
 tmp4_MUX_uxn_device_h_l299_c9_174d_return_output,
 result_u8_value_MUX_uxn_device_h_l299_c9_174d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_return_output,
 ram_addr_MUX_uxn_device_h_l299_c9_174d_return_output,
 BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_return_output,
 BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_return_output,
 tmp4_MUX_uxn_device_h_l303_c9_33f1_return_output,
 result_u8_value_MUX_uxn_device_h_l303_c9_33f1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_return_output,
 ram_addr_MUX_uxn_device_h_l303_c9_33f1_return_output,
 BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_return_output,
 tmp4_MUX_uxn_device_h_l307_c9_0b84_return_output,
 result_u8_value_MUX_uxn_device_h_l307_c9_0b84_return_output,
 result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_return_output,
 result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_return_output,
 ram_addr_MUX_uxn_device_h_l307_c9_0b84_return_output,
 BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_return_output,
 CONST_SR_8_uxn_device_h_l312_c33_41c7_return_output,
 BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_return_output,
 BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_return_output,
 tmp4_MUX_uxn_device_h_l314_c9_d2c5_return_output,
 result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_return_output,
 BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_return_output,
 BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_return_output,
 tmp4_MUX_uxn_device_h_l319_c9_7c66_return_output,
 result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_return_output,
 result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_return_output,
 BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_return_output,
 screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output,
 screen_2bpp_uxn_device_h_l328_c26_9600_return_output,
 screen_1bpp_uxn_device_h_l330_c26_cfa4_return_output,
 BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_return_output,
 MUX_uxn_device_h_l339_c19_4202_return_output,
 BIN_OP_XOR_uxn_device_h_l342_c11_a928_return_output,
 BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_return_output,
 MUX_uxn_device_h_l342_c11_96c2_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output,
 BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output,
 BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l231_c2_e548_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l231_c2_e548_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l231_c2_e548_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_5455_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l231_c2_e548_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_e548_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_e548_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5455_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_e548_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l231_c2_e548_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l238_c7_5455_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l238_c7_5455_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_5455_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c7_5b88_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5455_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5455_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_5b88_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l238_c7_5455_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l241_c7_5b88_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l241_c7_5b88_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c7_5b88_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l245_c7_e465_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_5b88_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_5b88_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_e465_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l241_c7_5b88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l245_c7_e465_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l245_c7_e465_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l245_c7_e465_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l249_c7_644d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_e465_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_e465_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_644d_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l245_c7_e465_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l249_c7_644d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l249_c7_644d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l249_c7_644d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l258_c7_1b01_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_644d_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_644d_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l249_c7_644d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l251_c11_18e3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l252_c25_b454_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l252_c25_b454_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l252_c15_6cc8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l253_c21_a1e2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l253_c21_a1e2_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l253_c11_6f22_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l254_c22_fc05_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l254_c22_fc05_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l254_c12_34a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l255_c22_a884_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l255_c22_a884_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l255_c12_b9ce_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l258_c7_1b01_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l258_c7_1b01_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l258_c7_1b01_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l263_c7_caca_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iffalse : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_uxn_device_h_l267_c3_5713 : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l266_c3_c6d3 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l263_c7_caca_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l263_c7_caca_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l278_c3_34c4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_uxn_device_h_l268_c3_0198 : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_d37f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_d37f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_d37f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l273_c18_d37f_return_output : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l274_c17_eee7_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_6ae9_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l275_c19_a35a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_6ae9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_6ae9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l275_c19_6ae9_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_c30f_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l276_c19_254c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_c30f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_c30f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l276_c19_c30f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_66c1_cond : unsigned(0 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l277_c20_099b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_66c1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_66c1_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_72f3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_72f3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_72f3_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c39_72f3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l277_c20_66c1_return_output : unsigned(15 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l278_c3_34c4_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l278_c3_34c4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f_uxn_device_h_l278_c3_34c4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l278_c3_34c4_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l278_c3_34c4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l285_c5_b94b : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_8e0f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_8e0f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_8e0f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l280_c12_8e0f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_6ce2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_6ce2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_6ce2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l281_c13_6ce2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_2c1a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_2c1a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_2c1a_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_3238_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_3238_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_3238_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c26_3238_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l282_c10_2c1a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_aa5b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_aa5b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_aa5b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_dad8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_dad8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_dad8_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c26_dad8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l283_c10_aa5b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l288_c23_d0f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l293_c23_b70a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_uxn_device_h_l309_c5_9e36 : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l312_c33_41c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l312_c33_41c7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l312_c23_6847_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l317_c23_37f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_return_output : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_right : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l320_c5_6f52 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_return_output : unsigned(4 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_cond : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_phase : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_x1 : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_y1 : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_color : unsigned(3 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_fx : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_fy : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l328_c26_9600_return_output : screen_blit_result_t;
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_phase : unsigned(11 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_x1 : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_y1 : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_color : unsigned(3 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_fx : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_fy : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l333_c4_d4c6 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l335_c27_5396_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l336_c22_b256_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l338_c22_38c9_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_4202_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_4202_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_4202_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l339_c19_4202_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_96c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_96c2_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_96c2_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_device_h_l342_c11_96c2_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l246_l259_l308_DUPLICATE_c748_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_d358_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_64f8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_eb35_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_93c0_return_output : unsigned(0 downto 0);
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
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iftrue := to_unsigned(0, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iftrue := to_unsigned(43, 8);
     VAR_MUX_uxn_device_h_l277_c39_72f3_iftrue := to_unsigned(16, 16);
     VAR_result_device_ram_address_uxn_device_h_l333_c4_d4c6 := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l275_c19_6ae9_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_right := to_unsigned(6, 3);
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iftrue := to_unsigned(44, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_right := to_unsigned(2, 2);
     VAR_tmp4_uxn_device_h_l266_c3_c6d3 := resize(to_unsigned(0, 1), 4);
     VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_iftrue := VAR_tmp4_uxn_device_h_l266_c3_c6d3;
     VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_right := to_unsigned(5, 3);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_right := to_unsigned(3, 12);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iftrue := to_unsigned(0, 1);
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l339_c19_4202_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_right := to_unsigned(1, 1);
     VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_iftrue := to_unsigned(7, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_right := to_unsigned(7, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_right := to_unsigned(0, 12);
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_right := to_unsigned(1, 12);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iftrue := to_unsigned(45, 8);
     VAR_MUX_uxn_device_h_l275_c19_6ae9_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iftrue := to_unsigned(45, 8);
     VAR_MUX_uxn_device_h_l276_c19_c30f_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_result_u16_addr_uxn_device_h_l285_c5_b94b := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_result_u16_addr_uxn_device_h_l285_c5_b94b;
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iftrue := to_unsigned(44, 8);
     VAR_MUX_uxn_device_h_l276_c19_c30f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l339_c19_4202_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_right := to_unsigned(7, 3);
     VAR_MUX_uxn_device_h_l277_c39_72f3_iffalse := to_unsigned(8, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_right := to_unsigned(5, 12);
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iftrue := to_unsigned(41, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_right := to_unsigned(6, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_right := to_unsigned(2, 12);
     VAR_MUX_uxn_device_h_l277_c20_66c1_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_right := to_unsigned(4, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_device_h_l273_c18_d37f_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_iftrue := auto_advance;
     VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_iftrue := auto_length;
     VAR_color_MUX_uxn_device_h_l231_c2_e548_iftrue := color;
     VAR_color_MUX_uxn_device_h_l238_c7_5455_iftrue := color;
     VAR_color_MUX_uxn_device_h_l241_c7_5b88_iftrue := color;
     VAR_color_MUX_uxn_device_h_l245_c7_e465_iftrue := color;
     VAR_color_MUX_uxn_device_h_l249_c7_644d_iffalse := color;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_color := color;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_color := color;
     VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_iffalse := ctrl;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l277_c39_72f3_cond := ctrl_mode;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_cond := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iffalse := ctrl_mode;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l280_c12_8e0f_cond := flip_x;
     VAR_MUX_uxn_device_h_l282_c26_3238_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_iffalse := flip_x;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_fx := flip_x;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_fx := flip_x;
     VAR_MUX_uxn_device_h_l281_c13_6ce2_cond := flip_y;
     VAR_MUX_uxn_device_h_l283_c26_dad8_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_iffalse := flip_y;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_fy := flip_y;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_fy := flip_y;
     VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_left := is_blit_done;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_cond := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iftrue := is_blit_done;
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_result_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_x_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_y_MUX_uxn_device_h_l278_c3_34c4_cond := is_blit_done;
     VAR_MUX_uxn_device_h_l282_c10_2c1a_cond := is_last_blit;
     VAR_MUX_uxn_device_h_l283_c10_aa5b_cond := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iftrue := is_last_blit;
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iftrue := is_last_blit;
     VAR_layer_MUX_uxn_device_h_l231_c2_e548_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l238_c7_5455_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l241_c7_5b88_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l245_c7_e465_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l249_c7_644d_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_left := VAR_phase;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l255_c22_a884_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l254_c22_fc05_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l253_c21_a1e2_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l252_c25_b454_x := VAR_previous_device_ram_read;
     VAR_MUX_uxn_device_h_l273_c18_d37f_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_iftrue := VAR_previous_device_ram_read;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_previous_ram_read := VAR_previous_ram_read;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_iffalse := ram_addr;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_ram_addr := ram_addr;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_ram_addr := ram_addr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iftrue := ram_addr_incr;
     VAR_result_MUX_uxn_device_h_l263_c7_caca_iftrue := result;
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iftrue := screen_blit_result;
     VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_right := tmp12;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_right := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_left := tmp12;
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_left := tmp12;
     VAR_MUX_uxn_device_h_l342_c11_96c2_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_iftrue := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_right := tmp4;
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_left := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_iffalse := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_iffalse := tmp4;
     VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_left := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_left := tmp8;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_x1 := tmp8;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_x1 := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_iffalse := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_iffalse := tmp8;
     VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_left := tmp8b;
     VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_left := tmp8b;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_y1 := tmp8b;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_y1 := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_iffalse := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_iffalse := tmp8b;
     VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_left := x;
     VAR_MUX_uxn_device_h_l282_c10_2c1a_iffalse := x;
     VAR_tmp8_uxn_device_h_l267_c3_5713 := resize(x, 8);
     VAR_x_MUX_uxn_device_h_l231_c2_e548_iftrue := x;
     VAR_x_MUX_uxn_device_h_l238_c7_5455_iftrue := x;
     VAR_x_MUX_uxn_device_h_l245_c7_e465_iftrue := x;
     VAR_x_MUX_uxn_device_h_l249_c7_644d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l258_c7_1b01_iftrue := x;
     VAR_x_MUX_uxn_device_h_l263_c7_caca_iftrue := x;
     VAR_x_MUX_uxn_device_h_l278_c3_34c4_iffalse := x;
     VAR_x_MUX_uxn_device_h_l279_c4_d221_iffalse := x;
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue := x_sprite_incr;
     VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_left := y;
     VAR_MUX_uxn_device_h_l283_c10_aa5b_iffalse := y;
     VAR_tmp8b_uxn_device_h_l268_c3_0198 := resize(y, 8);
     VAR_y_MUX_uxn_device_h_l231_c2_e548_iftrue := y;
     VAR_y_MUX_uxn_device_h_l238_c7_5455_iftrue := y;
     VAR_y_MUX_uxn_device_h_l241_c7_5b88_iftrue := y;
     VAR_y_MUX_uxn_device_h_l249_c7_644d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l258_c7_1b01_iftrue := y;
     VAR_y_MUX_uxn_device_h_l263_c7_caca_iftrue := y;
     VAR_y_MUX_uxn_device_h_l278_c3_34c4_iffalse := y;
     VAR_y_MUX_uxn_device_h_l279_c4_d221_iffalse := y;
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue := y_sprite_incr;
     VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_iftrue := VAR_tmp8_uxn_device_h_l267_c3_5713;
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_iftrue := VAR_tmp8b_uxn_device_h_l268_c3_0198;
     -- BIN_OP_EQ[uxn_device_h_l258_c11_79e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l258_c11_79e8_left <= VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_left;
     BIN_OP_EQ_uxn_device_h_l258_c11_79e8_right <= VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output := BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l249_c7_644d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l249_c7_644d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(45, 8));

     -- MUX[uxn_device_h_l277_c39_72f3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l277_c39_72f3_cond <= VAR_MUX_uxn_device_h_l277_c39_72f3_cond;
     MUX_uxn_device_h_l277_c39_72f3_iftrue <= VAR_MUX_uxn_device_h_l277_c39_72f3_iftrue;
     MUX_uxn_device_h_l277_c39_72f3_iffalse <= VAR_MUX_uxn_device_h_l277_c39_72f3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l277_c39_72f3_return_output := MUX_uxn_device_h_l277_c39_72f3_return_output;

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l279_c4_d221] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l279_c4_d221_return_output := result.u16_addr;

     -- BIN_OP_PLUS[uxn_device_h_l290_c22_6743] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l290_c22_6743_left <= VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_left;
     BIN_OP_PLUS_uxn_device_h_l290_c22_6743_right <= VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_return_output := BIN_OP_PLUS_uxn_device_h_l290_c22_6743_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l245_c7_e465] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l245_c7_e465_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(44, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l258_c7_1b01] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l258_c7_1b01_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- BIN_OP_PLUS[uxn_device_h_l295_c22_4113] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l295_c22_4113_left <= VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_left;
     BIN_OP_PLUS_uxn_device_h_l295_c22_4113_right <= VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_return_output := BIN_OP_PLUS_uxn_device_h_l295_c22_4113_return_output;

     -- CONST_SR_5[uxn_device_h_l254_c22_fc05] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l254_c22_fc05_x <= VAR_CONST_SR_5_uxn_device_h_l254_c22_fc05_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l254_c22_fc05_return_output := CONST_SR_5_uxn_device_h_l254_c22_fc05_return_output;

     -- BIN_OP_EQ[uxn_device_h_l231_c6_363b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l231_c6_363b_left <= VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_left;
     BIN_OP_EQ_uxn_device_h_l231_c6_363b_right <= VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output := BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l245_c11_d97d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l245_c11_d97d_left <= VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_left;
     BIN_OP_EQ_uxn_device_h_l245_c11_d97d_right <= VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output := BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l307_c22_0b0a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_left;
     BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_return_output := BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_eb35 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_eb35_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l263_c11_cb09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l263_c11_cb09_left <= VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_left;
     BIN_OP_EQ_uxn_device_h_l263_c11_cb09_right <= VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output := BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l317_c23_37f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l317_c23_37f6_return_output := CAST_TO_uint8_t_uint16_t(
     ram_addr);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l246_l259_l308_DUPLICATE_c748 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l246_l259_l308_DUPLICATE_c748_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CONST_SR_7[uxn_device_h_l252_c25_b454] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l252_c25_b454_x <= VAR_CONST_SR_7_uxn_device_h_l252_c25_b454_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l252_c25_b454_return_output := CONST_SR_7_uxn_device_h_l252_c25_b454_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l293_c23_b70a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l293_c23_b70a_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- CONST_SR_4[uxn_device_h_l255_c22_a884] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l255_c22_a884_x <= VAR_CONST_SR_4_uxn_device_h_l255_c22_a884_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l255_c22_a884_return_output := CONST_SR_4_uxn_device_h_l255_c22_a884_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l231_c2_e548] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l231_c2_e548_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(41, 8),
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_device_h_l249_c11_fb78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l249_c11_fb78_left <= VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_left;
     BIN_OP_EQ_uxn_device_h_l249_c11_fb78_right <= VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output := BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;

     -- BIN_OP_EQ[uxn_device_h_l279_c8_c59d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l279_c8_c59d_left <= VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_left;
     BIN_OP_EQ_uxn_device_h_l279_c8_c59d_right <= VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output := BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l314_c22_0ed4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_left <= VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_left;
     BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_right <= VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_return_output := BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l238_c7_5455] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l238_c7_5455_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_PLUS[uxn_device_h_l299_c22_791a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l299_c22_791a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_left;
     BIN_OP_PLUS_uxn_device_h_l299_c22_791a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_return_output := BIN_OP_PLUS_uxn_device_h_l299_c22_791a_return_output;

     -- CONST_SR_6[uxn_device_h_l253_c21_a1e2] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l253_c21_a1e2_x <= VAR_CONST_SR_6_uxn_device_h_l253_c21_a1e2_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l253_c21_a1e2_return_output := CONST_SR_6_uxn_device_h_l253_c21_a1e2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l273_c18_d5e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_left <= VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_left;
     BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_right <= VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_return_output := BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l238_c11_b78c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l238_c11_b78c_left <= VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_left;
     BIN_OP_EQ_uxn_device_h_l238_c11_b78c_right <= VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output := BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_64f8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_64f8_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l241_c7_5b88] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l241_c7_5b88_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(47, 8));

     -- CAST_TO_uint4_t[uxn_device_h_l251_c11_18e3] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l251_c11_18e3_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l319_c22_e7c7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_left;
     BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_return_output := BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output := result.is_deo_done;

     -- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_left <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_left;
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_right <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output := BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l342_c60_2fab] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_left <= VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_left;
     BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_right <= VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_return_output := BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l303_c22_ff80] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_left <= VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_left;
     BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_right <= VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_return_output := BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l320_c5_95fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_left;
     BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_return_output := BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_d358 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_d358_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l279_c4_d221] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l279_c4_d221_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output := screen_blit_result.is_blit_done;

     -- BIN_OP_EQ[uxn_device_h_l241_c11_1cf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_left <= VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_left;
     BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_right <= VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output := BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_color_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_layer_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_result_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_x_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_y_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c6_363b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_color_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_layer_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_result_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_x_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_y_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond := VAR_BIN_OP_EQ_uxn_device_h_l238_c11_b78c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_color_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_layer_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_result_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_x_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_y_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond := VAR_BIN_OP_EQ_uxn_device_h_l241_c11_1cf0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_color_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_layer_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_result_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_x_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_y_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond := VAR_BIN_OP_EQ_uxn_device_h_l245_c11_d97d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_color_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_layer_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_result_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_x_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_y_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond := VAR_BIN_OP_EQ_uxn_device_h_l249_c11_fb78_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_result_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_x_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_y_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond := VAR_BIN_OP_EQ_uxn_device_h_l258_c11_79e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_result_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_x_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_y_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond := VAR_BIN_OP_EQ_uxn_device_h_l263_c11_cb09_return_output;
     VAR_MUX_uxn_device_h_l273_c18_d37f_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c18_d5e5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_x_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_y_MUX_uxn_device_h_l279_c4_d221_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c8_c59d_return_output;
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_phase := resize(VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l328_l330_DUPLICATE_133b_return_output, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_right := VAR_BIN_OP_PLUS_uxn_device_h_l290_c22_6743_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_right := VAR_BIN_OP_PLUS_uxn_device_h_l295_c22_4113_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_right := VAR_BIN_OP_PLUS_uxn_device_h_l299_c22_791a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_right := VAR_BIN_OP_PLUS_uxn_device_h_l303_c22_ff80_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_right := VAR_BIN_OP_PLUS_uxn_device_h_l307_c22_0b0a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_right := VAR_BIN_OP_PLUS_uxn_device_h_l314_c22_0ed4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_right := VAR_BIN_OP_PLUS_uxn_device_h_l319_c22_e7c7_return_output;
     VAR_tmp4_uxn_device_h_l320_c5_6f52 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l320_c5_95fd_return_output, 4);
     VAR_MUX_uxn_device_h_l342_c11_96c2_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l342_c60_2fab_return_output, 12);
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l246_l259_l308_DUPLICATE_c748_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l246_l259_l308_DUPLICATE_c748_return_output;
     VAR_x_MUX_uxn_device_h_l241_c7_5b88_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l246_l259_l308_DUPLICATE_c748_return_output;
     VAR_y_MUX_uxn_device_h_l245_c7_e465_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l264_l242_l304_l246_l259_l308_DUPLICATE_c748_return_output;
     VAR_color_MUX_uxn_device_h_l249_c7_644d_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l251_c11_18e3_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l293_c23_b70a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l317_c23_37f6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_aaa2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_eb35_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l319_l303_DUPLICATE_eb35_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l319_l299_l314_l307_l290_l295_l279_l303_DUPLICATE_4efc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_64f8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l319_l303_DUPLICATE_64f8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_d358_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_d358_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_d358_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l295_l303_l314_l299_DUPLICATE_d358_return_output;
     VAR_MUX_uxn_device_h_l277_c20_66c1_iftrue := VAR_MUX_uxn_device_h_l277_c39_72f3_return_output;
     VAR_result_MUX_uxn_device_h_l238_c7_5455_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l238_c7_5455_return_output;
     VAR_result_MUX_uxn_device_h_l241_c7_5b88_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l241_c7_5b88_return_output;
     VAR_result_MUX_uxn_device_h_l245_c7_e465_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l245_c7_e465_return_output;
     VAR_result_MUX_uxn_device_h_l249_c7_644d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l249_c7_644d_return_output;
     VAR_result_MUX_uxn_device_h_l258_c7_1b01_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l258_c7_1b01_return_output;
     VAR_result_MUX_uxn_device_h_l231_c2_e548_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l231_c2_e548_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l279_c4_d221_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l279_c4_d221_return_output;
     VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_iftrue := VAR_tmp4_uxn_device_h_l320_c5_6f52;
     -- BIN_OP_EQ[uxn_device_h_l319_c13_4c4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_left <= VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_left;
     BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_right <= VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output := BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l295_c13_08d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l295_c13_08d1_left <= VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_left;
     BIN_OP_EQ_uxn_device_h_l295_c13_08d1_right <= VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output := BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l307_c13_2400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c13_2400_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_left;
     BIN_OP_EQ_uxn_device_h_l307_c13_2400_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output := BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;

     -- BIN_OP_EQ[uxn_device_h_l299_c13_aab8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l299_c13_aab8_left <= VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_left;
     BIN_OP_EQ_uxn_device_h_l299_c13_aab8_right <= VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output := BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_cond;
     result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iftrue;
     result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_return_output := result_u16_addr_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- color_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_color_MUX_uxn_device_h_l249_c7_644d_cond;
     color_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_color_MUX_uxn_device_h_l249_c7_644d_iftrue;
     color_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_color_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l249_c7_644d_return_output := color_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l290_c13_a4c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_left <= VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_left;
     BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_right <= VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output := BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;

     -- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e LATENCY=0
     -- Inputs
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_left <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_left;
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_right <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output := BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l252_c15_6cc8] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l252_c15_6cc8_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l252_c25_b454_return_output);

     -- result_is_vram_write_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_cond;
     result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_return_output := result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l253_c11_6f22] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l253_c11_6f22_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l253_c21_a1e2_return_output);

     -- MUX[uxn_device_h_l273_c18_d37f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l273_c18_d37f_cond <= VAR_MUX_uxn_device_h_l273_c18_d37f_cond;
     MUX_uxn_device_h_l273_c18_d37f_iftrue <= VAR_MUX_uxn_device_h_l273_c18_d37f_iftrue;
     MUX_uxn_device_h_l273_c18_d37f_iffalse <= VAR_MUX_uxn_device_h_l273_c18_d37f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l273_c18_d37f_return_output := MUX_uxn_device_h_l273_c18_d37f_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output := CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l254_c12_34a2] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l254_c12_34a2_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l254_c22_fc05_return_output);

     -- BIN_OP_EQ[uxn_device_h_l314_c13_599a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l314_c13_599a_left <= VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_left;
     BIN_OP_EQ_uxn_device_h_l314_c13_599a_right <= VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output := BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l255_c12_b9ce] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l255_c12_b9ce_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l255_c22_a884_return_output);

     -- BIN_OP_EQ[uxn_device_h_l303_c13_8b54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l303_c13_8b54_left <= VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_left;
     BIN_OP_EQ_uxn_device_h_l303_c13_8b54_right <= VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output := BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;

     -- ctrl_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_cond;
     ctrl_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_iftrue;
     ctrl_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_return_output := ctrl_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- Submodule level 2
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_cond := VAR_BIN_OP_EQ_uxn_device_h_l290_c13_a4c2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c13_08d1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;
     VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c13_aab8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;
     VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l303_c13_8b54_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c13_2400_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c13_599a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l319_c13_4c4d_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_left := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l264_l308_DUPLICATE_af4e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l252_c15_6cc8_return_output;
     VAR_layer_MUX_uxn_device_h_l249_c7_644d_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l253_c11_6f22_return_output;
     VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l254_c12_34a2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l255_c12_b9ce_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l260_l305_DUPLICATE_cedb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_MUX_uxn_device_h_l273_c18_d37f_return_output;
     VAR_color_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_color_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_ctrl_MUX_uxn_device_h_l249_c7_644d_return_output;
     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l319_c9_7c66] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_return_output;

     -- result_u8_value_MUX[uxn_device_h_l314_c9_d2c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_cond;
     result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iftrue;
     result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_return_output := result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_return_output;

     -- uint8_1_1[uxn_device_h_l276_c19_254c] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l276_c19_254c_return_output := uint8_1_1(
     VAR_MUX_uxn_device_h_l273_c18_d37f_return_output);

     -- uint8_7_4[uxn_device_h_l274_c17_eee7] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l274_c17_eee7_return_output := uint8_7_4(
     VAR_MUX_uxn_device_h_l273_c18_d37f_return_output);

     -- ctrl_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_cond;
     ctrl_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_iftrue;
     ctrl_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_return_output := ctrl_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- layer_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_layer_MUX_uxn_device_h_l249_c7_644d_cond;
     layer_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_layer_MUX_uxn_device_h_l249_c7_644d_iftrue;
     layer_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_layer_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l249_c7_644d_return_output := layer_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- color_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_color_MUX_uxn_device_h_l245_c7_e465_cond;
     color_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_color_MUX_uxn_device_h_l245_c7_e465_iftrue;
     color_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_color_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l245_c7_e465_return_output := color_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- flip_x_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_cond;
     flip_x_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_iftrue;
     flip_x_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_return_output := flip_x_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- uint8_2_2[uxn_device_h_l277_c20_099b] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l277_c20_099b_return_output := uint8_2_2(
     VAR_MUX_uxn_device_h_l273_c18_d37f_return_output);

     -- tmp4_MUX[uxn_device_h_l319_c9_7c66] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l319_c9_7c66_cond <= VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_cond;
     tmp4_MUX_uxn_device_h_l319_c9_7c66_iftrue <= VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_iftrue;
     tmp4_MUX_uxn_device_h_l319_c9_7c66_iffalse <= VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_return_output := tmp4_MUX_uxn_device_h_l319_c9_7c66_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l319_c9_7c66] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_cond;
     result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_return_output := result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l319_c9_7c66] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_cond;
     result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_return_output := result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_return_output;

     -- uint8_0_0[uxn_device_h_l275_c19_a35a] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l275_c19_a35a_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l273_c18_d37f_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_cond;
     ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iftrue;
     ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_return_output := ctrl_mode_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- flip_y_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_cond;
     flip_y_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_iftrue;
     flip_y_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_return_output := flip_y_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l319_c9_7c66] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_return_output := result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_return_output;

     -- auto_advance_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_cond;
     auto_advance_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_iftrue;
     auto_advance_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_return_output := auto_advance_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_auto_advance_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_color_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_color_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_ctrl_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_flip_x_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_flip_y_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_layer_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_layer_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l319_c9_7c66_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l319_c9_7c66_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l319_c9_7c66_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l314_c9_d2c5_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l319_c9_7c66_return_output;
     VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_iffalse := VAR_tmp4_MUX_uxn_device_h_l319_c9_7c66_return_output;
     VAR_MUX_uxn_device_h_l275_c19_6ae9_cond := VAR_uint8_0_0_uxn_device_h_l275_c19_a35a_return_output;
     VAR_MUX_uxn_device_h_l276_c19_c30f_cond := VAR_uint8_1_1_uxn_device_h_l276_c19_254c_return_output;
     VAR_MUX_uxn_device_h_l277_c20_66c1_cond := VAR_uint8_2_2_uxn_device_h_l277_c20_099b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_left := VAR_uint8_7_4_uxn_device_h_l274_c17_eee7_return_output;
     VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_uint8_7_4_uxn_device_h_l274_c17_eee7_return_output;
     -- auto_length_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_cond;
     auto_length_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_iftrue;
     auto_length_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_return_output := auto_length_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l339_c19_e8fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_left <= VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_left;
     BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_right <= VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_return_output := BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_return_output;

     -- MUX[uxn_device_h_l277_c20_66c1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l277_c20_66c1_cond <= VAR_MUX_uxn_device_h_l277_c20_66c1_cond;
     MUX_uxn_device_h_l277_c20_66c1_iftrue <= VAR_MUX_uxn_device_h_l277_c20_66c1_iftrue;
     MUX_uxn_device_h_l277_c20_66c1_iffalse <= VAR_MUX_uxn_device_h_l277_c20_66c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l277_c20_66c1_return_output := MUX_uxn_device_h_l277_c20_66c1_return_output;

     -- MUX[uxn_device_h_l275_c19_6ae9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l275_c19_6ae9_cond <= VAR_MUX_uxn_device_h_l275_c19_6ae9_cond;
     MUX_uxn_device_h_l275_c19_6ae9_iftrue <= VAR_MUX_uxn_device_h_l275_c19_6ae9_iftrue;
     MUX_uxn_device_h_l275_c19_6ae9_iffalse <= VAR_MUX_uxn_device_h_l275_c19_6ae9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l275_c19_6ae9_return_output := MUX_uxn_device_h_l275_c19_6ae9_return_output;

     -- flip_y_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_cond;
     flip_y_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_iftrue;
     flip_y_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_return_output := flip_y_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l314_c9_d2c5] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_return_output;

     -- tmp4_MUX[uxn_device_h_l314_c9_d2c5] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l314_c9_d2c5_cond <= VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_cond;
     tmp4_MUX_uxn_device_h_l314_c9_d2c5_iftrue <= VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_iftrue;
     tmp4_MUX_uxn_device_h_l314_c9_d2c5_iffalse <= VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_return_output := tmp4_MUX_uxn_device_h_l314_c9_d2c5_return_output;

     -- ctrl_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_cond;
     ctrl_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     ctrl_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_return_output := ctrl_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- MUX[uxn_device_h_l276_c19_c30f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l276_c19_c30f_cond <= VAR_MUX_uxn_device_h_l276_c19_c30f_cond;
     MUX_uxn_device_h_l276_c19_c30f_iftrue <= VAR_MUX_uxn_device_h_l276_c19_c30f_iftrue;
     MUX_uxn_device_h_l276_c19_c30f_iffalse <= VAR_MUX_uxn_device_h_l276_c19_c30f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l276_c19_c30f_return_output := MUX_uxn_device_h_l276_c19_c30f_return_output;

     -- color_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_color_MUX_uxn_device_h_l241_c7_5b88_cond;
     color_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_color_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     color_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_color_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l241_c7_5b88_return_output := color_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- flip_x_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_cond;
     flip_x_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_iftrue;
     flip_x_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_return_output := flip_x_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_cond;
     ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iftrue;
     ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_return_output := ctrl_mode_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- auto_advance_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_cond;
     auto_advance_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     auto_advance_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_return_output := auto_advance_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l314_c9_d2c5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_cond;
     result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_return_output := result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_return_output;

     -- layer_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_layer_MUX_uxn_device_h_l245_c7_e465_cond;
     layer_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_layer_MUX_uxn_device_h_l245_c7_e465_iftrue;
     layer_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_layer_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l245_c7_e465_return_output := layer_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l314_c9_d2c5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_cond;
     result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_return_output := result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l314_c9_d2c5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_return_output := result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l339_c19_4202_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c19_e8fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_right := VAR_MUX_uxn_device_h_l275_c19_6ae9_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_right := VAR_MUX_uxn_device_h_l275_c19_6ae9_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_right := VAR_MUX_uxn_device_h_l275_c19_6ae9_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_right := VAR_MUX_uxn_device_h_l275_c19_6ae9_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_MUX_uxn_device_h_l275_c19_6ae9_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_right := VAR_MUX_uxn_device_h_l276_c19_c30f_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_right := VAR_MUX_uxn_device_h_l276_c19_c30f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_right := VAR_MUX_uxn_device_h_l276_c19_c30f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_right := VAR_MUX_uxn_device_h_l276_c19_c30f_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_MUX_uxn_device_h_l276_c19_c30f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_right := VAR_MUX_uxn_device_h_l277_c20_66c1_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_MUX_uxn_device_h_l277_c20_66c1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_auto_length_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_color_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_color_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_ctrl_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_flip_x_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_flip_y_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_layer_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_layer_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l314_c9_d2c5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l314_c9_d2c5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l314_c9_d2c5_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l314_c9_d2c5_return_output;
     VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_iffalse := VAR_tmp4_MUX_uxn_device_h_l314_c9_d2c5_return_output;
     -- BIN_OP_MINUS[uxn_device_h_l282_c36_4b97] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_left <= VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_left;
     BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_right <= VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_return_output := BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l281_c23_0cf6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_left <= VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_left;
     BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_right <= VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_return_output := BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_cond;
     ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_return_output := ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- tmp4_MUX[uxn_device_h_l307_c9_0b84] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l307_c9_0b84_cond <= VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_cond;
     tmp4_MUX_uxn_device_h_l307_c9_0b84_iftrue <= VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_iftrue;
     tmp4_MUX_uxn_device_h_l307_c9_0b84_iffalse <= VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_return_output := tmp4_MUX_uxn_device_h_l307_c9_0b84_return_output;

     -- flip_x_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_cond;
     flip_x_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     flip_x_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_return_output := flip_x_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- flip_y_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_cond;
     flip_y_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     flip_y_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_return_output := flip_y_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- auto_length_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_cond;
     auto_length_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     auto_length_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_return_output := auto_length_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_cond;
     ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_return_output := ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l307_c9_0b84] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_return_output := result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond;
     x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output := x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- MUX[uxn_device_h_l339_c19_4202] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l339_c19_4202_cond <= VAR_MUX_uxn_device_h_l339_c19_4202_cond;
     MUX_uxn_device_h_l339_c19_4202_iftrue <= VAR_MUX_uxn_device_h_l339_c19_4202_iftrue;
     MUX_uxn_device_h_l339_c19_4202_iffalse <= VAR_MUX_uxn_device_h_l339_c19_4202_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l339_c19_4202_return_output := MUX_uxn_device_h_l339_c19_4202_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l282_c58_8722] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l282_c58_8722_left <= VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_left;
     BIN_OP_PLUS_uxn_device_h_l282_c58_8722_right <= VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_return_output := BIN_OP_PLUS_uxn_device_h_l282_c58_8722_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l280_c47_9736] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l280_c47_9736_left <= VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_left;
     BIN_OP_PLUS_uxn_device_h_l280_c47_9736_right <= VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_return_output := BIN_OP_PLUS_uxn_device_h_l280_c47_9736_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l281_c49_47f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_left <= VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_left;
     BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_right <= VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_return_output := BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_return_output;

     -- auto_advance_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_cond;
     auto_advance_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_iftrue;
     auto_advance_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_return_output := auto_advance_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l283_c36_fd1a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_left <= VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_left;
     BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_right <= VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_return_output := BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_cond;
     y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output := y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l309_c5_0d57] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_left <= VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_left;
     BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_right <= VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_return_output := BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_return_output;

     -- layer_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_layer_MUX_uxn_device_h_l241_c7_5b88_cond;
     layer_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_layer_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     layer_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_layer_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l241_c7_5b88_return_output := layer_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l307_c9_0b84] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l283_c58_ddba] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_left <= VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_left;
     BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_right <= VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_return_output := BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l280_c22_457f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l280_c22_457f_left <= VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_left;
     BIN_OP_MINUS_uxn_device_h_l280_c22_457f_right <= VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_return_output := BIN_OP_MINUS_uxn_device_h_l280_c22_457f_return_output;

     -- ctrl_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_cond;
     ctrl_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_iftrue;
     ctrl_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_return_output := ctrl_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- color_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_color_MUX_uxn_device_h_l238_c7_5455_cond;
     color_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_color_MUX_uxn_device_h_l238_c7_5455_iftrue;
     color_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_color_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l238_c7_5455_return_output := color_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l307_c9_0b84] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_cond;
     result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_return_output := result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l307_c9_0b84] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_cond;
     result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_return_output := result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l280_c12_8e0f_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l280_c22_457f_return_output;
     VAR_MUX_uxn_device_h_l281_c13_6ce2_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l281_c23_0cf6_return_output;
     VAR_MUX_uxn_device_h_l282_c26_3238_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l282_c36_4b97_return_output;
     VAR_MUX_uxn_device_h_l283_c26_dad8_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l283_c36_fd1a_return_output;
     VAR_MUX_uxn_device_h_l280_c12_8e0f_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l280_c47_9736_return_output, 8);
     VAR_MUX_uxn_device_h_l281_c13_6ce2_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l281_c49_47f6_return_output, 8);
     VAR_MUX_uxn_device_h_l282_c26_3238_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l282_c58_8722_return_output, 16);
     VAR_MUX_uxn_device_h_l283_c26_dad8_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l283_c58_ddba_return_output, 16);
     VAR_ram_addr_uxn_device_h_l309_c5_9e36 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l309_c5_0d57_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iffalse := VAR_MUX_uxn_device_h_l339_c19_4202_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_auto_advance_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_auto_length_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_color_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_color_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_ctrl_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_flip_x_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_flip_y_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_layer_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_layer_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l307_c9_0b84_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l307_c9_0b84_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l307_c9_0b84_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l307_c9_0b84_return_output;
     VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_iffalse := VAR_tmp4_MUX_uxn_device_h_l307_c9_0b84_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_CONST_SR_8_uxn_device_h_l312_c33_41c7_x := VAR_ram_addr_uxn_device_h_l309_c5_9e36;
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_iftrue := VAR_ram_addr_uxn_device_h_l309_c5_9e36;
     -- ram_addr_incr_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_cond;
     ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_return_output := ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond;
     y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output := y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- color_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_color_MUX_uxn_device_h_l231_c2_e548_cond;
     color_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_color_MUX_uxn_device_h_l231_c2_e548_iftrue;
     color_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_color_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l231_c2_e548_return_output := color_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- auto_length_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_cond;
     auto_length_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_iftrue;
     auto_length_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_return_output := auto_length_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- ctrl_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_cond;
     ctrl_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_iftrue;
     ctrl_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_return_output := ctrl_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_cond;
     ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iftrue;
     ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_return_output := ctrl_mode_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- ram_addr_MUX[uxn_device_h_l307_c9_0b84] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l307_c9_0b84_cond <= VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_cond;
     ram_addr_MUX_uxn_device_h_l307_c9_0b84_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_iftrue;
     ram_addr_MUX_uxn_device_h_l307_c9_0b84_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_return_output := ram_addr_MUX_uxn_device_h_l307_c9_0b84_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l303_c9_33f1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_cond;
     result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_return_output := result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l303_c9_33f1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_cond;
     result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_return_output := result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l303_c9_33f1] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_return_output;

     -- MUX[uxn_device_h_l282_c26_3238] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l282_c26_3238_cond <= VAR_MUX_uxn_device_h_l282_c26_3238_cond;
     MUX_uxn_device_h_l282_c26_3238_iftrue <= VAR_MUX_uxn_device_h_l282_c26_3238_iftrue;
     MUX_uxn_device_h_l282_c26_3238_iffalse <= VAR_MUX_uxn_device_h_l282_c26_3238_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l282_c26_3238_return_output := MUX_uxn_device_h_l282_c26_3238_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_cond;
     x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output := x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- MUX[uxn_device_h_l281_c13_6ce2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l281_c13_6ce2_cond <= VAR_MUX_uxn_device_h_l281_c13_6ce2_cond;
     MUX_uxn_device_h_l281_c13_6ce2_iftrue <= VAR_MUX_uxn_device_h_l281_c13_6ce2_iftrue;
     MUX_uxn_device_h_l281_c13_6ce2_iffalse <= VAR_MUX_uxn_device_h_l281_c13_6ce2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l281_c13_6ce2_return_output := MUX_uxn_device_h_l281_c13_6ce2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l303_c9_33f1] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_return_output := result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_return_output;

     -- auto_advance_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_cond;
     auto_advance_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_iftrue;
     auto_advance_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_return_output := auto_advance_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- flip_x_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_cond;
     flip_x_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_iftrue;
     flip_x_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_return_output := flip_x_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- layer_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_layer_MUX_uxn_device_h_l238_c7_5455_cond;
     layer_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_layer_MUX_uxn_device_h_l238_c7_5455_iftrue;
     layer_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_layer_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l238_c7_5455_return_output := layer_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- CONST_SR_8[uxn_device_h_l312_c33_41c7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l312_c33_41c7_x <= VAR_CONST_SR_8_uxn_device_h_l312_c33_41c7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l312_c33_41c7_return_output := CONST_SR_8_uxn_device_h_l312_c33_41c7_return_output;

     -- MUX[uxn_device_h_l280_c12_8e0f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l280_c12_8e0f_cond <= VAR_MUX_uxn_device_h_l280_c12_8e0f_cond;
     MUX_uxn_device_h_l280_c12_8e0f_iftrue <= VAR_MUX_uxn_device_h_l280_c12_8e0f_iftrue;
     MUX_uxn_device_h_l280_c12_8e0f_iffalse <= VAR_MUX_uxn_device_h_l280_c12_8e0f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l280_c12_8e0f_return_output := MUX_uxn_device_h_l280_c12_8e0f_return_output;

     -- tmp4_MUX[uxn_device_h_l303_c9_33f1] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l303_c9_33f1_cond <= VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_cond;
     tmp4_MUX_uxn_device_h_l303_c9_33f1_iftrue <= VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_iftrue;
     tmp4_MUX_uxn_device_h_l303_c9_33f1_iffalse <= VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_return_output := tmp4_MUX_uxn_device_h_l303_c9_33f1_return_output;

     -- is_last_blit_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_cond;
     is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_return_output := is_last_blit_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- flip_y_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_cond;
     flip_y_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_iftrue;
     flip_y_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_return_output := flip_y_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- MUX[uxn_device_h_l283_c26_dad8] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l283_c26_dad8_cond <= VAR_MUX_uxn_device_h_l283_c26_dad8_cond;
     MUX_uxn_device_h_l283_c26_dad8_iftrue <= VAR_MUX_uxn_device_h_l283_c26_dad8_iftrue;
     MUX_uxn_device_h_l283_c26_dad8_iffalse <= VAR_MUX_uxn_device_h_l283_c26_dad8_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l283_c26_dad8_return_output := MUX_uxn_device_h_l283_c26_dad8_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_MUX_uxn_device_h_l280_c12_8e0f_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_MUX_uxn_device_h_l281_c13_6ce2_return_output;
     VAR_MUX_uxn_device_h_l282_c10_2c1a_iftrue := VAR_MUX_uxn_device_h_l282_c26_3238_return_output;
     VAR_MUX_uxn_device_h_l283_c10_aa5b_iftrue := VAR_MUX_uxn_device_h_l283_c26_dad8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_auto_advance_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_auto_length_MUX_uxn_device_h_l249_c7_644d_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l231_c2_e548_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_flip_x_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_flip_y_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_layer_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_layer_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_iffalse := VAR_ram_addr_MUX_uxn_device_h_l307_c9_0b84_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l303_c9_33f1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l303_c9_33f1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l303_c9_33f1_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l303_c9_33f1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_iffalse := VAR_tmp4_MUX_uxn_device_h_l303_c9_33f1_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l258_c7_1b01_return_output;
     -- result_is_device_ram_write_MUX[uxn_device_h_l299_c9_174d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l312_c23_6847] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l312_c23_6847_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l312_c33_41c7_return_output);

     -- ram_addr_MUX[uxn_device_h_l303_c9_33f1] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l303_c9_33f1_cond <= VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_cond;
     ram_addr_MUX_uxn_device_h_l303_c9_33f1_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_iftrue;
     ram_addr_MUX_uxn_device_h_l303_c9_33f1_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_return_output := ram_addr_MUX_uxn_device_h_l303_c9_33f1_return_output;

     -- layer_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_layer_MUX_uxn_device_h_l231_c2_e548_cond;
     layer_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_layer_MUX_uxn_device_h_l231_c2_e548_iftrue;
     layer_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_layer_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l231_c2_e548_return_output := layer_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- MUX[uxn_device_h_l282_c10_2c1a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l282_c10_2c1a_cond <= VAR_MUX_uxn_device_h_l282_c10_2c1a_cond;
     MUX_uxn_device_h_l282_c10_2c1a_iftrue <= VAR_MUX_uxn_device_h_l282_c10_2c1a_iftrue;
     MUX_uxn_device_h_l282_c10_2c1a_iffalse <= VAR_MUX_uxn_device_h_l282_c10_2c1a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l282_c10_2c1a_return_output := MUX_uxn_device_h_l282_c10_2c1a_return_output;

     -- tmp8_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_cond;
     tmp8_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_iftrue;
     tmp8_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_return_output := tmp8_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- MUX[uxn_device_h_l283_c10_aa5b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l283_c10_aa5b_cond <= VAR_MUX_uxn_device_h_l283_c10_aa5b_cond;
     MUX_uxn_device_h_l283_c10_aa5b_iftrue <= VAR_MUX_uxn_device_h_l283_c10_aa5b_iftrue;
     MUX_uxn_device_h_l283_c10_aa5b_iffalse <= VAR_MUX_uxn_device_h_l283_c10_aa5b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l283_c10_aa5b_return_output := MUX_uxn_device_h_l283_c10_aa5b_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond;
     x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output := x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- tmp8b_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_cond;
     tmp8b_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_iftrue;
     tmp8b_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_return_output := tmp8b_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l299_c9_174d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_cond;
     result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_return_output := result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l299_c9_174d] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l299_c9_174d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_cond;
     result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_return_output := result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_return_output;

     -- is_last_blit_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_cond;
     is_last_blit_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_iftrue;
     is_last_blit_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_return_output := is_last_blit_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_cond;
     ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iftrue;
     ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_return_output := ctrl_mode_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- tmp4_MUX[uxn_device_h_l299_c9_174d] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l299_c9_174d_cond <= VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_cond;
     tmp4_MUX_uxn_device_h_l299_c9_174d_iftrue <= VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_iftrue;
     tmp4_MUX_uxn_device_h_l299_c9_174d_iffalse <= VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_return_output := tmp4_MUX_uxn_device_h_l299_c9_174d_return_output;

     -- auto_advance_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_cond;
     auto_advance_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     auto_advance_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_return_output := auto_advance_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_cond;
     ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_return_output := ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- auto_length_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_cond;
     auto_length_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_iftrue;
     auto_length_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_return_output := auto_length_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- flip_y_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_cond;
     flip_y_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_iftrue;
     flip_y_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_return_output := flip_y_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- flip_x_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_cond;
     flip_x_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_iftrue;
     flip_x_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_return_output := flip_x_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_cond;
     y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output := y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l312_c23_6847_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_x_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_MUX_uxn_device_h_l282_c10_2c1a_return_output;
     VAR_y_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_MUX_uxn_device_h_l283_c10_aa5b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_auto_advance_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_auto_length_MUX_uxn_device_h_l245_c7_e465_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l231_c2_e548_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l231_c2_e548_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l263_c7_caca_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_iffalse := VAR_ram_addr_MUX_uxn_device_h_l303_c9_33f1_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l299_c9_174d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l299_c9_174d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l299_c9_174d_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l299_c9_174d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_iffalse := VAR_tmp4_MUX_uxn_device_h_l299_c9_174d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_tmp8_MUX_uxn_device_h_l279_c4_d221_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_tmp8b_MUX_uxn_device_h_l279_c4_d221_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l249_c7_644d_return_output;
     -- tmp4_MUX[uxn_device_h_l295_c9_9323] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l295_c9_9323_cond <= VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_cond;
     tmp4_MUX_uxn_device_h_l295_c9_9323_iftrue <= VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_iftrue;
     tmp4_MUX_uxn_device_h_l295_c9_9323_iffalse <= VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_return_output := tmp4_MUX_uxn_device_h_l295_c9_9323_return_output;

     -- auto_length_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_cond;
     auto_length_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     auto_length_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_return_output := auto_length_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- tmp8b_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_cond;
     tmp8b_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     tmp8b_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_return_output := tmp8b_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l295_c9_9323] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_cond;
     result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_return_output := result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_return_output;

     -- is_last_blit_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_cond;
     is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_return_output := is_last_blit_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- auto_advance_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_cond;
     auto_advance_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_iftrue;
     auto_advance_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_return_output := auto_advance_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond;
     y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output := y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- y_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_y_MUX_uxn_device_h_l279_c4_d221_cond;
     y_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_y_MUX_uxn_device_h_l279_c4_d221_iftrue;
     y_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_y_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l279_c4_d221_return_output := y_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_cond;
     x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output := x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_cond;
     ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_return_output := ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l272_c1_9add] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l295_c9_9323] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_return_output := result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l288_c23_d0f3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l288_c23_d0f3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_device_h_l282_c10_2c1a_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l295_c9_9323] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_cond;
     result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_return_output := result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_return_output;

     -- result_u8_value_MUX[uxn_device_h_l307_c9_0b84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l307_c9_0b84_cond <= VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_cond;
     result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iftrue;
     result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_return_output := result_u8_value_MUX_uxn_device_h_l307_c9_0b84_return_output;

     -- x_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_x_MUX_uxn_device_h_l279_c4_d221_cond;
     x_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_x_MUX_uxn_device_h_l279_c4_d221_iftrue;
     x_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_x_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l279_c4_d221_return_output := x_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l295_c9_9323] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_return_output;

     -- tmp8_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_cond;
     tmp8_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     tmp8_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_return_output := tmp8_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- ram_addr_MUX[uxn_device_h_l299_c9_174d] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l299_c9_174d_cond <= VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_cond;
     ram_addr_MUX_uxn_device_h_l299_c9_174d_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_iftrue;
     ram_addr_MUX_uxn_device_h_l299_c9_174d_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_return_output := ram_addr_MUX_uxn_device_h_l299_c9_174d_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l288_c23_d0f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l272_c1_9add_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_auto_advance_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_auto_length_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_iffalse := VAR_ram_addr_MUX_uxn_device_h_l299_c9_174d_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l295_c9_9323_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l295_c9_9323_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l295_c9_9323_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l307_c9_0b84_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l295_c9_9323_return_output;
     VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_iffalse := VAR_tmp4_MUX_uxn_device_h_l295_c9_9323_return_output;
     VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_tmp8_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_tmp8b_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_x_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_x_MUX_uxn_device_h_l279_c4_d221_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_y_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_y_MUX_uxn_device_h_l279_c4_d221_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l245_c7_e465_return_output;
     -- is_last_blit_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_cond;
     is_last_blit_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_iftrue;
     is_last_blit_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_return_output := is_last_blit_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond;
     x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output := x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- ram_addr_MUX[uxn_device_h_l295_c9_9323] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l295_c9_9323_cond <= VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_cond;
     ram_addr_MUX_uxn_device_h_l295_c9_9323_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_iftrue;
     ram_addr_MUX_uxn_device_h_l295_c9_9323_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_return_output := ram_addr_MUX_uxn_device_h_l295_c9_9323_return_output;

     -- x_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_x_MUX_uxn_device_h_l278_c3_34c4_cond;
     x_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_x_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     x_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_x_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l278_c3_34c4_return_output := x_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- tmp4_MUX[uxn_device_h_l290_c9_8fec] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l290_c9_8fec_cond <= VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_cond;
     tmp4_MUX_uxn_device_h_l290_c9_8fec_iftrue <= VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_iftrue;
     tmp4_MUX_uxn_device_h_l290_c9_8fec_iffalse <= VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_return_output := tmp4_MUX_uxn_device_h_l290_c9_8fec_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l290_c9_8fec] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_return_output := result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_return_output;

     -- tmp8b_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_cond;
     tmp8b_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_iftrue;
     tmp8b_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_return_output := tmp8b_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l326_c1_2c3a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l290_c9_8fec] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_cond;
     result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_return_output := result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_return_output;

     -- auto_advance_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_cond;
     auto_advance_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_iftrue;
     auto_advance_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_return_output := auto_advance_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_cond;
     ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_return_output := ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- tmp8_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_cond;
     tmp8_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_iftrue;
     tmp8_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_return_output := tmp8_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l290_c9_8fec] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_cond;
     y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output := y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- y_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_y_MUX_uxn_device_h_l278_c3_34c4_cond;
     y_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_y_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     y_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_y_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l278_c3_34c4_return_output := y_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l303_c9_33f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l303_c9_33f1_cond <= VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_cond;
     result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iftrue;
     result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_return_output := result_u8_value_MUX_uxn_device_h_l303_c9_33f1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l290_c9_8fec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_cond;
     result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_return_output := result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_return_output;

     -- auto_length_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_cond;
     auto_length_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_iftrue;
     auto_length_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_return_output := auto_length_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l326_c1_2c3a_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_auto_length_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_iffalse := VAR_ram_addr_MUX_uxn_device_h_l295_c9_9323_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l290_c9_8fec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l290_c9_8fec_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l290_c9_8fec_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l303_c9_33f1_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l290_c9_8fec_return_output;
     VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_tmp4_MUX_uxn_device_h_l290_c9_8fec_return_output;
     VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_tmp8_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_tmp8b_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_x_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_x_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_y_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_y_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l241_c7_5b88_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l327_c1_02f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_cond;
     result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_return_output := result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- tmp8_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_cond;
     tmp8_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     tmp8_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_return_output := tmp8_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_cond;
     ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_return_output := ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_cond;
     result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_return_output := result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- result_u8_value_MUX[uxn_device_h_l299_c9_174d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l299_c9_174d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_cond;
     result_u8_value_MUX_uxn_device_h_l299_c9_174d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_iftrue;
     result_u8_value_MUX_uxn_device_h_l299_c9_174d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_return_output := result_u8_value_MUX_uxn_device_h_l299_c9_174d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l329_c1_67de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- y_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_y_MUX_uxn_device_h_l263_c7_caca_cond;
     y_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_y_MUX_uxn_device_h_l263_c7_caca_iftrue;
     y_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_y_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l263_c7_caca_return_output := y_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond;
     x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output := x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_cond;
     y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output := y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- tmp4_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_cond;
     tmp4_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_iftrue;
     tmp4_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_return_output := tmp4_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_return_output := result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- x_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_x_MUX_uxn_device_h_l263_c7_caca_cond;
     x_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_x_MUX_uxn_device_h_l263_c7_caca_iftrue;
     x_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_x_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l263_c7_caca_return_output := x_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- tmp8b_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_cond;
     tmp8b_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     tmp8b_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_return_output := tmp8b_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- auto_length_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_cond;
     auto_length_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_iftrue;
     auto_length_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_return_output := auto_length_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- is_last_blit_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_cond;
     is_last_blit_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_iftrue;
     is_last_blit_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_return_output := is_last_blit_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- ram_addr_MUX[uxn_device_h_l290_c9_8fec] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l290_c9_8fec_cond <= VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_cond;
     ram_addr_MUX_uxn_device_h_l290_c9_8fec_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_iftrue;
     ram_addr_MUX_uxn_device_h_l290_c9_8fec_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_return_output := ram_addr_MUX_uxn_device_h_l290_c9_8fec_return_output;

     -- Submodule level 10
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l329_c1_67de_return_output;
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l327_c1_02f5_return_output;
     REG_VAR_auto_length := VAR_auto_length_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_ram_addr_MUX_uxn_device_h_l290_c9_8fec_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l299_c9_174d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_tmp4_MUX_uxn_device_h_l279_c4_d221_return_output;
     VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_tmp8_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_tmp8b_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_x_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_x_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_y_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_y_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l238_c7_5455_return_output;
     -- screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63[uxn_device_h_l278_c3_34c4] LATENCY=0
     VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l278_c3_34c4_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63(
     screen_blit_result,
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l279_c4_d221_return_output);

     -- result_u8_value_MUX[uxn_device_h_l295_c9_9323] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l295_c9_9323_cond <= VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_cond;
     result_u8_value_MUX_uxn_device_h_l295_c9_9323_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_iftrue;
     result_u8_value_MUX_uxn_device_h_l295_c9_9323_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_return_output := result_u8_value_MUX_uxn_device_h_l295_c9_9323_return_output;

     -- y_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_y_MUX_uxn_device_h_l258_c7_1b01_cond;
     y_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_y_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     y_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_y_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l258_c7_1b01_return_output := y_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond;
     x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output := x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- screen_2bpp[uxn_device_h_l328_c26_9600] LATENCY=0
     -- Clock enable
     screen_2bpp_uxn_device_h_l328_c26_9600_CLOCK_ENABLE <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_CLOCK_ENABLE;
     -- Inputs
     screen_2bpp_uxn_device_h_l328_c26_9600_phase <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_phase;
     screen_2bpp_uxn_device_h_l328_c26_9600_x1 <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_x1;
     screen_2bpp_uxn_device_h_l328_c26_9600_y1 <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_y1;
     screen_2bpp_uxn_device_h_l328_c26_9600_color <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_color;
     screen_2bpp_uxn_device_h_l328_c26_9600_fx <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_fx;
     screen_2bpp_uxn_device_h_l328_c26_9600_fy <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_fy;
     screen_2bpp_uxn_device_h_l328_c26_9600_ram_addr <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_ram_addr;
     screen_2bpp_uxn_device_h_l328_c26_9600_previous_ram_read <= VAR_screen_2bpp_uxn_device_h_l328_c26_9600_previous_ram_read;
     -- Outputs
     VAR_screen_2bpp_uxn_device_h_l328_c26_9600_return_output := screen_2bpp_uxn_device_h_l328_c26_9600_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_cond;
     y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output := y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- tmp8b_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_cond;
     tmp8b_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_iftrue;
     tmp8b_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_return_output := tmp8b_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- screen_1bpp[uxn_device_h_l330_c26_cfa4] LATENCY=0
     -- Clock enable
     screen_1bpp_uxn_device_h_l330_c26_cfa4_CLOCK_ENABLE <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_CLOCK_ENABLE;
     -- Inputs
     screen_1bpp_uxn_device_h_l330_c26_cfa4_phase <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_phase;
     screen_1bpp_uxn_device_h_l330_c26_cfa4_x1 <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_x1;
     screen_1bpp_uxn_device_h_l330_c26_cfa4_y1 <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_y1;
     screen_1bpp_uxn_device_h_l330_c26_cfa4_color <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_color;
     screen_1bpp_uxn_device_h_l330_c26_cfa4_fx <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_fx;
     screen_1bpp_uxn_device_h_l330_c26_cfa4_fy <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_fy;
     screen_1bpp_uxn_device_h_l330_c26_cfa4_ram_addr <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_ram_addr;
     screen_1bpp_uxn_device_h_l330_c26_cfa4_previous_ram_read <= VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_previous_ram_read;
     -- Outputs
     VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_return_output := screen_1bpp_uxn_device_h_l330_c26_cfa4_return_output;

     -- ram_addr_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_cond;
     ram_addr_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_iftrue;
     ram_addr_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_return_output := ram_addr_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- tmp4_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_cond;
     tmp4_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     tmp4_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_return_output := tmp4_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_cond;
     ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_return_output := ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- is_last_blit_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_cond;
     is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_return_output := is_last_blit_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- tmp8_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_cond;
     tmp8_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_iftrue;
     tmp8_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_return_output := tmp8_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- x_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_x_MUX_uxn_device_h_l258_c7_1b01_cond;
     x_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_x_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     x_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_x_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l258_c7_1b01_return_output := x_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- Submodule level 11
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_ram_addr_MUX_uxn_device_h_l279_c4_d221_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l295_c9_9323_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iffalse := VAR_screen_1bpp_uxn_device_h_l330_c26_cfa4_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iftrue := VAR_screen_2bpp_uxn_device_h_l328_c26_9600_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l278_c3_34c4_return_output;
     VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_tmp4_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_tmp8_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_tmp8b_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_x_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_x_MUX_uxn_device_h_l258_c7_1b01_return_output;
     REG_VAR_x_sprite_incr := VAR_x_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_y_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_y_MUX_uxn_device_h_l258_c7_1b01_return_output;
     REG_VAR_y_sprite_incr := VAR_y_sprite_incr_MUX_uxn_device_h_l231_c2_e548_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l327_c4_deb8] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_cond;
     screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iftrue;
     screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output := screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output;

     -- is_last_blit_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_cond;
     is_last_blit_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_iftrue;
     is_last_blit_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_return_output := is_last_blit_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- result_u8_value_MUX[uxn_device_h_l290_c9_8fec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l290_c9_8fec_cond <= VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_cond;
     result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iftrue;
     result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_return_output := result_u8_value_MUX_uxn_device_h_l290_c9_8fec_return_output;

     -- tmp8b_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_cond;
     tmp8b_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_iftrue;
     tmp8b_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_return_output := tmp8b_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- ram_addr_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_cond;
     ram_addr_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     ram_addr_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_return_output := ram_addr_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- tmp8_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_cond;
     tmp8_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_iftrue;
     tmp8_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_return_output := tmp8_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- x_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_x_MUX_uxn_device_h_l249_c7_644d_cond;
     x_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_x_MUX_uxn_device_h_l249_c7_644d_iftrue;
     x_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_x_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l249_c7_644d_return_output := x_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- y_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_y_MUX_uxn_device_h_l249_c7_644d_cond;
     y_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_y_MUX_uxn_device_h_l249_c7_644d_iftrue;
     y_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_y_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l249_c7_644d_return_output := y_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- tmp4_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_cond;
     tmp4_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_iftrue;
     tmp4_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_return_output := tmp4_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- Submodule level 12
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_ram_addr_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l290_c9_8fec_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output;
     VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_tmp4_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_tmp8_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_tmp8b_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_x_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_x_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_y_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_y_MUX_uxn_device_h_l249_c7_644d_return_output;
     -- ram_addr_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_cond;
     ram_addr_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_iftrue;
     ram_addr_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_return_output := ram_addr_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- tmp4_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_cond;
     tmp4_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     tmp4_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_return_output := tmp4_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- tmp8b_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_cond;
     tmp8b_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     tmp8b_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_return_output := tmp8b_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- tmp8_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_cond;
     tmp8_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     tmp8_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_return_output := tmp8_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l338_c22_38c9] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l338_c22_38c9_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l335_c27_5396] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l335_c27_5396_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l336_c22_b256] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l336_c22_b256_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l327_c4_deb8_return_output.u16_addr;

     -- is_last_blit_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_cond;
     is_last_blit_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_iftrue;
     is_last_blit_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_return_output := is_last_blit_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- x_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_x_MUX_uxn_device_h_l245_c7_e465_cond;
     x_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_x_MUX_uxn_device_h_l245_c7_e465_iftrue;
     x_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_x_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l245_c7_e465_return_output := x_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_cond;
     screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output := screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l279_c4_d221] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l279_c4_d221_cond <= VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_cond;
     result_u8_value_MUX_uxn_device_h_l279_c4_d221_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_iftrue;
     result_u8_value_MUX_uxn_device_h_l279_c4_d221_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_return_output := result_u8_value_MUX_uxn_device_h_l279_c4_d221_return_output;

     -- y_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_y_MUX_uxn_device_h_l245_c7_e465_cond;
     y_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_y_MUX_uxn_device_h_l245_c7_e465_iftrue;
     y_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_y_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l245_c7_e465_return_output := y_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- Submodule level 13
     REG_VAR_is_last_blit := VAR_is_last_blit_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_ram_addr_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_tmp4_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_tmp8_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_tmp8b_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_x_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_x_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_y_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_y_MUX_uxn_device_h_l245_c7_e465_return_output;
     -- y_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_y_MUX_uxn_device_h_l241_c7_5b88_cond;
     y_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_y_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     y_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_y_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l241_c7_5b88_return_output := y_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f[uxn_device_h_l278_c3_34c4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f_uxn_device_h_l278_c3_34c4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f(
     result,
     VAR_result_u8_value_MUX_uxn_device_h_l279_c4_d221_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l279_c4_d221_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l279_c4_d221_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l279_c4_d221_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l279_c4_d221_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l279_c4_d221_return_output);

     -- tmp8b_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_cond;
     tmp8b_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_iftrue;
     tmp8b_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_return_output := tmp8b_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- tmp4_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_cond;
     tmp4_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_iftrue;
     tmp4_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_return_output := tmp4_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_93c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_93c0_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l278_c3_34c4_return_output.is_blit_done;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7[uxn_device_h_l278_c3_34c4] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l278_c3_34c4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39b7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l333_c4_d4c6,
     to_unsigned(0, 1),
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l335_c27_5396_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l336_c22_b256_return_output,
     layer,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l338_c22_38c9_return_output);

     -- ram_addr_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_cond;
     ram_addr_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     ram_addr_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_return_output := ram_addr_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- x_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_x_MUX_uxn_device_h_l241_c7_5b88_cond;
     x_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_x_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     x_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_x_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l241_c7_5b88_return_output := x_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_cond;
     screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iftrue;
     screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_return_output := screen_blit_result_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- tmp8_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_cond;
     tmp8_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_iftrue;
     tmp8_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_return_output := tmp8_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- Submodule level 14
     VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_right := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_93c0_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l343_l342_DUPLICATE_93c0_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_ram_addr_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_result_MUX_uxn_device_h_l278_c3_34c4_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l278_c3_34c4_return_output;
     VAR_result_MUX_uxn_device_h_l278_c3_34c4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_fa3f_uxn_device_h_l278_c3_34c4_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_tmp4_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_tmp8_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_tmp8b_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_x_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_x_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_y_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_y_MUX_uxn_device_h_l241_c7_5b88_return_output;
     -- ram_addr_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_cond;
     ram_addr_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_iftrue;
     ram_addr_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_return_output := ram_addr_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- tmp8b_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_cond;
     tmp8b_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_iftrue;
     tmp8b_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_return_output := tmp8b_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- BIN_OP_XOR[uxn_device_h_l342_c11_a928] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_device_h_l342_c11_a928_left <= VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_left;
     BIN_OP_XOR_uxn_device_h_l342_c11_a928_right <= VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_return_output := BIN_OP_XOR_uxn_device_h_l342_c11_a928_return_output;

     -- x_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_x_MUX_uxn_device_h_l238_c7_5455_cond;
     x_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_x_MUX_uxn_device_h_l238_c7_5455_iftrue;
     x_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_x_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l238_c7_5455_return_output := x_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- result_MUX[uxn_device_h_l278_c3_34c4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l278_c3_34c4_cond <= VAR_result_MUX_uxn_device_h_l278_c3_34c4_cond;
     result_MUX_uxn_device_h_l278_c3_34c4_iftrue <= VAR_result_MUX_uxn_device_h_l278_c3_34c4_iftrue;
     result_MUX_uxn_device_h_l278_c3_34c4_iffalse <= VAR_result_MUX_uxn_device_h_l278_c3_34c4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l278_c3_34c4_return_output := result_MUX_uxn_device_h_l278_c3_34c4_return_output;

     -- is_blit_done_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_cond;
     is_blit_done_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_iftrue;
     is_blit_done_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_return_output := is_blit_done_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- tmp8_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_cond;
     tmp8_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_iftrue;
     tmp8_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_return_output := tmp8_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- tmp4_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_cond;
     tmp4_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_iftrue;
     tmp4_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_return_output := tmp4_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_cond;
     screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_return_output := screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- y_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_y_MUX_uxn_device_h_l238_c7_5455_cond;
     y_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_y_MUX_uxn_device_h_l238_c7_5455_iftrue;
     y_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_y_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l238_c7_5455_return_output := y_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- Submodule level 15
     VAR_MUX_uxn_device_h_l342_c11_96c2_cond := VAR_BIN_OP_XOR_uxn_device_h_l342_c11_a928_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_ram_addr_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_result_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_result_MUX_uxn_device_h_l278_c3_34c4_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_tmp4_MUX_uxn_device_h_l245_c7_e465_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l231_c2_e548_return_output;
     REG_VAR_tmp8b := VAR_tmp8b_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_x_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_x_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_y_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_y_MUX_uxn_device_h_l238_c7_5455_return_output;
     -- result_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_result_MUX_uxn_device_h_l263_c7_caca_cond;
     result_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_result_MUX_uxn_device_h_l263_c7_caca_iftrue;
     result_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_result_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l263_c7_caca_return_output := result_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- is_blit_done_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_cond;
     is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_return_output := is_blit_done_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_cond;
     screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iftrue;
     screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_return_output := screen_blit_result_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- MUX[uxn_device_h_l342_c11_96c2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l342_c11_96c2_cond <= VAR_MUX_uxn_device_h_l342_c11_96c2_cond;
     MUX_uxn_device_h_l342_c11_96c2_iftrue <= VAR_MUX_uxn_device_h_l342_c11_96c2_iftrue;
     MUX_uxn_device_h_l342_c11_96c2_iffalse <= VAR_MUX_uxn_device_h_l342_c11_96c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l342_c11_96c2_return_output := MUX_uxn_device_h_l342_c11_96c2_return_output;

     -- tmp4_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_cond;
     tmp4_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     tmp4_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_return_output := tmp4_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- y_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_y_MUX_uxn_device_h_l231_c2_e548_cond;
     y_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_y_MUX_uxn_device_h_l231_c2_e548_iftrue;
     y_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_y_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l231_c2_e548_return_output := y_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- x_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_x_MUX_uxn_device_h_l231_c2_e548_cond;
     x_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_x_MUX_uxn_device_h_l231_c2_e548_iftrue;
     x_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_x_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l231_c2_e548_return_output := x_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- ram_addr_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_cond;
     ram_addr_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_iftrue;
     ram_addr_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_return_output := ram_addr_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- Submodule level 16
     VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_iffalse := VAR_MUX_uxn_device_h_l342_c11_96c2_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_ram_addr_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_result_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_result_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_tmp4_MUX_uxn_device_h_l241_c7_5b88_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l231_c2_e548_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l231_c2_e548_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_cond;
     screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iftrue;
     screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_return_output := screen_blit_result_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- ram_addr_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_cond;
     ram_addr_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     ram_addr_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_return_output := ram_addr_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- result_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_result_MUX_uxn_device_h_l258_c7_1b01_cond;
     result_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_result_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     result_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_result_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l258_c7_1b01_return_output := result_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- tmp4_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_cond;
     tmp4_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_iftrue;
     tmp4_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_return_output := tmp4_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- is_blit_done_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_cond;
     is_blit_done_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_iftrue;
     is_blit_done_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_return_output := is_blit_done_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- tmp12_MUX[uxn_device_h_l263_c7_caca] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l263_c7_caca_cond <= VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_cond;
     tmp12_MUX_uxn_device_h_l263_c7_caca_iftrue <= VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_iftrue;
     tmp12_MUX_uxn_device_h_l263_c7_caca_iffalse <= VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_return_output := tmp12_MUX_uxn_device_h_l263_c7_caca_return_output;

     -- Submodule level 17
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_ram_addr_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_result_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_result_MUX_uxn_device_h_l258_c7_1b01_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_iffalse := VAR_tmp12_MUX_uxn_device_h_l263_c7_caca_return_output;
     VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_tmp4_MUX_uxn_device_h_l238_c7_5455_return_output;
     -- tmp12_MUX[uxn_device_h_l258_c7_1b01] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l258_c7_1b01_cond <= VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_cond;
     tmp12_MUX_uxn_device_h_l258_c7_1b01_iftrue <= VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_iftrue;
     tmp12_MUX_uxn_device_h_l258_c7_1b01_iffalse <= VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_return_output := tmp12_MUX_uxn_device_h_l258_c7_1b01_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_cond;
     screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_return_output := screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- result_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_result_MUX_uxn_device_h_l249_c7_644d_cond;
     result_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_result_MUX_uxn_device_h_l249_c7_644d_iftrue;
     result_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_result_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l249_c7_644d_return_output := result_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- is_blit_done_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_cond;
     is_blit_done_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_iftrue;
     is_blit_done_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_return_output := is_blit_done_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- ram_addr_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_cond;
     ram_addr_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_iftrue;
     ram_addr_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_return_output := ram_addr_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- tmp4_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_cond;
     tmp4_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_iftrue;
     tmp4_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_return_output := tmp4_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- Submodule level 18
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_ram_addr_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_result_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_result_MUX_uxn_device_h_l249_c7_644d_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l241_c7_5b88_return_output;
     VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_iffalse := VAR_tmp12_MUX_uxn_device_h_l258_c7_1b01_return_output;
     REG_VAR_tmp4 := VAR_tmp4_MUX_uxn_device_h_l231_c2_e548_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_cond;
     screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iftrue;
     screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_return_output := screen_blit_result_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- result_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_result_MUX_uxn_device_h_l245_c7_e465_cond;
     result_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_result_MUX_uxn_device_h_l245_c7_e465_iftrue;
     result_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_result_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l245_c7_e465_return_output := result_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- tmp12_MUX[uxn_device_h_l249_c7_644d] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l249_c7_644d_cond <= VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_cond;
     tmp12_MUX_uxn_device_h_l249_c7_644d_iftrue <= VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_iftrue;
     tmp12_MUX_uxn_device_h_l249_c7_644d_iffalse <= VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_return_output := tmp12_MUX_uxn_device_h_l249_c7_644d_return_output;

     -- ram_addr_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_cond;
     ram_addr_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_iftrue;
     ram_addr_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_return_output := ram_addr_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- is_blit_done_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_cond;
     is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_return_output := is_blit_done_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- Submodule level 19
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l241_c7_5b88_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_result_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_result_MUX_uxn_device_h_l245_c7_e465_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_iffalse := VAR_tmp12_MUX_uxn_device_h_l249_c7_644d_return_output;
     -- tmp12_MUX[uxn_device_h_l245_c7_e465] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l245_c7_e465_cond <= VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_cond;
     tmp12_MUX_uxn_device_h_l245_c7_e465_iftrue <= VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_iftrue;
     tmp12_MUX_uxn_device_h_l245_c7_e465_iffalse <= VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_return_output := tmp12_MUX_uxn_device_h_l245_c7_e465_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_cond;
     screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iftrue;
     screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_return_output := screen_blit_result_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- is_blit_done_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_cond;
     is_blit_done_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_iftrue;
     is_blit_done_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_return_output := is_blit_done_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- result_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_result_MUX_uxn_device_h_l241_c7_5b88_cond;
     result_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_result_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     result_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_result_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l241_c7_5b88_return_output := result_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- Submodule level 20
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_result_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_result_MUX_uxn_device_h_l241_c7_5b88_return_output;
     REG_VAR_screen_blit_result := VAR_screen_blit_result_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_iffalse := VAR_tmp12_MUX_uxn_device_h_l245_c7_e465_return_output;
     -- result_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_result_MUX_uxn_device_h_l238_c7_5455_cond;
     result_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_result_MUX_uxn_device_h_l238_c7_5455_iftrue;
     result_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_result_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l238_c7_5455_return_output := result_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- tmp12_MUX[uxn_device_h_l241_c7_5b88] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l241_c7_5b88_cond <= VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_cond;
     tmp12_MUX_uxn_device_h_l241_c7_5b88_iftrue <= VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_iftrue;
     tmp12_MUX_uxn_device_h_l241_c7_5b88_iffalse <= VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_return_output := tmp12_MUX_uxn_device_h_l241_c7_5b88_return_output;

     -- is_blit_done_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_cond;
     is_blit_done_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_iftrue;
     is_blit_done_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_return_output := is_blit_done_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- Submodule level 21
     REG_VAR_is_blit_done := VAR_is_blit_done_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_result_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_result_MUX_uxn_device_h_l238_c7_5455_return_output;
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_iffalse := VAR_tmp12_MUX_uxn_device_h_l241_c7_5b88_return_output;
     -- tmp12_MUX[uxn_device_h_l238_c7_5455] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l238_c7_5455_cond <= VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_cond;
     tmp12_MUX_uxn_device_h_l238_c7_5455_iftrue <= VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_iftrue;
     tmp12_MUX_uxn_device_h_l238_c7_5455_iffalse <= VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_return_output := tmp12_MUX_uxn_device_h_l238_c7_5455_return_output;

     -- result_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_result_MUX_uxn_device_h_l231_c2_e548_cond;
     result_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_result_MUX_uxn_device_h_l231_c2_e548_iftrue;
     result_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_result_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l231_c2_e548_return_output := result_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- Submodule level 22
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l231_c2_e548_return_output;
     VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_iffalse := VAR_tmp12_MUX_uxn_device_h_l238_c7_5455_return_output;
     -- tmp12_MUX[uxn_device_h_l231_c2_e548] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l231_c2_e548_cond <= VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_cond;
     tmp12_MUX_uxn_device_h_l231_c2_e548_iftrue <= VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_iftrue;
     tmp12_MUX_uxn_device_h_l231_c2_e548_iffalse <= VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_return_output := tmp12_MUX_uxn_device_h_l231_c2_e548_return_output;

     -- Submodule level 23
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_device_h_l231_c2_e548_return_output;
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
