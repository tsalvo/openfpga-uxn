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
-- Submodules: 373
entity sprite_deo_0CLK_3b277fcb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end sprite_deo_0CLK_3b277fcb;
architecture arch of sprite_deo_0CLK_3b277fcb is
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
-- BIN_OP_EQ[uxn_device_h_l260_c6_2fcd]
signal BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l267_c7_eeba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l260_c2_fd3e]
signal flip_x_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l260_c2_fd3e]
signal flip_y_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l260_c2_fd3e]
signal tmp12_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l260_c2_fd3e]
signal is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l260_c2_fd3e]
signal auto_length_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l260_c2_fd3e]
signal is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l260_c2_fd3e]
signal result_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l260_c2_fd3e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l260_c2_fd3e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l260_c2_fd3e_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l260_c2_fd3e]
signal ctrl_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l260_c2_fd3e]
signal tmp16b_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l260_c2_fd3e]
signal auto_advance_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l260_c2_fd3e]
signal ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l260_c2_fd3e]
signal y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l260_c2_fd3e]
signal tmp4_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l260_c2_fd3e]
signal screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l260_c2_fd3e]
signal x_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l260_c2_fd3e]
signal tmp16_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l260_c2_fd3e]
signal ram_addr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l260_c2_fd3e]
signal color_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l260_c2_fd3e]
signal layer_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l260_c2_fd3e]
signal y_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l260_c2_fd3e]
signal x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l260_c2_fd3e]
signal ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l267_c11_9c98]
signal BIN_OP_EQ_uxn_device_h_l267_c11_9c98_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l267_c11_9c98_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l270_c7_86b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l267_c7_eeba]
signal flip_x_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l267_c7_eeba]
signal flip_y_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l267_c7_eeba]
signal tmp12_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l267_c7_eeba]
signal is_last_blit_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l267_c7_eeba]
signal auto_length_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l267_c7_eeba]
signal is_blit_done_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l267_c7_eeba]
signal result_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l267_c7_eeba_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l267_c7_eeba_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l267_c7_eeba_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l267_c7_eeba]
signal ctrl_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l267_c7_eeba]
signal tmp16b_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l267_c7_eeba]
signal auto_advance_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l267_c7_eeba]
signal ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l267_c7_eeba]
signal y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l267_c7_eeba]
signal tmp4_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l267_c7_eeba]
signal screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l267_c7_eeba]
signal x_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l267_c7_eeba]
signal tmp16_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l267_c7_eeba]
signal ram_addr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l267_c7_eeba]
signal color_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l267_c7_eeba]
signal layer_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l267_c7_eeba]
signal y_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l267_c7_eeba]
signal x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l267_c7_eeba]
signal ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l270_c11_b365]
signal BIN_OP_EQ_uxn_device_h_l270_c11_b365_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l270_c11_b365_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l275_c7_f0fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l270_c7_86b1]
signal flip_x_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l270_c7_86b1]
signal flip_y_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l270_c7_86b1]
signal tmp12_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l270_c7_86b1]
signal is_last_blit_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l270_c7_86b1]
signal auto_length_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l270_c7_86b1]
signal is_blit_done_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l270_c7_86b1]
signal result_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l270_c7_86b1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l270_c7_86b1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l270_c7_86b1_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l270_c7_86b1]
signal ctrl_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l270_c7_86b1]
signal tmp16b_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l270_c7_86b1]
signal auto_advance_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l270_c7_86b1]
signal ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l270_c7_86b1]
signal y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l270_c7_86b1]
signal tmp4_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l270_c7_86b1]
signal screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l270_c7_86b1]
signal x_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l270_c7_86b1]
signal tmp16_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l270_c7_86b1]
signal ram_addr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l270_c7_86b1]
signal color_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l270_c7_86b1]
signal layer_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l270_c7_86b1]
signal y_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l270_c7_86b1]
signal x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l270_c7_86b1]
signal ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l275_c11_a99d]
signal BIN_OP_EQ_uxn_device_h_l275_c11_a99d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l275_c11_a99d_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l279_c7_f401]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l275_c7_f0fc]
signal flip_x_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l275_c7_f0fc]
signal flip_y_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l275_c7_f0fc]
signal tmp12_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l275_c7_f0fc]
signal is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l275_c7_f0fc]
signal auto_length_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l275_c7_f0fc]
signal is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l275_c7_f0fc]
signal result_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l275_c7_f0fc_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l275_c7_f0fc_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l275_c7_f0fc_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l275_c7_f0fc]
signal ctrl_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l275_c7_f0fc]
signal tmp16b_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l275_c7_f0fc]
signal auto_advance_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l275_c7_f0fc]
signal ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l275_c7_f0fc]
signal y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l275_c7_f0fc]
signal tmp4_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l275_c7_f0fc]
signal screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l275_c7_f0fc]
signal x_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l275_c7_f0fc]
signal tmp16_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l275_c7_f0fc]
signal ram_addr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l275_c7_f0fc]
signal color_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l275_c7_f0fc]
signal layer_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l275_c7_f0fc]
signal y_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l275_c7_f0fc]
signal x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l275_c7_f0fc]
signal ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l276_c3_e781]
signal BIN_OP_OR_uxn_device_h_l276_c3_e781_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l276_c3_e781_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l276_c3_e781_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l279_c11_82e7]
signal BIN_OP_EQ_uxn_device_h_l279_c11_82e7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c11_82e7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l284_c7_26da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l279_c7_f401]
signal flip_x_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l279_c7_f401]
signal flip_y_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l279_c7_f401]
signal tmp12_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l279_c7_f401]
signal is_last_blit_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l279_c7_f401]
signal auto_length_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l279_c7_f401]
signal is_blit_done_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l279_c7_f401]
signal result_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l279_c7_f401_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l279_c7_f401_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l279_c7_f401_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l279_c7_f401]
signal ctrl_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l279_c7_f401]
signal tmp16b_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l279_c7_f401]
signal auto_advance_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l279_c7_f401]
signal ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l279_c7_f401]
signal y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l279_c7_f401]
signal tmp4_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l279_c7_f401]
signal screen_blit_result_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l279_c7_f401_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l279_c7_f401]
signal x_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l279_c7_f401]
signal tmp16_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l279_c7_f401]
signal ram_addr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l279_c7_f401]
signal color_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l279_c7_f401]
signal layer_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l279_c7_f401]
signal y_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l279_c7_f401]
signal x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l279_c7_f401]
signal ctrl_mode_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l284_c11_abb5]
signal BIN_OP_EQ_uxn_device_h_l284_c11_abb5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l284_c11_abb5_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l288_c7_f54c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l284_c7_26da]
signal flip_x_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l284_c7_26da]
signal flip_y_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l284_c7_26da]
signal tmp12_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l284_c7_26da]
signal is_last_blit_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l284_c7_26da]
signal auto_length_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l284_c7_26da]
signal is_blit_done_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l284_c7_26da]
signal result_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l284_c7_26da_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l284_c7_26da_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l284_c7_26da_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l284_c7_26da]
signal ctrl_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l284_c7_26da]
signal tmp16b_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l284_c7_26da]
signal auto_advance_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l284_c7_26da]
signal ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l284_c7_26da]
signal y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l284_c7_26da]
signal tmp4_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l284_c7_26da]
signal screen_blit_result_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l284_c7_26da_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l284_c7_26da]
signal x_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l284_c7_26da]
signal tmp16_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l284_c7_26da]
signal ram_addr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l284_c7_26da]
signal color_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l284_c7_26da]
signal layer_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l284_c7_26da]
signal y_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l284_c7_26da]
signal x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l284_c7_26da]
signal ctrl_mode_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l285_c3_54ab]
signal BIN_OP_OR_uxn_device_h_l285_c3_54ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l285_c3_54ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l285_c3_54ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l288_c11_a602]
signal BIN_OP_EQ_uxn_device_h_l288_c11_a602_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l288_c11_a602_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l297_c7_fe26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l288_c7_f54c]
signal flip_x_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l288_c7_f54c]
signal flip_y_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l288_c7_f54c]
signal tmp12_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l288_c7_f54c]
signal is_last_blit_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l288_c7_f54c]
signal auto_length_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l288_c7_f54c]
signal is_blit_done_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l288_c7_f54c]
signal result_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l288_c7_f54c_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l288_c7_f54c_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l288_c7_f54c_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l288_c7_f54c]
signal ctrl_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l288_c7_f54c]
signal tmp16b_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l288_c7_f54c]
signal auto_advance_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l288_c7_f54c]
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l288_c7_f54c]
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l288_c7_f54c]
signal tmp4_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l288_c7_f54c]
signal screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l288_c7_f54c]
signal x_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l288_c7_f54c]
signal tmp16_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l288_c7_f54c]
signal ram_addr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l288_c7_f54c]
signal color_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l288_c7_f54c]
signal layer_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l288_c7_f54c]
signal y_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l288_c7_f54c]
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l288_c7_f54c]
signal ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l297_c11_94a8]
signal BIN_OP_EQ_uxn_device_h_l297_c11_94a8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c11_94a8_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_33e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l297_c7_fe26]
signal tmp12_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l297_c7_fe26]
signal is_last_blit_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l297_c7_fe26]
signal auto_length_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l297_c7_fe26]
signal is_blit_done_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l297_c7_fe26]
signal result_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l297_c7_fe26_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l297_c7_fe26_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l297_c7_fe26_return_output : device_out_result_t;

-- tmp16b_MUX[uxn_device_h_l297_c7_fe26]
signal tmp16b_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l297_c7_fe26]
signal auto_advance_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l297_c7_fe26]
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l297_c7_fe26]
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l297_c7_fe26]
signal tmp4_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l297_c7_fe26]
signal screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l297_c7_fe26]
signal x_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l297_c7_fe26]
signal tmp16_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l297_c7_fe26]
signal ram_addr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l297_c7_fe26]
signal y_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l297_c7_fe26]
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l302_c11_4eda]
signal BIN_OP_EQ_uxn_device_h_l302_c11_4eda_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_4eda_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l311_c1_c929]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l302_c7_33e1]
signal tmp12_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(11 downto 0);

-- is_last_blit_MUX[uxn_device_h_l302_c7_33e1]
signal is_last_blit_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(0 downto 0);

-- auto_length_MUX[uxn_device_h_l302_c7_33e1]
signal auto_length_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(3 downto 0);

-- is_blit_done_MUX[uxn_device_h_l302_c7_33e1]
signal is_blit_done_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l302_c7_33e1]
signal result_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l302_c7_33e1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l302_c7_33e1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l302_c7_33e1_return_output : device_out_result_t;

-- tmp16b_MUX[uxn_device_h_l302_c7_33e1]
signal tmp16b_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l302_c7_33e1]
signal auto_advance_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(7 downto 0);

-- ram_addr_incr_MUX[uxn_device_h_l302_c7_33e1]
signal ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l302_c7_33e1]
signal y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l302_c7_33e1]
signal tmp4_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l302_c7_33e1]
signal screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l302_c7_33e1]
signal x_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l302_c7_33e1]
signal tmp16_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l302_c7_33e1]
signal ram_addr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l302_c7_33e1]
signal y_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l302_c7_33e1]
signal x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l312_c18_3416]
signal BIN_OP_EQ_uxn_device_h_l312_c18_3416_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c18_3416_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c18_3416_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l312_c18_79a5]
signal MUX_uxn_device_h_l312_c18_79a5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l312_c18_79a5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l312_c18_79a5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l312_c18_79a5_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l314_c19_73d5]
signal MUX_uxn_device_h_l314_c19_73d5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l314_c19_73d5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l314_c19_73d5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l314_c19_73d5_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l315_c19_9ca3]
signal MUX_uxn_device_h_l315_c19_9ca3_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l315_c19_9ca3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l315_c19_9ca3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l315_c19_9ca3_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l316_c39_fef7]
signal MUX_uxn_device_h_l316_c39_fef7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l316_c39_fef7_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l316_c39_fef7_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l316_c39_fef7_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l316_c20_f0cb]
signal MUX_uxn_device_h_l316_c20_f0cb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l316_c20_f0cb_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l316_c20_f0cb_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l316_c20_f0cb_return_output : unsigned(15 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_bc41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l317_c3_5353]
signal is_last_blit_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l317_c3_5353]
signal result_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l317_c3_5353_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l317_c3_5353_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l317_c3_5353_return_output : device_out_result_t;

-- tmp16b_MUX[uxn_device_h_l317_c3_5353]
signal tmp16b_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l317_c3_5353]
signal tmp4_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(3 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l317_c3_5353]
signal screen_blit_result_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output : screen_blit_result_t;

-- x_MUX[uxn_device_h_l317_c3_5353]
signal x_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l317_c3_5353]
signal tmp16_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l317_c3_5353]
signal ram_addr_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l317_c3_5353]
signal y_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l318_c8_7b73]
signal BIN_OP_EQ_uxn_device_h_l318_c8_7b73_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l318_c8_7b73_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l318_c4_0beb]
signal result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l318_c4_0beb]
signal result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l318_c4_0beb]
signal result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l318_c4_0beb]
signal result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l318_c4_0beb]
signal result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l318_c4_0beb]
signal result_u8_value_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(7 downto 0);

-- tmp16b_MUX[uxn_device_h_l318_c4_0beb]
signal tmp16b_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l318_c4_0beb]
signal tmp4_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l318_c4_0beb]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l318_c4_0beb]
signal x_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_device_h_l318_c4_0beb]
signal tmp16_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l318_c4_0beb]
signal ram_addr_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l318_c4_0beb]
signal y_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l319_c23_cac0]
signal BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l319_c49_c9db]
signal BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l319_c13_1a4d]
signal MUX_uxn_device_h_l319_c13_1a4d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l319_c13_1a4d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l319_c13_1a4d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l319_c13_1a4d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l320_c24_af41]
signal BIN_OP_MINUS_uxn_device_h_l320_c24_af41_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l320_c24_af41_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l320_c24_af41_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l320_c51_a137]
signal BIN_OP_PLUS_uxn_device_h_l320_c51_a137_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l320_c51_a137_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l320_c51_a137_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l320_c14_b2e5]
signal MUX_uxn_device_h_l320_c14_b2e5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l320_c14_b2e5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l320_c14_b2e5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l320_c14_b2e5_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l321_c36_e4fe]
signal BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l321_c58_7345]
signal BIN_OP_PLUS_uxn_device_h_l321_c58_7345_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l321_c58_7345_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l321_c58_7345_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l321_c26_998e]
signal MUX_uxn_device_h_l321_c26_998e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l321_c26_998e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l321_c26_998e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l321_c26_998e_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l321_c10_a259]
signal MUX_uxn_device_h_l321_c10_a259_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l321_c10_a259_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l321_c10_a259_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l321_c10_a259_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l322_c36_5880]
signal BIN_OP_MINUS_uxn_device_h_l322_c36_5880_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l322_c36_5880_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l322_c36_5880_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l322_c58_4c1c]
signal BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l322_c26_b0a5]
signal MUX_uxn_device_h_l322_c26_b0a5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l322_c26_b0a5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l322_c26_b0a5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l322_c26_b0a5_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l322_c10_c015]
signal MUX_uxn_device_h_l322_c10_c015_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l322_c10_c015_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l322_c10_c015_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l322_c10_c015_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l327_c33_c536]
signal CONST_SR_8_uxn_device_h_l327_c33_c536_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l327_c33_c536_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l329_c22_4ebc]
signal BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l329_c13_bceb]
signal BIN_OP_EQ_uxn_device_h_l329_c13_bceb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l329_c13_bceb_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l329_c9_3e5b]
signal result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l329_c9_3e5b]
signal result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l329_c9_3e5b]
signal result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l329_c9_3e5b]
signal result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l329_c9_3e5b]
signal tmp4_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l329_c9_3e5b]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l329_c9_3e5b]
signal ram_addr_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l334_c22_ae26]
signal BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l334_c13_b52a]
signal BIN_OP_EQ_uxn_device_h_l334_c13_b52a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l334_c13_b52a_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l334_c9_7cb6]
signal result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l334_c9_7cb6]
signal result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l334_c9_7cb6]
signal result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l334_c9_7cb6]
signal result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l334_c9_7cb6]
signal tmp4_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l334_c9_7cb6]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l334_c9_7cb6]
signal ram_addr_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l337_c33_0bf8]
signal CONST_SR_8_uxn_device_h_l337_c33_0bf8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l337_c33_0bf8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l339_c22_12fd]
signal BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l339_c13_2142]
signal BIN_OP_EQ_uxn_device_h_l339_c13_2142_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c13_2142_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l339_c9_ef7f]
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l339_c9_ef7f]
signal result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l339_c9_ef7f]
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l339_c9_ef7f]
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l339_c9_ef7f]
signal tmp4_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l339_c9_ef7f]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l339_c9_ef7f]
signal ram_addr_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l344_c22_9a01]
signal BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l344_c13_b92c]
signal BIN_OP_EQ_uxn_device_h_l344_c13_b92c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c13_b92c_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l344_c9_6535]
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l344_c9_6535]
signal result_u8_value_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l344_c9_6535]
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l344_c9_6535]
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l344_c9_6535]
signal tmp4_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l344_c9_6535]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l344_c9_6535]
signal ram_addr_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l348_c22_637e]
signal BIN_OP_MINUS_uxn_device_h_l348_c22_637e_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l348_c22_637e_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l348_c22_637e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l348_c13_d3b1]
signal BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l348_c9_698c]
signal result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l348_c9_698c]
signal result_u8_value_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l348_c9_698c]
signal result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l348_c9_698c]
signal result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l348_c9_698c]
signal tmp4_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l348_c9_698c]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l348_c9_698c]
signal ram_addr_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l352_c22_e57e]
signal BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l352_c13_a76e]
signal BIN_OP_EQ_uxn_device_h_l352_c13_a76e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l352_c13_a76e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l352_c9_c4e2]
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l352_c9_c4e2]
signal result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l352_c9_c4e2]
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l352_c9_c4e2]
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l352_c9_c4e2]
signal tmp4_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l352_c9_c4e2]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l352_c9_c4e2]
signal ram_addr_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l356_c22_9db6]
signal BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l356_c13_c95a]
signal BIN_OP_EQ_uxn_device_h_l356_c13_c95a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l356_c13_c95a_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l356_c9_deb3]
signal result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l356_c9_deb3]
signal result_u8_value_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l356_c9_deb3]
signal result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l356_c9_deb3]
signal result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l356_c9_deb3]
signal tmp4_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l356_c9_deb3]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(0 downto 0);

-- ram_addr_MUX[uxn_device_h_l356_c9_deb3]
signal ram_addr_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l358_c5_2cef]
signal BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l361_c33_95d7]
signal CONST_SR_8_uxn_device_h_l361_c33_95d7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l361_c33_95d7_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l363_c22_230b]
signal BIN_OP_MINUS_uxn_device_h_l363_c22_230b_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l363_c22_230b_right : unsigned(3 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l363_c22_230b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l363_c13_b8a6]
signal BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l363_c9_2091]
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l363_c9_2091]
signal result_u8_value_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l363_c9_2091]
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l363_c9_2091]
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l363_c9_2091]
signal tmp4_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l363_c9_2091]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l368_c22_e689]
signal BIN_OP_MINUS_uxn_device_h_l368_c22_e689_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l368_c22_e689_right : unsigned(3 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l368_c22_e689_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l368_c13_1fca]
signal BIN_OP_EQ_uxn_device_h_l368_c13_1fca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l368_c13_1fca_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l368_c9_7542]
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l368_c9_7542]
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l368_c9_7542]
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l368_c9_7542]
signal tmp4_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l368_c9_7542]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l369_c5_e819]
signal BIN_OP_PLUS_uxn_device_h_l369_c5_e819_left : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l369_c5_e819_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l369_c5_e819_return_output : unsigned(4 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l376_c1_5e60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l378_c1_4bb8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l376_c4_fe0d]
signal screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output : screen_blit_result_t;

-- screen_2bpp[uxn_device_h_l377_c26_5b73]
signal screen_2bpp_uxn_device_h_l377_c26_5b73_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_phase : unsigned(11 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_x1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_y1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_color : unsigned(3 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_fx : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_fy : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_ram_addr : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_previous_ram_read : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_5b73_return_output : screen_blit_result_t;

-- screen_1bpp[uxn_device_h_l379_c26_1515]
signal screen_1bpp_uxn_device_h_l379_c26_1515_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_phase : unsigned(11 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_x1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_y1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_color : unsigned(3 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_fx : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_fy : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_ram_addr : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_previous_ram_read : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_1515_return_output : screen_blit_result_t;

-- BIN_OP_EQ[uxn_device_h_l388_c19_69f2]
signal BIN_OP_EQ_uxn_device_h_l388_c19_69f2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l388_c19_69f2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l388_c19_69f2_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l388_c19_a30a]
signal MUX_uxn_device_h_l388_c19_a30a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c19_a30a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c19_a30a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c19_a30a_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_device_h_l391_c11_bb51]
signal BIN_OP_XOR_uxn_device_h_l391_c11_bb51_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l391_c11_bb51_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l391_c11_bb51_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l391_c60_ded9]
signal BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_return_output : unsigned(12 downto 0);

-- MUX[uxn_device_h_l391_c11_358b]
signal MUX_uxn_device_h_l391_c11_358b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l391_c11_358b_iftrue : unsigned(11 downto 0);
signal MUX_uxn_device_h_l391_c11_358b_iffalse : unsigned(11 downto 0);
signal MUX_uxn_device_h_l391_c11_358b_return_output : unsigned(11 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82
signal CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output : unsigned(11 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_8b59( ref_toks_0 : device_out_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.is_deo_done := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.u16_addr := ref_toks_5;
      base.u8_value := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l260_c6_2fcd
BIN_OP_EQ_uxn_device_h_l260_c6_2fcd : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_left,
BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_right,
BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- flip_x_MUX_uxn_device_h_l260_c2_fd3e
flip_x_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l260_c2_fd3e_cond,
flip_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
flip_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
flip_x_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- flip_y_MUX_uxn_device_h_l260_c2_fd3e
flip_y_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l260_c2_fd3e_cond,
flip_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
flip_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
flip_y_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- tmp12_MUX_uxn_device_h_l260_c2_fd3e
tmp12_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l260_c2_fd3e_cond,
tmp12_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
tmp12_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
tmp12_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- is_last_blit_MUX_uxn_device_h_l260_c2_fd3e
is_last_blit_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_cond,
is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- auto_length_MUX_uxn_device_h_l260_c2_fd3e
auto_length_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l260_c2_fd3e_cond,
auto_length_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
auto_length_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
auto_length_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- is_blit_done_MUX_uxn_device_h_l260_c2_fd3e
is_blit_done_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_cond,
is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- result_MUX_uxn_device_h_l260_c2_fd3e
result_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l260_c2_fd3e_cond,
result_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
result_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
result_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- ctrl_MUX_uxn_device_h_l260_c2_fd3e
ctrl_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l260_c2_fd3e_cond,
ctrl_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
ctrl_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
ctrl_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- tmp16b_MUX_uxn_device_h_l260_c2_fd3e
tmp16b_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l260_c2_fd3e_cond,
tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
tmp16b_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- auto_advance_MUX_uxn_device_h_l260_c2_fd3e
auto_advance_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l260_c2_fd3e_cond,
auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
auto_advance_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e
ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_cond,
ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e
y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond,
y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- tmp4_MUX_uxn_device_h_l260_c2_fd3e
tmp4_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l260_c2_fd3e_cond,
tmp4_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
tmp4_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
tmp4_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e
screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_cond,
screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- x_MUX_uxn_device_h_l260_c2_fd3e
x_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l260_c2_fd3e_cond,
x_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
x_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
x_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- tmp16_MUX_uxn_device_h_l260_c2_fd3e
tmp16_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l260_c2_fd3e_cond,
tmp16_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
tmp16_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
tmp16_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- ram_addr_MUX_uxn_device_h_l260_c2_fd3e
ram_addr_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l260_c2_fd3e_cond,
ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
ram_addr_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- color_MUX_uxn_device_h_l260_c2_fd3e
color_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l260_c2_fd3e_cond,
color_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
color_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
color_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- layer_MUX_uxn_device_h_l260_c2_fd3e
layer_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l260_c2_fd3e_cond,
layer_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
layer_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
layer_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- y_MUX_uxn_device_h_l260_c2_fd3e
y_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l260_c2_fd3e_cond,
y_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
y_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
y_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e
x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond,
x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e
ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_cond,
ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iftrue,
ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iffalse,
ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_return_output);

-- BIN_OP_EQ_uxn_device_h_l267_c11_9c98
BIN_OP_EQ_uxn_device_h_l267_c11_9c98 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l267_c11_9c98_left,
BIN_OP_EQ_uxn_device_h_l267_c11_9c98_right,
BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- flip_x_MUX_uxn_device_h_l267_c7_eeba
flip_x_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l267_c7_eeba_cond,
flip_x_MUX_uxn_device_h_l267_c7_eeba_iftrue,
flip_x_MUX_uxn_device_h_l267_c7_eeba_iffalse,
flip_x_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- flip_y_MUX_uxn_device_h_l267_c7_eeba
flip_y_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l267_c7_eeba_cond,
flip_y_MUX_uxn_device_h_l267_c7_eeba_iftrue,
flip_y_MUX_uxn_device_h_l267_c7_eeba_iffalse,
flip_y_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- tmp12_MUX_uxn_device_h_l267_c7_eeba
tmp12_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l267_c7_eeba_cond,
tmp12_MUX_uxn_device_h_l267_c7_eeba_iftrue,
tmp12_MUX_uxn_device_h_l267_c7_eeba_iffalse,
tmp12_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- is_last_blit_MUX_uxn_device_h_l267_c7_eeba
is_last_blit_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l267_c7_eeba_cond,
is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iftrue,
is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iffalse,
is_last_blit_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- auto_length_MUX_uxn_device_h_l267_c7_eeba
auto_length_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l267_c7_eeba_cond,
auto_length_MUX_uxn_device_h_l267_c7_eeba_iftrue,
auto_length_MUX_uxn_device_h_l267_c7_eeba_iffalse,
auto_length_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- is_blit_done_MUX_uxn_device_h_l267_c7_eeba
is_blit_done_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l267_c7_eeba_cond,
is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iftrue,
is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iffalse,
is_blit_done_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- result_MUX_uxn_device_h_l267_c7_eeba
result_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l267_c7_eeba_cond,
result_MUX_uxn_device_h_l267_c7_eeba_iftrue,
result_MUX_uxn_device_h_l267_c7_eeba_iffalse,
result_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- ctrl_MUX_uxn_device_h_l267_c7_eeba
ctrl_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l267_c7_eeba_cond,
ctrl_MUX_uxn_device_h_l267_c7_eeba_iftrue,
ctrl_MUX_uxn_device_h_l267_c7_eeba_iffalse,
ctrl_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- tmp16b_MUX_uxn_device_h_l267_c7_eeba
tmp16b_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l267_c7_eeba_cond,
tmp16b_MUX_uxn_device_h_l267_c7_eeba_iftrue,
tmp16b_MUX_uxn_device_h_l267_c7_eeba_iffalse,
tmp16b_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- auto_advance_MUX_uxn_device_h_l267_c7_eeba
auto_advance_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l267_c7_eeba_cond,
auto_advance_MUX_uxn_device_h_l267_c7_eeba_iftrue,
auto_advance_MUX_uxn_device_h_l267_c7_eeba_iffalse,
auto_advance_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba
ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_cond,
ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue,
ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse,
ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba
y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond,
y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue,
y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse,
y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- tmp4_MUX_uxn_device_h_l267_c7_eeba
tmp4_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l267_c7_eeba_cond,
tmp4_MUX_uxn_device_h_l267_c7_eeba_iftrue,
tmp4_MUX_uxn_device_h_l267_c7_eeba_iffalse,
tmp4_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- screen_blit_result_MUX_uxn_device_h_l267_c7_eeba
screen_blit_result_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_cond,
screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iftrue,
screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iffalse,
screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- x_MUX_uxn_device_h_l267_c7_eeba
x_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l267_c7_eeba_cond,
x_MUX_uxn_device_h_l267_c7_eeba_iftrue,
x_MUX_uxn_device_h_l267_c7_eeba_iffalse,
x_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- tmp16_MUX_uxn_device_h_l267_c7_eeba
tmp16_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l267_c7_eeba_cond,
tmp16_MUX_uxn_device_h_l267_c7_eeba_iftrue,
tmp16_MUX_uxn_device_h_l267_c7_eeba_iffalse,
tmp16_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- ram_addr_MUX_uxn_device_h_l267_c7_eeba
ram_addr_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l267_c7_eeba_cond,
ram_addr_MUX_uxn_device_h_l267_c7_eeba_iftrue,
ram_addr_MUX_uxn_device_h_l267_c7_eeba_iffalse,
ram_addr_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- color_MUX_uxn_device_h_l267_c7_eeba
color_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l267_c7_eeba_cond,
color_MUX_uxn_device_h_l267_c7_eeba_iftrue,
color_MUX_uxn_device_h_l267_c7_eeba_iffalse,
color_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- layer_MUX_uxn_device_h_l267_c7_eeba
layer_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l267_c7_eeba_cond,
layer_MUX_uxn_device_h_l267_c7_eeba_iftrue,
layer_MUX_uxn_device_h_l267_c7_eeba_iffalse,
layer_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- y_MUX_uxn_device_h_l267_c7_eeba
y_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l267_c7_eeba_cond,
y_MUX_uxn_device_h_l267_c7_eeba_iftrue,
y_MUX_uxn_device_h_l267_c7_eeba_iffalse,
y_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba
x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond,
x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue,
x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse,
x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- ctrl_mode_MUX_uxn_device_h_l267_c7_eeba
ctrl_mode_MUX_uxn_device_h_l267_c7_eeba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_cond,
ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iftrue,
ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iffalse,
ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_return_output);

-- BIN_OP_EQ_uxn_device_h_l270_c11_b365
BIN_OP_EQ_uxn_device_h_l270_c11_b365 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l270_c11_b365_left,
BIN_OP_EQ_uxn_device_h_l270_c11_b365_right,
BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- flip_x_MUX_uxn_device_h_l270_c7_86b1
flip_x_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l270_c7_86b1_cond,
flip_x_MUX_uxn_device_h_l270_c7_86b1_iftrue,
flip_x_MUX_uxn_device_h_l270_c7_86b1_iffalse,
flip_x_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- flip_y_MUX_uxn_device_h_l270_c7_86b1
flip_y_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l270_c7_86b1_cond,
flip_y_MUX_uxn_device_h_l270_c7_86b1_iftrue,
flip_y_MUX_uxn_device_h_l270_c7_86b1_iffalse,
flip_y_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- tmp12_MUX_uxn_device_h_l270_c7_86b1
tmp12_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l270_c7_86b1_cond,
tmp12_MUX_uxn_device_h_l270_c7_86b1_iftrue,
tmp12_MUX_uxn_device_h_l270_c7_86b1_iffalse,
tmp12_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- is_last_blit_MUX_uxn_device_h_l270_c7_86b1
is_last_blit_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l270_c7_86b1_cond,
is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iftrue,
is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iffalse,
is_last_blit_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- auto_length_MUX_uxn_device_h_l270_c7_86b1
auto_length_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l270_c7_86b1_cond,
auto_length_MUX_uxn_device_h_l270_c7_86b1_iftrue,
auto_length_MUX_uxn_device_h_l270_c7_86b1_iffalse,
auto_length_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- is_blit_done_MUX_uxn_device_h_l270_c7_86b1
is_blit_done_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l270_c7_86b1_cond,
is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iftrue,
is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iffalse,
is_blit_done_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- result_MUX_uxn_device_h_l270_c7_86b1
result_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l270_c7_86b1_cond,
result_MUX_uxn_device_h_l270_c7_86b1_iftrue,
result_MUX_uxn_device_h_l270_c7_86b1_iffalse,
result_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- ctrl_MUX_uxn_device_h_l270_c7_86b1
ctrl_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l270_c7_86b1_cond,
ctrl_MUX_uxn_device_h_l270_c7_86b1_iftrue,
ctrl_MUX_uxn_device_h_l270_c7_86b1_iffalse,
ctrl_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- tmp16b_MUX_uxn_device_h_l270_c7_86b1
tmp16b_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l270_c7_86b1_cond,
tmp16b_MUX_uxn_device_h_l270_c7_86b1_iftrue,
tmp16b_MUX_uxn_device_h_l270_c7_86b1_iffalse,
tmp16b_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- auto_advance_MUX_uxn_device_h_l270_c7_86b1
auto_advance_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l270_c7_86b1_cond,
auto_advance_MUX_uxn_device_h_l270_c7_86b1_iftrue,
auto_advance_MUX_uxn_device_h_l270_c7_86b1_iffalse,
auto_advance_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1
ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_cond,
ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue,
ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse,
ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1
y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond,
y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue,
y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse,
y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- tmp4_MUX_uxn_device_h_l270_c7_86b1
tmp4_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l270_c7_86b1_cond,
tmp4_MUX_uxn_device_h_l270_c7_86b1_iftrue,
tmp4_MUX_uxn_device_h_l270_c7_86b1_iffalse,
tmp4_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- screen_blit_result_MUX_uxn_device_h_l270_c7_86b1
screen_blit_result_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_cond,
screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iftrue,
screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iffalse,
screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- x_MUX_uxn_device_h_l270_c7_86b1
x_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l270_c7_86b1_cond,
x_MUX_uxn_device_h_l270_c7_86b1_iftrue,
x_MUX_uxn_device_h_l270_c7_86b1_iffalse,
x_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- tmp16_MUX_uxn_device_h_l270_c7_86b1
tmp16_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l270_c7_86b1_cond,
tmp16_MUX_uxn_device_h_l270_c7_86b1_iftrue,
tmp16_MUX_uxn_device_h_l270_c7_86b1_iffalse,
tmp16_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- ram_addr_MUX_uxn_device_h_l270_c7_86b1
ram_addr_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l270_c7_86b1_cond,
ram_addr_MUX_uxn_device_h_l270_c7_86b1_iftrue,
ram_addr_MUX_uxn_device_h_l270_c7_86b1_iffalse,
ram_addr_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- color_MUX_uxn_device_h_l270_c7_86b1
color_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l270_c7_86b1_cond,
color_MUX_uxn_device_h_l270_c7_86b1_iftrue,
color_MUX_uxn_device_h_l270_c7_86b1_iffalse,
color_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- layer_MUX_uxn_device_h_l270_c7_86b1
layer_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l270_c7_86b1_cond,
layer_MUX_uxn_device_h_l270_c7_86b1_iftrue,
layer_MUX_uxn_device_h_l270_c7_86b1_iffalse,
layer_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- y_MUX_uxn_device_h_l270_c7_86b1
y_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l270_c7_86b1_cond,
y_MUX_uxn_device_h_l270_c7_86b1_iftrue,
y_MUX_uxn_device_h_l270_c7_86b1_iffalse,
y_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1
x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond,
x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue,
x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse,
x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- ctrl_mode_MUX_uxn_device_h_l270_c7_86b1
ctrl_mode_MUX_uxn_device_h_l270_c7_86b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_cond,
ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iftrue,
ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iffalse,
ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_return_output);

-- BIN_OP_EQ_uxn_device_h_l275_c11_a99d
BIN_OP_EQ_uxn_device_h_l275_c11_a99d : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l275_c11_a99d_left,
BIN_OP_EQ_uxn_device_h_l275_c11_a99d_right,
BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_return_output);

-- flip_x_MUX_uxn_device_h_l275_c7_f0fc
flip_x_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l275_c7_f0fc_cond,
flip_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
flip_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
flip_x_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- flip_y_MUX_uxn_device_h_l275_c7_f0fc
flip_y_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l275_c7_f0fc_cond,
flip_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
flip_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
flip_y_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- tmp12_MUX_uxn_device_h_l275_c7_f0fc
tmp12_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l275_c7_f0fc_cond,
tmp12_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
tmp12_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
tmp12_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- is_last_blit_MUX_uxn_device_h_l275_c7_f0fc
is_last_blit_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_cond,
is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- auto_length_MUX_uxn_device_h_l275_c7_f0fc
auto_length_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l275_c7_f0fc_cond,
auto_length_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
auto_length_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
auto_length_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- is_blit_done_MUX_uxn_device_h_l275_c7_f0fc
is_blit_done_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_cond,
is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- result_MUX_uxn_device_h_l275_c7_f0fc
result_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l275_c7_f0fc_cond,
result_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
result_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
result_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- ctrl_MUX_uxn_device_h_l275_c7_f0fc
ctrl_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l275_c7_f0fc_cond,
ctrl_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
ctrl_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
ctrl_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- tmp16b_MUX_uxn_device_h_l275_c7_f0fc
tmp16b_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l275_c7_f0fc_cond,
tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
tmp16b_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- auto_advance_MUX_uxn_device_h_l275_c7_f0fc
auto_advance_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l275_c7_f0fc_cond,
auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
auto_advance_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc
ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_cond,
ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc
y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond,
y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- tmp4_MUX_uxn_device_h_l275_c7_f0fc
tmp4_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l275_c7_f0fc_cond,
tmp4_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
tmp4_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
tmp4_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc
screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_cond,
screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- x_MUX_uxn_device_h_l275_c7_f0fc
x_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l275_c7_f0fc_cond,
x_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
x_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
x_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- tmp16_MUX_uxn_device_h_l275_c7_f0fc
tmp16_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l275_c7_f0fc_cond,
tmp16_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
tmp16_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
tmp16_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- ram_addr_MUX_uxn_device_h_l275_c7_f0fc
ram_addr_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l275_c7_f0fc_cond,
ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
ram_addr_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- color_MUX_uxn_device_h_l275_c7_f0fc
color_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l275_c7_f0fc_cond,
color_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
color_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
color_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- layer_MUX_uxn_device_h_l275_c7_f0fc
layer_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l275_c7_f0fc_cond,
layer_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
layer_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
layer_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- y_MUX_uxn_device_h_l275_c7_f0fc
y_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l275_c7_f0fc_cond,
y_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
y_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
y_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc
x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond,
x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc
ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_cond,
ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iftrue,
ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iffalse,
ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_return_output);

-- BIN_OP_OR_uxn_device_h_l276_c3_e781
BIN_OP_OR_uxn_device_h_l276_c3_e781 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l276_c3_e781_left,
BIN_OP_OR_uxn_device_h_l276_c3_e781_right,
BIN_OP_OR_uxn_device_h_l276_c3_e781_return_output);

-- BIN_OP_EQ_uxn_device_h_l279_c11_82e7
BIN_OP_EQ_uxn_device_h_l279_c11_82e7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l279_c11_82e7_left,
BIN_OP_EQ_uxn_device_h_l279_c11_82e7_right,
BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_return_output);

-- flip_x_MUX_uxn_device_h_l279_c7_f401
flip_x_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l279_c7_f401_cond,
flip_x_MUX_uxn_device_h_l279_c7_f401_iftrue,
flip_x_MUX_uxn_device_h_l279_c7_f401_iffalse,
flip_x_MUX_uxn_device_h_l279_c7_f401_return_output);

-- flip_y_MUX_uxn_device_h_l279_c7_f401
flip_y_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l279_c7_f401_cond,
flip_y_MUX_uxn_device_h_l279_c7_f401_iftrue,
flip_y_MUX_uxn_device_h_l279_c7_f401_iffalse,
flip_y_MUX_uxn_device_h_l279_c7_f401_return_output);

-- tmp12_MUX_uxn_device_h_l279_c7_f401
tmp12_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l279_c7_f401_cond,
tmp12_MUX_uxn_device_h_l279_c7_f401_iftrue,
tmp12_MUX_uxn_device_h_l279_c7_f401_iffalse,
tmp12_MUX_uxn_device_h_l279_c7_f401_return_output);

-- is_last_blit_MUX_uxn_device_h_l279_c7_f401
is_last_blit_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l279_c7_f401_cond,
is_last_blit_MUX_uxn_device_h_l279_c7_f401_iftrue,
is_last_blit_MUX_uxn_device_h_l279_c7_f401_iffalse,
is_last_blit_MUX_uxn_device_h_l279_c7_f401_return_output);

-- auto_length_MUX_uxn_device_h_l279_c7_f401
auto_length_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l279_c7_f401_cond,
auto_length_MUX_uxn_device_h_l279_c7_f401_iftrue,
auto_length_MUX_uxn_device_h_l279_c7_f401_iffalse,
auto_length_MUX_uxn_device_h_l279_c7_f401_return_output);

-- is_blit_done_MUX_uxn_device_h_l279_c7_f401
is_blit_done_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l279_c7_f401_cond,
is_blit_done_MUX_uxn_device_h_l279_c7_f401_iftrue,
is_blit_done_MUX_uxn_device_h_l279_c7_f401_iffalse,
is_blit_done_MUX_uxn_device_h_l279_c7_f401_return_output);

-- result_MUX_uxn_device_h_l279_c7_f401
result_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l279_c7_f401_cond,
result_MUX_uxn_device_h_l279_c7_f401_iftrue,
result_MUX_uxn_device_h_l279_c7_f401_iffalse,
result_MUX_uxn_device_h_l279_c7_f401_return_output);

-- ctrl_MUX_uxn_device_h_l279_c7_f401
ctrl_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l279_c7_f401_cond,
ctrl_MUX_uxn_device_h_l279_c7_f401_iftrue,
ctrl_MUX_uxn_device_h_l279_c7_f401_iffalse,
ctrl_MUX_uxn_device_h_l279_c7_f401_return_output);

-- tmp16b_MUX_uxn_device_h_l279_c7_f401
tmp16b_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l279_c7_f401_cond,
tmp16b_MUX_uxn_device_h_l279_c7_f401_iftrue,
tmp16b_MUX_uxn_device_h_l279_c7_f401_iffalse,
tmp16b_MUX_uxn_device_h_l279_c7_f401_return_output);

-- auto_advance_MUX_uxn_device_h_l279_c7_f401
auto_advance_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l279_c7_f401_cond,
auto_advance_MUX_uxn_device_h_l279_c7_f401_iftrue,
auto_advance_MUX_uxn_device_h_l279_c7_f401_iffalse,
auto_advance_MUX_uxn_device_h_l279_c7_f401_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l279_c7_f401
ram_addr_incr_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_cond,
ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iftrue,
ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iffalse,
ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l279_c7_f401
y_sprite_incr_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond,
y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue,
y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse,
y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output);

-- tmp4_MUX_uxn_device_h_l279_c7_f401
tmp4_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l279_c7_f401_cond,
tmp4_MUX_uxn_device_h_l279_c7_f401_iftrue,
tmp4_MUX_uxn_device_h_l279_c7_f401_iffalse,
tmp4_MUX_uxn_device_h_l279_c7_f401_return_output);

-- screen_blit_result_MUX_uxn_device_h_l279_c7_f401
screen_blit_result_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l279_c7_f401_cond,
screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iftrue,
screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iffalse,
screen_blit_result_MUX_uxn_device_h_l279_c7_f401_return_output);

-- x_MUX_uxn_device_h_l279_c7_f401
x_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l279_c7_f401_cond,
x_MUX_uxn_device_h_l279_c7_f401_iftrue,
x_MUX_uxn_device_h_l279_c7_f401_iffalse,
x_MUX_uxn_device_h_l279_c7_f401_return_output);

-- tmp16_MUX_uxn_device_h_l279_c7_f401
tmp16_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l279_c7_f401_cond,
tmp16_MUX_uxn_device_h_l279_c7_f401_iftrue,
tmp16_MUX_uxn_device_h_l279_c7_f401_iffalse,
tmp16_MUX_uxn_device_h_l279_c7_f401_return_output);

-- ram_addr_MUX_uxn_device_h_l279_c7_f401
ram_addr_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l279_c7_f401_cond,
ram_addr_MUX_uxn_device_h_l279_c7_f401_iftrue,
ram_addr_MUX_uxn_device_h_l279_c7_f401_iffalse,
ram_addr_MUX_uxn_device_h_l279_c7_f401_return_output);

-- color_MUX_uxn_device_h_l279_c7_f401
color_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l279_c7_f401_cond,
color_MUX_uxn_device_h_l279_c7_f401_iftrue,
color_MUX_uxn_device_h_l279_c7_f401_iffalse,
color_MUX_uxn_device_h_l279_c7_f401_return_output);

-- layer_MUX_uxn_device_h_l279_c7_f401
layer_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l279_c7_f401_cond,
layer_MUX_uxn_device_h_l279_c7_f401_iftrue,
layer_MUX_uxn_device_h_l279_c7_f401_iffalse,
layer_MUX_uxn_device_h_l279_c7_f401_return_output);

-- y_MUX_uxn_device_h_l279_c7_f401
y_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l279_c7_f401_cond,
y_MUX_uxn_device_h_l279_c7_f401_iftrue,
y_MUX_uxn_device_h_l279_c7_f401_iffalse,
y_MUX_uxn_device_h_l279_c7_f401_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l279_c7_f401
x_sprite_incr_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond,
x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue,
x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse,
x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output);

-- ctrl_mode_MUX_uxn_device_h_l279_c7_f401
ctrl_mode_MUX_uxn_device_h_l279_c7_f401 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l279_c7_f401_cond,
ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iftrue,
ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iffalse,
ctrl_mode_MUX_uxn_device_h_l279_c7_f401_return_output);

-- BIN_OP_EQ_uxn_device_h_l284_c11_abb5
BIN_OP_EQ_uxn_device_h_l284_c11_abb5 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l284_c11_abb5_left,
BIN_OP_EQ_uxn_device_h_l284_c11_abb5_right,
BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- flip_x_MUX_uxn_device_h_l284_c7_26da
flip_x_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l284_c7_26da_cond,
flip_x_MUX_uxn_device_h_l284_c7_26da_iftrue,
flip_x_MUX_uxn_device_h_l284_c7_26da_iffalse,
flip_x_MUX_uxn_device_h_l284_c7_26da_return_output);

-- flip_y_MUX_uxn_device_h_l284_c7_26da
flip_y_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l284_c7_26da_cond,
flip_y_MUX_uxn_device_h_l284_c7_26da_iftrue,
flip_y_MUX_uxn_device_h_l284_c7_26da_iffalse,
flip_y_MUX_uxn_device_h_l284_c7_26da_return_output);

-- tmp12_MUX_uxn_device_h_l284_c7_26da
tmp12_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l284_c7_26da_cond,
tmp12_MUX_uxn_device_h_l284_c7_26da_iftrue,
tmp12_MUX_uxn_device_h_l284_c7_26da_iffalse,
tmp12_MUX_uxn_device_h_l284_c7_26da_return_output);

-- is_last_blit_MUX_uxn_device_h_l284_c7_26da
is_last_blit_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l284_c7_26da_cond,
is_last_blit_MUX_uxn_device_h_l284_c7_26da_iftrue,
is_last_blit_MUX_uxn_device_h_l284_c7_26da_iffalse,
is_last_blit_MUX_uxn_device_h_l284_c7_26da_return_output);

-- auto_length_MUX_uxn_device_h_l284_c7_26da
auto_length_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l284_c7_26da_cond,
auto_length_MUX_uxn_device_h_l284_c7_26da_iftrue,
auto_length_MUX_uxn_device_h_l284_c7_26da_iffalse,
auto_length_MUX_uxn_device_h_l284_c7_26da_return_output);

-- is_blit_done_MUX_uxn_device_h_l284_c7_26da
is_blit_done_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l284_c7_26da_cond,
is_blit_done_MUX_uxn_device_h_l284_c7_26da_iftrue,
is_blit_done_MUX_uxn_device_h_l284_c7_26da_iffalse,
is_blit_done_MUX_uxn_device_h_l284_c7_26da_return_output);

-- result_MUX_uxn_device_h_l284_c7_26da
result_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l284_c7_26da_cond,
result_MUX_uxn_device_h_l284_c7_26da_iftrue,
result_MUX_uxn_device_h_l284_c7_26da_iffalse,
result_MUX_uxn_device_h_l284_c7_26da_return_output);

-- ctrl_MUX_uxn_device_h_l284_c7_26da
ctrl_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l284_c7_26da_cond,
ctrl_MUX_uxn_device_h_l284_c7_26da_iftrue,
ctrl_MUX_uxn_device_h_l284_c7_26da_iffalse,
ctrl_MUX_uxn_device_h_l284_c7_26da_return_output);

-- tmp16b_MUX_uxn_device_h_l284_c7_26da
tmp16b_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l284_c7_26da_cond,
tmp16b_MUX_uxn_device_h_l284_c7_26da_iftrue,
tmp16b_MUX_uxn_device_h_l284_c7_26da_iffalse,
tmp16b_MUX_uxn_device_h_l284_c7_26da_return_output);

-- auto_advance_MUX_uxn_device_h_l284_c7_26da
auto_advance_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l284_c7_26da_cond,
auto_advance_MUX_uxn_device_h_l284_c7_26da_iftrue,
auto_advance_MUX_uxn_device_h_l284_c7_26da_iffalse,
auto_advance_MUX_uxn_device_h_l284_c7_26da_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l284_c7_26da
ram_addr_incr_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_cond,
ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iftrue,
ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iffalse,
ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l284_c7_26da
y_sprite_incr_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond,
y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue,
y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse,
y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output);

-- tmp4_MUX_uxn_device_h_l284_c7_26da
tmp4_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l284_c7_26da_cond,
tmp4_MUX_uxn_device_h_l284_c7_26da_iftrue,
tmp4_MUX_uxn_device_h_l284_c7_26da_iffalse,
tmp4_MUX_uxn_device_h_l284_c7_26da_return_output);

-- screen_blit_result_MUX_uxn_device_h_l284_c7_26da
screen_blit_result_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l284_c7_26da_cond,
screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iftrue,
screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iffalse,
screen_blit_result_MUX_uxn_device_h_l284_c7_26da_return_output);

-- x_MUX_uxn_device_h_l284_c7_26da
x_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l284_c7_26da_cond,
x_MUX_uxn_device_h_l284_c7_26da_iftrue,
x_MUX_uxn_device_h_l284_c7_26da_iffalse,
x_MUX_uxn_device_h_l284_c7_26da_return_output);

-- tmp16_MUX_uxn_device_h_l284_c7_26da
tmp16_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l284_c7_26da_cond,
tmp16_MUX_uxn_device_h_l284_c7_26da_iftrue,
tmp16_MUX_uxn_device_h_l284_c7_26da_iffalse,
tmp16_MUX_uxn_device_h_l284_c7_26da_return_output);

-- ram_addr_MUX_uxn_device_h_l284_c7_26da
ram_addr_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l284_c7_26da_cond,
ram_addr_MUX_uxn_device_h_l284_c7_26da_iftrue,
ram_addr_MUX_uxn_device_h_l284_c7_26da_iffalse,
ram_addr_MUX_uxn_device_h_l284_c7_26da_return_output);

-- color_MUX_uxn_device_h_l284_c7_26da
color_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l284_c7_26da_cond,
color_MUX_uxn_device_h_l284_c7_26da_iftrue,
color_MUX_uxn_device_h_l284_c7_26da_iffalse,
color_MUX_uxn_device_h_l284_c7_26da_return_output);

-- layer_MUX_uxn_device_h_l284_c7_26da
layer_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l284_c7_26da_cond,
layer_MUX_uxn_device_h_l284_c7_26da_iftrue,
layer_MUX_uxn_device_h_l284_c7_26da_iffalse,
layer_MUX_uxn_device_h_l284_c7_26da_return_output);

-- y_MUX_uxn_device_h_l284_c7_26da
y_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l284_c7_26da_cond,
y_MUX_uxn_device_h_l284_c7_26da_iftrue,
y_MUX_uxn_device_h_l284_c7_26da_iffalse,
y_MUX_uxn_device_h_l284_c7_26da_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l284_c7_26da
x_sprite_incr_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond,
x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue,
x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse,
x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output);

-- ctrl_mode_MUX_uxn_device_h_l284_c7_26da
ctrl_mode_MUX_uxn_device_h_l284_c7_26da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l284_c7_26da_cond,
ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iftrue,
ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iffalse,
ctrl_mode_MUX_uxn_device_h_l284_c7_26da_return_output);

-- BIN_OP_OR_uxn_device_h_l285_c3_54ab
BIN_OP_OR_uxn_device_h_l285_c3_54ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l285_c3_54ab_left,
BIN_OP_OR_uxn_device_h_l285_c3_54ab_right,
BIN_OP_OR_uxn_device_h_l285_c3_54ab_return_output);

-- BIN_OP_EQ_uxn_device_h_l288_c11_a602
BIN_OP_EQ_uxn_device_h_l288_c11_a602 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l288_c11_a602_left,
BIN_OP_EQ_uxn_device_h_l288_c11_a602_right,
BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- flip_x_MUX_uxn_device_h_l288_c7_f54c
flip_x_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l288_c7_f54c_cond,
flip_x_MUX_uxn_device_h_l288_c7_f54c_iftrue,
flip_x_MUX_uxn_device_h_l288_c7_f54c_iffalse,
flip_x_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- flip_y_MUX_uxn_device_h_l288_c7_f54c
flip_y_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l288_c7_f54c_cond,
flip_y_MUX_uxn_device_h_l288_c7_f54c_iftrue,
flip_y_MUX_uxn_device_h_l288_c7_f54c_iffalse,
flip_y_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- tmp12_MUX_uxn_device_h_l288_c7_f54c
tmp12_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l288_c7_f54c_cond,
tmp12_MUX_uxn_device_h_l288_c7_f54c_iftrue,
tmp12_MUX_uxn_device_h_l288_c7_f54c_iffalse,
tmp12_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- is_last_blit_MUX_uxn_device_h_l288_c7_f54c
is_last_blit_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l288_c7_f54c_cond,
is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iftrue,
is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iffalse,
is_last_blit_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- auto_length_MUX_uxn_device_h_l288_c7_f54c
auto_length_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l288_c7_f54c_cond,
auto_length_MUX_uxn_device_h_l288_c7_f54c_iftrue,
auto_length_MUX_uxn_device_h_l288_c7_f54c_iffalse,
auto_length_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- is_blit_done_MUX_uxn_device_h_l288_c7_f54c
is_blit_done_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l288_c7_f54c_cond,
is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iftrue,
is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iffalse,
is_blit_done_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- result_MUX_uxn_device_h_l288_c7_f54c
result_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l288_c7_f54c_cond,
result_MUX_uxn_device_h_l288_c7_f54c_iftrue,
result_MUX_uxn_device_h_l288_c7_f54c_iffalse,
result_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- ctrl_MUX_uxn_device_h_l288_c7_f54c
ctrl_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l288_c7_f54c_cond,
ctrl_MUX_uxn_device_h_l288_c7_f54c_iftrue,
ctrl_MUX_uxn_device_h_l288_c7_f54c_iffalse,
ctrl_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- tmp16b_MUX_uxn_device_h_l288_c7_f54c
tmp16b_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l288_c7_f54c_cond,
tmp16b_MUX_uxn_device_h_l288_c7_f54c_iftrue,
tmp16b_MUX_uxn_device_h_l288_c7_f54c_iffalse,
tmp16b_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- auto_advance_MUX_uxn_device_h_l288_c7_f54c
auto_advance_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l288_c7_f54c_cond,
auto_advance_MUX_uxn_device_h_l288_c7_f54c_iftrue,
auto_advance_MUX_uxn_device_h_l288_c7_f54c_iffalse,
auto_advance_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c
ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_cond,
ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue,
ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse,
ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c
y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond,
y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue,
y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse,
y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- tmp4_MUX_uxn_device_h_l288_c7_f54c
tmp4_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l288_c7_f54c_cond,
tmp4_MUX_uxn_device_h_l288_c7_f54c_iftrue,
tmp4_MUX_uxn_device_h_l288_c7_f54c_iffalse,
tmp4_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- screen_blit_result_MUX_uxn_device_h_l288_c7_f54c
screen_blit_result_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_cond,
screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iftrue,
screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iffalse,
screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- x_MUX_uxn_device_h_l288_c7_f54c
x_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l288_c7_f54c_cond,
x_MUX_uxn_device_h_l288_c7_f54c_iftrue,
x_MUX_uxn_device_h_l288_c7_f54c_iffalse,
x_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- tmp16_MUX_uxn_device_h_l288_c7_f54c
tmp16_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l288_c7_f54c_cond,
tmp16_MUX_uxn_device_h_l288_c7_f54c_iftrue,
tmp16_MUX_uxn_device_h_l288_c7_f54c_iffalse,
tmp16_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- ram_addr_MUX_uxn_device_h_l288_c7_f54c
ram_addr_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l288_c7_f54c_cond,
ram_addr_MUX_uxn_device_h_l288_c7_f54c_iftrue,
ram_addr_MUX_uxn_device_h_l288_c7_f54c_iffalse,
ram_addr_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- color_MUX_uxn_device_h_l288_c7_f54c
color_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l288_c7_f54c_cond,
color_MUX_uxn_device_h_l288_c7_f54c_iftrue,
color_MUX_uxn_device_h_l288_c7_f54c_iffalse,
color_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- layer_MUX_uxn_device_h_l288_c7_f54c
layer_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l288_c7_f54c_cond,
layer_MUX_uxn_device_h_l288_c7_f54c_iftrue,
layer_MUX_uxn_device_h_l288_c7_f54c_iffalse,
layer_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- y_MUX_uxn_device_h_l288_c7_f54c
y_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l288_c7_f54c_cond,
y_MUX_uxn_device_h_l288_c7_f54c_iftrue,
y_MUX_uxn_device_h_l288_c7_f54c_iffalse,
y_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c
x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond,
x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue,
x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse,
x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- ctrl_mode_MUX_uxn_device_h_l288_c7_f54c
ctrl_mode_MUX_uxn_device_h_l288_c7_f54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_cond,
ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iftrue,
ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iffalse,
ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_return_output);

-- BIN_OP_EQ_uxn_device_h_l297_c11_94a8
BIN_OP_EQ_uxn_device_h_l297_c11_94a8 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l297_c11_94a8_left,
BIN_OP_EQ_uxn_device_h_l297_c11_94a8_right,
BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- tmp12_MUX_uxn_device_h_l297_c7_fe26
tmp12_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l297_c7_fe26_cond,
tmp12_MUX_uxn_device_h_l297_c7_fe26_iftrue,
tmp12_MUX_uxn_device_h_l297_c7_fe26_iffalse,
tmp12_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- is_last_blit_MUX_uxn_device_h_l297_c7_fe26
is_last_blit_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l297_c7_fe26_cond,
is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iftrue,
is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iffalse,
is_last_blit_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- auto_length_MUX_uxn_device_h_l297_c7_fe26
auto_length_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l297_c7_fe26_cond,
auto_length_MUX_uxn_device_h_l297_c7_fe26_iftrue,
auto_length_MUX_uxn_device_h_l297_c7_fe26_iffalse,
auto_length_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- is_blit_done_MUX_uxn_device_h_l297_c7_fe26
is_blit_done_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l297_c7_fe26_cond,
is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iftrue,
is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iffalse,
is_blit_done_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- result_MUX_uxn_device_h_l297_c7_fe26
result_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l297_c7_fe26_cond,
result_MUX_uxn_device_h_l297_c7_fe26_iftrue,
result_MUX_uxn_device_h_l297_c7_fe26_iffalse,
result_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- tmp16b_MUX_uxn_device_h_l297_c7_fe26
tmp16b_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l297_c7_fe26_cond,
tmp16b_MUX_uxn_device_h_l297_c7_fe26_iftrue,
tmp16b_MUX_uxn_device_h_l297_c7_fe26_iffalse,
tmp16b_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- auto_advance_MUX_uxn_device_h_l297_c7_fe26
auto_advance_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l297_c7_fe26_cond,
auto_advance_MUX_uxn_device_h_l297_c7_fe26_iftrue,
auto_advance_MUX_uxn_device_h_l297_c7_fe26_iffalse,
auto_advance_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26
ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_cond,
ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue,
ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse,
ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26
y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond,
y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue,
y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse,
y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- tmp4_MUX_uxn_device_h_l297_c7_fe26
tmp4_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l297_c7_fe26_cond,
tmp4_MUX_uxn_device_h_l297_c7_fe26_iftrue,
tmp4_MUX_uxn_device_h_l297_c7_fe26_iffalse,
tmp4_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- screen_blit_result_MUX_uxn_device_h_l297_c7_fe26
screen_blit_result_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_cond,
screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iftrue,
screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iffalse,
screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- x_MUX_uxn_device_h_l297_c7_fe26
x_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l297_c7_fe26_cond,
x_MUX_uxn_device_h_l297_c7_fe26_iftrue,
x_MUX_uxn_device_h_l297_c7_fe26_iffalse,
x_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- tmp16_MUX_uxn_device_h_l297_c7_fe26
tmp16_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l297_c7_fe26_cond,
tmp16_MUX_uxn_device_h_l297_c7_fe26_iftrue,
tmp16_MUX_uxn_device_h_l297_c7_fe26_iffalse,
tmp16_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- ram_addr_MUX_uxn_device_h_l297_c7_fe26
ram_addr_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l297_c7_fe26_cond,
ram_addr_MUX_uxn_device_h_l297_c7_fe26_iftrue,
ram_addr_MUX_uxn_device_h_l297_c7_fe26_iffalse,
ram_addr_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- y_MUX_uxn_device_h_l297_c7_fe26
y_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l297_c7_fe26_cond,
y_MUX_uxn_device_h_l297_c7_fe26_iftrue,
y_MUX_uxn_device_h_l297_c7_fe26_iffalse,
y_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26
x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond,
x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue,
x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse,
x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output);

-- BIN_OP_EQ_uxn_device_h_l302_c11_4eda
BIN_OP_EQ_uxn_device_h_l302_c11_4eda : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l302_c11_4eda_left,
BIN_OP_EQ_uxn_device_h_l302_c11_4eda_right,
BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_return_output);

-- tmp12_MUX_uxn_device_h_l302_c7_33e1
tmp12_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l302_c7_33e1_cond,
tmp12_MUX_uxn_device_h_l302_c7_33e1_iftrue,
tmp12_MUX_uxn_device_h_l302_c7_33e1_iffalse,
tmp12_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- is_last_blit_MUX_uxn_device_h_l302_c7_33e1
is_last_blit_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l302_c7_33e1_cond,
is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iftrue,
is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iffalse,
is_last_blit_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- auto_length_MUX_uxn_device_h_l302_c7_33e1
auto_length_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l302_c7_33e1_cond,
auto_length_MUX_uxn_device_h_l302_c7_33e1_iftrue,
auto_length_MUX_uxn_device_h_l302_c7_33e1_iffalse,
auto_length_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- is_blit_done_MUX_uxn_device_h_l302_c7_33e1
is_blit_done_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l302_c7_33e1_cond,
is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iftrue,
is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iffalse,
is_blit_done_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- result_MUX_uxn_device_h_l302_c7_33e1
result_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l302_c7_33e1_cond,
result_MUX_uxn_device_h_l302_c7_33e1_iftrue,
result_MUX_uxn_device_h_l302_c7_33e1_iffalse,
result_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- tmp16b_MUX_uxn_device_h_l302_c7_33e1
tmp16b_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l302_c7_33e1_cond,
tmp16b_MUX_uxn_device_h_l302_c7_33e1_iftrue,
tmp16b_MUX_uxn_device_h_l302_c7_33e1_iffalse,
tmp16b_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- auto_advance_MUX_uxn_device_h_l302_c7_33e1
auto_advance_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l302_c7_33e1_cond,
auto_advance_MUX_uxn_device_h_l302_c7_33e1_iftrue,
auto_advance_MUX_uxn_device_h_l302_c7_33e1_iffalse,
auto_advance_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1
ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_cond,
ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue,
ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse,
ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1
y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond,
y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue,
y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse,
y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- tmp4_MUX_uxn_device_h_l302_c7_33e1
tmp4_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l302_c7_33e1_cond,
tmp4_MUX_uxn_device_h_l302_c7_33e1_iftrue,
tmp4_MUX_uxn_device_h_l302_c7_33e1_iffalse,
tmp4_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- screen_blit_result_MUX_uxn_device_h_l302_c7_33e1
screen_blit_result_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_cond,
screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iftrue,
screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iffalse,
screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- x_MUX_uxn_device_h_l302_c7_33e1
x_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l302_c7_33e1_cond,
x_MUX_uxn_device_h_l302_c7_33e1_iftrue,
x_MUX_uxn_device_h_l302_c7_33e1_iffalse,
x_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- tmp16_MUX_uxn_device_h_l302_c7_33e1
tmp16_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l302_c7_33e1_cond,
tmp16_MUX_uxn_device_h_l302_c7_33e1_iftrue,
tmp16_MUX_uxn_device_h_l302_c7_33e1_iffalse,
tmp16_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- ram_addr_MUX_uxn_device_h_l302_c7_33e1
ram_addr_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l302_c7_33e1_cond,
ram_addr_MUX_uxn_device_h_l302_c7_33e1_iftrue,
ram_addr_MUX_uxn_device_h_l302_c7_33e1_iffalse,
ram_addr_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- y_MUX_uxn_device_h_l302_c7_33e1
y_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l302_c7_33e1_cond,
y_MUX_uxn_device_h_l302_c7_33e1_iftrue,
y_MUX_uxn_device_h_l302_c7_33e1_iffalse,
y_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1
x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond,
x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue,
x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse,
x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output);

-- BIN_OP_EQ_uxn_device_h_l312_c18_3416
BIN_OP_EQ_uxn_device_h_l312_c18_3416 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l312_c18_3416_left,
BIN_OP_EQ_uxn_device_h_l312_c18_3416_right,
BIN_OP_EQ_uxn_device_h_l312_c18_3416_return_output);

-- MUX_uxn_device_h_l312_c18_79a5
MUX_uxn_device_h_l312_c18_79a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l312_c18_79a5_cond,
MUX_uxn_device_h_l312_c18_79a5_iftrue,
MUX_uxn_device_h_l312_c18_79a5_iffalse,
MUX_uxn_device_h_l312_c18_79a5_return_output);

-- MUX_uxn_device_h_l314_c19_73d5
MUX_uxn_device_h_l314_c19_73d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l314_c19_73d5_cond,
MUX_uxn_device_h_l314_c19_73d5_iftrue,
MUX_uxn_device_h_l314_c19_73d5_iffalse,
MUX_uxn_device_h_l314_c19_73d5_return_output);

-- MUX_uxn_device_h_l315_c19_9ca3
MUX_uxn_device_h_l315_c19_9ca3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l315_c19_9ca3_cond,
MUX_uxn_device_h_l315_c19_9ca3_iftrue,
MUX_uxn_device_h_l315_c19_9ca3_iffalse,
MUX_uxn_device_h_l315_c19_9ca3_return_output);

-- MUX_uxn_device_h_l316_c39_fef7
MUX_uxn_device_h_l316_c39_fef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l316_c39_fef7_cond,
MUX_uxn_device_h_l316_c39_fef7_iftrue,
MUX_uxn_device_h_l316_c39_fef7_iffalse,
MUX_uxn_device_h_l316_c39_fef7_return_output);

-- MUX_uxn_device_h_l316_c20_f0cb
MUX_uxn_device_h_l316_c20_f0cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l316_c20_f0cb_cond,
MUX_uxn_device_h_l316_c20_f0cb_iftrue,
MUX_uxn_device_h_l316_c20_f0cb_iffalse,
MUX_uxn_device_h_l316_c20_f0cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output);

-- is_last_blit_MUX_uxn_device_h_l317_c3_5353
is_last_blit_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l317_c3_5353_cond,
is_last_blit_MUX_uxn_device_h_l317_c3_5353_iftrue,
is_last_blit_MUX_uxn_device_h_l317_c3_5353_iffalse,
is_last_blit_MUX_uxn_device_h_l317_c3_5353_return_output);

-- result_MUX_uxn_device_h_l317_c3_5353
result_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l317_c3_5353_cond,
result_MUX_uxn_device_h_l317_c3_5353_iftrue,
result_MUX_uxn_device_h_l317_c3_5353_iffalse,
result_MUX_uxn_device_h_l317_c3_5353_return_output);

-- tmp16b_MUX_uxn_device_h_l317_c3_5353
tmp16b_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l317_c3_5353_cond,
tmp16b_MUX_uxn_device_h_l317_c3_5353_iftrue,
tmp16b_MUX_uxn_device_h_l317_c3_5353_iffalse,
tmp16b_MUX_uxn_device_h_l317_c3_5353_return_output);

-- tmp4_MUX_uxn_device_h_l317_c3_5353
tmp4_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l317_c3_5353_cond,
tmp4_MUX_uxn_device_h_l317_c3_5353_iftrue,
tmp4_MUX_uxn_device_h_l317_c3_5353_iffalse,
tmp4_MUX_uxn_device_h_l317_c3_5353_return_output);

-- screen_blit_result_MUX_uxn_device_h_l317_c3_5353
screen_blit_result_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l317_c3_5353_cond,
screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iftrue,
screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iffalse,
screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output);

-- x_MUX_uxn_device_h_l317_c3_5353
x_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l317_c3_5353_cond,
x_MUX_uxn_device_h_l317_c3_5353_iftrue,
x_MUX_uxn_device_h_l317_c3_5353_iffalse,
x_MUX_uxn_device_h_l317_c3_5353_return_output);

-- tmp16_MUX_uxn_device_h_l317_c3_5353
tmp16_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l317_c3_5353_cond,
tmp16_MUX_uxn_device_h_l317_c3_5353_iftrue,
tmp16_MUX_uxn_device_h_l317_c3_5353_iffalse,
tmp16_MUX_uxn_device_h_l317_c3_5353_return_output);

-- ram_addr_MUX_uxn_device_h_l317_c3_5353
ram_addr_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l317_c3_5353_cond,
ram_addr_MUX_uxn_device_h_l317_c3_5353_iftrue,
ram_addr_MUX_uxn_device_h_l317_c3_5353_iffalse,
ram_addr_MUX_uxn_device_h_l317_c3_5353_return_output);

-- y_MUX_uxn_device_h_l317_c3_5353
y_MUX_uxn_device_h_l317_c3_5353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l317_c3_5353_cond,
y_MUX_uxn_device_h_l317_c3_5353_iftrue,
y_MUX_uxn_device_h_l317_c3_5353_iffalse,
y_MUX_uxn_device_h_l317_c3_5353_return_output);

-- BIN_OP_EQ_uxn_device_h_l318_c8_7b73
BIN_OP_EQ_uxn_device_h_l318_c8_7b73 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l318_c8_7b73_left,
BIN_OP_EQ_uxn_device_h_l318_c8_7b73_right,
BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb
result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_cond,
result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb
result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_cond,
result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb
result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_cond,
result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb
result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_cond,
result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- result_u16_addr_MUX_uxn_device_h_l318_c4_0beb
result_u16_addr_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_cond,
result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue,
result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse,
result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- result_u8_value_MUX_uxn_device_h_l318_c4_0beb
result_u8_value_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l318_c4_0beb_cond,
result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iftrue,
result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iffalse,
result_u8_value_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- tmp16b_MUX_uxn_device_h_l318_c4_0beb
tmp16b_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l318_c4_0beb_cond,
tmp16b_MUX_uxn_device_h_l318_c4_0beb_iftrue,
tmp16b_MUX_uxn_device_h_l318_c4_0beb_iffalse,
tmp16b_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- tmp4_MUX_uxn_device_h_l318_c4_0beb
tmp4_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l318_c4_0beb_cond,
tmp4_MUX_uxn_device_h_l318_c4_0beb_iftrue,
tmp4_MUX_uxn_device_h_l318_c4_0beb_iffalse,
tmp4_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb
screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- x_MUX_uxn_device_h_l318_c4_0beb
x_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l318_c4_0beb_cond,
x_MUX_uxn_device_h_l318_c4_0beb_iftrue,
x_MUX_uxn_device_h_l318_c4_0beb_iffalse,
x_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- tmp16_MUX_uxn_device_h_l318_c4_0beb
tmp16_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l318_c4_0beb_cond,
tmp16_MUX_uxn_device_h_l318_c4_0beb_iftrue,
tmp16_MUX_uxn_device_h_l318_c4_0beb_iffalse,
tmp16_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- ram_addr_MUX_uxn_device_h_l318_c4_0beb
ram_addr_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l318_c4_0beb_cond,
ram_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue,
ram_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse,
ram_addr_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- y_MUX_uxn_device_h_l318_c4_0beb
y_MUX_uxn_device_h_l318_c4_0beb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l318_c4_0beb_cond,
y_MUX_uxn_device_h_l318_c4_0beb_iftrue,
y_MUX_uxn_device_h_l318_c4_0beb_iffalse,
y_MUX_uxn_device_h_l318_c4_0beb_return_output);

-- BIN_OP_MINUS_uxn_device_h_l319_c23_cac0
BIN_OP_MINUS_uxn_device_h_l319_c23_cac0 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_left,
BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_right,
BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l319_c49_c9db
BIN_OP_PLUS_uxn_device_h_l319_c49_c9db : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_left,
BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_right,
BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_return_output);

-- MUX_uxn_device_h_l319_c13_1a4d
MUX_uxn_device_h_l319_c13_1a4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l319_c13_1a4d_cond,
MUX_uxn_device_h_l319_c13_1a4d_iftrue,
MUX_uxn_device_h_l319_c13_1a4d_iffalse,
MUX_uxn_device_h_l319_c13_1a4d_return_output);

-- BIN_OP_MINUS_uxn_device_h_l320_c24_af41
BIN_OP_MINUS_uxn_device_h_l320_c24_af41 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l320_c24_af41_left,
BIN_OP_MINUS_uxn_device_h_l320_c24_af41_right,
BIN_OP_MINUS_uxn_device_h_l320_c24_af41_return_output);

-- BIN_OP_PLUS_uxn_device_h_l320_c51_a137
BIN_OP_PLUS_uxn_device_h_l320_c51_a137 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l320_c51_a137_left,
BIN_OP_PLUS_uxn_device_h_l320_c51_a137_right,
BIN_OP_PLUS_uxn_device_h_l320_c51_a137_return_output);

-- MUX_uxn_device_h_l320_c14_b2e5
MUX_uxn_device_h_l320_c14_b2e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l320_c14_b2e5_cond,
MUX_uxn_device_h_l320_c14_b2e5_iftrue,
MUX_uxn_device_h_l320_c14_b2e5_iffalse,
MUX_uxn_device_h_l320_c14_b2e5_return_output);

-- BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe
BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_left,
BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_right,
BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_return_output);

-- BIN_OP_PLUS_uxn_device_h_l321_c58_7345
BIN_OP_PLUS_uxn_device_h_l321_c58_7345 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l321_c58_7345_left,
BIN_OP_PLUS_uxn_device_h_l321_c58_7345_right,
BIN_OP_PLUS_uxn_device_h_l321_c58_7345_return_output);

-- MUX_uxn_device_h_l321_c26_998e
MUX_uxn_device_h_l321_c26_998e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l321_c26_998e_cond,
MUX_uxn_device_h_l321_c26_998e_iftrue,
MUX_uxn_device_h_l321_c26_998e_iffalse,
MUX_uxn_device_h_l321_c26_998e_return_output);

-- MUX_uxn_device_h_l321_c10_a259
MUX_uxn_device_h_l321_c10_a259 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l321_c10_a259_cond,
MUX_uxn_device_h_l321_c10_a259_iftrue,
MUX_uxn_device_h_l321_c10_a259_iffalse,
MUX_uxn_device_h_l321_c10_a259_return_output);

-- BIN_OP_MINUS_uxn_device_h_l322_c36_5880
BIN_OP_MINUS_uxn_device_h_l322_c36_5880 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l322_c36_5880_left,
BIN_OP_MINUS_uxn_device_h_l322_c36_5880_right,
BIN_OP_MINUS_uxn_device_h_l322_c36_5880_return_output);

-- BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c
BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_left,
BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_right,
BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_return_output);

-- MUX_uxn_device_h_l322_c26_b0a5
MUX_uxn_device_h_l322_c26_b0a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l322_c26_b0a5_cond,
MUX_uxn_device_h_l322_c26_b0a5_iftrue,
MUX_uxn_device_h_l322_c26_b0a5_iffalse,
MUX_uxn_device_h_l322_c26_b0a5_return_output);

-- MUX_uxn_device_h_l322_c10_c015
MUX_uxn_device_h_l322_c10_c015 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l322_c10_c015_cond,
MUX_uxn_device_h_l322_c10_c015_iftrue,
MUX_uxn_device_h_l322_c10_c015_iffalse,
MUX_uxn_device_h_l322_c10_c015_return_output);

-- CONST_SR_8_uxn_device_h_l327_c33_c536
CONST_SR_8_uxn_device_h_l327_c33_c536 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l327_c33_c536_x,
CONST_SR_8_uxn_device_h_l327_c33_c536_return_output);

-- BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc
BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc : entity work.BIN_OP_MINUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_left,
BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_right,
BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_return_output);

-- BIN_OP_EQ_uxn_device_h_l329_c13_bceb
BIN_OP_EQ_uxn_device_h_l329_c13_bceb : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l329_c13_bceb_left,
BIN_OP_EQ_uxn_device_h_l329_c13_bceb_right,
BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b
result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_cond,
result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_return_output);

-- result_u8_value_MUX_uxn_device_h_l329_c9_3e5b
result_u8_value_MUX_uxn_device_h_l329_c9_3e5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_cond,
result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iftrue,
result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iffalse,
result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b
result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_cond,
result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b
result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_return_output);

-- tmp4_MUX_uxn_device_h_l329_c9_3e5b
tmp4_MUX_uxn_device_h_l329_c9_3e5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l329_c9_3e5b_cond,
tmp4_MUX_uxn_device_h_l329_c9_3e5b_iftrue,
tmp4_MUX_uxn_device_h_l329_c9_3e5b_iffalse,
tmp4_MUX_uxn_device_h_l329_c9_3e5b_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b
screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_return_output);

-- ram_addr_MUX_uxn_device_h_l329_c9_3e5b
ram_addr_MUX_uxn_device_h_l329_c9_3e5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l329_c9_3e5b_cond,
ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iftrue,
ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iffalse,
ram_addr_MUX_uxn_device_h_l329_c9_3e5b_return_output);

-- BIN_OP_MINUS_uxn_device_h_l334_c22_ae26
BIN_OP_MINUS_uxn_device_h_l334_c22_ae26 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_left,
BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_right,
BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_return_output);

-- BIN_OP_EQ_uxn_device_h_l334_c13_b52a
BIN_OP_EQ_uxn_device_h_l334_c13_b52a : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l334_c13_b52a_left,
BIN_OP_EQ_uxn_device_h_l334_c13_b52a_right,
BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6
result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_cond,
result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_return_output);

-- result_u8_value_MUX_uxn_device_h_l334_c9_7cb6
result_u8_value_MUX_uxn_device_h_l334_c9_7cb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_cond,
result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iftrue,
result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iffalse,
result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6
result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_cond,
result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6
result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_cond,
result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_return_output);

-- tmp4_MUX_uxn_device_h_l334_c9_7cb6
tmp4_MUX_uxn_device_h_l334_c9_7cb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l334_c9_7cb6_cond,
tmp4_MUX_uxn_device_h_l334_c9_7cb6_iftrue,
tmp4_MUX_uxn_device_h_l334_c9_7cb6_iffalse,
tmp4_MUX_uxn_device_h_l334_c9_7cb6_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6
screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_return_output);

-- ram_addr_MUX_uxn_device_h_l334_c9_7cb6
ram_addr_MUX_uxn_device_h_l334_c9_7cb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l334_c9_7cb6_cond,
ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iftrue,
ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iffalse,
ram_addr_MUX_uxn_device_h_l334_c9_7cb6_return_output);

-- CONST_SR_8_uxn_device_h_l337_c33_0bf8
CONST_SR_8_uxn_device_h_l337_c33_0bf8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l337_c33_0bf8_x,
CONST_SR_8_uxn_device_h_l337_c33_0bf8_return_output);

-- BIN_OP_MINUS_uxn_device_h_l339_c22_12fd
BIN_OP_MINUS_uxn_device_h_l339_c22_12fd : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_left,
BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_right,
BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_return_output);

-- BIN_OP_EQ_uxn_device_h_l339_c13_2142
BIN_OP_EQ_uxn_device_h_l339_c13_2142 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l339_c13_2142_left,
BIN_OP_EQ_uxn_device_h_l339_c13_2142_right,
BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f
result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_cond,
result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_return_output);

-- result_u8_value_MUX_uxn_device_h_l339_c9_ef7f
result_u8_value_MUX_uxn_device_h_l339_c9_ef7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_cond,
result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iftrue,
result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iffalse,
result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f
result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_cond,
result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_cond,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_return_output);

-- tmp4_MUX_uxn_device_h_l339_c9_ef7f
tmp4_MUX_uxn_device_h_l339_c9_ef7f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l339_c9_ef7f_cond,
tmp4_MUX_uxn_device_h_l339_c9_ef7f_iftrue,
tmp4_MUX_uxn_device_h_l339_c9_ef7f_iffalse,
tmp4_MUX_uxn_device_h_l339_c9_ef7f_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_return_output);

-- ram_addr_MUX_uxn_device_h_l339_c9_ef7f
ram_addr_MUX_uxn_device_h_l339_c9_ef7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l339_c9_ef7f_cond,
ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iftrue,
ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iffalse,
ram_addr_MUX_uxn_device_h_l339_c9_ef7f_return_output);

-- BIN_OP_MINUS_uxn_device_h_l344_c22_9a01
BIN_OP_MINUS_uxn_device_h_l344_c22_9a01 : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_left,
BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_right,
BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_return_output);

-- BIN_OP_EQ_uxn_device_h_l344_c13_b92c
BIN_OP_EQ_uxn_device_h_l344_c13_b92c : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l344_c13_b92c_left,
BIN_OP_EQ_uxn_device_h_l344_c13_b92c_right,
BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l344_c9_6535
result_is_deo_done_MUX_uxn_device_h_l344_c9_6535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_cond,
result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iftrue,
result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iffalse,
result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_return_output);

-- result_u8_value_MUX_uxn_device_h_l344_c9_6535
result_u8_value_MUX_uxn_device_h_l344_c9_6535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l344_c9_6535_cond,
result_u8_value_MUX_uxn_device_h_l344_c9_6535_iftrue,
result_u8_value_MUX_uxn_device_h_l344_c9_6535_iffalse,
result_u8_value_MUX_uxn_device_h_l344_c9_6535_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l344_c9_6535
result_device_ram_address_MUX_uxn_device_h_l344_c9_6535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_cond,
result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iftrue,
result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iffalse,
result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_cond,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_return_output);

-- tmp4_MUX_uxn_device_h_l344_c9_6535
tmp4_MUX_uxn_device_h_l344_c9_6535 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l344_c9_6535_cond,
tmp4_MUX_uxn_device_h_l344_c9_6535_iftrue,
tmp4_MUX_uxn_device_h_l344_c9_6535_iffalse,
tmp4_MUX_uxn_device_h_l344_c9_6535_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_return_output);

-- ram_addr_MUX_uxn_device_h_l344_c9_6535
ram_addr_MUX_uxn_device_h_l344_c9_6535 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l344_c9_6535_cond,
ram_addr_MUX_uxn_device_h_l344_c9_6535_iftrue,
ram_addr_MUX_uxn_device_h_l344_c9_6535_iffalse,
ram_addr_MUX_uxn_device_h_l344_c9_6535_return_output);

-- BIN_OP_MINUS_uxn_device_h_l348_c22_637e
BIN_OP_MINUS_uxn_device_h_l348_c22_637e : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l348_c22_637e_left,
BIN_OP_MINUS_uxn_device_h_l348_c22_637e_right,
BIN_OP_MINUS_uxn_device_h_l348_c22_637e_return_output);

-- BIN_OP_EQ_uxn_device_h_l348_c13_d3b1
BIN_OP_EQ_uxn_device_h_l348_c13_d3b1 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_left,
BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_right,
BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l348_c9_698c
result_is_deo_done_MUX_uxn_device_h_l348_c9_698c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_cond,
result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_return_output);

-- result_u8_value_MUX_uxn_device_h_l348_c9_698c
result_u8_value_MUX_uxn_device_h_l348_c9_698c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l348_c9_698c_cond,
result_u8_value_MUX_uxn_device_h_l348_c9_698c_iftrue,
result_u8_value_MUX_uxn_device_h_l348_c9_698c_iffalse,
result_u8_value_MUX_uxn_device_h_l348_c9_698c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l348_c9_698c
result_device_ram_address_MUX_uxn_device_h_l348_c9_698c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_cond,
result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c
result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_cond,
result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_return_output);

-- tmp4_MUX_uxn_device_h_l348_c9_698c
tmp4_MUX_uxn_device_h_l348_c9_698c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l348_c9_698c_cond,
tmp4_MUX_uxn_device_h_l348_c9_698c_iftrue,
tmp4_MUX_uxn_device_h_l348_c9_698c_iffalse,
tmp4_MUX_uxn_device_h_l348_c9_698c_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c
screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_return_output);

-- ram_addr_MUX_uxn_device_h_l348_c9_698c
ram_addr_MUX_uxn_device_h_l348_c9_698c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l348_c9_698c_cond,
ram_addr_MUX_uxn_device_h_l348_c9_698c_iftrue,
ram_addr_MUX_uxn_device_h_l348_c9_698c_iffalse,
ram_addr_MUX_uxn_device_h_l348_c9_698c_return_output);

-- BIN_OP_MINUS_uxn_device_h_l352_c22_e57e
BIN_OP_MINUS_uxn_device_h_l352_c22_e57e : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_left,
BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_right,
BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_return_output);

-- BIN_OP_EQ_uxn_device_h_l352_c13_a76e
BIN_OP_EQ_uxn_device_h_l352_c13_a76e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l352_c13_a76e_left,
BIN_OP_EQ_uxn_device_h_l352_c13_a76e_right,
BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2
result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_cond,
result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_return_output);

-- result_u8_value_MUX_uxn_device_h_l352_c9_c4e2
result_u8_value_MUX_uxn_device_h_l352_c9_c4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_cond,
result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iftrue,
result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iffalse,
result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2
result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_cond,
result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_cond,
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_return_output);

-- tmp4_MUX_uxn_device_h_l352_c9_c4e2
tmp4_MUX_uxn_device_h_l352_c9_c4e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l352_c9_c4e2_cond,
tmp4_MUX_uxn_device_h_l352_c9_c4e2_iftrue,
tmp4_MUX_uxn_device_h_l352_c9_c4e2_iffalse,
tmp4_MUX_uxn_device_h_l352_c9_c4e2_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_return_output);

-- ram_addr_MUX_uxn_device_h_l352_c9_c4e2
ram_addr_MUX_uxn_device_h_l352_c9_c4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l352_c9_c4e2_cond,
ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iftrue,
ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iffalse,
ram_addr_MUX_uxn_device_h_l352_c9_c4e2_return_output);

-- BIN_OP_MINUS_uxn_device_h_l356_c22_9db6
BIN_OP_MINUS_uxn_device_h_l356_c22_9db6 : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_left,
BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_right,
BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_return_output);

-- BIN_OP_EQ_uxn_device_h_l356_c13_c95a
BIN_OP_EQ_uxn_device_h_l356_c13_c95a : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l356_c13_c95a_left,
BIN_OP_EQ_uxn_device_h_l356_c13_c95a_right,
BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3
result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_cond,
result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_return_output);

-- result_u8_value_MUX_uxn_device_h_l356_c9_deb3
result_u8_value_MUX_uxn_device_h_l356_c9_deb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l356_c9_deb3_cond,
result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iftrue,
result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iffalse,
result_u8_value_MUX_uxn_device_h_l356_c9_deb3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3
result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_cond,
result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3
result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_cond,
result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_return_output);

-- tmp4_MUX_uxn_device_h_l356_c9_deb3
tmp4_MUX_uxn_device_h_l356_c9_deb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l356_c9_deb3_cond,
tmp4_MUX_uxn_device_h_l356_c9_deb3_iftrue,
tmp4_MUX_uxn_device_h_l356_c9_deb3_iffalse,
tmp4_MUX_uxn_device_h_l356_c9_deb3_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3
screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_return_output);

-- ram_addr_MUX_uxn_device_h_l356_c9_deb3
ram_addr_MUX_uxn_device_h_l356_c9_deb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l356_c9_deb3_cond,
ram_addr_MUX_uxn_device_h_l356_c9_deb3_iftrue,
ram_addr_MUX_uxn_device_h_l356_c9_deb3_iffalse,
ram_addr_MUX_uxn_device_h_l356_c9_deb3_return_output);

-- BIN_OP_PLUS_uxn_device_h_l358_c5_2cef
BIN_OP_PLUS_uxn_device_h_l358_c5_2cef : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_left,
BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_right,
BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_return_output);

-- CONST_SR_8_uxn_device_h_l361_c33_95d7
CONST_SR_8_uxn_device_h_l361_c33_95d7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l361_c33_95d7_x,
CONST_SR_8_uxn_device_h_l361_c33_95d7_return_output);

-- BIN_OP_MINUS_uxn_device_h_l363_c22_230b
BIN_OP_MINUS_uxn_device_h_l363_c22_230b : entity work.BIN_OP_MINUS_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l363_c22_230b_left,
BIN_OP_MINUS_uxn_device_h_l363_c22_230b_right,
BIN_OP_MINUS_uxn_device_h_l363_c22_230b_return_output);

-- BIN_OP_EQ_uxn_device_h_l363_c13_b8a6
BIN_OP_EQ_uxn_device_h_l363_c13_b8a6 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_left,
BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_right,
BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l363_c9_2091
result_is_deo_done_MUX_uxn_device_h_l363_c9_2091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_cond,
result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iftrue,
result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iffalse,
result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_return_output);

-- result_u8_value_MUX_uxn_device_h_l363_c9_2091
result_u8_value_MUX_uxn_device_h_l363_c9_2091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l363_c9_2091_cond,
result_u8_value_MUX_uxn_device_h_l363_c9_2091_iftrue,
result_u8_value_MUX_uxn_device_h_l363_c9_2091_iffalse,
result_u8_value_MUX_uxn_device_h_l363_c9_2091_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l363_c9_2091
result_device_ram_address_MUX_uxn_device_h_l363_c9_2091 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_cond,
result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iftrue,
result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iffalse,
result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_cond,
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_return_output);

-- tmp4_MUX_uxn_device_h_l363_c9_2091
tmp4_MUX_uxn_device_h_l363_c9_2091 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l363_c9_2091_cond,
tmp4_MUX_uxn_device_h_l363_c9_2091_iftrue,
tmp4_MUX_uxn_device_h_l363_c9_2091_iffalse,
tmp4_MUX_uxn_device_h_l363_c9_2091_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_return_output);

-- BIN_OP_MINUS_uxn_device_h_l368_c22_e689
BIN_OP_MINUS_uxn_device_h_l368_c22_e689 : entity work.BIN_OP_MINUS_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l368_c22_e689_left,
BIN_OP_MINUS_uxn_device_h_l368_c22_e689_right,
BIN_OP_MINUS_uxn_device_h_l368_c22_e689_return_output);

-- BIN_OP_EQ_uxn_device_h_l368_c13_1fca
BIN_OP_EQ_uxn_device_h_l368_c13_1fca : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l368_c13_1fca_left,
BIN_OP_EQ_uxn_device_h_l368_c13_1fca_right,
BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l368_c9_7542
result_is_deo_done_MUX_uxn_device_h_l368_c9_7542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_cond,
result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iftrue,
result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iffalse,
result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l368_c9_7542
result_device_ram_address_MUX_uxn_device_h_l368_c9_7542 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_cond,
result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iftrue,
result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iffalse,
result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_cond,
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_return_output);

-- tmp4_MUX_uxn_device_h_l368_c9_7542
tmp4_MUX_uxn_device_h_l368_c9_7542 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l368_c9_7542_cond,
tmp4_MUX_uxn_device_h_l368_c9_7542_iftrue,
tmp4_MUX_uxn_device_h_l368_c9_7542_iffalse,
tmp4_MUX_uxn_device_h_l368_c9_7542_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_return_output);

-- BIN_OP_PLUS_uxn_device_h_l369_c5_e819
BIN_OP_PLUS_uxn_device_h_l369_c5_e819 : entity work.BIN_OP_PLUS_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l369_c5_e819_left,
BIN_OP_PLUS_uxn_device_h_l369_c5_e819_right,
BIN_OP_PLUS_uxn_device_h_l369_c5_e819_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_return_output);

-- screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d
screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_cond,
screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iftrue,
screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iffalse,
screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output);

-- screen_2bpp_uxn_device_h_l377_c26_5b73
screen_2bpp_uxn_device_h_l377_c26_5b73 : entity work.screen_2bpp_0CLK_da8bfdac port map (
clk,
screen_2bpp_uxn_device_h_l377_c26_5b73_CLOCK_ENABLE,
screen_2bpp_uxn_device_h_l377_c26_5b73_phase,
screen_2bpp_uxn_device_h_l377_c26_5b73_x1,
screen_2bpp_uxn_device_h_l377_c26_5b73_y1,
screen_2bpp_uxn_device_h_l377_c26_5b73_color,
screen_2bpp_uxn_device_h_l377_c26_5b73_fx,
screen_2bpp_uxn_device_h_l377_c26_5b73_fy,
screen_2bpp_uxn_device_h_l377_c26_5b73_ram_addr,
screen_2bpp_uxn_device_h_l377_c26_5b73_previous_ram_read,
screen_2bpp_uxn_device_h_l377_c26_5b73_return_output);

-- screen_1bpp_uxn_device_h_l379_c26_1515
screen_1bpp_uxn_device_h_l379_c26_1515 : entity work.screen_1bpp_0CLK_1c60fd1a port map (
clk,
screen_1bpp_uxn_device_h_l379_c26_1515_CLOCK_ENABLE,
screen_1bpp_uxn_device_h_l379_c26_1515_phase,
screen_1bpp_uxn_device_h_l379_c26_1515_x1,
screen_1bpp_uxn_device_h_l379_c26_1515_y1,
screen_1bpp_uxn_device_h_l379_c26_1515_color,
screen_1bpp_uxn_device_h_l379_c26_1515_fx,
screen_1bpp_uxn_device_h_l379_c26_1515_fy,
screen_1bpp_uxn_device_h_l379_c26_1515_ram_addr,
screen_1bpp_uxn_device_h_l379_c26_1515_previous_ram_read,
screen_1bpp_uxn_device_h_l379_c26_1515_return_output);

-- BIN_OP_EQ_uxn_device_h_l388_c19_69f2
BIN_OP_EQ_uxn_device_h_l388_c19_69f2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l388_c19_69f2_left,
BIN_OP_EQ_uxn_device_h_l388_c19_69f2_right,
BIN_OP_EQ_uxn_device_h_l388_c19_69f2_return_output);

-- MUX_uxn_device_h_l388_c19_a30a
MUX_uxn_device_h_l388_c19_a30a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l388_c19_a30a_cond,
MUX_uxn_device_h_l388_c19_a30a_iftrue,
MUX_uxn_device_h_l388_c19_a30a_iffalse,
MUX_uxn_device_h_l388_c19_a30a_return_output);

-- BIN_OP_XOR_uxn_device_h_l391_c11_bb51
BIN_OP_XOR_uxn_device_h_l391_c11_bb51 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_device_h_l391_c11_bb51_left,
BIN_OP_XOR_uxn_device_h_l391_c11_bb51_right,
BIN_OP_XOR_uxn_device_h_l391_c11_bb51_return_output);

-- BIN_OP_PLUS_uxn_device_h_l391_c60_ded9
BIN_OP_PLUS_uxn_device_h_l391_c60_ded9 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_left,
BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_right,
BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_return_output);

-- MUX_uxn_device_h_l391_c11_358b
MUX_uxn_device_h_l391_c11_358b : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l391_c11_358b_cond,
MUX_uxn_device_h_l391_c11_358b_iftrue,
MUX_uxn_device_h_l391_c11_358b_iffalse,
MUX_uxn_device_h_l391_c11_358b_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82
CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_x,
CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output);

-- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_left,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_right,
BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8 : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_left,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_right,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output);



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
 BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_return_output,
 flip_x_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 flip_y_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 tmp12_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 auto_length_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 result_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 ctrl_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 tmp16b_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 auto_advance_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 tmp4_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 x_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 tmp16_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 ram_addr_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 color_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 layer_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 y_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_return_output,
 BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_return_output,
 flip_x_MUX_uxn_device_h_l267_c7_eeba_return_output,
 flip_y_MUX_uxn_device_h_l267_c7_eeba_return_output,
 tmp12_MUX_uxn_device_h_l267_c7_eeba_return_output,
 is_last_blit_MUX_uxn_device_h_l267_c7_eeba_return_output,
 auto_length_MUX_uxn_device_h_l267_c7_eeba_return_output,
 is_blit_done_MUX_uxn_device_h_l267_c7_eeba_return_output,
 result_MUX_uxn_device_h_l267_c7_eeba_return_output,
 ctrl_MUX_uxn_device_h_l267_c7_eeba_return_output,
 tmp16b_MUX_uxn_device_h_l267_c7_eeba_return_output,
 auto_advance_MUX_uxn_device_h_l267_c7_eeba_return_output,
 ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_return_output,
 y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output,
 tmp4_MUX_uxn_device_h_l267_c7_eeba_return_output,
 screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_return_output,
 x_MUX_uxn_device_h_l267_c7_eeba_return_output,
 tmp16_MUX_uxn_device_h_l267_c7_eeba_return_output,
 ram_addr_MUX_uxn_device_h_l267_c7_eeba_return_output,
 color_MUX_uxn_device_h_l267_c7_eeba_return_output,
 layer_MUX_uxn_device_h_l267_c7_eeba_return_output,
 y_MUX_uxn_device_h_l267_c7_eeba_return_output,
 x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output,
 ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_return_output,
 BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 flip_x_MUX_uxn_device_h_l270_c7_86b1_return_output,
 flip_y_MUX_uxn_device_h_l270_c7_86b1_return_output,
 tmp12_MUX_uxn_device_h_l270_c7_86b1_return_output,
 is_last_blit_MUX_uxn_device_h_l270_c7_86b1_return_output,
 auto_length_MUX_uxn_device_h_l270_c7_86b1_return_output,
 is_blit_done_MUX_uxn_device_h_l270_c7_86b1_return_output,
 result_MUX_uxn_device_h_l270_c7_86b1_return_output,
 ctrl_MUX_uxn_device_h_l270_c7_86b1_return_output,
 tmp16b_MUX_uxn_device_h_l270_c7_86b1_return_output,
 auto_advance_MUX_uxn_device_h_l270_c7_86b1_return_output,
 ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_return_output,
 y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output,
 tmp4_MUX_uxn_device_h_l270_c7_86b1_return_output,
 screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_return_output,
 x_MUX_uxn_device_h_l270_c7_86b1_return_output,
 tmp16_MUX_uxn_device_h_l270_c7_86b1_return_output,
 ram_addr_MUX_uxn_device_h_l270_c7_86b1_return_output,
 color_MUX_uxn_device_h_l270_c7_86b1_return_output,
 layer_MUX_uxn_device_h_l270_c7_86b1_return_output,
 y_MUX_uxn_device_h_l270_c7_86b1_return_output,
 x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output,
 ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_return_output,
 BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_return_output,
 flip_x_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 flip_y_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 tmp12_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 auto_length_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 result_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 ctrl_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 tmp16b_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 auto_advance_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 tmp4_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 x_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 tmp16_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 ram_addr_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 color_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 layer_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 y_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_return_output,
 BIN_OP_OR_uxn_device_h_l276_c3_e781_return_output,
 BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_return_output,
 flip_x_MUX_uxn_device_h_l279_c7_f401_return_output,
 flip_y_MUX_uxn_device_h_l279_c7_f401_return_output,
 tmp12_MUX_uxn_device_h_l279_c7_f401_return_output,
 is_last_blit_MUX_uxn_device_h_l279_c7_f401_return_output,
 auto_length_MUX_uxn_device_h_l279_c7_f401_return_output,
 is_blit_done_MUX_uxn_device_h_l279_c7_f401_return_output,
 result_MUX_uxn_device_h_l279_c7_f401_return_output,
 ctrl_MUX_uxn_device_h_l279_c7_f401_return_output,
 tmp16b_MUX_uxn_device_h_l279_c7_f401_return_output,
 auto_advance_MUX_uxn_device_h_l279_c7_f401_return_output,
 ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_return_output,
 y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output,
 tmp4_MUX_uxn_device_h_l279_c7_f401_return_output,
 screen_blit_result_MUX_uxn_device_h_l279_c7_f401_return_output,
 x_MUX_uxn_device_h_l279_c7_f401_return_output,
 tmp16_MUX_uxn_device_h_l279_c7_f401_return_output,
 ram_addr_MUX_uxn_device_h_l279_c7_f401_return_output,
 color_MUX_uxn_device_h_l279_c7_f401_return_output,
 layer_MUX_uxn_device_h_l279_c7_f401_return_output,
 y_MUX_uxn_device_h_l279_c7_f401_return_output,
 x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output,
 ctrl_mode_MUX_uxn_device_h_l279_c7_f401_return_output,
 BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_return_output,
 flip_x_MUX_uxn_device_h_l284_c7_26da_return_output,
 flip_y_MUX_uxn_device_h_l284_c7_26da_return_output,
 tmp12_MUX_uxn_device_h_l284_c7_26da_return_output,
 is_last_blit_MUX_uxn_device_h_l284_c7_26da_return_output,
 auto_length_MUX_uxn_device_h_l284_c7_26da_return_output,
 is_blit_done_MUX_uxn_device_h_l284_c7_26da_return_output,
 result_MUX_uxn_device_h_l284_c7_26da_return_output,
 ctrl_MUX_uxn_device_h_l284_c7_26da_return_output,
 tmp16b_MUX_uxn_device_h_l284_c7_26da_return_output,
 auto_advance_MUX_uxn_device_h_l284_c7_26da_return_output,
 ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_return_output,
 y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output,
 tmp4_MUX_uxn_device_h_l284_c7_26da_return_output,
 screen_blit_result_MUX_uxn_device_h_l284_c7_26da_return_output,
 x_MUX_uxn_device_h_l284_c7_26da_return_output,
 tmp16_MUX_uxn_device_h_l284_c7_26da_return_output,
 ram_addr_MUX_uxn_device_h_l284_c7_26da_return_output,
 color_MUX_uxn_device_h_l284_c7_26da_return_output,
 layer_MUX_uxn_device_h_l284_c7_26da_return_output,
 y_MUX_uxn_device_h_l284_c7_26da_return_output,
 x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output,
 ctrl_mode_MUX_uxn_device_h_l284_c7_26da_return_output,
 BIN_OP_OR_uxn_device_h_l285_c3_54ab_return_output,
 BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_return_output,
 flip_x_MUX_uxn_device_h_l288_c7_f54c_return_output,
 flip_y_MUX_uxn_device_h_l288_c7_f54c_return_output,
 tmp12_MUX_uxn_device_h_l288_c7_f54c_return_output,
 is_last_blit_MUX_uxn_device_h_l288_c7_f54c_return_output,
 auto_length_MUX_uxn_device_h_l288_c7_f54c_return_output,
 is_blit_done_MUX_uxn_device_h_l288_c7_f54c_return_output,
 result_MUX_uxn_device_h_l288_c7_f54c_return_output,
 ctrl_MUX_uxn_device_h_l288_c7_f54c_return_output,
 tmp16b_MUX_uxn_device_h_l288_c7_f54c_return_output,
 auto_advance_MUX_uxn_device_h_l288_c7_f54c_return_output,
 ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_return_output,
 y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output,
 tmp4_MUX_uxn_device_h_l288_c7_f54c_return_output,
 screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_return_output,
 x_MUX_uxn_device_h_l288_c7_f54c_return_output,
 tmp16_MUX_uxn_device_h_l288_c7_f54c_return_output,
 ram_addr_MUX_uxn_device_h_l288_c7_f54c_return_output,
 color_MUX_uxn_device_h_l288_c7_f54c_return_output,
 layer_MUX_uxn_device_h_l288_c7_f54c_return_output,
 y_MUX_uxn_device_h_l288_c7_f54c_return_output,
 x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output,
 ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_return_output,
 BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_return_output,
 tmp12_MUX_uxn_device_h_l297_c7_fe26_return_output,
 is_last_blit_MUX_uxn_device_h_l297_c7_fe26_return_output,
 auto_length_MUX_uxn_device_h_l297_c7_fe26_return_output,
 is_blit_done_MUX_uxn_device_h_l297_c7_fe26_return_output,
 result_MUX_uxn_device_h_l297_c7_fe26_return_output,
 tmp16b_MUX_uxn_device_h_l297_c7_fe26_return_output,
 auto_advance_MUX_uxn_device_h_l297_c7_fe26_return_output,
 ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_return_output,
 y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output,
 tmp4_MUX_uxn_device_h_l297_c7_fe26_return_output,
 screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_return_output,
 x_MUX_uxn_device_h_l297_c7_fe26_return_output,
 tmp16_MUX_uxn_device_h_l297_c7_fe26_return_output,
 ram_addr_MUX_uxn_device_h_l297_c7_fe26_return_output,
 y_MUX_uxn_device_h_l297_c7_fe26_return_output,
 x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output,
 BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_return_output,
 tmp12_MUX_uxn_device_h_l302_c7_33e1_return_output,
 is_last_blit_MUX_uxn_device_h_l302_c7_33e1_return_output,
 auto_length_MUX_uxn_device_h_l302_c7_33e1_return_output,
 is_blit_done_MUX_uxn_device_h_l302_c7_33e1_return_output,
 result_MUX_uxn_device_h_l302_c7_33e1_return_output,
 tmp16b_MUX_uxn_device_h_l302_c7_33e1_return_output,
 auto_advance_MUX_uxn_device_h_l302_c7_33e1_return_output,
 ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_return_output,
 y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output,
 tmp4_MUX_uxn_device_h_l302_c7_33e1_return_output,
 screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_return_output,
 x_MUX_uxn_device_h_l302_c7_33e1_return_output,
 tmp16_MUX_uxn_device_h_l302_c7_33e1_return_output,
 ram_addr_MUX_uxn_device_h_l302_c7_33e1_return_output,
 y_MUX_uxn_device_h_l302_c7_33e1_return_output,
 x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output,
 BIN_OP_EQ_uxn_device_h_l312_c18_3416_return_output,
 MUX_uxn_device_h_l312_c18_79a5_return_output,
 MUX_uxn_device_h_l314_c19_73d5_return_output,
 MUX_uxn_device_h_l315_c19_9ca3_return_output,
 MUX_uxn_device_h_l316_c39_fef7_return_output,
 MUX_uxn_device_h_l316_c20_f0cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output,
 is_last_blit_MUX_uxn_device_h_l317_c3_5353_return_output,
 result_MUX_uxn_device_h_l317_c3_5353_return_output,
 tmp16b_MUX_uxn_device_h_l317_c3_5353_return_output,
 tmp4_MUX_uxn_device_h_l317_c3_5353_return_output,
 screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output,
 x_MUX_uxn_device_h_l317_c3_5353_return_output,
 tmp16_MUX_uxn_device_h_l317_c3_5353_return_output,
 ram_addr_MUX_uxn_device_h_l317_c3_5353_return_output,
 y_MUX_uxn_device_h_l317_c3_5353_return_output,
 BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output,
 result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_return_output,
 result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_return_output,
 result_u8_value_MUX_uxn_device_h_l318_c4_0beb_return_output,
 tmp16b_MUX_uxn_device_h_l318_c4_0beb_return_output,
 tmp4_MUX_uxn_device_h_l318_c4_0beb_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_return_output,
 x_MUX_uxn_device_h_l318_c4_0beb_return_output,
 tmp16_MUX_uxn_device_h_l318_c4_0beb_return_output,
 ram_addr_MUX_uxn_device_h_l318_c4_0beb_return_output,
 y_MUX_uxn_device_h_l318_c4_0beb_return_output,
 BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_return_output,
 BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_return_output,
 MUX_uxn_device_h_l319_c13_1a4d_return_output,
 BIN_OP_MINUS_uxn_device_h_l320_c24_af41_return_output,
 BIN_OP_PLUS_uxn_device_h_l320_c51_a137_return_output,
 MUX_uxn_device_h_l320_c14_b2e5_return_output,
 BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_return_output,
 BIN_OP_PLUS_uxn_device_h_l321_c58_7345_return_output,
 MUX_uxn_device_h_l321_c26_998e_return_output,
 MUX_uxn_device_h_l321_c10_a259_return_output,
 BIN_OP_MINUS_uxn_device_h_l322_c36_5880_return_output,
 BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_return_output,
 MUX_uxn_device_h_l322_c26_b0a5_return_output,
 MUX_uxn_device_h_l322_c10_c015_return_output,
 CONST_SR_8_uxn_device_h_l327_c33_c536_return_output,
 BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_return_output,
 BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_return_output,
 result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_return_output,
 tmp4_MUX_uxn_device_h_l329_c9_3e5b_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_return_output,
 ram_addr_MUX_uxn_device_h_l329_c9_3e5b_return_output,
 BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_return_output,
 BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_return_output,
 result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_return_output,
 tmp4_MUX_uxn_device_h_l334_c9_7cb6_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_return_output,
 ram_addr_MUX_uxn_device_h_l334_c9_7cb6_return_output,
 CONST_SR_8_uxn_device_h_l337_c33_0bf8_return_output,
 BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_return_output,
 BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output,
 result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_return_output,
 result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_return_output,
 tmp4_MUX_uxn_device_h_l339_c9_ef7f_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_return_output,
 ram_addr_MUX_uxn_device_h_l339_c9_ef7f_return_output,
 BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_return_output,
 BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_return_output,
 result_u8_value_MUX_uxn_device_h_l344_c9_6535_return_output,
 result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_return_output,
 tmp4_MUX_uxn_device_h_l344_c9_6535_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_return_output,
 ram_addr_MUX_uxn_device_h_l344_c9_6535_return_output,
 BIN_OP_MINUS_uxn_device_h_l348_c22_637e_return_output,
 BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_return_output,
 result_u8_value_MUX_uxn_device_h_l348_c9_698c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_return_output,
 tmp4_MUX_uxn_device_h_l348_c9_698c_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_return_output,
 ram_addr_MUX_uxn_device_h_l348_c9_698c_return_output,
 BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_return_output,
 BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_return_output,
 result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_return_output,
 tmp4_MUX_uxn_device_h_l352_c9_c4e2_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_return_output,
 ram_addr_MUX_uxn_device_h_l352_c9_c4e2_return_output,
 BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_return_output,
 BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_return_output,
 result_u8_value_MUX_uxn_device_h_l356_c9_deb3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_return_output,
 tmp4_MUX_uxn_device_h_l356_c9_deb3_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_return_output,
 ram_addr_MUX_uxn_device_h_l356_c9_deb3_return_output,
 BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_return_output,
 CONST_SR_8_uxn_device_h_l361_c33_95d7_return_output,
 BIN_OP_MINUS_uxn_device_h_l363_c22_230b_return_output,
 BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_return_output,
 result_u8_value_MUX_uxn_device_h_l363_c9_2091_return_output,
 result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_return_output,
 tmp4_MUX_uxn_device_h_l363_c9_2091_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_return_output,
 BIN_OP_MINUS_uxn_device_h_l368_c22_e689_return_output,
 BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output,
 result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_return_output,
 result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_return_output,
 tmp4_MUX_uxn_device_h_l368_c9_7542_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_return_output,
 BIN_OP_PLUS_uxn_device_h_l369_c5_e819_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_return_output,
 screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output,
 screen_2bpp_uxn_device_h_l377_c26_5b73_return_output,
 screen_1bpp_uxn_device_h_l379_c26_1515_return_output,
 BIN_OP_EQ_uxn_device_h_l388_c19_69f2_return_output,
 MUX_uxn_device_h_l388_c19_a30a_return_output,
 BIN_OP_XOR_uxn_device_h_l391_c11_bb51_return_output,
 BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_return_output,
 MUX_uxn_device_h_l391_c11_358b_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output,
 BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output,
 BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l260_c2_fd3e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l267_c7_eeba_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l260_c2_fd3e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l267_c7_eeba_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l267_c7_eeba_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l267_c7_eeba_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c7_86b1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l270_c7_86b1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l270_c7_86b1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c7_86b1_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l275_c7_f0fc_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l275_c7_f0fc_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l279_c7_f401_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l279_c7_f401_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l279_c7_f401_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l279_c7_f401_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l284_c7_26da_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l284_c7_26da_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l284_c7_26da_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l284_c7_26da_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l288_c7_f54c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l288_c7_f54c_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l288_c7_f54c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l288_c7_f54c_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c7_fe26_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l290_c11_9bc8_return_output : unsigned(3 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l291_c15_30d1_return_output : unsigned(0 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l292_c11_440a_return_output : unsigned(0 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l293_c12_dea3_return_output : unsigned(0 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l294_c12_17ab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l297_c7_fe26_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l297_c7_fe26_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c7_fe26_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_33e1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iffalse : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l302_c7_33e1_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_33e1_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l317_c3_5353_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l305_c3_76a6 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l317_c3_5353_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l312_c18_79a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l312_c18_79a5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l312_c18_79a5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l312_c18_79a5_return_output : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l313_c17_9690_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l314_c19_73d5_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l314_c19_5179_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l314_c19_73d5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l314_c19_73d5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l314_c19_73d5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l315_c19_9ca3_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l315_c19_4645_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l315_c19_9ca3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l315_c19_9ca3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l315_c19_9ca3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c20_f0cb_cond : unsigned(0 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l316_c20_4283_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c20_f0cb_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c20_f0cb_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c39_fef7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c39_fef7_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c39_fef7_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c39_fef7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l316_c20_f0cb_return_output : unsigned(15 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l317_c3_5353_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59_uxn_device_h_l317_c3_5353_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l317_c3_5353_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l317_c3_5353_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l317_c3_5353_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l317_c3_5353_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l317_c3_5353_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l317_c3_5353_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l324_c5_b2a0 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l318_c4_0beb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l318_c4_0beb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l318_c4_0beb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l319_c13_1a4d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l319_c13_1a4d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l319_c13_1a4d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l319_c13_1a4d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l320_c14_b2e5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l320_c14_b2e5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l320_c14_b2e5_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l320_c14_b2e5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c10_a259_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c10_a259_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c10_a259_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c26_998e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c26_998e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c26_998e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c26_998e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l321_c10_a259_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c10_c015_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c10_c015_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c10_c015_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c26_b0a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c26_b0a5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c26_b0a5_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c26_b0a5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l322_c10_c015_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l327_c33_c536_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l327_c33_c536_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l327_c23_2094_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l332_c23_34b6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l337_c33_0bf8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l337_c33_0bf8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_b292_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_32fe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_uxn_device_h_l358_c5_f768 : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l361_c33_95d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l361_c33_95d7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l361_c23_25ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l366_c23_d252_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l369_c5_6a67 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_return_output : unsigned(4 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_cond : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_phase : unsigned(11 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_x1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_y1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_color : unsigned(3 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_fx : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_fy : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_return_output : screen_blit_result_t;
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_phase : unsigned(11 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_x1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_y1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_color : unsigned(3 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_fx : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_fy : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_1515_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l382_c4_838a : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l384_c27_2a00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l385_c22_04b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l387_c22_045c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_a30a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_a30a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_a30a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_a30a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_358b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_358b_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_358b_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_358b_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l357_l285_l298_l276_l303_l271_l280_l353_DUPLICATE_82f1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l344_l348_l352_l363_DUPLICATE_b83c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l352_l368_DUPLICATE_7950_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l352_l368_DUPLICATE_ef7b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_632d_return_output : unsigned(0 downto 0);
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
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l388_c19_a30a_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iftrue := to_unsigned(1, 1);
     VAR_tmp4_uxn_device_h_l305_c3_76a6 := resize(to_unsigned(0, 1), 4);
     VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_iftrue := VAR_tmp4_uxn_device_h_l305_c3_76a6;
     VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_right := to_unsigned(2, 2);
     VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_right := to_unsigned(9, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iftrue := to_unsigned(1, 1);
     VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_right := to_unsigned(1, 12);
     VAR_MUX_uxn_device_h_l314_c19_73d5_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_right := to_unsigned(4, 3);
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_right := to_unsigned(3, 12);
     VAR_result_device_ram_address_uxn_device_h_l382_c4_838a := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l314_c19_73d5_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_right := to_unsigned(5, 12);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iftrue := to_unsigned(41, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l315_c19_9ca3_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l316_c39_fef7_iftrue := to_unsigned(16, 16);
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iftrue := to_unsigned(44, 8);
     VAR_MUX_uxn_device_h_l316_c39_fef7_iffalse := to_unsigned(8, 16);
     VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iftrue := to_unsigned(44, 8);
     VAR_MUX_uxn_device_h_l316_c20_f0cb_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_iftrue := to_unsigned(9, 12);
     VAR_MUX_uxn_device_h_l388_c19_a30a_iffalse := to_unsigned(0, 1);
     VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iftrue := to_unsigned(45, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l315_c19_9ca3_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iftrue := to_unsigned(40, 8);
     VAR_result_u16_addr_uxn_device_h_l324_c5_b2a0 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_result_u16_addr_uxn_device_h_l324_c5_b2a0;
     VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_right := to_unsigned(0, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_right := to_unsigned(9, 12);
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iftrue := to_unsigned(0, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iftrue := to_unsigned(43, 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_right := to_unsigned(8, 4);
     VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_right := to_unsigned(4, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iftrue := to_unsigned(45, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_right := to_unsigned(7, 12);
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_right := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_right := to_unsigned(2, 12);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_right := to_unsigned(8, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_right := to_unsigned(6, 12);
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_right := to_unsigned(5, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_device_h_l312_c18_79a5_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_iftrue := auto_advance;
     VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_iftrue := auto_length;
     VAR_color_MUX_uxn_device_h_l260_c2_fd3e_iftrue := color;
     VAR_color_MUX_uxn_device_h_l267_c7_eeba_iftrue := color;
     VAR_color_MUX_uxn_device_h_l270_c7_86b1_iftrue := color;
     VAR_color_MUX_uxn_device_h_l275_c7_f0fc_iftrue := color;
     VAR_color_MUX_uxn_device_h_l279_c7_f401_iftrue := color;
     VAR_color_MUX_uxn_device_h_l284_c7_26da_iftrue := color;
     VAR_color_MUX_uxn_device_h_l288_c7_f54c_iffalse := color;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_color := color;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_color := color;
     VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_iffalse := ctrl;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l316_c39_fef7_cond := ctrl_mode;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_cond := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iffalse := ctrl_mode;
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l319_c13_1a4d_cond := flip_x;
     VAR_MUX_uxn_device_h_l321_c26_998e_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_iffalse := flip_x;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_fx := flip_x;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_fx := flip_x;
     VAR_MUX_uxn_device_h_l320_c14_b2e5_cond := flip_y;
     VAR_MUX_uxn_device_h_l322_c26_b0a5_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_iffalse := flip_y;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_fy := flip_y;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_fy := flip_y;
     VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_left := is_blit_done;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_cond := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iftrue := is_blit_done;
     VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_result_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_x_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_y_MUX_uxn_device_h_l317_c3_5353_cond := is_blit_done;
     VAR_MUX_uxn_device_h_l321_c10_a259_cond := is_last_blit;
     VAR_MUX_uxn_device_h_l322_c10_c015_cond := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_iftrue := is_last_blit;
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iftrue := is_last_blit;
     VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l267_c7_eeba_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l270_c7_86b1_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l279_c7_f401_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l284_c7_26da_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l288_c7_f54c_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_right := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_left := VAR_phase;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_left := VAR_phase;
     VAR_MUX_uxn_device_h_l312_c18_79a5_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_iftrue := VAR_previous_device_ram_read;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_previous_ram_read := VAR_previous_ram_read;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_iffalse := ram_addr;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_ram_addr := ram_addr;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_ram_addr := ram_addr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue := ram_addr_incr;
     VAR_result_MUX_uxn_device_h_l302_c7_33e1_iftrue := result;
     VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iftrue := screen_blit_result;
     VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_left := tmp12;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_right := tmp12;
     VAR_MUX_uxn_device_h_l391_c11_358b_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_iftrue := tmp12;
     VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_left := tmp16;
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_left := tmp16;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_x1 := tmp16;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_x1 := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_iffalse := tmp16;
     VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_left := tmp16b;
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_left := tmp16b;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_y1 := tmp16b;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_y1 := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_iffalse := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_iffalse := tmp16b;
     VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_right := tmp4;
     VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_left := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_iffalse := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_iffalse := tmp4;
     VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_left := x;
     VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_left := x;
     VAR_MUX_uxn_device_h_l321_c10_a259_iffalse := x;
     VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_iftrue := x;
     VAR_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue := x;
     VAR_x_MUX_uxn_device_h_l267_c7_eeba_iftrue := x;
     VAR_x_MUX_uxn_device_h_l279_c7_f401_iftrue := x;
     VAR_x_MUX_uxn_device_h_l284_c7_26da_iftrue := x;
     VAR_x_MUX_uxn_device_h_l288_c7_f54c_iftrue := x;
     VAR_x_MUX_uxn_device_h_l297_c7_fe26_iftrue := x;
     VAR_x_MUX_uxn_device_h_l302_c7_33e1_iftrue := x;
     VAR_x_MUX_uxn_device_h_l317_c3_5353_iffalse := x;
     VAR_x_MUX_uxn_device_h_l318_c4_0beb_iffalse := x;
     VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue := x_sprite_incr;
     VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_left := y;
     VAR_CONST_SR_8_uxn_device_h_l337_c33_0bf8_x := y;
     VAR_MUX_uxn_device_h_l322_c10_c015_iffalse := y;
     VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_iftrue := y;
     VAR_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l267_c7_eeba_iftrue := y;
     VAR_y_MUX_uxn_device_h_l270_c7_86b1_iftrue := y;
     VAR_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue := y;
     VAR_y_MUX_uxn_device_h_l288_c7_f54c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l297_c7_fe26_iftrue := y;
     VAR_y_MUX_uxn_device_h_l302_c7_33e1_iftrue := y;
     VAR_y_MUX_uxn_device_h_l317_c3_5353_iffalse := y;
     VAR_y_MUX_uxn_device_h_l318_c4_0beb_iffalse := y;
     VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue := y_sprite_incr;
     -- BIN_OP_MINUS[uxn_device_h_l344_c22_9a01] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_left <= VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_left;
     BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_right <= VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_return_output := BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l329_c22_4ebc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_left <= VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_left;
     BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_right <= VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_return_output := BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_return_output;

     -- uint8_5_5[uxn_device_h_l293_c12_dea3] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l293_c12_dea3_return_output := uint8_5_5(
     VAR_previous_device_ram_read);

     -- uint8_4_4[uxn_device_h_l294_c12_17ab] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l294_c12_17ab_return_output := uint8_4_4(
     VAR_previous_device_ram_read);

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l318_c4_0beb] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l318_c4_0beb_return_output := result.u16_addr;

     -- BIN_OP_MINUS[uxn_device_h_l352_c22_e57e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_left;
     BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_return_output := BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l368_c22_e689] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l368_c22_e689_left <= VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_left;
     BIN_OP_MINUS_uxn_device_h_l368_c22_e689_right <= VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_return_output := BIN_OP_MINUS_uxn_device_h_l368_c22_e689_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l275_c7_f0fc] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l275_c7_f0fc_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_EQ[uxn_device_h_l260_c6_2fcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_left <= VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_left;
     BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_right <= VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output := BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l297_c11_94a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l297_c11_94a8_left <= VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_left;
     BIN_OP_EQ_uxn_device_h_l297_c11_94a8_right <= VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output := BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l297_c7_fe26] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l297_c7_fe26_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- CAST_TO_uint8_t[uxn_device_h_l332_c23_34b6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l332_c23_34b6_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l312_c18_3416] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l312_c18_3416_left <= VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_left;
     BIN_OP_EQ_uxn_device_h_l312_c18_3416_right <= VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_return_output := BIN_OP_EQ_uxn_device_h_l312_c18_3416_return_output;

     -- BIN_OP_EQ[uxn_device_h_l267_c11_9c98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l267_c11_9c98_left <= VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_left;
     BIN_OP_EQ_uxn_device_h_l267_c11_9c98_right <= VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output := BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;

     -- BIN_OP_EQ[uxn_device_h_l275_c11_a99d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l275_c11_a99d_left <= VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_left;
     BIN_OP_EQ_uxn_device_h_l275_c11_a99d_right <= VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output := BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l363_c22_230b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l363_c22_230b_left <= VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_left;
     BIN_OP_MINUS_uxn_device_h_l363_c22_230b_right <= VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_return_output := BIN_OP_MINUS_uxn_device_h_l363_c22_230b_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l348_c22_637e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l348_c22_637e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_left;
     BIN_OP_MINUS_uxn_device_h_l348_c22_637e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_return_output := BIN_OP_MINUS_uxn_device_h_l348_c22_637e_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l260_c2_fd3e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l260_c2_fd3e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l288_c7_f54c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l288_c7_f54c_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(45, 8));

     -- uint8_6_6[uxn_device_h_l292_c11_440a] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l292_c11_440a_return_output := uint8_6_6(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l288_c11_a602] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l288_c11_a602_left <= VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_left;
     BIN_OP_EQ_uxn_device_h_l288_c11_a602_right <= VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output := BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l352_l368_DUPLICATE_ef7b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l352_l368_DUPLICATE_ef7b_return_output := result.is_device_ram_write;

     -- BIN_OP_MINUS[uxn_device_h_l339_c22_12fd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_left <= VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_left;
     BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_right <= VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_return_output := BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_return_output;

     -- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8 LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_left <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_left;
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_right <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output := BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l334_c22_ae26] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_left <= VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_left;
     BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_right <= VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_return_output := BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l369_c5_e819] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l369_c5_e819_left <= VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_left;
     BIN_OP_PLUS_uxn_device_h_l369_c5_e819_right <= VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_return_output := BIN_OP_PLUS_uxn_device_h_l369_c5_e819_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l284_c7_26da] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l284_c7_26da_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(44, 8));

     -- BIN_OP_EQ[uxn_device_h_l279_c11_82e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l279_c11_82e7_left <= VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_left;
     BIN_OP_EQ_uxn_device_h_l279_c11_82e7_right <= VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output := BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l318_c8_7b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l318_c8_7b73_left <= VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_left;
     BIN_OP_EQ_uxn_device_h_l318_c8_7b73_right <= VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output := BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l279_c7_f401] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l279_c7_f401_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(47, 8));

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output := screen_blit_result.is_blit_done;

     -- BIN_OP_MINUS[uxn_device_h_l356_c22_9db6] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_left <= VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_left;
     BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_right <= VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_return_output := BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l344_l348_l352_l363_DUPLICATE_b83c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l344_l348_l352_l363_DUPLICATE_b83c_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l357_l285_l298_l276_l303_l271_l280_l353_DUPLICATE_82f1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l357_l285_l298_l276_l303_l271_l280_l353_DUPLICATE_82f1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l302_c11_4eda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l302_c11_4eda_left <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_left;
     BIN_OP_EQ_uxn_device_h_l302_c11_4eda_right <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output := BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;

     -- BIN_OP_EQ[uxn_device_h_l284_c11_abb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l284_c11_abb5_left <= VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_left;
     BIN_OP_EQ_uxn_device_h_l284_c11_abb5_right <= VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output := BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l391_c60_ded9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_left;
     BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_return_output := BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l270_c7_86b1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l270_c7_86b1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- CAST_TO_uint8_t[uxn_device_h_l342_c23_32fe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_32fe_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l318_c4_0beb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l318_c4_0beb_return_output := result.is_vram_write;

     -- uint8_7_7[uxn_device_h_l291_c15_30d1] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l291_c15_30d1_return_output := uint8_7_7(
     VAR_previous_device_ram_read);

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output := result.is_deo_done;

     -- CAST_TO_uint4_t[uxn_device_h_l290_c11_9bc8] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l290_c11_9bc8_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l270_c11_b365] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l270_c11_b365_left <= VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_left;
     BIN_OP_EQ_uxn_device_h_l270_c11_b365_right <= VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output := BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;

     -- MUX[uxn_device_h_l316_c39_fef7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l316_c39_fef7_cond <= VAR_MUX_uxn_device_h_l316_c39_fef7_cond;
     MUX_uxn_device_h_l316_c39_fef7_iftrue <= VAR_MUX_uxn_device_h_l316_c39_fef7_iftrue;
     MUX_uxn_device_h_l316_c39_fef7_iffalse <= VAR_MUX_uxn_device_h_l316_c39_fef7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l316_c39_fef7_return_output := MUX_uxn_device_h_l316_c39_fef7_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l366_c23_d252] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l366_c23_d252_return_output := CAST_TO_uint8_t_uint16_t(
     ram_addr);

     -- CONST_SR_8[uxn_device_h_l337_c33_0bf8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l337_c33_0bf8_x <= VAR_CONST_SR_8_uxn_device_h_l337_c33_0bf8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l337_c33_0bf8_return_output := CONST_SR_8_uxn_device_h_l337_c33_0bf8_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l352_l368_DUPLICATE_7950 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l352_l368_DUPLICATE_7950_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l267_c7_eeba] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l267_c7_eeba_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_color_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_result_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_x_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_y_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c6_2fcd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_color_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_layer_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_result_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_x_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_y_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond := VAR_BIN_OP_EQ_uxn_device_h_l267_c11_9c98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_color_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_layer_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_result_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_x_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_y_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond := VAR_BIN_OP_EQ_uxn_device_h_l270_c11_b365_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_color_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_result_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_x_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_y_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l275_c11_a99d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_color_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_layer_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_result_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_x_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_y_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond := VAR_BIN_OP_EQ_uxn_device_h_l279_c11_82e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_color_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_layer_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_result_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_x_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_y_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond := VAR_BIN_OP_EQ_uxn_device_h_l284_c11_abb5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_color_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_layer_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_result_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_x_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_y_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_a602_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_result_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_x_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_y_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_94a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_x_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_y_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_4eda_return_output;
     VAR_MUX_uxn_device_h_l312_c18_79a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c18_3416_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_x_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_y_MUX_uxn_device_h_l318_c4_0beb_cond := VAR_BIN_OP_EQ_uxn_device_h_l318_c8_7b73_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_right := VAR_BIN_OP_MINUS_uxn_device_h_l329_c22_4ebc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_right := VAR_BIN_OP_MINUS_uxn_device_h_l334_c22_ae26_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_right := VAR_BIN_OP_MINUS_uxn_device_h_l339_c22_12fd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_right := VAR_BIN_OP_MINUS_uxn_device_h_l344_c22_9a01_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_right := VAR_BIN_OP_MINUS_uxn_device_h_l348_c22_637e_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_right := VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_e57e_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_right := VAR_BIN_OP_MINUS_uxn_device_h_l356_c22_9db6_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_right := VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_230b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_right := VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_e689_return_output;
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l377_l379_DUPLICATE_f8e8_return_output;
     VAR_tmp4_uxn_device_h_l369_c5_6a67 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_e819_return_output, 4);
     VAR_MUX_uxn_device_h_l391_c11_358b_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_ded9_return_output, 12);
     VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l357_l285_l298_l276_l303_l271_l280_l353_DUPLICATE_82f1_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l357_l285_l298_l276_l303_l271_l280_l353_DUPLICATE_82f1_return_output;
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l357_l285_l298_l276_l303_l271_l280_l353_DUPLICATE_82f1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l357_l285_l298_l276_l303_l271_l280_l353_DUPLICATE_82f1_return_output;
     VAR_color_MUX_uxn_device_h_l288_c7_f54c_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l290_c11_9bc8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l332_c23_34b6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l342_c23_32fe_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l366_c23_d252_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0147_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l352_l368_DUPLICATE_ef7b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l352_l368_DUPLICATE_ef7b_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l352_l363_l339_l318_l344_l356_l368_l334_l329_l348_DUPLICATE_0ff6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l352_l368_DUPLICATE_7950_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l352_l368_DUPLICATE_7950_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l344_l348_l352_l363_DUPLICATE_b83c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l344_l348_l352_l363_DUPLICATE_b83c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l344_l348_l352_l363_DUPLICATE_b83c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l344_l348_l352_l363_DUPLICATE_b83c_return_output;
     VAR_MUX_uxn_device_h_l316_c20_f0cb_iftrue := VAR_MUX_uxn_device_h_l316_c39_fef7_return_output;
     VAR_result_MUX_uxn_device_h_l267_c7_eeba_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l267_c7_eeba_return_output;
     VAR_result_MUX_uxn_device_h_l270_c7_86b1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l270_c7_86b1_return_output;
     VAR_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_result_MUX_uxn_device_h_l279_c7_f401_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l279_c7_f401_return_output;
     VAR_result_MUX_uxn_device_h_l284_c7_26da_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l284_c7_26da_return_output;
     VAR_result_MUX_uxn_device_h_l288_c7_f54c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l288_c7_f54c_return_output;
     VAR_result_MUX_uxn_device_h_l297_c7_fe26_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l297_c7_fe26_return_output;
     VAR_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l318_c4_0beb_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l318_c4_0beb_return_output;
     VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_iftrue := VAR_uint8_4_4_uxn_device_h_l294_c12_17ab_return_output;
     VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_iftrue := VAR_uint8_5_5_uxn_device_h_l293_c12_dea3_return_output;
     VAR_layer_MUX_uxn_device_h_l288_c7_f54c_iftrue := VAR_uint8_6_6_uxn_device_h_l292_c11_440a_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iftrue := VAR_uint8_7_7_uxn_device_h_l291_c15_30d1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_iftrue := VAR_tmp4_uxn_device_h_l369_c5_6a67;
     -- flip_y_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_cond;
     flip_y_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     flip_y_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_return_output := flip_y_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- BIN_OP_OR[uxn_device_h_l276_c3_e781] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l276_c3_e781_left <= VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_left;
     BIN_OP_OR_uxn_device_h_l276_c3_e781_right <= VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_return_output := BIN_OP_OR_uxn_device_h_l276_c3_e781_return_output;

     -- BIN_OP_EQ[uxn_device_h_l344_c13_b92c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l344_c13_b92c_left <= VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_left;
     BIN_OP_EQ_uxn_device_h_l344_c13_b92c_right <= VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output := BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;

     -- MUX[uxn_device_h_l312_c18_79a5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l312_c18_79a5_cond <= VAR_MUX_uxn_device_h_l312_c18_79a5_cond;
     MUX_uxn_device_h_l312_c18_79a5_iftrue <= VAR_MUX_uxn_device_h_l312_c18_79a5_iftrue;
     MUX_uxn_device_h_l312_c18_79a5_iffalse <= VAR_MUX_uxn_device_h_l312_c18_79a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l312_c18_79a5_return_output := MUX_uxn_device_h_l312_c18_79a5_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_cond;
     ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_return_output := ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- layer_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_layer_MUX_uxn_device_h_l288_c7_f54c_cond;
     layer_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_layer_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     layer_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_layer_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l288_c7_f54c_return_output := layer_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output := CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_cond;
     result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_return_output := result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_cond;
     result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_return_output := result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa LATENCY=0
     -- Inputs
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_left <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_left;
     BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_right <= VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_right;
     -- Outputs
     VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output := BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output;

     -- BIN_OP_EQ[uxn_device_h_l329_c13_bceb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l329_c13_bceb_left <= VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_left;
     BIN_OP_EQ_uxn_device_h_l329_c13_bceb_right <= VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output := BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l334_c13_b52a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l334_c13_b52a_left <= VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_left;
     BIN_OP_EQ_uxn_device_h_l334_c13_b52a_right <= VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output := BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l368_c13_1fca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l368_c13_1fca_left <= VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_left;
     BIN_OP_EQ_uxn_device_h_l368_c13_1fca_right <= VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output := BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l363_c13_b8a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_left <= VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_left;
     BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_right <= VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output := BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- BIN_OP_OR[uxn_device_h_l285_c3_54ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l285_c3_54ab_left <= VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_left;
     BIN_OP_OR_uxn_device_h_l285_c3_54ab_right <= VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_return_output := BIN_OP_OR_uxn_device_h_l285_c3_54ab_return_output;

     -- ctrl_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_cond;
     ctrl_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     ctrl_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_return_output := ctrl_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l337_c23_b292] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_b292_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l337_c33_0bf8_return_output);

     -- color_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_color_MUX_uxn_device_h_l288_c7_f54c_cond;
     color_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_color_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     color_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_color_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l288_c7_f54c_return_output := color_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- flip_x_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_cond;
     flip_x_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     flip_x_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_return_output := flip_x_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l339_c13_2142] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l339_c13_2142_left <= VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_left;
     BIN_OP_EQ_uxn_device_h_l339_c13_2142_right <= VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output := BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;

     -- BIN_OP_EQ[uxn_device_h_l356_c13_c95a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l356_c13_c95a_left <= VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_left;
     BIN_OP_EQ_uxn_device_h_l356_c13_c95a_right <= VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output := BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l348_c13_d3b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_left <= VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_left;
     BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_right <= VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output := BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l352_c13_a76e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l352_c13_a76e_left <= VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_left;
     BIN_OP_EQ_uxn_device_h_l352_c13_a76e_right <= VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output := BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;

     -- Submodule level 2
     VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;
     VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c13_bceb_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c13_b52a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c13_2142_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c13_b92c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_cond := VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_cond := VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_cond := VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_cond := VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_cond := VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_cond := VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_cond := VAR_BIN_OP_EQ_uxn_device_h_l348_c13_d3b1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;
     VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_a76e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_cond := VAR_BIN_OP_EQ_uxn_device_h_l356_c13_c95a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output;
     VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_b8a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output;
     VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_1fca_return_output;
     VAR_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue := VAR_BIN_OP_OR_uxn_device_h_l276_c3_e781_return_output;
     VAR_y_MUX_uxn_device_h_l284_c7_26da_iftrue := VAR_BIN_OP_OR_uxn_device_h_l285_c3_54ab_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_left := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_iftrue := VAR_BIN_OP_OR_uint16_t_uint16_t_uxn_device_h_l303_l357_DUPLICATE_e7aa_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l337_c23_b292_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output;
     VAR_x_MUX_uxn_device_h_l270_c7_86b1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output;
     VAR_y_MUX_uxn_device_h_l279_c7_f401_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l354_l299_l281_l272_DUPLICATE_0b82_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_MUX_uxn_device_h_l312_c18_79a5_return_output;
     VAR_color_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_color_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_ctrl_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_flip_x_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_flip_y_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_layer_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_layer_MUX_uxn_device_h_l288_c7_f54c_return_output;
     -- uint8_7_4[uxn_device_h_l313_c17_9690] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l313_c17_9690_return_output := uint8_7_4(
     VAR_MUX_uxn_device_h_l312_c18_79a5_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l368_c9_7542] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_return_output := result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_return_output;

     -- result_u8_value_MUX[uxn_device_h_l363_c9_2091] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l363_c9_2091_cond <= VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_cond;
     result_u8_value_MUX_uxn_device_h_l363_c9_2091_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_iftrue;
     result_u8_value_MUX_uxn_device_h_l363_c9_2091_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_return_output := result_u8_value_MUX_uxn_device_h_l363_c9_2091_return_output;

     -- uint8_1_1[uxn_device_h_l315_c19_4645] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l315_c19_4645_return_output := uint8_1_1(
     VAR_MUX_uxn_device_h_l312_c18_79a5_return_output);

     -- ctrl_mode_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_cond;
     ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iftrue;
     ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_return_output := ctrl_mode_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l368_c9_7542] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_return_output;

     -- uint8_0_0[uxn_device_h_l314_c19_5179] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l314_c19_5179_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l312_c18_79a5_return_output);

     -- uint8_2_2[uxn_device_h_l316_c20_4283] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l316_c20_4283_return_output := uint8_2_2(
     VAR_MUX_uxn_device_h_l312_c18_79a5_return_output);

     -- tmp4_MUX[uxn_device_h_l368_c9_7542] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l368_c9_7542_cond <= VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_cond;
     tmp4_MUX_uxn_device_h_l368_c9_7542_iftrue <= VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_iftrue;
     tmp4_MUX_uxn_device_h_l368_c9_7542_iffalse <= VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_return_output := tmp4_MUX_uxn_device_h_l368_c9_7542_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- flip_y_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_cond;
     flip_y_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_iftrue;
     flip_y_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_return_output := flip_y_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- color_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_color_MUX_uxn_device_h_l284_c7_26da_cond;
     color_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_color_MUX_uxn_device_h_l284_c7_26da_iftrue;
     color_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_color_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l284_c7_26da_return_output := color_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- layer_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_layer_MUX_uxn_device_h_l284_c7_26da_cond;
     layer_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_layer_MUX_uxn_device_h_l284_c7_26da_iftrue;
     layer_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_layer_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l284_c7_26da_return_output := layer_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l368_c9_7542] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_cond;
     result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_return_output := result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l368_c9_7542] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_cond;
     result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_return_output := result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_return_output;

     -- flip_x_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_cond;
     flip_x_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_iftrue;
     flip_x_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_return_output := flip_x_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- ctrl_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_cond;
     ctrl_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_iftrue;
     ctrl_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_return_output := ctrl_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- auto_advance_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_cond;
     auto_advance_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     auto_advance_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_return_output := auto_advance_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_auto_advance_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_color_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_color_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_ctrl_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_flip_x_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_flip_y_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_layer_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_layer_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_7542_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_7542_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_7542_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l363_c9_2091_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_7542_return_output;
     VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_iffalse := VAR_tmp4_MUX_uxn_device_h_l368_c9_7542_return_output;
     VAR_MUX_uxn_device_h_l314_c19_73d5_cond := VAR_uint8_0_0_uxn_device_h_l314_c19_5179_return_output;
     VAR_MUX_uxn_device_h_l315_c19_9ca3_cond := VAR_uint8_1_1_uxn_device_h_l315_c19_4645_return_output;
     VAR_MUX_uxn_device_h_l316_c20_f0cb_cond := VAR_uint8_2_2_uxn_device_h_l316_c20_4283_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_left := VAR_uint8_7_4_uxn_device_h_l313_c17_9690_return_output;
     VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_uint8_7_4_uxn_device_h_l313_c17_9690_return_output;
     -- layer_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_layer_MUX_uxn_device_h_l279_c7_f401_cond;
     layer_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_layer_MUX_uxn_device_h_l279_c7_f401_iftrue;
     layer_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_layer_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l279_c7_f401_return_output := layer_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l363_c9_2091] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_cond;
     result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_return_output := result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_return_output;

     -- MUX[uxn_device_h_l315_c19_9ca3] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l315_c19_9ca3_cond <= VAR_MUX_uxn_device_h_l315_c19_9ca3_cond;
     MUX_uxn_device_h_l315_c19_9ca3_iftrue <= VAR_MUX_uxn_device_h_l315_c19_9ca3_iftrue;
     MUX_uxn_device_h_l315_c19_9ca3_iffalse <= VAR_MUX_uxn_device_h_l315_c19_9ca3_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l315_c19_9ca3_return_output := MUX_uxn_device_h_l315_c19_9ca3_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l363_c9_2091] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l363_c9_2091] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_cond;
     result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_return_output := result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_return_output;

     -- flip_x_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_cond;
     flip_x_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_iftrue;
     flip_x_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_return_output := flip_x_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- MUX[uxn_device_h_l314_c19_73d5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l314_c19_73d5_cond <= VAR_MUX_uxn_device_h_l314_c19_73d5_cond;
     MUX_uxn_device_h_l314_c19_73d5_iftrue <= VAR_MUX_uxn_device_h_l314_c19_73d5_iftrue;
     MUX_uxn_device_h_l314_c19_73d5_iffalse <= VAR_MUX_uxn_device_h_l314_c19_73d5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l314_c19_73d5_return_output := MUX_uxn_device_h_l314_c19_73d5_return_output;

     -- color_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_color_MUX_uxn_device_h_l279_c7_f401_cond;
     color_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_color_MUX_uxn_device_h_l279_c7_f401_iftrue;
     color_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_color_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l279_c7_f401_return_output := color_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l363_c9_2091] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_return_output := result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_return_output;

     -- BIN_OP_EQ[uxn_device_h_l388_c19_69f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l388_c19_69f2_left <= VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_left;
     BIN_OP_EQ_uxn_device_h_l388_c19_69f2_right <= VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_return_output := BIN_OP_EQ_uxn_device_h_l388_c19_69f2_return_output;

     -- MUX[uxn_device_h_l316_c20_f0cb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l316_c20_f0cb_cond <= VAR_MUX_uxn_device_h_l316_c20_f0cb_cond;
     MUX_uxn_device_h_l316_c20_f0cb_iftrue <= VAR_MUX_uxn_device_h_l316_c20_f0cb_iftrue;
     MUX_uxn_device_h_l316_c20_f0cb_iffalse <= VAR_MUX_uxn_device_h_l316_c20_f0cb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l316_c20_f0cb_return_output := MUX_uxn_device_h_l316_c20_f0cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- tmp4_MUX[uxn_device_h_l363_c9_2091] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l363_c9_2091_cond <= VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_cond;
     tmp4_MUX_uxn_device_h_l363_c9_2091_iftrue <= VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_iftrue;
     tmp4_MUX_uxn_device_h_l363_c9_2091_iffalse <= VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_return_output := tmp4_MUX_uxn_device_h_l363_c9_2091_return_output;

     -- flip_y_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_cond;
     flip_y_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_iftrue;
     flip_y_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_return_output := flip_y_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- auto_length_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_cond;
     auto_length_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     auto_length_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_return_output := auto_length_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_cond;
     ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iftrue;
     ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_return_output := ctrl_mode_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- auto_advance_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_cond;
     auto_advance_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     auto_advance_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_return_output := auto_advance_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- ctrl_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_cond;
     ctrl_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_iftrue;
     ctrl_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_return_output := ctrl_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l388_c19_a30a_cond := VAR_BIN_OP_EQ_uxn_device_h_l388_c19_69f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_right := VAR_MUX_uxn_device_h_l314_c19_73d5_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_right := VAR_MUX_uxn_device_h_l314_c19_73d5_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_right := VAR_MUX_uxn_device_h_l314_c19_73d5_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_right := VAR_MUX_uxn_device_h_l314_c19_73d5_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_MUX_uxn_device_h_l314_c19_73d5_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_right := VAR_MUX_uxn_device_h_l315_c19_9ca3_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_right := VAR_MUX_uxn_device_h_l315_c19_9ca3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_right := VAR_MUX_uxn_device_h_l315_c19_9ca3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_right := VAR_MUX_uxn_device_h_l315_c19_9ca3_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_MUX_uxn_device_h_l315_c19_9ca3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_right := VAR_MUX_uxn_device_h_l316_c20_f0cb_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_MUX_uxn_device_h_l316_c20_f0cb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_auto_length_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_color_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_color_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_ctrl_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_flip_x_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_flip_y_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_layer_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_2091_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_2091_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_2091_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_2091_return_output;
     VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_iffalse := VAR_tmp4_MUX_uxn_device_h_l363_c9_2091_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l321_c58_7345] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l321_c58_7345_left <= VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_left;
     BIN_OP_PLUS_uxn_device_h_l321_c58_7345_right <= VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_return_output := BIN_OP_PLUS_uxn_device_h_l321_c58_7345_return_output;

     -- ctrl_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_cond;
     ctrl_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     ctrl_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_return_output := ctrl_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l356_c9_deb3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_cond;
     result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_return_output := result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond;
     y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output := y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_cond;
     x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output := x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- layer_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_cond;
     layer_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     layer_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_return_output := layer_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- tmp4_MUX[uxn_device_h_l356_c9_deb3] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l356_c9_deb3_cond <= VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_cond;
     tmp4_MUX_uxn_device_h_l356_c9_deb3_iftrue <= VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_iftrue;
     tmp4_MUX_uxn_device_h_l356_c9_deb3_iffalse <= VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_return_output := tmp4_MUX_uxn_device_h_l356_c9_deb3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l356_c9_deb3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_cond;
     result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_return_output := result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l320_c51_a137] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l320_c51_a137_left <= VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_left;
     BIN_OP_PLUS_uxn_device_h_l320_c51_a137_right <= VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_return_output := BIN_OP_PLUS_uxn_device_h_l320_c51_a137_return_output;

     -- color_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_color_MUX_uxn_device_h_l275_c7_f0fc_cond;
     color_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_color_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     color_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_color_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l275_c7_f0fc_return_output := color_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l356_c9_deb3] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l321_c36_e4fe] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_left <= VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_left;
     BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_right <= VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_return_output := BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l319_c23_cac0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_left <= VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_left;
     BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_right <= VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_return_output := BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l322_c36_5880] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l322_c36_5880_left <= VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_left;
     BIN_OP_MINUS_uxn_device_h_l322_c36_5880_right <= VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_return_output := BIN_OP_MINUS_uxn_device_h_l322_c36_5880_return_output;

     -- auto_advance_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_cond;
     auto_advance_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     auto_advance_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_return_output := auto_advance_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- auto_length_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_cond;
     auto_length_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     auto_length_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_return_output := auto_length_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_cond;
     ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_return_output := ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l320_c24_af41] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l320_c24_af41_left <= VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_left;
     BIN_OP_MINUS_uxn_device_h_l320_c24_af41_right <= VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_return_output := BIN_OP_MINUS_uxn_device_h_l320_c24_af41_return_output;

     -- flip_x_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_cond;
     flip_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     flip_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_return_output := flip_x_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_cond;
     ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_return_output := ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l322_c58_4c1c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_left <= VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_left;
     BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_right <= VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_return_output := BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l358_c5_2cef] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_left <= VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_left;
     BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_right <= VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_return_output := BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_return_output;

     -- flip_y_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_cond;
     flip_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     flip_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_return_output := flip_y_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l356_c9_deb3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_return_output := result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_return_output;

     -- MUX[uxn_device_h_l388_c19_a30a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l388_c19_a30a_cond <= VAR_MUX_uxn_device_h_l388_c19_a30a_cond;
     MUX_uxn_device_h_l388_c19_a30a_iftrue <= VAR_MUX_uxn_device_h_l388_c19_a30a_iftrue;
     MUX_uxn_device_h_l388_c19_a30a_iffalse <= VAR_MUX_uxn_device_h_l388_c19_a30a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l388_c19_a30a_return_output := MUX_uxn_device_h_l388_c19_a30a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l319_c49_c9db] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_left <= VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_left;
     BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_right <= VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_return_output := BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l319_c13_1a4d_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l319_c23_cac0_return_output;
     VAR_MUX_uxn_device_h_l320_c14_b2e5_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l320_c24_af41_return_output;
     VAR_MUX_uxn_device_h_l321_c26_998e_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l321_c36_e4fe_return_output;
     VAR_MUX_uxn_device_h_l322_c26_b0a5_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l322_c36_5880_return_output;
     VAR_MUX_uxn_device_h_l319_c13_1a4d_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l319_c49_c9db_return_output, 16);
     VAR_MUX_uxn_device_h_l320_c14_b2e5_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l320_c51_a137_return_output, 16);
     VAR_MUX_uxn_device_h_l321_c26_998e_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l321_c58_7345_return_output, 16);
     VAR_MUX_uxn_device_h_l322_c26_b0a5_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l322_c58_4c1c_return_output, 16);
     VAR_ram_addr_uxn_device_h_l358_c5_f768 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_2cef_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_iffalse := VAR_MUX_uxn_device_h_l388_c19_a30a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_auto_advance_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_auto_length_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_color_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_color_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_ctrl_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_flip_x_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_flip_y_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_layer_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_layer_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l356_c9_deb3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l356_c9_deb3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l356_c9_deb3_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l356_c9_deb3_return_output;
     VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_iffalse := VAR_tmp4_MUX_uxn_device_h_l356_c9_deb3_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_CONST_SR_8_uxn_device_h_l361_c33_95d7_x := VAR_ram_addr_uxn_device_h_l358_c5_f768;
     VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_iftrue := VAR_ram_addr_uxn_device_h_l358_c5_f768;
     -- auto_length_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_cond;
     auto_length_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     auto_length_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_return_output := auto_length_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_cond;
     ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_return_output := ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- tmp4_MUX[uxn_device_h_l352_c9_c4e2] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l352_c9_c4e2_cond <= VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_cond;
     tmp4_MUX_uxn_device_h_l352_c9_c4e2_iftrue <= VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_iftrue;
     tmp4_MUX_uxn_device_h_l352_c9_c4e2_iffalse <= VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_return_output := tmp4_MUX_uxn_device_h_l352_c9_c4e2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l352_c9_c4e2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_cond;
     result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_return_output := result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_return_output;

     -- MUX[uxn_device_h_l321_c26_998e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l321_c26_998e_cond <= VAR_MUX_uxn_device_h_l321_c26_998e_cond;
     MUX_uxn_device_h_l321_c26_998e_iftrue <= VAR_MUX_uxn_device_h_l321_c26_998e_iftrue;
     MUX_uxn_device_h_l321_c26_998e_iffalse <= VAR_MUX_uxn_device_h_l321_c26_998e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l321_c26_998e_return_output := MUX_uxn_device_h_l321_c26_998e_return_output;

     -- MUX[uxn_device_h_l320_c14_b2e5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l320_c14_b2e5_cond <= VAR_MUX_uxn_device_h_l320_c14_b2e5_cond;
     MUX_uxn_device_h_l320_c14_b2e5_iftrue <= VAR_MUX_uxn_device_h_l320_c14_b2e5_iftrue;
     MUX_uxn_device_h_l320_c14_b2e5_iffalse <= VAR_MUX_uxn_device_h_l320_c14_b2e5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l320_c14_b2e5_return_output := MUX_uxn_device_h_l320_c14_b2e5_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l352_c9_c4e2] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_return_output;

     -- flip_x_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_cond;
     flip_x_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     flip_x_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_return_output := flip_x_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- flip_y_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_cond;
     flip_y_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     flip_y_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_return_output := flip_y_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l352_c9_c4e2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_cond;
     result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_return_output := result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l352_c9_c4e2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_return_output := result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_return_output;

     -- ctrl_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_cond;
     ctrl_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     ctrl_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_return_output := ctrl_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_cond;
     ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_return_output := ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- MUX[uxn_device_h_l319_c13_1a4d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l319_c13_1a4d_cond <= VAR_MUX_uxn_device_h_l319_c13_1a4d_cond;
     MUX_uxn_device_h_l319_c13_1a4d_iftrue <= VAR_MUX_uxn_device_h_l319_c13_1a4d_iftrue;
     MUX_uxn_device_h_l319_c13_1a4d_iffalse <= VAR_MUX_uxn_device_h_l319_c13_1a4d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l319_c13_1a4d_return_output := MUX_uxn_device_h_l319_c13_1a4d_return_output;

     -- MUX[uxn_device_h_l322_c26_b0a5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l322_c26_b0a5_cond <= VAR_MUX_uxn_device_h_l322_c26_b0a5_cond;
     MUX_uxn_device_h_l322_c26_b0a5_iftrue <= VAR_MUX_uxn_device_h_l322_c26_b0a5_iftrue;
     MUX_uxn_device_h_l322_c26_b0a5_iffalse <= VAR_MUX_uxn_device_h_l322_c26_b0a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l322_c26_b0a5_return_output := MUX_uxn_device_h_l322_c26_b0a5_return_output;

     -- is_last_blit_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_cond;
     is_last_blit_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_iftrue;
     is_last_blit_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_return_output := is_last_blit_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- ram_addr_MUX[uxn_device_h_l356_c9_deb3] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l356_c9_deb3_cond <= VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_cond;
     ram_addr_MUX_uxn_device_h_l356_c9_deb3_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_iftrue;
     ram_addr_MUX_uxn_device_h_l356_c9_deb3_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_return_output := ram_addr_MUX_uxn_device_h_l356_c9_deb3_return_output;

     -- color_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_color_MUX_uxn_device_h_l270_c7_86b1_cond;
     color_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_color_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     color_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_color_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l270_c7_86b1_return_output := color_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- auto_advance_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_cond;
     auto_advance_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_iftrue;
     auto_advance_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_return_output := auto_advance_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond;
     y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output := y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_cond;
     x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output := x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- layer_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_layer_MUX_uxn_device_h_l270_c7_86b1_cond;
     layer_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_layer_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     layer_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_layer_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l270_c7_86b1_return_output := layer_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- CONST_SR_8[uxn_device_h_l361_c33_95d7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l361_c33_95d7_x <= VAR_CONST_SR_8_uxn_device_h_l361_c33_95d7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l361_c33_95d7_return_output := CONST_SR_8_uxn_device_h_l361_c33_95d7_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_MUX_uxn_device_h_l319_c13_1a4d_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_MUX_uxn_device_h_l320_c14_b2e5_return_output;
     VAR_MUX_uxn_device_h_l321_c10_a259_iftrue := VAR_MUX_uxn_device_h_l321_c26_998e_return_output;
     VAR_MUX_uxn_device_h_l322_c10_c015_iftrue := VAR_MUX_uxn_device_h_l322_c26_b0a5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_auto_advance_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_auto_length_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_color_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_color_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_ctrl_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_flip_x_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_flip_y_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_layer_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_layer_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l356_c9_deb3_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_c4e2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_c4e2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_c4e2_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_c4e2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_iffalse := VAR_tmp4_MUX_uxn_device_h_l352_c9_c4e2_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_fe26_return_output;
     -- flip_y_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_cond;
     flip_y_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     flip_y_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_return_output := flip_y_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- ctrl_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_cond;
     ctrl_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     ctrl_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_return_output := ctrl_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- MUX[uxn_device_h_l321_c10_a259] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l321_c10_a259_cond <= VAR_MUX_uxn_device_h_l321_c10_a259_cond;
     MUX_uxn_device_h_l321_c10_a259_iftrue <= VAR_MUX_uxn_device_h_l321_c10_a259_iftrue;
     MUX_uxn_device_h_l321_c10_a259_iffalse <= VAR_MUX_uxn_device_h_l321_c10_a259_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l321_c10_a259_return_output := MUX_uxn_device_h_l321_c10_a259_return_output;

     -- MUX[uxn_device_h_l322_c10_c015] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l322_c10_c015_cond <= VAR_MUX_uxn_device_h_l322_c10_c015_cond;
     MUX_uxn_device_h_l322_c10_c015_iftrue <= VAR_MUX_uxn_device_h_l322_c10_c015_iftrue;
     MUX_uxn_device_h_l322_c10_c015_iffalse <= VAR_MUX_uxn_device_h_l322_c10_c015_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l322_c10_c015_return_output := MUX_uxn_device_h_l322_c10_c015_return_output;

     -- layer_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_layer_MUX_uxn_device_h_l267_c7_eeba_cond;
     layer_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_layer_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     layer_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_layer_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l267_c7_eeba_return_output := layer_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l348_c9_698c] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_return_output;

     -- auto_advance_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_cond;
     auto_advance_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_iftrue;
     auto_advance_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_return_output := auto_advance_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- auto_length_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_cond;
     auto_length_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_iftrue;
     auto_length_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_return_output := auto_length_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond;
     y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output := y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- is_last_blit_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_cond;
     is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_return_output := is_last_blit_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l348_c9_698c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_cond;
     result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_return_output := result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_return_output;

     -- ram_addr_MUX[uxn_device_h_l352_c9_c4e2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l352_c9_c4e2_cond <= VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_cond;
     ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iftrue;
     ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_return_output := ram_addr_MUX_uxn_device_h_l352_c9_c4e2_return_output;

     -- color_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_color_MUX_uxn_device_h_l267_c7_eeba_cond;
     color_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_color_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     color_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_color_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l267_c7_eeba_return_output := color_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- tmp16_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_cond;
     tmp16_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     tmp16_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_return_output := tmp16_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l348_c9_698c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_cond;
     result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_return_output := result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_cond;
     ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_return_output := ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- tmp16b_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_cond;
     tmp16b_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     tmp16b_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_return_output := tmp16b_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- flip_x_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_cond;
     flip_x_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     flip_x_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_return_output := flip_x_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l361_c23_25ae] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l361_c23_25ae_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l361_c33_95d7_return_output);

     -- result_is_device_ram_write_MUX[uxn_device_h_l348_c9_698c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_return_output := result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_return_output;

     -- tmp4_MUX[uxn_device_h_l348_c9_698c] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l348_c9_698c_cond <= VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_cond;
     tmp4_MUX_uxn_device_h_l348_c9_698c_iftrue <= VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_iftrue;
     tmp4_MUX_uxn_device_h_l348_c9_698c_iffalse <= VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_return_output := tmp4_MUX_uxn_device_h_l348_c9_698c_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_cond;
     ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_return_output := ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_cond;
     x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output := x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l361_c23_25ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_CONST_SR_8_uxn_device_h_l327_c33_c536_x := VAR_MUX_uxn_device_h_l321_c10_a259_return_output;
     VAR_x_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_MUX_uxn_device_h_l321_c10_a259_return_output;
     VAR_y_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_MUX_uxn_device_h_l322_c10_c015_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_auto_advance_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_auto_length_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_color_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_color_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_ctrl_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_flip_x_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_flip_y_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_layer_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l352_c9_c4e2_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l348_c9_698c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l348_c9_698c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l348_c9_698c_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l348_c9_698c_return_output;
     VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_tmp16_MUX_uxn_device_h_l318_c4_0beb_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_tmp16b_MUX_uxn_device_h_l318_c4_0beb_return_output;
     VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_iffalse := VAR_tmp4_MUX_uxn_device_h_l348_c9_698c_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_f54c_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l344_c9_6535] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_cond;
     result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_return_output := result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l344_c9_6535] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_return_output := result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_return_output;

     -- tmp16b_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_cond;
     tmp16b_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_iftrue;
     tmp16b_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_return_output := tmp16b_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- color_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_color_MUX_uxn_device_h_l260_c2_fd3e_cond;
     color_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_color_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     color_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_color_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l260_c2_fd3e_return_output := color_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_cond;
     ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_return_output := ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- CONST_SR_8[uxn_device_h_l327_c33_c536] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l327_c33_c536_x <= VAR_CONST_SR_8_uxn_device_h_l327_c33_c536_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l327_c33_c536_return_output := CONST_SR_8_uxn_device_h_l327_c33_c536_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_cond;
     ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_return_output := ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- ram_addr_MUX[uxn_device_h_l348_c9_698c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l348_c9_698c_cond <= VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_cond;
     ram_addr_MUX_uxn_device_h_l348_c9_698c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_iftrue;
     ram_addr_MUX_uxn_device_h_l348_c9_698c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_return_output := ram_addr_MUX_uxn_device_h_l348_c9_698c_return_output;

     -- auto_advance_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_cond;
     auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_return_output := auto_advance_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- x_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_x_MUX_uxn_device_h_l318_c4_0beb_cond;
     x_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_x_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     x_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_x_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l318_c4_0beb_return_output := x_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l344_c9_6535] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_return_output;

     -- layer_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_cond;
     layer_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     layer_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_return_output := layer_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond;
     y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output := y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- result_u8_value_MUX[uxn_device_h_l356_c9_deb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l356_c9_deb3_cond <= VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_cond;
     result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iftrue;
     result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_return_output := result_u8_value_MUX_uxn_device_h_l356_c9_deb3_return_output;

     -- flip_x_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_cond;
     flip_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     flip_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_return_output := flip_x_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- y_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_y_MUX_uxn_device_h_l318_c4_0beb_cond;
     y_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_y_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     y_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_y_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l318_c4_0beb_return_output := y_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- tmp16_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_cond;
     tmp16_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_iftrue;
     tmp16_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_return_output := tmp16_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- ctrl_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_cond;
     ctrl_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     ctrl_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_return_output := ctrl_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- flip_y_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_cond;
     flip_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     flip_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_return_output := flip_y_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- tmp4_MUX[uxn_device_h_l344_c9_6535] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l344_c9_6535_cond <= VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_cond;
     tmp4_MUX_uxn_device_h_l344_c9_6535_iftrue <= VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_iftrue;
     tmp4_MUX_uxn_device_h_l344_c9_6535_iffalse <= VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_return_output := tmp4_MUX_uxn_device_h_l344_c9_6535_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l344_c9_6535] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_cond;
     result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_return_output := result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_return_output;

     -- is_last_blit_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_cond;
     is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_return_output := is_last_blit_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_cond;
     x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output := x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- auto_length_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_cond;
     auto_length_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_iftrue;
     auto_length_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_return_output := auto_length_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_auto_advance_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_auto_length_MUX_uxn_device_h_l279_c7_f401_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l297_c7_fe26_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_iffalse := VAR_ram_addr_MUX_uxn_device_h_l348_c9_698c_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l344_c9_6535_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l344_c9_6535_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l344_c9_6535_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l356_c9_deb3_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l344_c9_6535_return_output;
     VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_tmp16_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_tmp16b_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_iffalse := VAR_tmp4_MUX_uxn_device_h_l344_c9_6535_return_output;
     VAR_x_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_x_MUX_uxn_device_h_l318_c4_0beb_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_y_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_y_MUX_uxn_device_h_l318_c4_0beb_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l284_c7_26da_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l339_c9_ef7f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_cond;
     result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_return_output := result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_cond;
     ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_return_output := ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- tmp4_MUX[uxn_device_h_l339_c9_ef7f] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l339_c9_ef7f_cond <= VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_cond;
     tmp4_MUX_uxn_device_h_l339_c9_ef7f_iftrue <= VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_iftrue;
     tmp4_MUX_uxn_device_h_l339_c9_ef7f_iffalse <= VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_return_output := tmp4_MUX_uxn_device_h_l339_c9_ef7f_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l327_c23_2094] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l327_c23_2094_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l327_c33_c536_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l339_c9_ef7f] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond;
     x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output := x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- auto_length_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_cond;
     auto_length_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     auto_length_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_return_output := auto_length_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- ram_addr_MUX[uxn_device_h_l344_c9_6535] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l344_c9_6535_cond <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_cond;
     ram_addr_MUX_uxn_device_h_l344_c9_6535_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_iftrue;
     ram_addr_MUX_uxn_device_h_l344_c9_6535_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_return_output := ram_addr_MUX_uxn_device_h_l344_c9_6535_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_cond;
     y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output := y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- y_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_y_MUX_uxn_device_h_l317_c3_5353_cond;
     y_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_y_MUX_uxn_device_h_l317_c3_5353_iftrue;
     y_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_y_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l317_c3_5353_return_output := y_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- auto_advance_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_cond;
     auto_advance_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     auto_advance_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_return_output := auto_advance_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- tmp16b_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_cond;
     tmp16b_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     tmp16b_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_return_output := tmp16b_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- result_u8_value_MUX[uxn_device_h_l352_c9_c4e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_cond <= VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_cond;
     result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iftrue;
     result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_return_output := result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_return_output;

     -- is_last_blit_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_cond;
     is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_return_output := is_last_blit_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l339_c9_ef7f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_cond;
     result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_return_output := result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_return_output;

     -- x_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_x_MUX_uxn_device_h_l317_c3_5353_cond;
     x_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_x_MUX_uxn_device_h_l317_c3_5353_iftrue;
     x_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_x_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l317_c3_5353_return_output := x_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l339_c9_ef7f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_return_output := result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_return_output;

     -- tmp16_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_cond;
     tmp16_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     tmp16_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_return_output := tmp16_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l327_c23_2094_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_auto_advance_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_auto_length_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iffalse := VAR_ram_addr_MUX_uxn_device_h_l344_c9_6535_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l339_c9_ef7f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l339_c9_ef7f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l339_c9_ef7f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l352_c9_c4e2_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l339_c9_ef7f_return_output;
     VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_tmp16_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_tmp16b_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_iffalse := VAR_tmp4_MUX_uxn_device_h_l339_c9_ef7f_return_output;
     VAR_x_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_x_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_y_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_y_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l279_c7_f401_return_output;
     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l334_c9_7cb6] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_return_output;

     -- auto_advance_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_cond;
     auto_advance_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     auto_advance_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_return_output := auto_advance_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- tmp16_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_cond;
     tmp16_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     tmp16_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_return_output := tmp16_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- result_u8_value_MUX[uxn_device_h_l348_c9_698c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l348_c9_698c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_cond;
     result_u8_value_MUX_uxn_device_h_l348_c9_698c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_iftrue;
     result_u8_value_MUX_uxn_device_h_l348_c9_698c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_return_output := result_u8_value_MUX_uxn_device_h_l348_c9_698c_return_output;

     -- auto_length_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_cond;
     auto_length_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     auto_length_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_return_output := auto_length_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l334_c9_7cb6] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_return_output := result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l334_c9_7cb6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_cond;
     result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_return_output := result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond;
     x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output := x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- ram_addr_MUX[uxn_device_h_l339_c9_ef7f] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l339_c9_ef7f_cond <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_cond;
     ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iftrue;
     ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_return_output := ram_addr_MUX_uxn_device_h_l339_c9_ef7f_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_cond;
     y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output := y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- is_last_blit_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_cond;
     is_last_blit_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_iftrue;
     is_last_blit_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_return_output := is_last_blit_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- x_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_x_MUX_uxn_device_h_l302_c7_33e1_cond;
     x_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_x_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     x_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_x_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l302_c7_33e1_return_output := x_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- y_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_y_MUX_uxn_device_h_l302_c7_33e1_cond;
     y_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_y_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     y_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_y_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l302_c7_33e1_return_output := y_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- tmp16b_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_cond;
     tmp16b_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     tmp16b_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_return_output := tmp16b_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l311_c1_c929] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_return_output;

     -- tmp4_MUX[uxn_device_h_l334_c9_7cb6] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l334_c9_7cb6_cond <= VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_cond;
     tmp4_MUX_uxn_device_h_l334_c9_7cb6_iftrue <= VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_iftrue;
     tmp4_MUX_uxn_device_h_l334_c9_7cb6_iffalse <= VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_return_output := tmp4_MUX_uxn_device_h_l334_c9_7cb6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l334_c9_7cb6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_cond;
     result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_return_output := result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_cond;
     ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output := ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c1_c929_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_auto_length_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l339_c9_ef7f_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l334_c9_7cb6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l334_c9_7cb6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l334_c9_7cb6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l348_c9_698c_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l334_c9_7cb6_return_output;
     VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_tmp16_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_tmp16b_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_iffalse := VAR_tmp4_MUX_uxn_device_h_l334_c9_7cb6_return_output;
     VAR_x_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_x_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_y_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_y_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     -- tmp16_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_cond;
     tmp16_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     tmp16_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_return_output := tmp16_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- x_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_x_MUX_uxn_device_h_l297_c7_fe26_cond;
     x_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_x_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     x_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_x_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l297_c7_fe26_return_output := x_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- tmp16b_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_cond;
     tmp16b_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     tmp16b_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_return_output := tmp16b_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- y_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_y_MUX_uxn_device_h_l297_c7_fe26_cond;
     y_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_y_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     y_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_y_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l297_c7_fe26_return_output := y_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- tmp4_MUX[uxn_device_h_l329_c9_3e5b] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l329_c9_3e5b_cond <= VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_cond;
     tmp4_MUX_uxn_device_h_l329_c9_3e5b_iftrue <= VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_iftrue;
     tmp4_MUX_uxn_device_h_l329_c9_3e5b_iffalse <= VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_return_output := tmp4_MUX_uxn_device_h_l329_c9_3e5b_return_output;

     -- auto_advance_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_cond;
     auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_return_output := auto_advance_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond;
     x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output := x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l329_c9_3e5b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_cond;
     result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_return_output := result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l344_c9_6535] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l344_c9_6535_cond <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_cond;
     result_u8_value_MUX_uxn_device_h_l344_c9_6535_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_iftrue;
     result_u8_value_MUX_uxn_device_h_l344_c9_6535_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_return_output := result_u8_value_MUX_uxn_device_h_l344_c9_6535_return_output;

     -- ram_addr_MUX[uxn_device_h_l334_c9_7cb6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l334_c9_7cb6_cond <= VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_cond;
     ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iftrue;
     ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_return_output := ram_addr_MUX_uxn_device_h_l334_c9_7cb6_return_output;

     -- auto_length_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_cond;
     auto_length_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     auto_length_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_return_output := auto_length_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_bc41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l329_c9_3e5b] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l329_c9_3e5b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_cond;
     ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_return_output := ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- is_last_blit_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_cond;
     is_last_blit_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_iftrue;
     is_last_blit_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_return_output := is_last_blit_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_cond;
     y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output := y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l329_c9_3e5b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_cond;
     result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_return_output := result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_bc41_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_auto_length_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iffalse := VAR_ram_addr_MUX_uxn_device_h_l334_c9_7cb6_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l329_c9_3e5b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l329_c9_3e5b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l329_c9_3e5b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l344_c9_6535_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l329_c9_3e5b_return_output;
     VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_tmp16_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_tmp16b_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_tmp4_MUX_uxn_device_h_l329_c9_3e5b_return_output;
     VAR_x_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_x_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_y_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_y_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l270_c7_86b1_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_cond;
     result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_return_output := result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_cond;
     result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_return_output := result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l376_c1_5e60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond;
     x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output := x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l378_c1_4bb8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_return_output;

     -- is_last_blit_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_cond;
     is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_return_output := is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_return_output := result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- y_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_y_MUX_uxn_device_h_l288_c7_f54c_cond;
     y_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_y_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     y_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_y_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l288_c7_f54c_return_output := y_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- x_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_x_MUX_uxn_device_h_l288_c7_f54c_cond;
     x_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_x_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     x_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_x_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l288_c7_f54c_return_output := x_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_cond;
     ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_return_output := ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- result_u8_value_MUX[uxn_device_h_l339_c9_ef7f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_cond <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_cond;
     result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iftrue;
     result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_return_output := result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_return_output;

     -- tmp16b_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_cond;
     tmp16b_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_iftrue;
     tmp16b_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_return_output := tmp16b_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- ram_addr_MUX[uxn_device_h_l329_c9_3e5b] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l329_c9_3e5b_cond <= VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_cond;
     ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iftrue;
     ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_return_output := ram_addr_MUX_uxn_device_h_l329_c9_3e5b_return_output;

     -- auto_length_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_cond;
     auto_length_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     auto_length_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_return_output := auto_length_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- tmp4_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_cond;
     tmp4_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     tmp4_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_return_output := tmp4_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- tmp16_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_cond;
     tmp16_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_iftrue;
     tmp16_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_return_output := tmp16_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_cond;
     y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output := y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- Submodule level 12
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_4bb8_return_output;
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_5e60_return_output;
     REG_VAR_auto_length := VAR_auto_length_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l329_c9_3e5b_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l339_c9_ef7f_return_output;
     VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_tmp16_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_tmp16b_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_tmp4_MUX_uxn_device_h_l318_c4_0beb_return_output;
     VAR_x_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_x_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_y_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_y_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l267_c7_eeba_return_output;
     -- ram_addr_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_cond;
     ram_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     ram_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_return_output := ram_addr_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- is_last_blit_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_cond;
     is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_return_output := is_last_blit_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- screen_2bpp[uxn_device_h_l377_c26_5b73] LATENCY=0
     -- Clock enable
     screen_2bpp_uxn_device_h_l377_c26_5b73_CLOCK_ENABLE <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_CLOCK_ENABLE;
     -- Inputs
     screen_2bpp_uxn_device_h_l377_c26_5b73_phase <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_phase;
     screen_2bpp_uxn_device_h_l377_c26_5b73_x1 <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_x1;
     screen_2bpp_uxn_device_h_l377_c26_5b73_y1 <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_y1;
     screen_2bpp_uxn_device_h_l377_c26_5b73_color <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_color;
     screen_2bpp_uxn_device_h_l377_c26_5b73_fx <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_fx;
     screen_2bpp_uxn_device_h_l377_c26_5b73_fy <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_fy;
     screen_2bpp_uxn_device_h_l377_c26_5b73_ram_addr <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_ram_addr;
     screen_2bpp_uxn_device_h_l377_c26_5b73_previous_ram_read <= VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_previous_ram_read;
     -- Outputs
     VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_return_output := screen_2bpp_uxn_device_h_l377_c26_5b73_return_output;

     -- tmp4_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_cond;
     tmp4_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_iftrue;
     tmp4_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_return_output := tmp4_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- screen_1bpp[uxn_device_h_l379_c26_1515] LATENCY=0
     -- Clock enable
     screen_1bpp_uxn_device_h_l379_c26_1515_CLOCK_ENABLE <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_CLOCK_ENABLE;
     -- Inputs
     screen_1bpp_uxn_device_h_l379_c26_1515_phase <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_phase;
     screen_1bpp_uxn_device_h_l379_c26_1515_x1 <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_x1;
     screen_1bpp_uxn_device_h_l379_c26_1515_y1 <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_y1;
     screen_1bpp_uxn_device_h_l379_c26_1515_color <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_color;
     screen_1bpp_uxn_device_h_l379_c26_1515_fx <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_fx;
     screen_1bpp_uxn_device_h_l379_c26_1515_fy <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_fy;
     screen_1bpp_uxn_device_h_l379_c26_1515_ram_addr <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_ram_addr;
     screen_1bpp_uxn_device_h_l379_c26_1515_previous_ram_read <= VAR_screen_1bpp_uxn_device_h_l379_c26_1515_previous_ram_read;
     -- Outputs
     VAR_screen_1bpp_uxn_device_h_l379_c26_1515_return_output := screen_1bpp_uxn_device_h_l379_c26_1515_return_output;

     -- tmp16b_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_cond;
     tmp16b_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_iftrue;
     tmp16b_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_return_output := tmp16b_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_cond;
     ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output := ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond;
     y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output := y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- x_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_x_MUX_uxn_device_h_l284_c7_26da_cond;
     x_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_x_MUX_uxn_device_h_l284_c7_26da_iftrue;
     x_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_x_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l284_c7_26da_return_output := x_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- y_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_y_MUX_uxn_device_h_l284_c7_26da_cond;
     y_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_y_MUX_uxn_device_h_l284_c7_26da_iftrue;
     y_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_y_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l284_c7_26da_return_output := y_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63[uxn_device_h_l317_c3_5353] LATENCY=0
     VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l317_c3_5353_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63(
     screen_blit_result,
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l318_c4_0beb_return_output);

     -- result_u8_value_MUX[uxn_device_h_l334_c9_7cb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_cond;
     result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iftrue;
     result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_return_output := result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_return_output;

     -- tmp16_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_cond;
     tmp16_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_iftrue;
     tmp16_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_return_output := tmp16_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_cond;
     x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output := x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- Submodule level 13
     VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_ram_addr_MUX_uxn_device_h_l318_c4_0beb_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l334_c9_7cb6_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iffalse := VAR_screen_1bpp_uxn_device_h_l379_c26_1515_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iftrue := VAR_screen_2bpp_uxn_device_h_l377_c26_5b73_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l317_c3_5353_return_output;
     VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_tmp16_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_tmp16b_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_tmp4_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_x_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_x_MUX_uxn_device_h_l284_c7_26da_return_output;
     REG_VAR_x_sprite_incr := VAR_x_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_y_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_y_MUX_uxn_device_h_l284_c7_26da_return_output;
     REG_VAR_y_sprite_incr := VAR_y_sprite_incr_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l376_c4_fe0d] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_cond;
     screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iftrue;
     screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output := screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output;

     -- result_u8_value_MUX[uxn_device_h_l329_c9_3e5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_cond;
     result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iftrue;
     result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_return_output := result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_return_output;

     -- x_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_x_MUX_uxn_device_h_l279_c7_f401_cond;
     x_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_x_MUX_uxn_device_h_l279_c7_f401_iftrue;
     x_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_x_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l279_c7_f401_return_output := x_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- tmp4_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_cond;
     tmp4_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     tmp4_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_return_output := tmp4_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- y_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_y_MUX_uxn_device_h_l279_c7_f401_cond;
     y_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_y_MUX_uxn_device_h_l279_c7_f401_iftrue;
     y_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_y_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l279_c7_f401_return_output := y_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- tmp16_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_cond;
     tmp16_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     tmp16_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_return_output := tmp16_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- ram_addr_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_cond;
     ram_addr_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_iftrue;
     ram_addr_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_return_output := ram_addr_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- is_last_blit_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_cond;
     is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_return_output := is_last_blit_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- tmp16b_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_cond;
     tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_return_output := tmp16b_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- Submodule level 14
     VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_ram_addr_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l329_c9_3e5b_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output;
     VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_tmp16_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_tmp16b_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_tmp4_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_x_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_y_MUX_uxn_device_h_l279_c7_f401_return_output;
     -- ram_addr_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_cond;
     ram_addr_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     ram_addr_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_return_output := ram_addr_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- tmp16b_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_cond;
     tmp16b_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     tmp16b_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_return_output := tmp16b_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- is_last_blit_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_cond;
     is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_return_output := is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l384_c27_2a00] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l384_c27_2a00_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l387_c22_045c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l387_c22_045c_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output.u8_value;

     -- x_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_x_MUX_uxn_device_h_l275_c7_f0fc_cond;
     x_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_x_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     x_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_x_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l275_c7_f0fc_return_output := x_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- tmp16_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_cond;
     tmp16_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     tmp16_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_return_output := tmp16_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- tmp4_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_cond;
     tmp4_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     tmp4_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_return_output := tmp4_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- y_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_y_MUX_uxn_device_h_l275_c7_f0fc_cond;
     y_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_y_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     y_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_y_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l275_c7_f0fc_return_output := y_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- result_u8_value_MUX[uxn_device_h_l318_c4_0beb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l318_c4_0beb_cond <= VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_cond;
     result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iftrue;
     result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_return_output := result_u8_value_MUX_uxn_device_h_l318_c4_0beb_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_cond;
     screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iftrue;
     screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output := screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l385_c22_04b6] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l385_c22_04b6_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_fe0d_return_output.u16_addr;

     -- Submodule level 15
     REG_VAR_is_last_blit := VAR_is_last_blit_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_ram_addr_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_tmp16_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_tmp16b_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_tmp4_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_x_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_x_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_y_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_y_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     -- tmp4_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_cond;
     tmp4_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     tmp4_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_return_output := tmp4_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- ram_addr_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_cond;
     ram_addr_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     ram_addr_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_return_output := ram_addr_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_cond;
     screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_return_output := screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- tmp16_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_cond;
     tmp16_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     tmp16_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_return_output := tmp16_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_632d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_632d_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l317_c3_5353_return_output.is_blit_done;

     -- y_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_y_MUX_uxn_device_h_l270_c7_86b1_cond;
     y_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_y_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     y_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_y_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l270_c7_86b1_return_output := y_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- x_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_x_MUX_uxn_device_h_l270_c7_86b1_cond;
     x_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_x_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     x_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_x_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l270_c7_86b1_return_output := x_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- tmp16b_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_cond;
     tmp16b_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     tmp16b_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_return_output := tmp16b_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7[uxn_device_h_l317_c3_5353] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l317_c3_5353_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39b7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l382_c4_838a,
     to_unsigned(0, 1),
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l384_c27_2a00_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l385_c22_04b6_return_output,
     layer,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l387_c22_045c_return_output);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59[uxn_device_h_l317_c3_5353] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59_uxn_device_h_l317_c3_5353_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_8b59(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l318_c4_0beb_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l318_c4_0beb_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l318_c4_0beb_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l318_c4_0beb_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l318_c4_0beb_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l318_c4_0beb_return_output);

     -- Submodule level 16
     VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_right := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_632d_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_632d_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_ram_addr_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_result_MUX_uxn_device_h_l317_c3_5353_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l317_c3_5353_return_output;
     VAR_result_MUX_uxn_device_h_l317_c3_5353_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59_uxn_device_h_l317_c3_5353_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_tmp16_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_tmp16b_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_tmp4_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_x_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_x_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_y_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_y_MUX_uxn_device_h_l270_c7_86b1_return_output;
     -- tmp4_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_cond;
     tmp4_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_iftrue;
     tmp4_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_return_output := tmp4_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- x_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_x_MUX_uxn_device_h_l267_c7_eeba_cond;
     x_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_x_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     x_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_x_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l267_c7_eeba_return_output := x_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- result_MUX[uxn_device_h_l317_c3_5353] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l317_c3_5353_cond <= VAR_result_MUX_uxn_device_h_l317_c3_5353_cond;
     result_MUX_uxn_device_h_l317_c3_5353_iftrue <= VAR_result_MUX_uxn_device_h_l317_c3_5353_iftrue;
     result_MUX_uxn_device_h_l317_c3_5353_iffalse <= VAR_result_MUX_uxn_device_h_l317_c3_5353_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l317_c3_5353_return_output := result_MUX_uxn_device_h_l317_c3_5353_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_cond;
     screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_return_output := screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- tmp16b_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_cond;
     tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_return_output := tmp16b_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- is_blit_done_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_cond;
     is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_return_output := is_blit_done_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- BIN_OP_XOR[uxn_device_h_l391_c11_bb51] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_device_h_l391_c11_bb51_left <= VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_left;
     BIN_OP_XOR_uxn_device_h_l391_c11_bb51_right <= VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_return_output := BIN_OP_XOR_uxn_device_h_l391_c11_bb51_return_output;

     -- tmp16_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_cond;
     tmp16_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     tmp16_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_return_output := tmp16_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- ram_addr_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_cond;
     ram_addr_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     ram_addr_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_return_output := ram_addr_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- y_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_y_MUX_uxn_device_h_l267_c7_eeba_cond;
     y_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_y_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     y_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_y_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l267_c7_eeba_return_output := y_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- Submodule level 17
     VAR_MUX_uxn_device_h_l391_c11_358b_cond := VAR_BIN_OP_XOR_uxn_device_h_l391_c11_bb51_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_ram_addr_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_result_MUX_uxn_device_h_l317_c3_5353_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_fe26_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     REG_VAR_tmp16b := VAR_tmp16b_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_tmp4_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_x_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_y_MUX_uxn_device_h_l267_c7_eeba_return_output;
     -- MUX[uxn_device_h_l391_c11_358b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l391_c11_358b_cond <= VAR_MUX_uxn_device_h_l391_c11_358b_cond;
     MUX_uxn_device_h_l391_c11_358b_iftrue <= VAR_MUX_uxn_device_h_l391_c11_358b_iftrue;
     MUX_uxn_device_h_l391_c11_358b_iffalse <= VAR_MUX_uxn_device_h_l391_c11_358b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l391_c11_358b_return_output := MUX_uxn_device_h_l391_c11_358b_return_output;

     -- is_blit_done_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_cond;
     is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_return_output := is_blit_done_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- result_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_result_MUX_uxn_device_h_l302_c7_33e1_cond;
     result_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_result_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     result_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_result_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l302_c7_33e1_return_output := result_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- x_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_x_MUX_uxn_device_h_l260_c2_fd3e_cond;
     x_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_x_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     x_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_x_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l260_c2_fd3e_return_output := x_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- y_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_y_MUX_uxn_device_h_l260_c2_fd3e_cond;
     y_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_y_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     y_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_y_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l260_c2_fd3e_return_output := y_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- ram_addr_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_cond;
     ram_addr_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_iftrue;
     ram_addr_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_return_output := ram_addr_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_cond;
     screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_return_output := screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- tmp4_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_cond;
     tmp4_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_iftrue;
     tmp4_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_return_output := tmp4_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- Submodule level 18
     VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_iffalse := VAR_MUX_uxn_device_h_l391_c11_358b_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_ram_addr_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_result_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_result_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_tmp4_MUX_uxn_device_h_l279_c7_f401_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     -- tmp4_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_cond;
     tmp4_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     tmp4_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_return_output := tmp4_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- is_blit_done_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_cond;
     is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_return_output := is_blit_done_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- ram_addr_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_cond;
     ram_addr_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_iftrue;
     ram_addr_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_return_output := ram_addr_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- tmp12_MUX[uxn_device_h_l302_c7_33e1] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l302_c7_33e1_cond <= VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_cond;
     tmp12_MUX_uxn_device_h_l302_c7_33e1_iftrue <= VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_iftrue;
     tmp12_MUX_uxn_device_h_l302_c7_33e1_iffalse <= VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_return_output := tmp12_MUX_uxn_device_h_l302_c7_33e1_return_output;

     -- result_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_result_MUX_uxn_device_h_l297_c7_fe26_cond;
     result_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_result_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     result_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_result_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l297_c7_fe26_return_output := result_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_cond;
     screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iftrue;
     screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_return_output := screen_blit_result_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- Submodule level 19
     VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_ram_addr_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_result_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_result_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_iffalse := VAR_tmp12_MUX_uxn_device_h_l302_c7_33e1_return_output;
     VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_tmp4_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     -- tmp4_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_cond;
     tmp4_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     tmp4_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_return_output := tmp4_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- is_blit_done_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_cond;
     is_blit_done_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_iftrue;
     is_blit_done_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_return_output := is_blit_done_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- tmp12_MUX[uxn_device_h_l297_c7_fe26] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l297_c7_fe26_cond <= VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_cond;
     tmp12_MUX_uxn_device_h_l297_c7_fe26_iftrue <= VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_iftrue;
     tmp12_MUX_uxn_device_h_l297_c7_fe26_iffalse <= VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_return_output := tmp12_MUX_uxn_device_h_l297_c7_fe26_return_output;

     -- ram_addr_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_cond;
     ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_return_output := ram_addr_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- result_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_result_MUX_uxn_device_h_l288_c7_f54c_cond;
     result_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_result_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     result_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_result_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l288_c7_f54c_return_output := result_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_cond;
     screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iftrue;
     screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_return_output := screen_blit_result_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- Submodule level 20
     VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_ram_addr_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_result_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_result_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_iffalse := VAR_tmp12_MUX_uxn_device_h_l297_c7_fe26_return_output;
     VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_tmp4_MUX_uxn_device_h_l270_c7_86b1_return_output;
     -- tmp12_MUX[uxn_device_h_l288_c7_f54c] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l288_c7_f54c_cond <= VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_cond;
     tmp12_MUX_uxn_device_h_l288_c7_f54c_iftrue <= VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_iftrue;
     tmp12_MUX_uxn_device_h_l288_c7_f54c_iffalse <= VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_return_output := tmp12_MUX_uxn_device_h_l288_c7_f54c_return_output;

     -- ram_addr_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_cond;
     ram_addr_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     ram_addr_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_return_output := ram_addr_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- result_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_result_MUX_uxn_device_h_l284_c7_26da_cond;
     result_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_result_MUX_uxn_device_h_l284_c7_26da_iftrue;
     result_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_result_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l284_c7_26da_return_output := result_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- is_blit_done_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_cond;
     is_blit_done_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_iftrue;
     is_blit_done_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_return_output := is_blit_done_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_cond;
     screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_return_output := screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- tmp4_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_cond;
     tmp4_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     tmp4_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_return_output := tmp4_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- Submodule level 21
     VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_ram_addr_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_result_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_result_MUX_uxn_device_h_l284_c7_26da_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_iffalse := VAR_tmp12_MUX_uxn_device_h_l288_c7_f54c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_tmp4_MUX_uxn_device_h_l267_c7_eeba_return_output;
     -- result_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_result_MUX_uxn_device_h_l279_c7_f401_cond;
     result_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_result_MUX_uxn_device_h_l279_c7_f401_iftrue;
     result_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_result_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l279_c7_f401_return_output := result_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- is_blit_done_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_cond;
     is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_return_output := is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_cond;
     screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_return_output := screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- ram_addr_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_cond;
     ram_addr_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     ram_addr_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_return_output := ram_addr_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- tmp4_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_cond;
     tmp4_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     tmp4_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_return_output := tmp4_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- tmp12_MUX[uxn_device_h_l284_c7_26da] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l284_c7_26da_cond <= VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_cond;
     tmp12_MUX_uxn_device_h_l284_c7_26da_iftrue <= VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_iftrue;
     tmp12_MUX_uxn_device_h_l284_c7_26da_iffalse <= VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_return_output := tmp12_MUX_uxn_device_h_l284_c7_26da_return_output;

     -- Submodule level 22
     VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_result_MUX_uxn_device_h_l279_c7_f401_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l270_c7_86b1_return_output;
     VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_iffalse := VAR_tmp12_MUX_uxn_device_h_l284_c7_26da_return_output;
     REG_VAR_tmp4 := VAR_tmp4_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     -- result_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_result_MUX_uxn_device_h_l275_c7_f0fc_cond;
     result_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_result_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     result_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_result_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l275_c7_f0fc_return_output := result_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- is_blit_done_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_cond;
     is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_return_output := is_blit_done_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- tmp12_MUX[uxn_device_h_l279_c7_f401] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l279_c7_f401_cond <= VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_cond;
     tmp12_MUX_uxn_device_h_l279_c7_f401_iftrue <= VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_iftrue;
     tmp12_MUX_uxn_device_h_l279_c7_f401_iffalse <= VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_return_output := tmp12_MUX_uxn_device_h_l279_c7_f401_return_output;

     -- ram_addr_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_cond;
     ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_return_output := ram_addr_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_cond;
     screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_return_output := screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- Submodule level 23
     VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l270_c7_86b1_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_result_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_result_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_iffalse := VAR_tmp12_MUX_uxn_device_h_l279_c7_f401_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_cond;
     screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_return_output := screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- tmp12_MUX[uxn_device_h_l275_c7_f0fc] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l275_c7_f0fc_cond <= VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_cond;
     tmp12_MUX_uxn_device_h_l275_c7_f0fc_iftrue <= VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_iftrue;
     tmp12_MUX_uxn_device_h_l275_c7_f0fc_iffalse <= VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_return_output := tmp12_MUX_uxn_device_h_l275_c7_f0fc_return_output;

     -- result_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_result_MUX_uxn_device_h_l270_c7_86b1_cond;
     result_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_result_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     result_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_result_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l270_c7_86b1_return_output := result_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- is_blit_done_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_cond;
     is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_return_output := is_blit_done_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- Submodule level 24
     VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_result_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_result_MUX_uxn_device_h_l270_c7_86b1_return_output;
     REG_VAR_screen_blit_result := VAR_screen_blit_result_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_iffalse := VAR_tmp12_MUX_uxn_device_h_l275_c7_f0fc_return_output;
     -- tmp12_MUX[uxn_device_h_l270_c7_86b1] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l270_c7_86b1_cond <= VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_cond;
     tmp12_MUX_uxn_device_h_l270_c7_86b1_iftrue <= VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_iftrue;
     tmp12_MUX_uxn_device_h_l270_c7_86b1_iffalse <= VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_return_output := tmp12_MUX_uxn_device_h_l270_c7_86b1_return_output;

     -- result_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_result_MUX_uxn_device_h_l267_c7_eeba_cond;
     result_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_result_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     result_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_result_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l267_c7_eeba_return_output := result_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- is_blit_done_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_cond;
     is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_return_output := is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- Submodule level 25
     REG_VAR_is_blit_done := VAR_is_blit_done_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_result_MUX_uxn_device_h_l267_c7_eeba_return_output;
     VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_iffalse := VAR_tmp12_MUX_uxn_device_h_l270_c7_86b1_return_output;
     -- result_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_result_MUX_uxn_device_h_l260_c2_fd3e_cond;
     result_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_result_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     result_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_result_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l260_c2_fd3e_return_output := result_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- tmp12_MUX[uxn_device_h_l267_c7_eeba] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l267_c7_eeba_cond <= VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_cond;
     tmp12_MUX_uxn_device_h_l267_c7_eeba_iftrue <= VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_iftrue;
     tmp12_MUX_uxn_device_h_l267_c7_eeba_iffalse <= VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_return_output := tmp12_MUX_uxn_device_h_l267_c7_eeba_return_output;

     -- Submodule level 26
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l260_c2_fd3e_return_output;
     VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_iffalse := VAR_tmp12_MUX_uxn_device_h_l267_c7_eeba_return_output;
     -- tmp12_MUX[uxn_device_h_l260_c2_fd3e] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l260_c2_fd3e_cond <= VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_cond;
     tmp12_MUX_uxn_device_h_l260_c2_fd3e_iftrue <= VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_iftrue;
     tmp12_MUX_uxn_device_h_l260_c2_fd3e_iffalse <= VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_return_output := tmp12_MUX_uxn_device_h_l260_c2_fd3e_return_output;

     -- Submodule level 27
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_device_h_l260_c2_fd3e_return_output;
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
