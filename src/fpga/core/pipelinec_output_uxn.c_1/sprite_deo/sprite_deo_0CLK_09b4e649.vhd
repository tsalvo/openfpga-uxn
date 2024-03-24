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
entity sprite_deo_0CLK_09b4e649 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end sprite_deo_0CLK_09b4e649;
architecture arch of sprite_deo_0CLK_09b4e649 is
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
-- BIN_OP_EQ[uxn_device_h_l273_c6_a1c6]
signal BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l280_c7_7bdc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l273_c2_e4b6]
signal color_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l273_c2_e4b6]
signal is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l273_c2_e4b6]
signal y_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l273_c2_e4b6]
signal is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l273_c2_e4b6]
signal ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l273_c2_e4b6]
signal auto_advance_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l273_c2_e4b6]
signal tmp4_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l273_c2_e4b6]
signal x_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l273_c2_e4b6]
signal flip_x_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l273_c2_e4b6]
signal tmp12_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(11 downto 0);

-- layer_MUX[uxn_device_h_l273_c2_e4b6]
signal layer_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l273_c2_e4b6]
signal flip_y_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l273_c2_e4b6]
signal tmp16b_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l273_c2_e4b6]
signal x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l273_c2_e4b6]
signal ctrl_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l273_c2_e4b6]
signal ram_addr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l273_c2_e4b6]
signal screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l273_c2_e4b6]
signal ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l273_c2_e4b6]
signal y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l273_c2_e4b6]
signal result_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l273_c2_e4b6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l273_c2_e4b6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l273_c2_e4b6_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l273_c2_e4b6]
signal tmp16_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l273_c2_e4b6]
signal auto_length_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l280_c11_c213]
signal BIN_OP_EQ_uxn_device_h_l280_c11_c213_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l280_c11_c213_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l283_c7_8eff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l280_c7_7bdc]
signal color_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l280_c7_7bdc]
signal is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l280_c7_7bdc]
signal y_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l280_c7_7bdc]
signal is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l280_c7_7bdc]
signal ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l280_c7_7bdc]
signal auto_advance_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l280_c7_7bdc]
signal tmp4_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l280_c7_7bdc]
signal x_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l280_c7_7bdc]
signal flip_x_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l280_c7_7bdc]
signal tmp12_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(11 downto 0);

-- layer_MUX[uxn_device_h_l280_c7_7bdc]
signal layer_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l280_c7_7bdc]
signal flip_y_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l280_c7_7bdc]
signal tmp16b_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l280_c7_7bdc]
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l280_c7_7bdc]
signal ctrl_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l280_c7_7bdc]
signal ram_addr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l280_c7_7bdc]
signal screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l280_c7_7bdc]
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l280_c7_7bdc]
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l280_c7_7bdc]
signal result_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l280_c7_7bdc_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l280_c7_7bdc_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l280_c7_7bdc_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l280_c7_7bdc]
signal tmp16_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l280_c7_7bdc]
signal auto_length_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l283_c11_6450]
signal BIN_OP_EQ_uxn_device_h_l283_c11_6450_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l283_c11_6450_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l288_c7_0d6e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l283_c7_8eff]
signal color_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l283_c7_8eff]
signal is_last_blit_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l283_c7_8eff]
signal y_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l283_c7_8eff]
signal is_blit_done_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l283_c7_8eff]
signal ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l283_c7_8eff]
signal auto_advance_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l283_c7_8eff]
signal tmp4_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l283_c7_8eff]
signal x_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l283_c7_8eff]
signal flip_x_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l283_c7_8eff]
signal tmp12_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(11 downto 0);

-- layer_MUX[uxn_device_h_l283_c7_8eff]
signal layer_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l283_c7_8eff]
signal flip_y_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l283_c7_8eff]
signal tmp16b_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l283_c7_8eff]
signal x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l283_c7_8eff]
signal ctrl_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l283_c7_8eff]
signal ram_addr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l283_c7_8eff]
signal screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l283_c7_8eff]
signal ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l283_c7_8eff]
signal y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l283_c7_8eff]
signal result_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l283_c7_8eff_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l283_c7_8eff_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l283_c7_8eff_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l283_c7_8eff]
signal tmp16_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l283_c7_8eff]
signal auto_length_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l288_c11_0670]
signal BIN_OP_EQ_uxn_device_h_l288_c11_0670_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l288_c11_0670_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l292_c7_e7b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l288_c7_0d6e]
signal color_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l288_c7_0d6e]
signal is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l288_c7_0d6e]
signal y_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l288_c7_0d6e]
signal is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l288_c7_0d6e]
signal ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l288_c7_0d6e]
signal auto_advance_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l288_c7_0d6e]
signal tmp4_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l288_c7_0d6e]
signal x_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l288_c7_0d6e]
signal flip_x_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l288_c7_0d6e]
signal tmp12_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(11 downto 0);

-- layer_MUX[uxn_device_h_l288_c7_0d6e]
signal layer_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l288_c7_0d6e]
signal flip_y_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l288_c7_0d6e]
signal tmp16b_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l288_c7_0d6e]
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l288_c7_0d6e]
signal ctrl_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l288_c7_0d6e]
signal ram_addr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l288_c7_0d6e]
signal screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l288_c7_0d6e]
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l288_c7_0d6e]
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l288_c7_0d6e]
signal result_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l288_c7_0d6e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l288_c7_0d6e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l288_c7_0d6e_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l288_c7_0d6e]
signal tmp16_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l288_c7_0d6e]
signal auto_length_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_device_h_l289_c3_1685]
signal BIN_OP_OR_uxn_device_h_l289_c3_1685_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l289_c3_1685_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l289_c3_1685_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l292_c11_8736]
signal BIN_OP_EQ_uxn_device_h_l292_c11_8736_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l292_c11_8736_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l297_c7_f065]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l292_c7_e7b7]
signal color_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l292_c7_e7b7]
signal is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l292_c7_e7b7]
signal y_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l292_c7_e7b7]
signal is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l292_c7_e7b7]
signal ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l292_c7_e7b7]
signal auto_advance_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l292_c7_e7b7]
signal tmp4_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l292_c7_e7b7]
signal x_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l292_c7_e7b7]
signal flip_x_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l292_c7_e7b7]
signal tmp12_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(11 downto 0);

-- layer_MUX[uxn_device_h_l292_c7_e7b7]
signal layer_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l292_c7_e7b7]
signal flip_y_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l292_c7_e7b7]
signal tmp16b_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l292_c7_e7b7]
signal x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l292_c7_e7b7]
signal ctrl_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l292_c7_e7b7]
signal ram_addr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l292_c7_e7b7]
signal screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l292_c7_e7b7]
signal ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l292_c7_e7b7]
signal y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l292_c7_e7b7]
signal result_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l292_c7_e7b7_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l292_c7_e7b7_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l292_c7_e7b7_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l292_c7_e7b7]
signal tmp16_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l292_c7_e7b7]
signal auto_length_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l297_c11_a6cf]
signal BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l301_c7_045a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l297_c7_f065]
signal color_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l297_c7_f065]
signal is_last_blit_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l297_c7_f065]
signal y_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l297_c7_f065]
signal is_blit_done_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l297_c7_f065]
signal ctrl_mode_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l297_c7_f065]
signal auto_advance_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l297_c7_f065]
signal tmp4_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l297_c7_f065]
signal x_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l297_c7_f065]
signal flip_x_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l297_c7_f065]
signal tmp12_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(11 downto 0);

-- layer_MUX[uxn_device_h_l297_c7_f065]
signal layer_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l297_c7_f065]
signal flip_y_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l297_c7_f065]
signal tmp16b_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l297_c7_f065]
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l297_c7_f065]
signal ctrl_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l297_c7_f065]
signal ram_addr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l297_c7_f065]
signal screen_blit_result_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l297_c7_f065_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l297_c7_f065]
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l297_c7_f065]
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l297_c7_f065]
signal result_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l297_c7_f065_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l297_c7_f065_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l297_c7_f065_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l297_c7_f065]
signal tmp16_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l297_c7_f065]
signal auto_length_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_device_h_l298_c3_9801]
signal BIN_OP_OR_uxn_device_h_l298_c3_9801_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l298_c3_9801_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l298_c3_9801_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l301_c11_93f7]
signal BIN_OP_EQ_uxn_device_h_l301_c11_93f7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l301_c11_93f7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l310_c7_2ba2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l301_c7_045a]
signal color_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(3 downto 0);

-- is_last_blit_MUX[uxn_device_h_l301_c7_045a]
signal is_last_blit_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l301_c7_045a]
signal y_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l301_c7_045a]
signal is_blit_done_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l301_c7_045a]
signal ctrl_mode_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l301_c7_045a]
signal auto_advance_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l301_c7_045a]
signal tmp4_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l301_c7_045a]
signal x_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l301_c7_045a]
signal flip_x_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);

-- tmp12_MUX[uxn_device_h_l301_c7_045a]
signal tmp12_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(11 downto 0);

-- layer_MUX[uxn_device_h_l301_c7_045a]
signal layer_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l301_c7_045a]
signal flip_y_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_device_h_l301_c7_045a]
signal tmp16b_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l301_c7_045a]
signal x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);

-- ctrl_MUX[uxn_device_h_l301_c7_045a]
signal ctrl_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l301_c7_045a]
signal ram_addr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l301_c7_045a]
signal screen_blit_result_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l301_c7_045a_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l301_c7_045a]
signal ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l301_c7_045a]
signal y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l301_c7_045a]
signal result_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l301_c7_045a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l301_c7_045a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l301_c7_045a_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l301_c7_045a]
signal tmp16_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l301_c7_045a]
signal auto_length_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l310_c11_0d16]
signal BIN_OP_EQ_uxn_device_h_l310_c11_0d16_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c11_0d16_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c7_ebbd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l310_c7_2ba2]
signal is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l310_c7_2ba2]
signal y_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l310_c7_2ba2]
signal is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l310_c7_2ba2]
signal auto_advance_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l310_c7_2ba2]
signal tmp4_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l310_c7_2ba2]
signal x_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l310_c7_2ba2]
signal tmp12_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(11 downto 0);

-- tmp16b_MUX[uxn_device_h_l310_c7_2ba2]
signal tmp16b_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l310_c7_2ba2]
signal x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l310_c7_2ba2]
signal ram_addr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l310_c7_2ba2]
signal screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l310_c7_2ba2]
signal ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l310_c7_2ba2]
signal y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l310_c7_2ba2]
signal result_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l310_c7_2ba2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l310_c7_2ba2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l310_c7_2ba2_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l310_c7_2ba2]
signal tmp16_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l310_c7_2ba2]
signal auto_length_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_device_h_l315_c11_45d4]
signal BIN_OP_EQ_uxn_device_h_l315_c11_45d4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c11_45d4_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l324_c1_dbb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l315_c7_ebbd]
signal is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l315_c7_ebbd]
signal y_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);

-- is_blit_done_MUX[uxn_device_h_l315_c7_ebbd]
signal is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(0 downto 0);
signal is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l315_c7_ebbd]
signal auto_advance_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(7 downto 0);

-- tmp4_MUX[uxn_device_h_l315_c7_ebbd]
signal tmp4_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l315_c7_ebbd]
signal x_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);

-- tmp12_MUX[uxn_device_h_l315_c7_ebbd]
signal tmp12_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal tmp12_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(11 downto 0);
signal tmp12_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(11 downto 0);

-- tmp16b_MUX[uxn_device_h_l315_c7_ebbd]
signal tmp16b_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);

-- x_sprite_incr_MUX[uxn_device_h_l315_c7_ebbd]
signal x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(7 downto 0);
signal x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(7 downto 0);

-- ram_addr_MUX[uxn_device_h_l315_c7_ebbd]
signal ram_addr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l315_c7_ebbd]
signal screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_return_output : screen_blit_result_t;

-- ram_addr_incr_MUX[uxn_device_h_l315_c7_ebbd]
signal ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
signal ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);

-- y_sprite_incr_MUX[uxn_device_h_l315_c7_ebbd]
signal y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(7 downto 0);
signal y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l315_c7_ebbd]
signal result_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l315_c7_ebbd_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l315_c7_ebbd_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l315_c7_ebbd_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l315_c7_ebbd]
signal tmp16_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);

-- auto_length_MUX[uxn_device_h_l315_c7_ebbd]
signal auto_length_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
signal auto_length_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(3 downto 0);
signal auto_length_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_device_h_l316_c3_9b5f]
signal BIN_OP_OR_uxn_device_h_l316_c3_9b5f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l316_c3_9b5f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l316_c3_9b5f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l325_c18_266a]
signal BIN_OP_EQ_uxn_device_h_l325_c18_266a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l325_c18_266a_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l325_c18_266a_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l325_c18_f3a4]
signal MUX_uxn_device_h_l325_c18_f3a4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l325_c18_f3a4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l325_c18_f3a4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l325_c18_f3a4_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l327_c19_6e15]
signal MUX_uxn_device_h_l327_c19_6e15_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l327_c19_6e15_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l327_c19_6e15_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l327_c19_6e15_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l328_c19_ed25]
signal MUX_uxn_device_h_l328_c19_ed25_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l328_c19_ed25_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l328_c19_ed25_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l328_c19_ed25_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l329_c39_633b]
signal MUX_uxn_device_h_l329_c39_633b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l329_c39_633b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c39_633b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c39_633b_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l329_c20_7d1d]
signal MUX_uxn_device_h_l329_c20_7d1d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l329_c20_7d1d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c20_7d1d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l329_c20_7d1d_return_output : unsigned(15 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_35a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output : unsigned(0 downto 0);

-- is_last_blit_MUX[uxn_device_h_l330_c3_af90]
signal is_last_blit_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(0 downto 0);
signal is_last_blit_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l330_c3_af90]
signal y_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l330_c3_af90]
signal tmp4_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l330_c3_af90]
signal x_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l330_c3_af90]
signal tmp16b_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l330_c3_af90]
signal ram_addr_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l330_c3_af90]
signal screen_blit_result_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output : screen_blit_result_t;

-- result_MUX[uxn_device_h_l330_c3_af90]
signal result_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l330_c3_af90_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l330_c3_af90_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l330_c3_af90_return_output : device_out_result_t;

-- tmp16_MUX[uxn_device_h_l330_c3_af90]
signal tmp16_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l331_c8_6a67]
signal BIN_OP_EQ_uxn_device_h_l331_c8_6a67_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l331_c8_6a67_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l331_c4_97ca]
signal y_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);

-- tmp4_MUX[uxn_device_h_l331_c4_97ca]
signal tmp4_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(3 downto 0);

-- x_MUX[uxn_device_h_l331_c4_97ca]
signal x_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);

-- tmp16b_MUX[uxn_device_h_l331_c4_97ca]
signal tmp16b_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);

-- ram_addr_MUX[uxn_device_h_l331_c4_97ca]
signal ram_addr_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l331_c4_97ca]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l331_c4_97ca]
signal result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l331_c4_97ca]
signal result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l331_c4_97ca]
signal result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l331_c4_97ca]
signal result_u8_value_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l331_c4_97ca]
signal result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l331_c4_97ca]
signal result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_device_h_l331_c4_97ca]
signal tmp16_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l332_c23_759c]
signal BIN_OP_MINUS_uxn_device_h_l332_c23_759c_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l332_c23_759c_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l332_c23_759c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l332_c49_53f3]
signal BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l332_c13_f57b]
signal MUX_uxn_device_h_l332_c13_f57b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l332_c13_f57b_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c13_f57b_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l332_c13_f57b_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l333_c24_2e95]
signal BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l333_c51_3e54]
signal BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l333_c14_1b6d]
signal MUX_uxn_device_h_l333_c14_1b6d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l333_c14_1b6d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l333_c14_1b6d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l333_c14_1b6d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l334_c36_3893]
signal BIN_OP_MINUS_uxn_device_h_l334_c36_3893_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l334_c36_3893_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l334_c36_3893_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l334_c58_90ac]
signal BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l334_c26_d460]
signal MUX_uxn_device_h_l334_c26_d460_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l334_c26_d460_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l334_c26_d460_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l334_c26_d460_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l334_c10_c672]
signal MUX_uxn_device_h_l334_c10_c672_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l334_c10_c672_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l334_c10_c672_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l334_c10_c672_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l335_c36_d369]
signal BIN_OP_MINUS_uxn_device_h_l335_c36_d369_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l335_c36_d369_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l335_c36_d369_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l335_c58_cd7b]
signal BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l335_c26_a624]
signal MUX_uxn_device_h_l335_c26_a624_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l335_c26_a624_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l335_c26_a624_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l335_c26_a624_return_output : unsigned(15 downto 0);

-- MUX[uxn_device_h_l335_c10_1ddf]
signal MUX_uxn_device_h_l335_c10_1ddf_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l335_c10_1ddf_iftrue : unsigned(15 downto 0);
signal MUX_uxn_device_h_l335_c10_1ddf_iffalse : unsigned(15 downto 0);
signal MUX_uxn_device_h_l335_c10_1ddf_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_device_h_l340_c33_c0b0]
signal CONST_SR_8_uxn_device_h_l340_c33_c0b0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l340_c33_c0b0_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l342_c22_eca1]
signal BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l342_c13_353c]
signal BIN_OP_EQ_uxn_device_h_l342_c13_353c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l342_c13_353c_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l342_c9_e832]
signal tmp4_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(3 downto 0);

-- ram_addr_MUX[uxn_device_h_l342_c9_e832]
signal ram_addr_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(15 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l342_c9_e832]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l342_c9_e832]
signal result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l342_c9_e832]
signal result_u8_value_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l342_c9_e832]
signal result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l342_c9_e832]
signal result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l347_c22_933a]
signal BIN_OP_MINUS_uxn_device_h_l347_c22_933a_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l347_c22_933a_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l347_c22_933a_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l347_c13_4232]
signal BIN_OP_EQ_uxn_device_h_l347_c13_4232_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l347_c13_4232_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l347_c9_b1bb]
signal tmp4_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(3 downto 0);

-- ram_addr_MUX[uxn_device_h_l347_c9_b1bb]
signal ram_addr_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(15 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l347_c9_b1bb]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l347_c9_b1bb]
signal result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l347_c9_b1bb]
signal result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l347_c9_b1bb]
signal result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l347_c9_b1bb]
signal result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_device_h_l350_c33_7887]
signal CONST_SR_8_uxn_device_h_l350_c33_7887_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l350_c33_7887_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l352_c22_a494]
signal BIN_OP_MINUS_uxn_device_h_l352_c22_a494_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l352_c22_a494_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l352_c22_a494_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l352_c13_04cd]
signal BIN_OP_EQ_uxn_device_h_l352_c13_04cd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l352_c13_04cd_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l352_c9_73d0]
signal tmp4_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(3 downto 0);

-- ram_addr_MUX[uxn_device_h_l352_c9_73d0]
signal ram_addr_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(15 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l352_c9_73d0]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l352_c9_73d0]
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l352_c9_73d0]
signal result_u8_value_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l352_c9_73d0]
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l352_c9_73d0]
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l357_c22_0792]
signal BIN_OP_MINUS_uxn_device_h_l357_c22_0792_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l357_c22_0792_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l357_c22_0792_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l357_c13_4ce8]
signal BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l357_c9_5337]
signal tmp4_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(3 downto 0);

-- ram_addr_MUX[uxn_device_h_l357_c9_5337]
signal ram_addr_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
signal ram_addr_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(15 downto 0);
signal ram_addr_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(15 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l357_c9_5337]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l357_c9_5337]
signal result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l357_c9_5337]
signal result_u8_value_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l357_c9_5337]
signal result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l357_c9_5337]
signal result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l358_c5_04a9]
signal BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l361_c33_463c]
signal CONST_SR_8_uxn_device_h_l361_c33_463c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l361_c33_463c_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l363_c22_ce7e]
signal BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l363_c13_10ca]
signal BIN_OP_EQ_uxn_device_h_l363_c13_10ca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l363_c13_10ca_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l363_c9_70da]
signal tmp4_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l363_c9_70da]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l363_c9_70da]
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l363_c9_70da]
signal result_u8_value_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l363_c9_70da]
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l363_c9_70da]
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_device_h_l368_c22_07d4]
signal BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_device_h_l368_c13_b8ea]
signal BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output : unsigned(0 downto 0);

-- tmp4_MUX[uxn_device_h_l368_c9_f270]
signal tmp4_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
signal tmp4_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(3 downto 0);
signal tmp4_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(3 downto 0);

-- screen_blit_result_is_blit_done_MUX[uxn_device_h_l368_c9_f270]
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(0 downto 0);
signal screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l368_c9_f270]
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l368_c9_f270]
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l368_c9_f270]
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l369_c5_1fea]
signal BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_left : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_return_output : unsigned(4 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l376_c1_216f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l378_c1_c15b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_return_output : unsigned(0 downto 0);

-- screen_blit_result_MUX[uxn_device_h_l376_c4_f294]
signal screen_blit_result_MUX_uxn_device_h_l376_c4_f294_cond : unsigned(0 downto 0);
signal screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iftrue : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iffalse : screen_blit_result_t;
signal screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output : screen_blit_result_t;

-- screen_2bpp[uxn_device_h_l377_c26_6ab1]
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_phase : unsigned(11 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_x1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_y1 : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_color : unsigned(3 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_fx : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_fy : unsigned(0 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_ram_addr : unsigned(15 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_previous_ram_read : unsigned(7 downto 0);
signal screen_2bpp_uxn_device_h_l377_c26_6ab1_return_output : screen_blit_result_t;

-- screen_1bpp[uxn_device_h_l379_c26_71a6]
signal screen_1bpp_uxn_device_h_l379_c26_71a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_phase : unsigned(11 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_x1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_y1 : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_color : unsigned(3 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_fx : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_fy : unsigned(0 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_ram_addr : unsigned(15 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_previous_ram_read : unsigned(7 downto 0);
signal screen_1bpp_uxn_device_h_l379_c26_71a6_return_output : screen_blit_result_t;

-- BIN_OP_EQ[uxn_device_h_l388_c19_acf6]
signal BIN_OP_EQ_uxn_device_h_l388_c19_acf6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l388_c19_acf6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l388_c19_acf6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l388_c19_50b2]
signal MUX_uxn_device_h_l388_c19_50b2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c19_50b2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c19_50b2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l388_c19_50b2_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_device_h_l391_c11_a3d4]
signal BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l391_c60_6ee2]
signal BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_return_output : unsigned(12 downto 0);

-- MUX[uxn_device_h_l391_c11_192e]
signal MUX_uxn_device_h_l391_c11_192e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l391_c11_192e_iftrue : unsigned(11 downto 0);
signal MUX_uxn_device_h_l391_c11_192e_iffalse : unsigned(11 downto 0);
signal MUX_uxn_device_h_l391_c11_192e_return_output : unsigned(11 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f
signal CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output : unsigned(11 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_deo_done := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l273_c6_a1c6
BIN_OP_EQ_uxn_device_h_l273_c6_a1c6 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_left,
BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_right,
BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- color_MUX_uxn_device_h_l273_c2_e4b6
color_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l273_c2_e4b6_cond,
color_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
color_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
color_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- is_last_blit_MUX_uxn_device_h_l273_c2_e4b6
is_last_blit_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_cond,
is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- y_MUX_uxn_device_h_l273_c2_e4b6
y_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l273_c2_e4b6_cond,
y_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
y_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
y_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- is_blit_done_MUX_uxn_device_h_l273_c2_e4b6
is_blit_done_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_cond,
is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6
ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_cond,
ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- auto_advance_MUX_uxn_device_h_l273_c2_e4b6
auto_advance_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l273_c2_e4b6_cond,
auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
auto_advance_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- tmp4_MUX_uxn_device_h_l273_c2_e4b6
tmp4_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l273_c2_e4b6_cond,
tmp4_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
tmp4_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
tmp4_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- x_MUX_uxn_device_h_l273_c2_e4b6
x_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l273_c2_e4b6_cond,
x_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
x_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
x_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- flip_x_MUX_uxn_device_h_l273_c2_e4b6
flip_x_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l273_c2_e4b6_cond,
flip_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
flip_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
flip_x_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- tmp12_MUX_uxn_device_h_l273_c2_e4b6
tmp12_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l273_c2_e4b6_cond,
tmp12_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
tmp12_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
tmp12_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- layer_MUX_uxn_device_h_l273_c2_e4b6
layer_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l273_c2_e4b6_cond,
layer_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
layer_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
layer_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- flip_y_MUX_uxn_device_h_l273_c2_e4b6
flip_y_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l273_c2_e4b6_cond,
flip_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
flip_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
flip_y_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- tmp16b_MUX_uxn_device_h_l273_c2_e4b6
tmp16b_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l273_c2_e4b6_cond,
tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
tmp16b_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6
x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond,
x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- ctrl_MUX_uxn_device_h_l273_c2_e4b6
ctrl_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l273_c2_e4b6_cond,
ctrl_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
ctrl_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
ctrl_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- ram_addr_MUX_uxn_device_h_l273_c2_e4b6
ram_addr_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l273_c2_e4b6_cond,
ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
ram_addr_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6
screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_cond,
screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6
ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_cond,
ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6
y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond,
y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- result_MUX_uxn_device_h_l273_c2_e4b6
result_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l273_c2_e4b6_cond,
result_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
result_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
result_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- tmp16_MUX_uxn_device_h_l273_c2_e4b6
tmp16_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l273_c2_e4b6_cond,
tmp16_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
tmp16_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
tmp16_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- auto_length_MUX_uxn_device_h_l273_c2_e4b6
auto_length_MUX_uxn_device_h_l273_c2_e4b6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l273_c2_e4b6_cond,
auto_length_MUX_uxn_device_h_l273_c2_e4b6_iftrue,
auto_length_MUX_uxn_device_h_l273_c2_e4b6_iffalse,
auto_length_MUX_uxn_device_h_l273_c2_e4b6_return_output);

-- BIN_OP_EQ_uxn_device_h_l280_c11_c213
BIN_OP_EQ_uxn_device_h_l280_c11_c213 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l280_c11_c213_left,
BIN_OP_EQ_uxn_device_h_l280_c11_c213_right,
BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- color_MUX_uxn_device_h_l280_c7_7bdc
color_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l280_c7_7bdc_cond,
color_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
color_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
color_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- is_last_blit_MUX_uxn_device_h_l280_c7_7bdc
is_last_blit_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_cond,
is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- y_MUX_uxn_device_h_l280_c7_7bdc
y_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l280_c7_7bdc_cond,
y_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
y_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
y_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- is_blit_done_MUX_uxn_device_h_l280_c7_7bdc
is_blit_done_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_cond,
is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc
ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_cond,
ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- auto_advance_MUX_uxn_device_h_l280_c7_7bdc
auto_advance_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l280_c7_7bdc_cond,
auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
auto_advance_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- tmp4_MUX_uxn_device_h_l280_c7_7bdc
tmp4_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l280_c7_7bdc_cond,
tmp4_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
tmp4_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
tmp4_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- x_MUX_uxn_device_h_l280_c7_7bdc
x_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l280_c7_7bdc_cond,
x_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
x_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
x_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- flip_x_MUX_uxn_device_h_l280_c7_7bdc
flip_x_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l280_c7_7bdc_cond,
flip_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
flip_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
flip_x_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- tmp12_MUX_uxn_device_h_l280_c7_7bdc
tmp12_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l280_c7_7bdc_cond,
tmp12_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
tmp12_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
tmp12_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- layer_MUX_uxn_device_h_l280_c7_7bdc
layer_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l280_c7_7bdc_cond,
layer_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
layer_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
layer_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- flip_y_MUX_uxn_device_h_l280_c7_7bdc
flip_y_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l280_c7_7bdc_cond,
flip_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
flip_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
flip_y_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- tmp16b_MUX_uxn_device_h_l280_c7_7bdc
tmp16b_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l280_c7_7bdc_cond,
tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
tmp16b_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc
x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond,
x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- ctrl_MUX_uxn_device_h_l280_c7_7bdc
ctrl_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l280_c7_7bdc_cond,
ctrl_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
ctrl_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
ctrl_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- ram_addr_MUX_uxn_device_h_l280_c7_7bdc
ram_addr_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l280_c7_7bdc_cond,
ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
ram_addr_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc
screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_cond,
screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc
ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_cond,
ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc
y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond,
y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- result_MUX_uxn_device_h_l280_c7_7bdc
result_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l280_c7_7bdc_cond,
result_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
result_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
result_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- tmp16_MUX_uxn_device_h_l280_c7_7bdc
tmp16_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l280_c7_7bdc_cond,
tmp16_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
tmp16_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
tmp16_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- auto_length_MUX_uxn_device_h_l280_c7_7bdc
auto_length_MUX_uxn_device_h_l280_c7_7bdc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l280_c7_7bdc_cond,
auto_length_MUX_uxn_device_h_l280_c7_7bdc_iftrue,
auto_length_MUX_uxn_device_h_l280_c7_7bdc_iffalse,
auto_length_MUX_uxn_device_h_l280_c7_7bdc_return_output);

-- BIN_OP_EQ_uxn_device_h_l283_c11_6450
BIN_OP_EQ_uxn_device_h_l283_c11_6450 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l283_c11_6450_left,
BIN_OP_EQ_uxn_device_h_l283_c11_6450_right,
BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- color_MUX_uxn_device_h_l283_c7_8eff
color_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l283_c7_8eff_cond,
color_MUX_uxn_device_h_l283_c7_8eff_iftrue,
color_MUX_uxn_device_h_l283_c7_8eff_iffalse,
color_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- is_last_blit_MUX_uxn_device_h_l283_c7_8eff
is_last_blit_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l283_c7_8eff_cond,
is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iftrue,
is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iffalse,
is_last_blit_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- y_MUX_uxn_device_h_l283_c7_8eff
y_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l283_c7_8eff_cond,
y_MUX_uxn_device_h_l283_c7_8eff_iftrue,
y_MUX_uxn_device_h_l283_c7_8eff_iffalse,
y_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- is_blit_done_MUX_uxn_device_h_l283_c7_8eff
is_blit_done_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l283_c7_8eff_cond,
is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iftrue,
is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iffalse,
is_blit_done_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- ctrl_mode_MUX_uxn_device_h_l283_c7_8eff
ctrl_mode_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_cond,
ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iftrue,
ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iffalse,
ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- auto_advance_MUX_uxn_device_h_l283_c7_8eff
auto_advance_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l283_c7_8eff_cond,
auto_advance_MUX_uxn_device_h_l283_c7_8eff_iftrue,
auto_advance_MUX_uxn_device_h_l283_c7_8eff_iffalse,
auto_advance_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- tmp4_MUX_uxn_device_h_l283_c7_8eff
tmp4_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l283_c7_8eff_cond,
tmp4_MUX_uxn_device_h_l283_c7_8eff_iftrue,
tmp4_MUX_uxn_device_h_l283_c7_8eff_iffalse,
tmp4_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- x_MUX_uxn_device_h_l283_c7_8eff
x_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l283_c7_8eff_cond,
x_MUX_uxn_device_h_l283_c7_8eff_iftrue,
x_MUX_uxn_device_h_l283_c7_8eff_iffalse,
x_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- flip_x_MUX_uxn_device_h_l283_c7_8eff
flip_x_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l283_c7_8eff_cond,
flip_x_MUX_uxn_device_h_l283_c7_8eff_iftrue,
flip_x_MUX_uxn_device_h_l283_c7_8eff_iffalse,
flip_x_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- tmp12_MUX_uxn_device_h_l283_c7_8eff
tmp12_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l283_c7_8eff_cond,
tmp12_MUX_uxn_device_h_l283_c7_8eff_iftrue,
tmp12_MUX_uxn_device_h_l283_c7_8eff_iffalse,
tmp12_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- layer_MUX_uxn_device_h_l283_c7_8eff
layer_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l283_c7_8eff_cond,
layer_MUX_uxn_device_h_l283_c7_8eff_iftrue,
layer_MUX_uxn_device_h_l283_c7_8eff_iffalse,
layer_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- flip_y_MUX_uxn_device_h_l283_c7_8eff
flip_y_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l283_c7_8eff_cond,
flip_y_MUX_uxn_device_h_l283_c7_8eff_iftrue,
flip_y_MUX_uxn_device_h_l283_c7_8eff_iffalse,
flip_y_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- tmp16b_MUX_uxn_device_h_l283_c7_8eff
tmp16b_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l283_c7_8eff_cond,
tmp16b_MUX_uxn_device_h_l283_c7_8eff_iftrue,
tmp16b_MUX_uxn_device_h_l283_c7_8eff_iffalse,
tmp16b_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff
x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond,
x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue,
x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse,
x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- ctrl_MUX_uxn_device_h_l283_c7_8eff
ctrl_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l283_c7_8eff_cond,
ctrl_MUX_uxn_device_h_l283_c7_8eff_iftrue,
ctrl_MUX_uxn_device_h_l283_c7_8eff_iffalse,
ctrl_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- ram_addr_MUX_uxn_device_h_l283_c7_8eff
ram_addr_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l283_c7_8eff_cond,
ram_addr_MUX_uxn_device_h_l283_c7_8eff_iftrue,
ram_addr_MUX_uxn_device_h_l283_c7_8eff_iffalse,
ram_addr_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- screen_blit_result_MUX_uxn_device_h_l283_c7_8eff
screen_blit_result_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_cond,
screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iftrue,
screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iffalse,
screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff
ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_cond,
ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue,
ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse,
ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff
y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond,
y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue,
y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse,
y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- result_MUX_uxn_device_h_l283_c7_8eff
result_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l283_c7_8eff_cond,
result_MUX_uxn_device_h_l283_c7_8eff_iftrue,
result_MUX_uxn_device_h_l283_c7_8eff_iffalse,
result_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- tmp16_MUX_uxn_device_h_l283_c7_8eff
tmp16_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l283_c7_8eff_cond,
tmp16_MUX_uxn_device_h_l283_c7_8eff_iftrue,
tmp16_MUX_uxn_device_h_l283_c7_8eff_iffalse,
tmp16_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- auto_length_MUX_uxn_device_h_l283_c7_8eff
auto_length_MUX_uxn_device_h_l283_c7_8eff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l283_c7_8eff_cond,
auto_length_MUX_uxn_device_h_l283_c7_8eff_iftrue,
auto_length_MUX_uxn_device_h_l283_c7_8eff_iffalse,
auto_length_MUX_uxn_device_h_l283_c7_8eff_return_output);

-- BIN_OP_EQ_uxn_device_h_l288_c11_0670
BIN_OP_EQ_uxn_device_h_l288_c11_0670 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l288_c11_0670_left,
BIN_OP_EQ_uxn_device_h_l288_c11_0670_right,
BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- color_MUX_uxn_device_h_l288_c7_0d6e
color_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l288_c7_0d6e_cond,
color_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
color_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
color_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- is_last_blit_MUX_uxn_device_h_l288_c7_0d6e
is_last_blit_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_cond,
is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- y_MUX_uxn_device_h_l288_c7_0d6e
y_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l288_c7_0d6e_cond,
y_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
y_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
y_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- is_blit_done_MUX_uxn_device_h_l288_c7_0d6e
is_blit_done_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_cond,
is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e
ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_cond,
ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- auto_advance_MUX_uxn_device_h_l288_c7_0d6e
auto_advance_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l288_c7_0d6e_cond,
auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
auto_advance_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- tmp4_MUX_uxn_device_h_l288_c7_0d6e
tmp4_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l288_c7_0d6e_cond,
tmp4_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
tmp4_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
tmp4_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- x_MUX_uxn_device_h_l288_c7_0d6e
x_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l288_c7_0d6e_cond,
x_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
x_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
x_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- flip_x_MUX_uxn_device_h_l288_c7_0d6e
flip_x_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l288_c7_0d6e_cond,
flip_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
flip_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
flip_x_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- tmp12_MUX_uxn_device_h_l288_c7_0d6e
tmp12_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l288_c7_0d6e_cond,
tmp12_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
tmp12_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
tmp12_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- layer_MUX_uxn_device_h_l288_c7_0d6e
layer_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l288_c7_0d6e_cond,
layer_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
layer_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
layer_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- flip_y_MUX_uxn_device_h_l288_c7_0d6e
flip_y_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l288_c7_0d6e_cond,
flip_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
flip_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
flip_y_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- tmp16b_MUX_uxn_device_h_l288_c7_0d6e
tmp16b_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l288_c7_0d6e_cond,
tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
tmp16b_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e
x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond,
x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- ctrl_MUX_uxn_device_h_l288_c7_0d6e
ctrl_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l288_c7_0d6e_cond,
ctrl_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
ctrl_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
ctrl_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- ram_addr_MUX_uxn_device_h_l288_c7_0d6e
ram_addr_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l288_c7_0d6e_cond,
ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
ram_addr_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e
screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_cond,
screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e
ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_cond,
ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e
y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond,
y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- result_MUX_uxn_device_h_l288_c7_0d6e
result_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l288_c7_0d6e_cond,
result_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
result_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
result_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- tmp16_MUX_uxn_device_h_l288_c7_0d6e
tmp16_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l288_c7_0d6e_cond,
tmp16_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
tmp16_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
tmp16_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- auto_length_MUX_uxn_device_h_l288_c7_0d6e
auto_length_MUX_uxn_device_h_l288_c7_0d6e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l288_c7_0d6e_cond,
auto_length_MUX_uxn_device_h_l288_c7_0d6e_iftrue,
auto_length_MUX_uxn_device_h_l288_c7_0d6e_iffalse,
auto_length_MUX_uxn_device_h_l288_c7_0d6e_return_output);

-- BIN_OP_OR_uxn_device_h_l289_c3_1685
BIN_OP_OR_uxn_device_h_l289_c3_1685 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l289_c3_1685_left,
BIN_OP_OR_uxn_device_h_l289_c3_1685_right,
BIN_OP_OR_uxn_device_h_l289_c3_1685_return_output);

-- BIN_OP_EQ_uxn_device_h_l292_c11_8736
BIN_OP_EQ_uxn_device_h_l292_c11_8736 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l292_c11_8736_left,
BIN_OP_EQ_uxn_device_h_l292_c11_8736_right,
BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_return_output);

-- color_MUX_uxn_device_h_l292_c7_e7b7
color_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l292_c7_e7b7_cond,
color_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
color_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
color_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- is_last_blit_MUX_uxn_device_h_l292_c7_e7b7
is_last_blit_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_cond,
is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- y_MUX_uxn_device_h_l292_c7_e7b7
y_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l292_c7_e7b7_cond,
y_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
y_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
y_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- is_blit_done_MUX_uxn_device_h_l292_c7_e7b7
is_blit_done_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_cond,
is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7
ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_cond,
ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- auto_advance_MUX_uxn_device_h_l292_c7_e7b7
auto_advance_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l292_c7_e7b7_cond,
auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
auto_advance_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- tmp4_MUX_uxn_device_h_l292_c7_e7b7
tmp4_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l292_c7_e7b7_cond,
tmp4_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
tmp4_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
tmp4_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- x_MUX_uxn_device_h_l292_c7_e7b7
x_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l292_c7_e7b7_cond,
x_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
x_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
x_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- flip_x_MUX_uxn_device_h_l292_c7_e7b7
flip_x_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l292_c7_e7b7_cond,
flip_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
flip_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
flip_x_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- tmp12_MUX_uxn_device_h_l292_c7_e7b7
tmp12_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l292_c7_e7b7_cond,
tmp12_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
tmp12_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
tmp12_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- layer_MUX_uxn_device_h_l292_c7_e7b7
layer_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l292_c7_e7b7_cond,
layer_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
layer_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
layer_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- flip_y_MUX_uxn_device_h_l292_c7_e7b7
flip_y_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l292_c7_e7b7_cond,
flip_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
flip_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
flip_y_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- tmp16b_MUX_uxn_device_h_l292_c7_e7b7
tmp16b_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l292_c7_e7b7_cond,
tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
tmp16b_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7
x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond,
x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- ctrl_MUX_uxn_device_h_l292_c7_e7b7
ctrl_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l292_c7_e7b7_cond,
ctrl_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
ctrl_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
ctrl_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- ram_addr_MUX_uxn_device_h_l292_c7_e7b7
ram_addr_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l292_c7_e7b7_cond,
ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
ram_addr_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7
screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_cond,
screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7
ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_cond,
ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7
y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond,
y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- result_MUX_uxn_device_h_l292_c7_e7b7
result_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l292_c7_e7b7_cond,
result_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
result_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
result_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- tmp16_MUX_uxn_device_h_l292_c7_e7b7
tmp16_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l292_c7_e7b7_cond,
tmp16_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
tmp16_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
tmp16_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- auto_length_MUX_uxn_device_h_l292_c7_e7b7
auto_length_MUX_uxn_device_h_l292_c7_e7b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l292_c7_e7b7_cond,
auto_length_MUX_uxn_device_h_l292_c7_e7b7_iftrue,
auto_length_MUX_uxn_device_h_l292_c7_e7b7_iffalse,
auto_length_MUX_uxn_device_h_l292_c7_e7b7_return_output);

-- BIN_OP_EQ_uxn_device_h_l297_c11_a6cf
BIN_OP_EQ_uxn_device_h_l297_c11_a6cf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_left,
BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_right,
BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_return_output);

-- color_MUX_uxn_device_h_l297_c7_f065
color_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l297_c7_f065_cond,
color_MUX_uxn_device_h_l297_c7_f065_iftrue,
color_MUX_uxn_device_h_l297_c7_f065_iffalse,
color_MUX_uxn_device_h_l297_c7_f065_return_output);

-- is_last_blit_MUX_uxn_device_h_l297_c7_f065
is_last_blit_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l297_c7_f065_cond,
is_last_blit_MUX_uxn_device_h_l297_c7_f065_iftrue,
is_last_blit_MUX_uxn_device_h_l297_c7_f065_iffalse,
is_last_blit_MUX_uxn_device_h_l297_c7_f065_return_output);

-- y_MUX_uxn_device_h_l297_c7_f065
y_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l297_c7_f065_cond,
y_MUX_uxn_device_h_l297_c7_f065_iftrue,
y_MUX_uxn_device_h_l297_c7_f065_iffalse,
y_MUX_uxn_device_h_l297_c7_f065_return_output);

-- is_blit_done_MUX_uxn_device_h_l297_c7_f065
is_blit_done_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l297_c7_f065_cond,
is_blit_done_MUX_uxn_device_h_l297_c7_f065_iftrue,
is_blit_done_MUX_uxn_device_h_l297_c7_f065_iffalse,
is_blit_done_MUX_uxn_device_h_l297_c7_f065_return_output);

-- ctrl_mode_MUX_uxn_device_h_l297_c7_f065
ctrl_mode_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l297_c7_f065_cond,
ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iftrue,
ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iffalse,
ctrl_mode_MUX_uxn_device_h_l297_c7_f065_return_output);

-- auto_advance_MUX_uxn_device_h_l297_c7_f065
auto_advance_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l297_c7_f065_cond,
auto_advance_MUX_uxn_device_h_l297_c7_f065_iftrue,
auto_advance_MUX_uxn_device_h_l297_c7_f065_iffalse,
auto_advance_MUX_uxn_device_h_l297_c7_f065_return_output);

-- tmp4_MUX_uxn_device_h_l297_c7_f065
tmp4_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l297_c7_f065_cond,
tmp4_MUX_uxn_device_h_l297_c7_f065_iftrue,
tmp4_MUX_uxn_device_h_l297_c7_f065_iffalse,
tmp4_MUX_uxn_device_h_l297_c7_f065_return_output);

-- x_MUX_uxn_device_h_l297_c7_f065
x_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l297_c7_f065_cond,
x_MUX_uxn_device_h_l297_c7_f065_iftrue,
x_MUX_uxn_device_h_l297_c7_f065_iffalse,
x_MUX_uxn_device_h_l297_c7_f065_return_output);

-- flip_x_MUX_uxn_device_h_l297_c7_f065
flip_x_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l297_c7_f065_cond,
flip_x_MUX_uxn_device_h_l297_c7_f065_iftrue,
flip_x_MUX_uxn_device_h_l297_c7_f065_iffalse,
flip_x_MUX_uxn_device_h_l297_c7_f065_return_output);

-- tmp12_MUX_uxn_device_h_l297_c7_f065
tmp12_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l297_c7_f065_cond,
tmp12_MUX_uxn_device_h_l297_c7_f065_iftrue,
tmp12_MUX_uxn_device_h_l297_c7_f065_iffalse,
tmp12_MUX_uxn_device_h_l297_c7_f065_return_output);

-- layer_MUX_uxn_device_h_l297_c7_f065
layer_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l297_c7_f065_cond,
layer_MUX_uxn_device_h_l297_c7_f065_iftrue,
layer_MUX_uxn_device_h_l297_c7_f065_iffalse,
layer_MUX_uxn_device_h_l297_c7_f065_return_output);

-- flip_y_MUX_uxn_device_h_l297_c7_f065
flip_y_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l297_c7_f065_cond,
flip_y_MUX_uxn_device_h_l297_c7_f065_iftrue,
flip_y_MUX_uxn_device_h_l297_c7_f065_iffalse,
flip_y_MUX_uxn_device_h_l297_c7_f065_return_output);

-- tmp16b_MUX_uxn_device_h_l297_c7_f065
tmp16b_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l297_c7_f065_cond,
tmp16b_MUX_uxn_device_h_l297_c7_f065_iftrue,
tmp16b_MUX_uxn_device_h_l297_c7_f065_iffalse,
tmp16b_MUX_uxn_device_h_l297_c7_f065_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l297_c7_f065
x_sprite_incr_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond,
x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue,
x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse,
x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output);

-- ctrl_MUX_uxn_device_h_l297_c7_f065
ctrl_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l297_c7_f065_cond,
ctrl_MUX_uxn_device_h_l297_c7_f065_iftrue,
ctrl_MUX_uxn_device_h_l297_c7_f065_iffalse,
ctrl_MUX_uxn_device_h_l297_c7_f065_return_output);

-- ram_addr_MUX_uxn_device_h_l297_c7_f065
ram_addr_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l297_c7_f065_cond,
ram_addr_MUX_uxn_device_h_l297_c7_f065_iftrue,
ram_addr_MUX_uxn_device_h_l297_c7_f065_iffalse,
ram_addr_MUX_uxn_device_h_l297_c7_f065_return_output);

-- screen_blit_result_MUX_uxn_device_h_l297_c7_f065
screen_blit_result_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l297_c7_f065_cond,
screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iftrue,
screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iffalse,
screen_blit_result_MUX_uxn_device_h_l297_c7_f065_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l297_c7_f065
ram_addr_incr_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_cond,
ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iftrue,
ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iffalse,
ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l297_c7_f065
y_sprite_incr_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond,
y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue,
y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse,
y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output);

-- result_MUX_uxn_device_h_l297_c7_f065
result_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l297_c7_f065_cond,
result_MUX_uxn_device_h_l297_c7_f065_iftrue,
result_MUX_uxn_device_h_l297_c7_f065_iffalse,
result_MUX_uxn_device_h_l297_c7_f065_return_output);

-- tmp16_MUX_uxn_device_h_l297_c7_f065
tmp16_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l297_c7_f065_cond,
tmp16_MUX_uxn_device_h_l297_c7_f065_iftrue,
tmp16_MUX_uxn_device_h_l297_c7_f065_iffalse,
tmp16_MUX_uxn_device_h_l297_c7_f065_return_output);

-- auto_length_MUX_uxn_device_h_l297_c7_f065
auto_length_MUX_uxn_device_h_l297_c7_f065 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l297_c7_f065_cond,
auto_length_MUX_uxn_device_h_l297_c7_f065_iftrue,
auto_length_MUX_uxn_device_h_l297_c7_f065_iffalse,
auto_length_MUX_uxn_device_h_l297_c7_f065_return_output);

-- BIN_OP_OR_uxn_device_h_l298_c3_9801
BIN_OP_OR_uxn_device_h_l298_c3_9801 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l298_c3_9801_left,
BIN_OP_OR_uxn_device_h_l298_c3_9801_right,
BIN_OP_OR_uxn_device_h_l298_c3_9801_return_output);

-- BIN_OP_EQ_uxn_device_h_l301_c11_93f7
BIN_OP_EQ_uxn_device_h_l301_c11_93f7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l301_c11_93f7_left,
BIN_OP_EQ_uxn_device_h_l301_c11_93f7_right,
BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- color_MUX_uxn_device_h_l301_c7_045a
color_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l301_c7_045a_cond,
color_MUX_uxn_device_h_l301_c7_045a_iftrue,
color_MUX_uxn_device_h_l301_c7_045a_iffalse,
color_MUX_uxn_device_h_l301_c7_045a_return_output);

-- is_last_blit_MUX_uxn_device_h_l301_c7_045a
is_last_blit_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l301_c7_045a_cond,
is_last_blit_MUX_uxn_device_h_l301_c7_045a_iftrue,
is_last_blit_MUX_uxn_device_h_l301_c7_045a_iffalse,
is_last_blit_MUX_uxn_device_h_l301_c7_045a_return_output);

-- y_MUX_uxn_device_h_l301_c7_045a
y_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l301_c7_045a_cond,
y_MUX_uxn_device_h_l301_c7_045a_iftrue,
y_MUX_uxn_device_h_l301_c7_045a_iffalse,
y_MUX_uxn_device_h_l301_c7_045a_return_output);

-- is_blit_done_MUX_uxn_device_h_l301_c7_045a
is_blit_done_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l301_c7_045a_cond,
is_blit_done_MUX_uxn_device_h_l301_c7_045a_iftrue,
is_blit_done_MUX_uxn_device_h_l301_c7_045a_iffalse,
is_blit_done_MUX_uxn_device_h_l301_c7_045a_return_output);

-- ctrl_mode_MUX_uxn_device_h_l301_c7_045a
ctrl_mode_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l301_c7_045a_cond,
ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iftrue,
ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iffalse,
ctrl_mode_MUX_uxn_device_h_l301_c7_045a_return_output);

-- auto_advance_MUX_uxn_device_h_l301_c7_045a
auto_advance_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l301_c7_045a_cond,
auto_advance_MUX_uxn_device_h_l301_c7_045a_iftrue,
auto_advance_MUX_uxn_device_h_l301_c7_045a_iffalse,
auto_advance_MUX_uxn_device_h_l301_c7_045a_return_output);

-- tmp4_MUX_uxn_device_h_l301_c7_045a
tmp4_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l301_c7_045a_cond,
tmp4_MUX_uxn_device_h_l301_c7_045a_iftrue,
tmp4_MUX_uxn_device_h_l301_c7_045a_iffalse,
tmp4_MUX_uxn_device_h_l301_c7_045a_return_output);

-- x_MUX_uxn_device_h_l301_c7_045a
x_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l301_c7_045a_cond,
x_MUX_uxn_device_h_l301_c7_045a_iftrue,
x_MUX_uxn_device_h_l301_c7_045a_iffalse,
x_MUX_uxn_device_h_l301_c7_045a_return_output);

-- flip_x_MUX_uxn_device_h_l301_c7_045a
flip_x_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l301_c7_045a_cond,
flip_x_MUX_uxn_device_h_l301_c7_045a_iftrue,
flip_x_MUX_uxn_device_h_l301_c7_045a_iffalse,
flip_x_MUX_uxn_device_h_l301_c7_045a_return_output);

-- tmp12_MUX_uxn_device_h_l301_c7_045a
tmp12_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l301_c7_045a_cond,
tmp12_MUX_uxn_device_h_l301_c7_045a_iftrue,
tmp12_MUX_uxn_device_h_l301_c7_045a_iffalse,
tmp12_MUX_uxn_device_h_l301_c7_045a_return_output);

-- layer_MUX_uxn_device_h_l301_c7_045a
layer_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l301_c7_045a_cond,
layer_MUX_uxn_device_h_l301_c7_045a_iftrue,
layer_MUX_uxn_device_h_l301_c7_045a_iffalse,
layer_MUX_uxn_device_h_l301_c7_045a_return_output);

-- flip_y_MUX_uxn_device_h_l301_c7_045a
flip_y_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l301_c7_045a_cond,
flip_y_MUX_uxn_device_h_l301_c7_045a_iftrue,
flip_y_MUX_uxn_device_h_l301_c7_045a_iffalse,
flip_y_MUX_uxn_device_h_l301_c7_045a_return_output);

-- tmp16b_MUX_uxn_device_h_l301_c7_045a
tmp16b_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l301_c7_045a_cond,
tmp16b_MUX_uxn_device_h_l301_c7_045a_iftrue,
tmp16b_MUX_uxn_device_h_l301_c7_045a_iffalse,
tmp16b_MUX_uxn_device_h_l301_c7_045a_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l301_c7_045a
x_sprite_incr_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond,
x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue,
x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse,
x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output);

-- ctrl_MUX_uxn_device_h_l301_c7_045a
ctrl_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l301_c7_045a_cond,
ctrl_MUX_uxn_device_h_l301_c7_045a_iftrue,
ctrl_MUX_uxn_device_h_l301_c7_045a_iffalse,
ctrl_MUX_uxn_device_h_l301_c7_045a_return_output);

-- ram_addr_MUX_uxn_device_h_l301_c7_045a
ram_addr_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l301_c7_045a_cond,
ram_addr_MUX_uxn_device_h_l301_c7_045a_iftrue,
ram_addr_MUX_uxn_device_h_l301_c7_045a_iffalse,
ram_addr_MUX_uxn_device_h_l301_c7_045a_return_output);

-- screen_blit_result_MUX_uxn_device_h_l301_c7_045a
screen_blit_result_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l301_c7_045a_cond,
screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iftrue,
screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iffalse,
screen_blit_result_MUX_uxn_device_h_l301_c7_045a_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l301_c7_045a
ram_addr_incr_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_cond,
ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iftrue,
ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iffalse,
ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l301_c7_045a
y_sprite_incr_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond,
y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue,
y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse,
y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output);

-- result_MUX_uxn_device_h_l301_c7_045a
result_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l301_c7_045a_cond,
result_MUX_uxn_device_h_l301_c7_045a_iftrue,
result_MUX_uxn_device_h_l301_c7_045a_iffalse,
result_MUX_uxn_device_h_l301_c7_045a_return_output);

-- tmp16_MUX_uxn_device_h_l301_c7_045a
tmp16_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l301_c7_045a_cond,
tmp16_MUX_uxn_device_h_l301_c7_045a_iftrue,
tmp16_MUX_uxn_device_h_l301_c7_045a_iffalse,
tmp16_MUX_uxn_device_h_l301_c7_045a_return_output);

-- auto_length_MUX_uxn_device_h_l301_c7_045a
auto_length_MUX_uxn_device_h_l301_c7_045a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l301_c7_045a_cond,
auto_length_MUX_uxn_device_h_l301_c7_045a_iftrue,
auto_length_MUX_uxn_device_h_l301_c7_045a_iffalse,
auto_length_MUX_uxn_device_h_l301_c7_045a_return_output);

-- BIN_OP_EQ_uxn_device_h_l310_c11_0d16
BIN_OP_EQ_uxn_device_h_l310_c11_0d16 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l310_c11_0d16_left,
BIN_OP_EQ_uxn_device_h_l310_c11_0d16_right,
BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- is_last_blit_MUX_uxn_device_h_l310_c7_2ba2
is_last_blit_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_cond,
is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- y_MUX_uxn_device_h_l310_c7_2ba2
y_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l310_c7_2ba2_cond,
y_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
y_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
y_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- is_blit_done_MUX_uxn_device_h_l310_c7_2ba2
is_blit_done_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_cond,
is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- auto_advance_MUX_uxn_device_h_l310_c7_2ba2
auto_advance_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l310_c7_2ba2_cond,
auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
auto_advance_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- tmp4_MUX_uxn_device_h_l310_c7_2ba2
tmp4_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l310_c7_2ba2_cond,
tmp4_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
tmp4_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
tmp4_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- x_MUX_uxn_device_h_l310_c7_2ba2
x_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l310_c7_2ba2_cond,
x_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
x_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
x_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- tmp12_MUX_uxn_device_h_l310_c7_2ba2
tmp12_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l310_c7_2ba2_cond,
tmp12_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
tmp12_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
tmp12_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- tmp16b_MUX_uxn_device_h_l310_c7_2ba2
tmp16b_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l310_c7_2ba2_cond,
tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
tmp16b_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2
x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond,
x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- ram_addr_MUX_uxn_device_h_l310_c7_2ba2
ram_addr_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l310_c7_2ba2_cond,
ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
ram_addr_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2
screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_cond,
screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2
ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_cond,
ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2
y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond,
y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- result_MUX_uxn_device_h_l310_c7_2ba2
result_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l310_c7_2ba2_cond,
result_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
result_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
result_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- tmp16_MUX_uxn_device_h_l310_c7_2ba2
tmp16_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l310_c7_2ba2_cond,
tmp16_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
tmp16_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
tmp16_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- auto_length_MUX_uxn_device_h_l310_c7_2ba2
auto_length_MUX_uxn_device_h_l310_c7_2ba2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l310_c7_2ba2_cond,
auto_length_MUX_uxn_device_h_l310_c7_2ba2_iftrue,
auto_length_MUX_uxn_device_h_l310_c7_2ba2_iffalse,
auto_length_MUX_uxn_device_h_l310_c7_2ba2_return_output);

-- BIN_OP_EQ_uxn_device_h_l315_c11_45d4
BIN_OP_EQ_uxn_device_h_l315_c11_45d4 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l315_c11_45d4_left,
BIN_OP_EQ_uxn_device_h_l315_c11_45d4_right,
BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_return_output);

-- is_last_blit_MUX_uxn_device_h_l315_c7_ebbd
is_last_blit_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_cond,
is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- y_MUX_uxn_device_h_l315_c7_ebbd
y_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l315_c7_ebbd_cond,
y_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
y_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
y_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- is_blit_done_MUX_uxn_device_h_l315_c7_ebbd
is_blit_done_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_cond,
is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- auto_advance_MUX_uxn_device_h_l315_c7_ebbd
auto_advance_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l315_c7_ebbd_cond,
auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
auto_advance_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- tmp4_MUX_uxn_device_h_l315_c7_ebbd
tmp4_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l315_c7_ebbd_cond,
tmp4_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
tmp4_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
tmp4_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- x_MUX_uxn_device_h_l315_c7_ebbd
x_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l315_c7_ebbd_cond,
x_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
x_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
x_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- tmp12_MUX_uxn_device_h_l315_c7_ebbd
tmp12_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
tmp12_MUX_uxn_device_h_l315_c7_ebbd_cond,
tmp12_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
tmp12_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
tmp12_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- tmp16b_MUX_uxn_device_h_l315_c7_ebbd
tmp16b_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l315_c7_ebbd_cond,
tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
tmp16b_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd
x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond,
x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- ram_addr_MUX_uxn_device_h_l315_c7_ebbd
ram_addr_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l315_c7_ebbd_cond,
ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
ram_addr_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd
screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_cond,
screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd
ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_cond,
ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd
y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond,
y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- result_MUX_uxn_device_h_l315_c7_ebbd
result_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l315_c7_ebbd_cond,
result_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
result_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
result_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- tmp16_MUX_uxn_device_h_l315_c7_ebbd
tmp16_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l315_c7_ebbd_cond,
tmp16_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
tmp16_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
tmp16_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- auto_length_MUX_uxn_device_h_l315_c7_ebbd
auto_length_MUX_uxn_device_h_l315_c7_ebbd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
auto_length_MUX_uxn_device_h_l315_c7_ebbd_cond,
auto_length_MUX_uxn_device_h_l315_c7_ebbd_iftrue,
auto_length_MUX_uxn_device_h_l315_c7_ebbd_iffalse,
auto_length_MUX_uxn_device_h_l315_c7_ebbd_return_output);

-- BIN_OP_OR_uxn_device_h_l316_c3_9b5f
BIN_OP_OR_uxn_device_h_l316_c3_9b5f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l316_c3_9b5f_left,
BIN_OP_OR_uxn_device_h_l316_c3_9b5f_right,
BIN_OP_OR_uxn_device_h_l316_c3_9b5f_return_output);

-- BIN_OP_EQ_uxn_device_h_l325_c18_266a
BIN_OP_EQ_uxn_device_h_l325_c18_266a : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l325_c18_266a_left,
BIN_OP_EQ_uxn_device_h_l325_c18_266a_right,
BIN_OP_EQ_uxn_device_h_l325_c18_266a_return_output);

-- MUX_uxn_device_h_l325_c18_f3a4
MUX_uxn_device_h_l325_c18_f3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l325_c18_f3a4_cond,
MUX_uxn_device_h_l325_c18_f3a4_iftrue,
MUX_uxn_device_h_l325_c18_f3a4_iffalse,
MUX_uxn_device_h_l325_c18_f3a4_return_output);

-- MUX_uxn_device_h_l327_c19_6e15
MUX_uxn_device_h_l327_c19_6e15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l327_c19_6e15_cond,
MUX_uxn_device_h_l327_c19_6e15_iftrue,
MUX_uxn_device_h_l327_c19_6e15_iffalse,
MUX_uxn_device_h_l327_c19_6e15_return_output);

-- MUX_uxn_device_h_l328_c19_ed25
MUX_uxn_device_h_l328_c19_ed25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l328_c19_ed25_cond,
MUX_uxn_device_h_l328_c19_ed25_iftrue,
MUX_uxn_device_h_l328_c19_ed25_iffalse,
MUX_uxn_device_h_l328_c19_ed25_return_output);

-- MUX_uxn_device_h_l329_c39_633b
MUX_uxn_device_h_l329_c39_633b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l329_c39_633b_cond,
MUX_uxn_device_h_l329_c39_633b_iftrue,
MUX_uxn_device_h_l329_c39_633b_iffalse,
MUX_uxn_device_h_l329_c39_633b_return_output);

-- MUX_uxn_device_h_l329_c20_7d1d
MUX_uxn_device_h_l329_c20_7d1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l329_c20_7d1d_cond,
MUX_uxn_device_h_l329_c20_7d1d_iftrue,
MUX_uxn_device_h_l329_c20_7d1d_iffalse,
MUX_uxn_device_h_l329_c20_7d1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output);

-- is_last_blit_MUX_uxn_device_h_l330_c3_af90
is_last_blit_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_last_blit_MUX_uxn_device_h_l330_c3_af90_cond,
is_last_blit_MUX_uxn_device_h_l330_c3_af90_iftrue,
is_last_blit_MUX_uxn_device_h_l330_c3_af90_iffalse,
is_last_blit_MUX_uxn_device_h_l330_c3_af90_return_output);

-- y_MUX_uxn_device_h_l330_c3_af90
y_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l330_c3_af90_cond,
y_MUX_uxn_device_h_l330_c3_af90_iftrue,
y_MUX_uxn_device_h_l330_c3_af90_iffalse,
y_MUX_uxn_device_h_l330_c3_af90_return_output);

-- tmp4_MUX_uxn_device_h_l330_c3_af90
tmp4_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l330_c3_af90_cond,
tmp4_MUX_uxn_device_h_l330_c3_af90_iftrue,
tmp4_MUX_uxn_device_h_l330_c3_af90_iffalse,
tmp4_MUX_uxn_device_h_l330_c3_af90_return_output);

-- x_MUX_uxn_device_h_l330_c3_af90
x_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l330_c3_af90_cond,
x_MUX_uxn_device_h_l330_c3_af90_iftrue,
x_MUX_uxn_device_h_l330_c3_af90_iffalse,
x_MUX_uxn_device_h_l330_c3_af90_return_output);

-- tmp16b_MUX_uxn_device_h_l330_c3_af90
tmp16b_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l330_c3_af90_cond,
tmp16b_MUX_uxn_device_h_l330_c3_af90_iftrue,
tmp16b_MUX_uxn_device_h_l330_c3_af90_iffalse,
tmp16b_MUX_uxn_device_h_l330_c3_af90_return_output);

-- ram_addr_MUX_uxn_device_h_l330_c3_af90
ram_addr_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l330_c3_af90_cond,
ram_addr_MUX_uxn_device_h_l330_c3_af90_iftrue,
ram_addr_MUX_uxn_device_h_l330_c3_af90_iffalse,
ram_addr_MUX_uxn_device_h_l330_c3_af90_return_output);

-- screen_blit_result_MUX_uxn_device_h_l330_c3_af90
screen_blit_result_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l330_c3_af90_cond,
screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iftrue,
screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iffalse,
screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output);

-- result_MUX_uxn_device_h_l330_c3_af90
result_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l330_c3_af90_cond,
result_MUX_uxn_device_h_l330_c3_af90_iftrue,
result_MUX_uxn_device_h_l330_c3_af90_iffalse,
result_MUX_uxn_device_h_l330_c3_af90_return_output);

-- tmp16_MUX_uxn_device_h_l330_c3_af90
tmp16_MUX_uxn_device_h_l330_c3_af90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l330_c3_af90_cond,
tmp16_MUX_uxn_device_h_l330_c3_af90_iftrue,
tmp16_MUX_uxn_device_h_l330_c3_af90_iffalse,
tmp16_MUX_uxn_device_h_l330_c3_af90_return_output);

-- BIN_OP_EQ_uxn_device_h_l331_c8_6a67
BIN_OP_EQ_uxn_device_h_l331_c8_6a67 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l331_c8_6a67_left,
BIN_OP_EQ_uxn_device_h_l331_c8_6a67_right,
BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output);

-- y_MUX_uxn_device_h_l331_c4_97ca
y_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l331_c4_97ca_cond,
y_MUX_uxn_device_h_l331_c4_97ca_iftrue,
y_MUX_uxn_device_h_l331_c4_97ca_iffalse,
y_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- tmp4_MUX_uxn_device_h_l331_c4_97ca
tmp4_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l331_c4_97ca_cond,
tmp4_MUX_uxn_device_h_l331_c4_97ca_iftrue,
tmp4_MUX_uxn_device_h_l331_c4_97ca_iffalse,
tmp4_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- x_MUX_uxn_device_h_l331_c4_97ca
x_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l331_c4_97ca_cond,
x_MUX_uxn_device_h_l331_c4_97ca_iftrue,
x_MUX_uxn_device_h_l331_c4_97ca_iffalse,
x_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- tmp16b_MUX_uxn_device_h_l331_c4_97ca
tmp16b_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_device_h_l331_c4_97ca_cond,
tmp16b_MUX_uxn_device_h_l331_c4_97ca_iftrue,
tmp16b_MUX_uxn_device_h_l331_c4_97ca_iffalse,
tmp16b_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- ram_addr_MUX_uxn_device_h_l331_c4_97ca
ram_addr_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l331_c4_97ca_cond,
ram_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue,
ram_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse,
ram_addr_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca
screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca
result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_cond,
result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue,
result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse,
result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- result_u16_addr_MUX_uxn_device_h_l331_c4_97ca
result_u16_addr_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_cond,
result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue,
result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse,
result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca
result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_cond,
result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- result_u8_value_MUX_uxn_device_h_l331_c4_97ca
result_u8_value_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l331_c4_97ca_cond,
result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iftrue,
result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iffalse,
result_u8_value_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca
result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_cond,
result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iftrue,
result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iffalse,
result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca
result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_cond,
result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iftrue,
result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iffalse,
result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- tmp16_MUX_uxn_device_h_l331_c4_97ca
tmp16_MUX_uxn_device_h_l331_c4_97ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_device_h_l331_c4_97ca_cond,
tmp16_MUX_uxn_device_h_l331_c4_97ca_iftrue,
tmp16_MUX_uxn_device_h_l331_c4_97ca_iffalse,
tmp16_MUX_uxn_device_h_l331_c4_97ca_return_output);

-- BIN_OP_MINUS_uxn_device_h_l332_c23_759c
BIN_OP_MINUS_uxn_device_h_l332_c23_759c : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l332_c23_759c_left,
BIN_OP_MINUS_uxn_device_h_l332_c23_759c_right,
BIN_OP_MINUS_uxn_device_h_l332_c23_759c_return_output);

-- BIN_OP_PLUS_uxn_device_h_l332_c49_53f3
BIN_OP_PLUS_uxn_device_h_l332_c49_53f3 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_left,
BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_right,
BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_return_output);

-- MUX_uxn_device_h_l332_c13_f57b
MUX_uxn_device_h_l332_c13_f57b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l332_c13_f57b_cond,
MUX_uxn_device_h_l332_c13_f57b_iftrue,
MUX_uxn_device_h_l332_c13_f57b_iffalse,
MUX_uxn_device_h_l332_c13_f57b_return_output);

-- BIN_OP_MINUS_uxn_device_h_l333_c24_2e95
BIN_OP_MINUS_uxn_device_h_l333_c24_2e95 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_left,
BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_right,
BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_return_output);

-- BIN_OP_PLUS_uxn_device_h_l333_c51_3e54
BIN_OP_PLUS_uxn_device_h_l333_c51_3e54 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_left,
BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_right,
BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_return_output);

-- MUX_uxn_device_h_l333_c14_1b6d
MUX_uxn_device_h_l333_c14_1b6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l333_c14_1b6d_cond,
MUX_uxn_device_h_l333_c14_1b6d_iftrue,
MUX_uxn_device_h_l333_c14_1b6d_iffalse,
MUX_uxn_device_h_l333_c14_1b6d_return_output);

-- BIN_OP_MINUS_uxn_device_h_l334_c36_3893
BIN_OP_MINUS_uxn_device_h_l334_c36_3893 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l334_c36_3893_left,
BIN_OP_MINUS_uxn_device_h_l334_c36_3893_right,
BIN_OP_MINUS_uxn_device_h_l334_c36_3893_return_output);

-- BIN_OP_PLUS_uxn_device_h_l334_c58_90ac
BIN_OP_PLUS_uxn_device_h_l334_c58_90ac : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_left,
BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_right,
BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_return_output);

-- MUX_uxn_device_h_l334_c26_d460
MUX_uxn_device_h_l334_c26_d460 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l334_c26_d460_cond,
MUX_uxn_device_h_l334_c26_d460_iftrue,
MUX_uxn_device_h_l334_c26_d460_iffalse,
MUX_uxn_device_h_l334_c26_d460_return_output);

-- MUX_uxn_device_h_l334_c10_c672
MUX_uxn_device_h_l334_c10_c672 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l334_c10_c672_cond,
MUX_uxn_device_h_l334_c10_c672_iftrue,
MUX_uxn_device_h_l334_c10_c672_iffalse,
MUX_uxn_device_h_l334_c10_c672_return_output);

-- BIN_OP_MINUS_uxn_device_h_l335_c36_d369
BIN_OP_MINUS_uxn_device_h_l335_c36_d369 : entity work.BIN_OP_MINUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l335_c36_d369_left,
BIN_OP_MINUS_uxn_device_h_l335_c36_d369_right,
BIN_OP_MINUS_uxn_device_h_l335_c36_d369_return_output);

-- BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b
BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_left,
BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_right,
BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_return_output);

-- MUX_uxn_device_h_l335_c26_a624
MUX_uxn_device_h_l335_c26_a624 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l335_c26_a624_cond,
MUX_uxn_device_h_l335_c26_a624_iftrue,
MUX_uxn_device_h_l335_c26_a624_iffalse,
MUX_uxn_device_h_l335_c26_a624_return_output);

-- MUX_uxn_device_h_l335_c10_1ddf
MUX_uxn_device_h_l335_c10_1ddf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l335_c10_1ddf_cond,
MUX_uxn_device_h_l335_c10_1ddf_iftrue,
MUX_uxn_device_h_l335_c10_1ddf_iffalse,
MUX_uxn_device_h_l335_c10_1ddf_return_output);

-- CONST_SR_8_uxn_device_h_l340_c33_c0b0
CONST_SR_8_uxn_device_h_l340_c33_c0b0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l340_c33_c0b0_x,
CONST_SR_8_uxn_device_h_l340_c33_c0b0_return_output);

-- BIN_OP_MINUS_uxn_device_h_l342_c22_eca1
BIN_OP_MINUS_uxn_device_h_l342_c22_eca1 : entity work.BIN_OP_MINUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_left,
BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_right,
BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_return_output);

-- BIN_OP_EQ_uxn_device_h_l342_c13_353c
BIN_OP_EQ_uxn_device_h_l342_c13_353c : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l342_c13_353c_left,
BIN_OP_EQ_uxn_device_h_l342_c13_353c_right,
BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output);

-- tmp4_MUX_uxn_device_h_l342_c9_e832
tmp4_MUX_uxn_device_h_l342_c9_e832 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l342_c9_e832_cond,
tmp4_MUX_uxn_device_h_l342_c9_e832_iftrue,
tmp4_MUX_uxn_device_h_l342_c9_e832_iffalse,
tmp4_MUX_uxn_device_h_l342_c9_e832_return_output);

-- ram_addr_MUX_uxn_device_h_l342_c9_e832
ram_addr_MUX_uxn_device_h_l342_c9_e832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l342_c9_e832_cond,
ram_addr_MUX_uxn_device_h_l342_c9_e832_iftrue,
ram_addr_MUX_uxn_device_h_l342_c9_e832_iffalse,
ram_addr_MUX_uxn_device_h_l342_c9_e832_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832
screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832
result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_cond,
result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_return_output);

-- result_u8_value_MUX_uxn_device_h_l342_c9_e832
result_u8_value_MUX_uxn_device_h_l342_c9_e832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l342_c9_e832_cond,
result_u8_value_MUX_uxn_device_h_l342_c9_e832_iftrue,
result_u8_value_MUX_uxn_device_h_l342_c9_e832_iffalse,
result_u8_value_MUX_uxn_device_h_l342_c9_e832_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l342_c9_e832
result_device_ram_address_MUX_uxn_device_h_l342_c9_e832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_cond,
result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iftrue,
result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iffalse,
result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l342_c9_e832
result_is_deo_done_MUX_uxn_device_h_l342_c9_e832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_cond,
result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iftrue,
result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iffalse,
result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_return_output);

-- BIN_OP_MINUS_uxn_device_h_l347_c22_933a
BIN_OP_MINUS_uxn_device_h_l347_c22_933a : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l347_c22_933a_left,
BIN_OP_MINUS_uxn_device_h_l347_c22_933a_right,
BIN_OP_MINUS_uxn_device_h_l347_c22_933a_return_output);

-- BIN_OP_EQ_uxn_device_h_l347_c13_4232
BIN_OP_EQ_uxn_device_h_l347_c13_4232 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l347_c13_4232_left,
BIN_OP_EQ_uxn_device_h_l347_c13_4232_right,
BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output);

-- tmp4_MUX_uxn_device_h_l347_c9_b1bb
tmp4_MUX_uxn_device_h_l347_c9_b1bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l347_c9_b1bb_cond,
tmp4_MUX_uxn_device_h_l347_c9_b1bb_iftrue,
tmp4_MUX_uxn_device_h_l347_c9_b1bb_iffalse,
tmp4_MUX_uxn_device_h_l347_c9_b1bb_return_output);

-- ram_addr_MUX_uxn_device_h_l347_c9_b1bb
ram_addr_MUX_uxn_device_h_l347_c9_b1bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l347_c9_b1bb_cond,
ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iftrue,
ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iffalse,
ram_addr_MUX_uxn_device_h_l347_c9_b1bb_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb
screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb
result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_cond,
result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_return_output);

-- result_u8_value_MUX_uxn_device_h_l347_c9_b1bb
result_u8_value_MUX_uxn_device_h_l347_c9_b1bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_cond,
result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iftrue,
result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iffalse,
result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb
result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_cond,
result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb
result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_cond,
result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_return_output);

-- CONST_SR_8_uxn_device_h_l350_c33_7887
CONST_SR_8_uxn_device_h_l350_c33_7887 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l350_c33_7887_x,
CONST_SR_8_uxn_device_h_l350_c33_7887_return_output);

-- BIN_OP_MINUS_uxn_device_h_l352_c22_a494
BIN_OP_MINUS_uxn_device_h_l352_c22_a494 : entity work.BIN_OP_MINUS_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l352_c22_a494_left,
BIN_OP_MINUS_uxn_device_h_l352_c22_a494_right,
BIN_OP_MINUS_uxn_device_h_l352_c22_a494_return_output);

-- BIN_OP_EQ_uxn_device_h_l352_c13_04cd
BIN_OP_EQ_uxn_device_h_l352_c13_04cd : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l352_c13_04cd_left,
BIN_OP_EQ_uxn_device_h_l352_c13_04cd_right,
BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output);

-- tmp4_MUX_uxn_device_h_l352_c9_73d0
tmp4_MUX_uxn_device_h_l352_c9_73d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l352_c9_73d0_cond,
tmp4_MUX_uxn_device_h_l352_c9_73d0_iftrue,
tmp4_MUX_uxn_device_h_l352_c9_73d0_iffalse,
tmp4_MUX_uxn_device_h_l352_c9_73d0_return_output);

-- ram_addr_MUX_uxn_device_h_l352_c9_73d0
ram_addr_MUX_uxn_device_h_l352_c9_73d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l352_c9_73d0_cond,
ram_addr_MUX_uxn_device_h_l352_c9_73d0_iftrue,
ram_addr_MUX_uxn_device_h_l352_c9_73d0_iffalse,
ram_addr_MUX_uxn_device_h_l352_c9_73d0_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_cond,
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_return_output);

-- result_u8_value_MUX_uxn_device_h_l352_c9_73d0
result_u8_value_MUX_uxn_device_h_l352_c9_73d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l352_c9_73d0_cond,
result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iftrue,
result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iffalse,
result_u8_value_MUX_uxn_device_h_l352_c9_73d0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0
result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_cond,
result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0
result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_cond,
result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_return_output);

-- BIN_OP_MINUS_uxn_device_h_l357_c22_0792
BIN_OP_MINUS_uxn_device_h_l357_c22_0792 : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l357_c22_0792_left,
BIN_OP_MINUS_uxn_device_h_l357_c22_0792_right,
BIN_OP_MINUS_uxn_device_h_l357_c22_0792_return_output);

-- BIN_OP_EQ_uxn_device_h_l357_c13_4ce8
BIN_OP_EQ_uxn_device_h_l357_c13_4ce8 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_left,
BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_right,
BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output);

-- tmp4_MUX_uxn_device_h_l357_c9_5337
tmp4_MUX_uxn_device_h_l357_c9_5337 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l357_c9_5337_cond,
tmp4_MUX_uxn_device_h_l357_c9_5337_iftrue,
tmp4_MUX_uxn_device_h_l357_c9_5337_iffalse,
tmp4_MUX_uxn_device_h_l357_c9_5337_return_output);

-- ram_addr_MUX_uxn_device_h_l357_c9_5337
ram_addr_MUX_uxn_device_h_l357_c9_5337 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_addr_MUX_uxn_device_h_l357_c9_5337_cond,
ram_addr_MUX_uxn_device_h_l357_c9_5337_iftrue,
ram_addr_MUX_uxn_device_h_l357_c9_5337_iffalse,
ram_addr_MUX_uxn_device_h_l357_c9_5337_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337
screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337
result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_cond,
result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_return_output);

-- result_u8_value_MUX_uxn_device_h_l357_c9_5337
result_u8_value_MUX_uxn_device_h_l357_c9_5337 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l357_c9_5337_cond,
result_u8_value_MUX_uxn_device_h_l357_c9_5337_iftrue,
result_u8_value_MUX_uxn_device_h_l357_c9_5337_iffalse,
result_u8_value_MUX_uxn_device_h_l357_c9_5337_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l357_c9_5337
result_device_ram_address_MUX_uxn_device_h_l357_c9_5337 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_cond,
result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iftrue,
result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iffalse,
result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l357_c9_5337
result_is_deo_done_MUX_uxn_device_h_l357_c9_5337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_cond,
result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iftrue,
result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iffalse,
result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_return_output);

-- BIN_OP_PLUS_uxn_device_h_l358_c5_04a9
BIN_OP_PLUS_uxn_device_h_l358_c5_04a9 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_left,
BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_right,
BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_return_output);

-- CONST_SR_8_uxn_device_h_l361_c33_463c
CONST_SR_8_uxn_device_h_l361_c33_463c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l361_c33_463c_x,
CONST_SR_8_uxn_device_h_l361_c33_463c_return_output);

-- BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e
BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_left,
BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_right,
BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_return_output);

-- BIN_OP_EQ_uxn_device_h_l363_c13_10ca
BIN_OP_EQ_uxn_device_h_l363_c13_10ca : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l363_c13_10ca_left,
BIN_OP_EQ_uxn_device_h_l363_c13_10ca_right,
BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output);

-- tmp4_MUX_uxn_device_h_l363_c9_70da
tmp4_MUX_uxn_device_h_l363_c9_70da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l363_c9_70da_cond,
tmp4_MUX_uxn_device_h_l363_c9_70da_iftrue,
tmp4_MUX_uxn_device_h_l363_c9_70da_iffalse,
tmp4_MUX_uxn_device_h_l363_c9_70da_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_cond,
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_return_output);

-- result_u8_value_MUX_uxn_device_h_l363_c9_70da
result_u8_value_MUX_uxn_device_h_l363_c9_70da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l363_c9_70da_cond,
result_u8_value_MUX_uxn_device_h_l363_c9_70da_iftrue,
result_u8_value_MUX_uxn_device_h_l363_c9_70da_iffalse,
result_u8_value_MUX_uxn_device_h_l363_c9_70da_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l363_c9_70da
result_device_ram_address_MUX_uxn_device_h_l363_c9_70da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_cond,
result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iftrue,
result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iffalse,
result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l363_c9_70da
result_is_deo_done_MUX_uxn_device_h_l363_c9_70da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_cond,
result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iftrue,
result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iffalse,
result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_return_output);

-- BIN_OP_MINUS_uxn_device_h_l368_c22_07d4
BIN_OP_MINUS_uxn_device_h_l368_c22_07d4 : entity work.BIN_OP_MINUS_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_left,
BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_right,
BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_return_output);

-- BIN_OP_EQ_uxn_device_h_l368_c13_b8ea
BIN_OP_EQ_uxn_device_h_l368_c13_b8ea : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_left,
BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_right,
BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output);

-- tmp4_MUX_uxn_device_h_l368_c9_f270
tmp4_MUX_uxn_device_h_l368_c9_f270 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
tmp4_MUX_uxn_device_h_l368_c9_f270_cond,
tmp4_MUX_uxn_device_h_l368_c9_f270_iftrue,
tmp4_MUX_uxn_device_h_l368_c9_f270_iffalse,
tmp4_MUX_uxn_device_h_l368_c9_f270_return_output);

-- screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_cond,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iftrue,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iffalse,
screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_cond,
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l368_c9_f270
result_device_ram_address_MUX_uxn_device_h_l368_c9_f270 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_cond,
result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iftrue,
result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iffalse,
result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l368_c9_f270
result_is_deo_done_MUX_uxn_device_h_l368_c9_f270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_cond,
result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iftrue,
result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iffalse,
result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_return_output);

-- BIN_OP_PLUS_uxn_device_h_l369_c5_1fea
BIN_OP_PLUS_uxn_device_h_l369_c5_1fea : entity work.BIN_OP_PLUS_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_left,
BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_right,
BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_return_output);

-- screen_blit_result_MUX_uxn_device_h_l376_c4_f294
screen_blit_result_MUX_uxn_device_h_l376_c4_f294 : entity work.MUX_uint1_t_screen_blit_result_t_screen_blit_result_t_0CLK_de264c78 port map (
screen_blit_result_MUX_uxn_device_h_l376_c4_f294_cond,
screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iftrue,
screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iffalse,
screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output);

-- screen_2bpp_uxn_device_h_l377_c26_6ab1
screen_2bpp_uxn_device_h_l377_c26_6ab1 : entity work.screen_2bpp_0CLK_7c567d05 port map (
clk,
screen_2bpp_uxn_device_h_l377_c26_6ab1_CLOCK_ENABLE,
screen_2bpp_uxn_device_h_l377_c26_6ab1_phase,
screen_2bpp_uxn_device_h_l377_c26_6ab1_x1,
screen_2bpp_uxn_device_h_l377_c26_6ab1_y1,
screen_2bpp_uxn_device_h_l377_c26_6ab1_color,
screen_2bpp_uxn_device_h_l377_c26_6ab1_fx,
screen_2bpp_uxn_device_h_l377_c26_6ab1_fy,
screen_2bpp_uxn_device_h_l377_c26_6ab1_ram_addr,
screen_2bpp_uxn_device_h_l377_c26_6ab1_previous_ram_read,
screen_2bpp_uxn_device_h_l377_c26_6ab1_return_output);

-- screen_1bpp_uxn_device_h_l379_c26_71a6
screen_1bpp_uxn_device_h_l379_c26_71a6 : entity work.screen_1bpp_0CLK_72b59ec3 port map (
clk,
screen_1bpp_uxn_device_h_l379_c26_71a6_CLOCK_ENABLE,
screen_1bpp_uxn_device_h_l379_c26_71a6_phase,
screen_1bpp_uxn_device_h_l379_c26_71a6_x1,
screen_1bpp_uxn_device_h_l379_c26_71a6_y1,
screen_1bpp_uxn_device_h_l379_c26_71a6_color,
screen_1bpp_uxn_device_h_l379_c26_71a6_fx,
screen_1bpp_uxn_device_h_l379_c26_71a6_fy,
screen_1bpp_uxn_device_h_l379_c26_71a6_ram_addr,
screen_1bpp_uxn_device_h_l379_c26_71a6_previous_ram_read,
screen_1bpp_uxn_device_h_l379_c26_71a6_return_output);

-- BIN_OP_EQ_uxn_device_h_l388_c19_acf6
BIN_OP_EQ_uxn_device_h_l388_c19_acf6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l388_c19_acf6_left,
BIN_OP_EQ_uxn_device_h_l388_c19_acf6_right,
BIN_OP_EQ_uxn_device_h_l388_c19_acf6_return_output);

-- MUX_uxn_device_h_l388_c19_50b2
MUX_uxn_device_h_l388_c19_50b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l388_c19_50b2_cond,
MUX_uxn_device_h_l388_c19_50b2_iftrue,
MUX_uxn_device_h_l388_c19_50b2_iffalse,
MUX_uxn_device_h_l388_c19_50b2_return_output);

-- BIN_OP_XOR_uxn_device_h_l391_c11_a3d4
BIN_OP_XOR_uxn_device_h_l391_c11_a3d4 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_left,
BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_right,
BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_return_output);

-- BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2
BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2 : entity work.BIN_OP_PLUS_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_left,
BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_right,
BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_return_output);

-- MUX_uxn_device_h_l391_c11_192e
MUX_uxn_device_h_l391_c11_192e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l391_c11_192e_cond,
MUX_uxn_device_h_l391_c11_192e_iftrue,
MUX_uxn_device_h_l391_c11_192e_iffalse,
MUX_uxn_device_h_l391_c11_192e_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f
CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_x,
CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output);

-- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_left,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_right,
BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output);



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
 BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 color_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 y_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 auto_advance_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 tmp4_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 x_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 flip_x_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 tmp12_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 layer_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 flip_y_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 tmp16b_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 ctrl_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 ram_addr_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 result_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 tmp16_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 auto_length_MUX_uxn_device_h_l273_c2_e4b6_return_output,
 BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_return_output,
 color_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 y_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 auto_advance_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 tmp4_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 x_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 flip_x_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 tmp12_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 layer_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 flip_y_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 tmp16b_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 ctrl_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 ram_addr_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 result_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 tmp16_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 auto_length_MUX_uxn_device_h_l280_c7_7bdc_return_output,
 BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 color_MUX_uxn_device_h_l283_c7_8eff_return_output,
 is_last_blit_MUX_uxn_device_h_l283_c7_8eff_return_output,
 y_MUX_uxn_device_h_l283_c7_8eff_return_output,
 is_blit_done_MUX_uxn_device_h_l283_c7_8eff_return_output,
 ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_return_output,
 auto_advance_MUX_uxn_device_h_l283_c7_8eff_return_output,
 tmp4_MUX_uxn_device_h_l283_c7_8eff_return_output,
 x_MUX_uxn_device_h_l283_c7_8eff_return_output,
 flip_x_MUX_uxn_device_h_l283_c7_8eff_return_output,
 tmp12_MUX_uxn_device_h_l283_c7_8eff_return_output,
 layer_MUX_uxn_device_h_l283_c7_8eff_return_output,
 flip_y_MUX_uxn_device_h_l283_c7_8eff_return_output,
 tmp16b_MUX_uxn_device_h_l283_c7_8eff_return_output,
 x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output,
 ctrl_MUX_uxn_device_h_l283_c7_8eff_return_output,
 ram_addr_MUX_uxn_device_h_l283_c7_8eff_return_output,
 screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_return_output,
 ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_return_output,
 y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output,
 result_MUX_uxn_device_h_l283_c7_8eff_return_output,
 tmp16_MUX_uxn_device_h_l283_c7_8eff_return_output,
 auto_length_MUX_uxn_device_h_l283_c7_8eff_return_output,
 BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 color_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 y_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 auto_advance_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 tmp4_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 x_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 flip_x_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 tmp12_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 layer_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 flip_y_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 tmp16b_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 ctrl_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 ram_addr_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 result_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 tmp16_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 auto_length_MUX_uxn_device_h_l288_c7_0d6e_return_output,
 BIN_OP_OR_uxn_device_h_l289_c3_1685_return_output,
 BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_return_output,
 color_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 y_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 auto_advance_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 tmp4_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 x_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 flip_x_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 tmp12_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 layer_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 flip_y_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 tmp16b_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 ctrl_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 ram_addr_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 result_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 tmp16_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 auto_length_MUX_uxn_device_h_l292_c7_e7b7_return_output,
 BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_return_output,
 color_MUX_uxn_device_h_l297_c7_f065_return_output,
 is_last_blit_MUX_uxn_device_h_l297_c7_f065_return_output,
 y_MUX_uxn_device_h_l297_c7_f065_return_output,
 is_blit_done_MUX_uxn_device_h_l297_c7_f065_return_output,
 ctrl_mode_MUX_uxn_device_h_l297_c7_f065_return_output,
 auto_advance_MUX_uxn_device_h_l297_c7_f065_return_output,
 tmp4_MUX_uxn_device_h_l297_c7_f065_return_output,
 x_MUX_uxn_device_h_l297_c7_f065_return_output,
 flip_x_MUX_uxn_device_h_l297_c7_f065_return_output,
 tmp12_MUX_uxn_device_h_l297_c7_f065_return_output,
 layer_MUX_uxn_device_h_l297_c7_f065_return_output,
 flip_y_MUX_uxn_device_h_l297_c7_f065_return_output,
 tmp16b_MUX_uxn_device_h_l297_c7_f065_return_output,
 x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output,
 ctrl_MUX_uxn_device_h_l297_c7_f065_return_output,
 ram_addr_MUX_uxn_device_h_l297_c7_f065_return_output,
 screen_blit_result_MUX_uxn_device_h_l297_c7_f065_return_output,
 ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_return_output,
 y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output,
 result_MUX_uxn_device_h_l297_c7_f065_return_output,
 tmp16_MUX_uxn_device_h_l297_c7_f065_return_output,
 auto_length_MUX_uxn_device_h_l297_c7_f065_return_output,
 BIN_OP_OR_uxn_device_h_l298_c3_9801_return_output,
 BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 color_MUX_uxn_device_h_l301_c7_045a_return_output,
 is_last_blit_MUX_uxn_device_h_l301_c7_045a_return_output,
 y_MUX_uxn_device_h_l301_c7_045a_return_output,
 is_blit_done_MUX_uxn_device_h_l301_c7_045a_return_output,
 ctrl_mode_MUX_uxn_device_h_l301_c7_045a_return_output,
 auto_advance_MUX_uxn_device_h_l301_c7_045a_return_output,
 tmp4_MUX_uxn_device_h_l301_c7_045a_return_output,
 x_MUX_uxn_device_h_l301_c7_045a_return_output,
 flip_x_MUX_uxn_device_h_l301_c7_045a_return_output,
 tmp12_MUX_uxn_device_h_l301_c7_045a_return_output,
 layer_MUX_uxn_device_h_l301_c7_045a_return_output,
 flip_y_MUX_uxn_device_h_l301_c7_045a_return_output,
 tmp16b_MUX_uxn_device_h_l301_c7_045a_return_output,
 x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output,
 ctrl_MUX_uxn_device_h_l301_c7_045a_return_output,
 ram_addr_MUX_uxn_device_h_l301_c7_045a_return_output,
 screen_blit_result_MUX_uxn_device_h_l301_c7_045a_return_output,
 ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_return_output,
 y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output,
 result_MUX_uxn_device_h_l301_c7_045a_return_output,
 tmp16_MUX_uxn_device_h_l301_c7_045a_return_output,
 auto_length_MUX_uxn_device_h_l301_c7_045a_return_output,
 BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 y_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 auto_advance_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 tmp4_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 x_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 tmp12_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 tmp16b_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 ram_addr_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 result_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 tmp16_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 auto_length_MUX_uxn_device_h_l310_c7_2ba2_return_output,
 BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_return_output,
 is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 y_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 auto_advance_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 tmp4_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 x_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 tmp12_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 tmp16b_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 ram_addr_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 result_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 tmp16_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 auto_length_MUX_uxn_device_h_l315_c7_ebbd_return_output,
 BIN_OP_OR_uxn_device_h_l316_c3_9b5f_return_output,
 BIN_OP_EQ_uxn_device_h_l325_c18_266a_return_output,
 MUX_uxn_device_h_l325_c18_f3a4_return_output,
 MUX_uxn_device_h_l327_c19_6e15_return_output,
 MUX_uxn_device_h_l328_c19_ed25_return_output,
 MUX_uxn_device_h_l329_c39_633b_return_output,
 MUX_uxn_device_h_l329_c20_7d1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output,
 is_last_blit_MUX_uxn_device_h_l330_c3_af90_return_output,
 y_MUX_uxn_device_h_l330_c3_af90_return_output,
 tmp4_MUX_uxn_device_h_l330_c3_af90_return_output,
 x_MUX_uxn_device_h_l330_c3_af90_return_output,
 tmp16b_MUX_uxn_device_h_l330_c3_af90_return_output,
 ram_addr_MUX_uxn_device_h_l330_c3_af90_return_output,
 screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output,
 result_MUX_uxn_device_h_l330_c3_af90_return_output,
 tmp16_MUX_uxn_device_h_l330_c3_af90_return_output,
 BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output,
 y_MUX_uxn_device_h_l331_c4_97ca_return_output,
 tmp4_MUX_uxn_device_h_l331_c4_97ca_return_output,
 x_MUX_uxn_device_h_l331_c4_97ca_return_output,
 tmp16b_MUX_uxn_device_h_l331_c4_97ca_return_output,
 ram_addr_MUX_uxn_device_h_l331_c4_97ca_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_return_output,
 result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_return_output,
 result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_return_output,
 result_u8_value_MUX_uxn_device_h_l331_c4_97ca_return_output,
 result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_return_output,
 result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_return_output,
 tmp16_MUX_uxn_device_h_l331_c4_97ca_return_output,
 BIN_OP_MINUS_uxn_device_h_l332_c23_759c_return_output,
 BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_return_output,
 MUX_uxn_device_h_l332_c13_f57b_return_output,
 BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_return_output,
 BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_return_output,
 MUX_uxn_device_h_l333_c14_1b6d_return_output,
 BIN_OP_MINUS_uxn_device_h_l334_c36_3893_return_output,
 BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_return_output,
 MUX_uxn_device_h_l334_c26_d460_return_output,
 MUX_uxn_device_h_l334_c10_c672_return_output,
 BIN_OP_MINUS_uxn_device_h_l335_c36_d369_return_output,
 BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_return_output,
 MUX_uxn_device_h_l335_c26_a624_return_output,
 MUX_uxn_device_h_l335_c10_1ddf_return_output,
 CONST_SR_8_uxn_device_h_l340_c33_c0b0_return_output,
 BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_return_output,
 BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output,
 tmp4_MUX_uxn_device_h_l342_c9_e832_return_output,
 ram_addr_MUX_uxn_device_h_l342_c9_e832_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_return_output,
 result_u8_value_MUX_uxn_device_h_l342_c9_e832_return_output,
 result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_return_output,
 result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_return_output,
 BIN_OP_MINUS_uxn_device_h_l347_c22_933a_return_output,
 BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output,
 tmp4_MUX_uxn_device_h_l347_c9_b1bb_return_output,
 ram_addr_MUX_uxn_device_h_l347_c9_b1bb_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_return_output,
 result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_return_output,
 CONST_SR_8_uxn_device_h_l350_c33_7887_return_output,
 BIN_OP_MINUS_uxn_device_h_l352_c22_a494_return_output,
 BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output,
 tmp4_MUX_uxn_device_h_l352_c9_73d0_return_output,
 ram_addr_MUX_uxn_device_h_l352_c9_73d0_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_return_output,
 result_u8_value_MUX_uxn_device_h_l352_c9_73d0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_return_output,
 BIN_OP_MINUS_uxn_device_h_l357_c22_0792_return_output,
 BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output,
 tmp4_MUX_uxn_device_h_l357_c9_5337_return_output,
 ram_addr_MUX_uxn_device_h_l357_c9_5337_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_return_output,
 result_u8_value_MUX_uxn_device_h_l357_c9_5337_return_output,
 result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_return_output,
 result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_return_output,
 BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_return_output,
 CONST_SR_8_uxn_device_h_l361_c33_463c_return_output,
 BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_return_output,
 BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output,
 tmp4_MUX_uxn_device_h_l363_c9_70da_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_return_output,
 result_u8_value_MUX_uxn_device_h_l363_c9_70da_return_output,
 result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_return_output,
 result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_return_output,
 BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_return_output,
 BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output,
 tmp4_MUX_uxn_device_h_l368_c9_f270_return_output,
 screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_return_output,
 result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_return_output,
 result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_return_output,
 BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_return_output,
 screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output,
 screen_2bpp_uxn_device_h_l377_c26_6ab1_return_output,
 screen_1bpp_uxn_device_h_l379_c26_71a6_return_output,
 BIN_OP_EQ_uxn_device_h_l388_c19_acf6_return_output,
 MUX_uxn_device_h_l388_c19_50b2_return_output,
 BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_return_output,
 BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_return_output,
 MUX_uxn_device_h_l391_c11_192e_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output,
 BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l273_c2_e4b6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_7bdc_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l273_c2_e4b6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_7bdc_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l283_c7_8eff_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l283_c7_8eff_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l283_c7_8eff_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l283_c7_8eff_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l288_c7_0d6e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l288_c7_0d6e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l292_c7_e7b7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l292_c7_e7b7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c7_f065_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l297_c7_f065_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l297_c7_f065_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c7_f065_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l301_c7_045a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l301_c7_045a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l301_c7_045a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l301_c7_045a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c7_2ba2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l303_c15_6944_return_output : unsigned(0 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l304_c11_fee3_return_output : unsigned(0 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l305_c12_f07f_return_output : unsigned(0 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l306_c12_2e66_return_output : unsigned(0 downto 0);
 variable VAR_uint8_3_0_uxn_device_h_l307_c11_9904_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l310_c7_2ba2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_ebbd_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_return_output : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(0 downto 0);
 variable VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l318_c3_8822 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(11 downto 0);
 variable VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(7 downto 0);
 variable VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(7 downto 0);
 variable VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l330_c3_af90_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_iftrue : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_iffalse : unsigned(3 downto 0);
 variable VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c18_f3a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c18_f3a4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c18_f3a4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l325_c18_f3a4_return_output : unsigned(7 downto 0);
 variable VAR_uint8_7_4_uxn_device_h_l326_c17_bffd_return_output : unsigned(3 downto 0);
 variable VAR_MUX_uxn_device_h_l327_c19_6e15_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l327_c19_66b3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l327_c19_6e15_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l327_c19_6e15_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l327_c19_6e15_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l328_c19_ed25_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l328_c19_1a99_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l328_c19_ed25_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l328_c19_ed25_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l328_c19_ed25_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c20_7d1d_cond : unsigned(0 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l329_c20_44e4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c20_7d1d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c20_7d1d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c39_633b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c39_633b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c39_633b_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c39_633b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l329_c20_7d1d_return_output : unsigned(15 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(0 downto 0);
 variable VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l330_c3_af90_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l330_c3_af90_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc_uxn_device_h_l330_c3_af90_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l330_c3_af90_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l330_c3_af90_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l337_c5_e9b8 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c13_f57b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c13_f57b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c13_f57b_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l332_c13_f57b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l333_c14_1b6d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l333_c14_1b6d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l333_c14_1b6d_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l333_c14_1b6d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c10_c672_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c10_c672_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c10_c672_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c26_d460_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c26_d460_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c26_d460_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c26_d460_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l334_c10_c672_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c10_1ddf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c10_1ddf_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c10_1ddf_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c26_a624_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c26_a624_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c26_a624_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c26_a624_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l335_c10_1ddf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l340_c33_c0b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l340_c33_c0b0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l340_c23_bf94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l345_c23_d769_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l350_c33_7887_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l350_c33_7887_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l350_c23_13da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l355_c23_2af4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(15 downto 0);
 variable VAR_ram_addr_uxn_device_h_l358_c5_05ac : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(15 downto 0);
 variable VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l361_c33_463c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l361_c33_463c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l361_c23_d6ed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l363_c9_70da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l366_c23_1135_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output : unsigned(0 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(3 downto 0);
 variable VAR_tmp4_uxn_device_h_l369_c5_e968 : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(3 downto 0);
 variable VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l368_c9_f270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l368_c9_f270_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_return_output : unsigned(4 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iffalse : unsigned(0 downto 0);
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iftrue : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iffalse : screen_blit_result_t;
 variable VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_cond : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_phase : unsigned(11 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_x1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_y1 : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_color : unsigned(3 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_fx : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_fy : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_return_output : screen_blit_result_t;
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_phase : unsigned(11 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_x1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_y1 : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_color : unsigned(3 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_fx : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_fy : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_ram_addr : unsigned(15 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_return_output : screen_blit_result_t;
 variable VAR_result_device_ram_address_uxn_device_h_l382_c4_efff : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l384_c27_059c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l385_c22_9174_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l387_c22_e5de_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_50b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_50b2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_50b2_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l388_c19_50b2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_192e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_192e_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_192e_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_return_output : unsigned(12 downto 0);
 variable VAR_MUX_uxn_device_h_l391_c11_192e_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l284_l298_l289_l316_l293_l311_DUPLICATE_8129_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_3315_return_output : unsigned(0 downto 0);
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
     VAR_MUX_uxn_device_h_l328_c19_ed25_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l327_c19_6e15_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iftrue := to_unsigned(40, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iftrue := to_unsigned(44, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l328_c19_ed25_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_MUX_uxn_device_h_l329_c20_7d1d_iffalse := resize(to_unsigned(0, 1), 16);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_right := to_unsigned(3, 2);
     VAR_MUX_uxn_device_h_l388_c19_50b2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iftrue := to_unsigned(0, 1);
     VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l382_c4_efff := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iftrue := to_unsigned(0, 1);
     VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_right := to_unsigned(7, 12);
     VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_right := to_unsigned(5, 3);
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l388_c19_50b2_iftrue := to_unsigned(1, 1);
     VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iftrue := to_unsigned(43, 8);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l329_c39_633b_iftrue := to_unsigned(16, 16);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_right := to_unsigned(4, 12);
     VAR_MUX_uxn_device_h_l327_c19_6e15_iftrue := resize(to_unsigned(8, 4), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_right := to_unsigned(1, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_right := to_unsigned(3, 12);
     VAR_tmp4_uxn_device_h_l318_c3_8822 := resize(to_unsigned(0, 1), 4);
     VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_iftrue := VAR_tmp4_uxn_device_h_l318_c3_8822;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iftrue := to_unsigned(0, 1);
     VAR_result_u16_addr_uxn_device_h_l337_c5_e9b8 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_result_u16_addr_uxn_device_h_l337_c5_e9b8;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_right := to_unsigned(2, 12);
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iftrue := to_unsigned(45, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_right := to_unsigned(8, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_right := to_unsigned(9, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_right := to_unsigned(5, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l329_c39_633b_iffalse := to_unsigned(8, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_right := to_unsigned(0, 12);
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iftrue := to_unsigned(0, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_right := to_unsigned(6, 12);
     VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_iftrue := to_unsigned(9, 12);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_CLOCK_ENABLE;
     VAR_MUX_uxn_device_h_l325_c18_f3a4_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iftrue := auto_advance;
     VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_iftrue := auto_length;
     VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_iftrue := auto_length;
     VAR_color_MUX_uxn_device_h_l273_c2_e4b6_iftrue := color;
     VAR_color_MUX_uxn_device_h_l280_c7_7bdc_iftrue := color;
     VAR_color_MUX_uxn_device_h_l283_c7_8eff_iftrue := color;
     VAR_color_MUX_uxn_device_h_l288_c7_0d6e_iftrue := color;
     VAR_color_MUX_uxn_device_h_l292_c7_e7b7_iftrue := color;
     VAR_color_MUX_uxn_device_h_l297_c7_f065_iftrue := color;
     VAR_color_MUX_uxn_device_h_l301_c7_045a_iffalse := color;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_color := color;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_color := color;
     VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_iffalse := ctrl;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l329_c39_633b_cond := ctrl_mode;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_cond := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iffalse := ctrl_mode;
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_cond := ctrl_mode;
     VAR_MUX_uxn_device_h_l332_c13_f57b_cond := flip_x;
     VAR_MUX_uxn_device_h_l334_c26_d460_cond := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_iffalse := flip_x;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_fx := flip_x;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_fx := flip_x;
     VAR_MUX_uxn_device_h_l333_c14_1b6d_cond := flip_y;
     VAR_MUX_uxn_device_h_l335_c26_a624_cond := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_iffalse := flip_y;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_fy := flip_y;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_fy := flip_y;
     VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_left := is_blit_done;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_cond := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_iftrue := is_blit_done;
     VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iftrue := is_blit_done;
     VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_result_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_x_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_y_MUX_uxn_device_h_l330_c3_af90_cond := is_blit_done;
     VAR_MUX_uxn_device_h_l334_c10_c672_cond := is_last_blit;
     VAR_MUX_uxn_device_h_l335_c10_1ddf_cond := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iftrue := is_last_blit;
     VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_iftrue := is_last_blit;
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iftrue := is_last_blit;
     VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l283_c7_8eff_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l297_c7_f065_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l301_c7_045a_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_right := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_left := VAR_phase;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_left := VAR_phase;
     VAR_MUX_uxn_device_h_l325_c18_f3a4_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_iftrue := VAR_previous_device_ram_read;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_previous_ram_read := VAR_previous_ram_read;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_left := ram_addr;
     VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_left := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_iffalse := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_iftrue := ram_addr;
     VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_iffalse := ram_addr;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_ram_addr := ram_addr;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_ram_addr := ram_addr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue := ram_addr_incr;
     VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue := ram_addr_incr;
     VAR_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue := result;
     VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue := screen_blit_result;
     VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue := screen_blit_result;
     VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_left := tmp12;
     VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_left := tmp12;
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_right := tmp12;
     VAR_MUX_uxn_device_h_l391_c11_192e_iffalse := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_iftrue := tmp12;
     VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_iftrue := tmp12;
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_left := tmp16;
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_left := tmp16;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_x1 := tmp16;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_x1 := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_iffalse := tmp16;
     VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_left := tmp16b;
     VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_left := tmp16b;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_y1 := tmp16b;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_y1 := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_iffalse := tmp16b;
     VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_iffalse := tmp16b;
     VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_right := tmp4;
     VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_left := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_iffalse := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_iftrue := tmp4;
     VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_iffalse := tmp4;
     VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_left := x;
     VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_left := x;
     VAR_MUX_uxn_device_h_l334_c10_c672_iffalse := x;
     VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_iftrue := x;
     VAR_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue := x;
     VAR_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue := x;
     VAR_x_MUX_uxn_device_h_l297_c7_f065_iftrue := x;
     VAR_x_MUX_uxn_device_h_l301_c7_045a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l310_c7_2ba2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l315_c7_ebbd_iftrue := x;
     VAR_x_MUX_uxn_device_h_l330_c3_af90_iffalse := x;
     VAR_x_MUX_uxn_device_h_l331_c4_97ca_iffalse := x;
     VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue := x_sprite_incr;
     VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue := x_sprite_incr;
     VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_left := y;
     VAR_CONST_SR_8_uxn_device_h_l350_c33_7887_x := y;
     VAR_MUX_uxn_device_h_l335_c10_1ddf_iffalse := y;
     VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iftrue := y;
     VAR_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue := y;
     VAR_y_MUX_uxn_device_h_l283_c7_8eff_iftrue := y;
     VAR_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l301_c7_045a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l310_c7_2ba2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l315_c7_ebbd_iftrue := y;
     VAR_y_MUX_uxn_device_h_l330_c3_af90_iffalse := y;
     VAR_y_MUX_uxn_device_h_l331_c4_97ca_iffalse := y;
     VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue := y_sprite_incr;
     VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue := y_sprite_incr;
     -- BIN_OP_PLUS[uxn_device_h_l391_c60_6ee2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_left <= VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_left;
     BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_right <= VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_return_output := BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l297_c7_f065] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l297_c7_f065_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(44, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l292_c7_e7b7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l292_c7_e7b7_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(47, 8));

     -- BIN_OP_MINUS[uxn_device_h_l363_c22_ce7e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_left <= VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_left;
     BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_right <= VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_return_output := BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_return_output;

     -- uint8_5_5[uxn_device_h_l305_c12_f07f] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l305_c12_f07f_return_output := uint8_5_5(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l283_c7_8eff] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l283_c7_8eff_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- BIN_OP_EQ[uxn_device_h_l325_c18_266a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l325_c18_266a_left <= VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_left;
     BIN_OP_EQ_uxn_device_h_l325_c18_266a_right <= VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_return_output := BIN_OP_EQ_uxn_device_h_l325_c18_266a_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l345_c23_d769] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l345_c23_d769_return_output := CAST_TO_uint8_t_uint16_t(
     x);

     -- uint8_4_4[uxn_device_h_l306_c12_2e66] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l306_c12_2e66_return_output := uint8_4_4(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l280_c7_7bdc] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_7bdc_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_left <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_left;
     BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_right <= VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output := BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l288_c7_0d6e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l288_c7_0d6e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_PLUS[uxn_device_h_l369_c5_1fea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_left <= VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_left;
     BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_right <= VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_return_output := BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l310_c7_2ba2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l310_c7_2ba2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l331_c4_97ca] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l331_c4_97ca_return_output := result.u16_addr;

     -- BIN_OP_EQ[uxn_device_h_l288_c11_0670] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l288_c11_0670_left <= VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_left;
     BIN_OP_EQ_uxn_device_h_l288_c11_0670_right <= VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output := BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l355_c23_2af4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l355_c23_2af4_return_output := CAST_TO_uint8_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l301_c11_93f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l301_c11_93f7_left <= VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_left;
     BIN_OP_EQ_uxn_device_h_l301_c11_93f7_right <= VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output := BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l357_c22_0792] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l357_c22_0792_left <= VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_left;
     BIN_OP_MINUS_uxn_device_h_l357_c22_0792_right <= VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_return_output := BIN_OP_MINUS_uxn_device_h_l357_c22_0792_return_output;

     -- BIN_OP_EQ[uxn_device_h_l283_c11_6450] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l283_c11_6450_left <= VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_left;
     BIN_OP_EQ_uxn_device_h_l283_c11_6450_right <= VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output := BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output := screen_blit_result.is_blit_done;

     -- MUX[uxn_device_h_l329_c39_633b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l329_c39_633b_cond <= VAR_MUX_uxn_device_h_l329_c39_633b_cond;
     MUX_uxn_device_h_l329_c39_633b_iftrue <= VAR_MUX_uxn_device_h_l329_c39_633b_iftrue;
     MUX_uxn_device_h_l329_c39_633b_iffalse <= VAR_MUX_uxn_device_h_l329_c39_633b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l329_c39_633b_return_output := MUX_uxn_device_h_l329_c39_633b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l292_c11_8736] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l292_c11_8736_left <= VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_left;
     BIN_OP_EQ_uxn_device_h_l292_c11_8736_right <= VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output := BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l331_c4_97ca] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l331_c4_97ca_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l273_c6_a1c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_left <= VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_left;
     BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_right <= VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output := BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l368_c9_f270] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l368_c9_f270_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l297_c11_a6cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_left <= VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_left;
     BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_right <= VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output := BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l347_c22_933a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l347_c22_933a_left <= VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_left;
     BIN_OP_MINUS_uxn_device_h_l347_c22_933a_right <= VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_return_output := BIN_OP_MINUS_uxn_device_h_l347_c22_933a_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l342_c22_eca1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_left <= VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_left;
     BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_right <= VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_return_output := BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l301_c7_045a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l301_c7_045a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(45, 8));

     -- CAST_TO_uint8_t[uxn_device_h_l366_c23_1135] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l366_c23_1135_return_output := CAST_TO_uint8_t_uint16_t(
     ram_addr);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l284_l298_l289_l316_l293_l311_DUPLICATE_8129 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l284_l298_l289_l316_l293_l311_DUPLICATE_8129_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l273_c2_e4b6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l273_c2_e4b6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_device_h_l310_c11_0d16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l310_c11_0d16_left <= VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_left;
     BIN_OP_EQ_uxn_device_h_l310_c11_0d16_right <= VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output := BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l315_c11_45d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l315_c11_45d4_left <= VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_left;
     BIN_OP_EQ_uxn_device_h_l315_c11_45d4_right <= VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output := BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l331_c8_6a67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l331_c8_6a67_left <= VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_left;
     BIN_OP_EQ_uxn_device_h_l331_c8_6a67_right <= VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output := BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l368_c9_f270] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l368_c9_f270_return_output := result.device_ram_address;

     -- uint8_7_7[uxn_device_h_l303_c15_6944] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l303_c15_6944_return_output := uint8_7_7(
     VAR_previous_device_ram_read);

     -- BIN_OP_MINUS[uxn_device_h_l352_c22_a494] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l352_c22_a494_left <= VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_left;
     BIN_OP_MINUS_uxn_device_h_l352_c22_a494_right <= VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_return_output := BIN_OP_MINUS_uxn_device_h_l352_c22_a494_return_output;

     -- CONST_SR_8[uxn_device_h_l350_c33_7887] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l350_c33_7887_x <= VAR_CONST_SR_8_uxn_device_h_l350_c33_7887_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l350_c33_7887_return_output := CONST_SR_8_uxn_device_h_l350_c33_7887_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l363_c9_70da] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l363_c9_70da_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l280_c11_c213] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l280_c11_c213_left <= VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_left;
     BIN_OP_EQ_uxn_device_h_l280_c11_c213_right <= VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output := BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;

     -- uint8_6_6[uxn_device_h_l304_c11_fee3] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l304_c11_fee3_return_output := uint8_6_6(
     VAR_previous_device_ram_read);

     -- BIN_OP_MINUS[uxn_device_h_l368_c22_07d4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_left <= VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_left;
     BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_right <= VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_return_output := BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_return_output;

     -- uint8_3_0[uxn_device_h_l307_c11_9904] LATENCY=0
     VAR_uint8_3_0_uxn_device_h_l307_c11_9904_return_output := uint8_3_0(
     VAR_previous_device_ram_read);

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_color_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_result_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_x_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_y_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l273_c6_a1c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_color_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_y_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond := VAR_BIN_OP_EQ_uxn_device_h_l280_c11_c213_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_color_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_layer_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_result_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_x_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_y_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond := VAR_BIN_OP_EQ_uxn_device_h_l283_c11_6450_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_color_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_result_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_x_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_y_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond := VAR_BIN_OP_EQ_uxn_device_h_l288_c11_0670_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_color_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_result_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_x_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_y_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l292_c11_8736_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_color_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_layer_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_result_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_x_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_y_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c11_a6cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_color_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_layer_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_result_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_x_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_y_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c11_93f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_result_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_x_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_y_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_0d16_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_result_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_x_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_y_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_45d4_return_output;
     VAR_MUX_uxn_device_h_l325_c18_f3a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l325_c18_266a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_x_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_y_MUX_uxn_device_h_l331_c4_97ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l331_c8_6a67_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_right := VAR_BIN_OP_MINUS_uxn_device_h_l342_c22_eca1_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_right := VAR_BIN_OP_MINUS_uxn_device_h_l347_c22_933a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_right := VAR_BIN_OP_MINUS_uxn_device_h_l352_c22_a494_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_right := VAR_BIN_OP_MINUS_uxn_device_h_l357_c22_0792_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_right := VAR_BIN_OP_MINUS_uxn_device_h_l363_c22_ce7e_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_right := VAR_BIN_OP_MINUS_uxn_device_h_l368_c22_07d4_return_output;
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_phase := VAR_BIN_OP_MINUS_uint12_t_uint12_t_uxn_device_h_l379_l377_DUPLICATE_24cd_return_output;
     VAR_tmp4_uxn_device_h_l369_c5_e968 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l369_c5_1fea_return_output, 4);
     VAR_MUX_uxn_device_h_l391_c11_192e_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l391_c60_6ee2_return_output, 12);
     VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l284_l298_l289_l316_l293_l311_DUPLICATE_8129_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l284_l298_l289_l316_l293_l311_DUPLICATE_8129_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l284_l298_l289_l316_l293_l311_DUPLICATE_8129_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l284_l298_l289_l316_l293_l311_DUPLICATE_8129_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l345_c23_d769_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l355_c23_2af4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l366_c23_1135_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_52cc_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iftrue := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l342_l352_l368_l357_l347_l331_l363_DUPLICATE_603f_return_output;
     VAR_MUX_uxn_device_h_l329_c20_7d1d_iftrue := VAR_MUX_uxn_device_h_l329_c39_633b_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_result_MUX_uxn_device_h_l283_c7_8eff_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l283_c7_8eff_return_output;
     VAR_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_result_MUX_uxn_device_h_l297_c7_f065_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l297_c7_f065_return_output;
     VAR_result_MUX_uxn_device_h_l301_c7_045a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l301_c7_045a_return_output;
     VAR_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l368_c9_f270_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l368_c9_f270_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l331_c4_97ca_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l331_c4_97ca_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l363_c9_70da_return_output;
     VAR_color_MUX_uxn_device_h_l301_c7_045a_iftrue := VAR_uint8_3_0_uxn_device_h_l307_c11_9904_return_output;
     VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_iftrue := VAR_uint8_4_4_uxn_device_h_l306_c12_2e66_return_output;
     VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_iftrue := VAR_uint8_5_5_uxn_device_h_l305_c12_f07f_return_output;
     VAR_layer_MUX_uxn_device_h_l301_c7_045a_iftrue := VAR_uint8_6_6_uxn_device_h_l304_c11_fee3_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iftrue := VAR_uint8_7_7_uxn_device_h_l303_c15_6944_return_output;
     VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_iftrue := VAR_tmp4_uxn_device_h_l369_c5_e968;
     -- BIN_OP_OR[uxn_device_h_l316_c3_9b5f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l316_c3_9b5f_left <= VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_left;
     BIN_OP_OR_uxn_device_h_l316_c3_9b5f_right <= VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_return_output := BIN_OP_OR_uxn_device_h_l316_c3_9b5f_return_output;

     -- color_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_color_MUX_uxn_device_h_l301_c7_045a_cond;
     color_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_color_MUX_uxn_device_h_l301_c7_045a_iftrue;
     color_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_color_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l301_c7_045a_return_output := color_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- BIN_OP_OR[uxn_device_h_l298_c3_9801] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l298_c3_9801_left <= VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_left;
     BIN_OP_OR_uxn_device_h_l298_c3_9801_right <= VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_return_output := BIN_OP_OR_uxn_device_h_l298_c3_9801_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l357_c13_4ce8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_left <= VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_left;
     BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_right <= VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output := BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;

     -- flip_x_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_cond;
     flip_x_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_iftrue;
     flip_x_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_return_output := flip_x_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l350_c23_13da] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l350_c23_13da_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l350_c33_7887_return_output);

     -- BIN_OP_OR[uxn_device_h_l289_c3_1685] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l289_c3_1685_left <= VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_left;
     BIN_OP_OR_uxn_device_h_l289_c3_1685_right <= VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_return_output := BIN_OP_OR_uxn_device_h_l289_c3_1685_return_output;

     -- flip_y_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_cond;
     flip_y_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_iftrue;
     flip_y_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_return_output := flip_y_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- layer_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_layer_MUX_uxn_device_h_l301_c7_045a_cond;
     layer_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_layer_MUX_uxn_device_h_l301_c7_045a_iftrue;
     layer_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_layer_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l301_c7_045a_return_output := layer_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l342_c13_353c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l342_c13_353c_left <= VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_left;
     BIN_OP_EQ_uxn_device_h_l342_c13_353c_right <= VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output := BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l347_c13_4232] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l347_c13_4232_left <= VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_left;
     BIN_OP_EQ_uxn_device_h_l347_c13_4232_right <= VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output := BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output := CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_cond;
     result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_return_output := result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l363_c13_10ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l363_c13_10ca_left <= VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_left;
     BIN_OP_EQ_uxn_device_h_l363_c13_10ca_right <= VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output := BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_cond;
     result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_return_output := result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l352_c13_04cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l352_c13_04cd_left <= VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_left;
     BIN_OP_EQ_uxn_device_h_l352_c13_04cd_right <= VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output := BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;

     -- ctrl_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_cond;
     ctrl_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_iftrue;
     ctrl_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_return_output := ctrl_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l368_c13_b8ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_left <= VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_left;
     BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_right <= VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output := BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_cond;
     ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iftrue;
     ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_return_output := ctrl_mode_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- MUX[uxn_device_h_l325_c18_f3a4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l325_c18_f3a4_cond <= VAR_MUX_uxn_device_h_l325_c18_f3a4_cond;
     MUX_uxn_device_h_l325_c18_f3a4_iftrue <= VAR_MUX_uxn_device_h_l325_c18_f3a4_iftrue;
     MUX_uxn_device_h_l325_c18_f3a4_iffalse <= VAR_MUX_uxn_device_h_l325_c18_f3a4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l325_c18_f3a4_return_output := MUX_uxn_device_h_l325_c18_f3a4_return_output;

     -- Submodule level 2
     VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_cond := VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_cond := VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_cond := VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_cond := VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_cond := VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_cond := VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;
     VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_cond := VAR_BIN_OP_EQ_uxn_device_h_l342_c13_353c_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;
     VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l347_c13_4232_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;
     VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_cond := VAR_BIN_OP_EQ_uxn_device_h_l352_c13_04cd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_cond := VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_cond := VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_cond := VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_cond := VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_cond := VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_cond := VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;
     VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_cond := VAR_BIN_OP_EQ_uxn_device_h_l357_c13_4ce8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output;
     VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_cond := VAR_BIN_OP_EQ_uxn_device_h_l363_c13_10ca_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output;
     VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_cond := VAR_BIN_OP_EQ_uxn_device_h_l368_c13_b8ea_return_output;
     VAR_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue := VAR_BIN_OP_OR_uxn_device_h_l289_c3_1685_return_output;
     VAR_y_MUX_uxn_device_h_l297_c7_f065_iftrue := VAR_BIN_OP_OR_uxn_device_h_l298_c3_9801_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iftrue := VAR_BIN_OP_OR_uxn_device_h_l316_c3_9b5f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l350_c23_13da_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output;
     VAR_x_MUX_uxn_device_h_l283_c7_8eff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output;
     VAR_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l294_l285_l312_DUPLICATE_743f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_MUX_uxn_device_h_l325_c18_f3a4_return_output;
     VAR_color_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_color_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_ctrl_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_flip_x_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_flip_y_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_layer_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_layer_MUX_uxn_device_h_l301_c7_045a_return_output;
     -- ctrl_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_cond;
     ctrl_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_iftrue;
     ctrl_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_return_output := ctrl_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l368_c9_f270] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_cond;
     result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_return_output := result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_return_output;

     -- uint8_1_1[uxn_device_h_l328_c19_1a99] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l328_c19_1a99_return_output := uint8_1_1(
     VAR_MUX_uxn_device_h_l325_c18_f3a4_return_output);

     -- uint8_7_4[uxn_device_h_l326_c17_bffd] LATENCY=0
     VAR_uint8_7_4_uxn_device_h_l326_c17_bffd_return_output := uint8_7_4(
     VAR_MUX_uxn_device_h_l325_c18_f3a4_return_output);

     -- auto_advance_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_cond;
     auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_return_output := auto_advance_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- layer_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_layer_MUX_uxn_device_h_l297_c7_f065_cond;
     layer_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_layer_MUX_uxn_device_h_l297_c7_f065_iftrue;
     layer_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_layer_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l297_c7_f065_return_output := layer_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- flip_y_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_cond;
     flip_y_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_iftrue;
     flip_y_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_return_output := flip_y_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l368_c9_f270] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_cond;
     result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_return_output := result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_return_output;

     -- flip_x_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_cond;
     flip_x_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_iftrue;
     flip_x_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_return_output := flip_x_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- uint8_2_2[uxn_device_h_l329_c20_44e4] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l329_c20_44e4_return_output := uint8_2_2(
     VAR_MUX_uxn_device_h_l325_c18_f3a4_return_output);

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l368_c9_f270] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l368_c9_f270] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_return_output := result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_cond;
     ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iftrue;
     ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_return_output := ctrl_mode_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- color_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_color_MUX_uxn_device_h_l297_c7_f065_cond;
     color_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_color_MUX_uxn_device_h_l297_c7_f065_iftrue;
     color_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_color_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l297_c7_f065_return_output := color_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- tmp4_MUX[uxn_device_h_l368_c9_f270] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l368_c9_f270_cond <= VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_cond;
     tmp4_MUX_uxn_device_h_l368_c9_f270_iftrue <= VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_iftrue;
     tmp4_MUX_uxn_device_h_l368_c9_f270_iffalse <= VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_return_output := tmp4_MUX_uxn_device_h_l368_c9_f270_return_output;

     -- result_u8_value_MUX[uxn_device_h_l363_c9_70da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l363_c9_70da_cond <= VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_cond;
     result_u8_value_MUX_uxn_device_h_l363_c9_70da_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_iftrue;
     result_u8_value_MUX_uxn_device_h_l363_c9_70da_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_return_output := result_u8_value_MUX_uxn_device_h_l363_c9_70da_return_output;

     -- uint8_0_0[uxn_device_h_l327_c19_66b3] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l327_c19_66b3_return_output := uint8_0_0(
     VAR_MUX_uxn_device_h_l325_c18_f3a4_return_output);

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_color_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_color_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_ctrl_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_flip_x_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_flip_y_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_layer_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l368_c9_f270_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l368_c9_f270_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l368_c9_f270_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l363_c9_70da_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l368_c9_f270_return_output;
     VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_iffalse := VAR_tmp4_MUX_uxn_device_h_l368_c9_f270_return_output;
     VAR_MUX_uxn_device_h_l327_c19_6e15_cond := VAR_uint8_0_0_uxn_device_h_l327_c19_66b3_return_output;
     VAR_MUX_uxn_device_h_l328_c19_ed25_cond := VAR_uint8_1_1_uxn_device_h_l328_c19_1a99_return_output;
     VAR_MUX_uxn_device_h_l329_c20_7d1d_cond := VAR_uint8_2_2_uxn_device_h_l329_c20_44e4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_left := VAR_uint8_7_4_uxn_device_h_l326_c17_bffd_return_output;
     VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_uint8_7_4_uxn_device_h_l326_c17_bffd_return_output;
     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l363_c9_70da] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l363_c9_70da] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_return_output := result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_return_output;

     -- auto_length_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_cond;
     auto_length_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     auto_length_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_return_output := auto_length_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_cond;
     ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_return_output := ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l363_c9_70da] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_cond;
     result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_return_output := result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_return_output;

     -- flip_x_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_cond;
     flip_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     flip_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_return_output := flip_x_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- ctrl_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_cond;
     ctrl_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     ctrl_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_return_output := ctrl_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- tmp4_MUX[uxn_device_h_l363_c9_70da] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l363_c9_70da_cond <= VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_cond;
     tmp4_MUX_uxn_device_h_l363_c9_70da_iftrue <= VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_iftrue;
     tmp4_MUX_uxn_device_h_l363_c9_70da_iffalse <= VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_return_output := tmp4_MUX_uxn_device_h_l363_c9_70da_return_output;

     -- auto_advance_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_cond;
     auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_return_output := auto_advance_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- MUX[uxn_device_h_l327_c19_6e15] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l327_c19_6e15_cond <= VAR_MUX_uxn_device_h_l327_c19_6e15_cond;
     MUX_uxn_device_h_l327_c19_6e15_iftrue <= VAR_MUX_uxn_device_h_l327_c19_6e15_iftrue;
     MUX_uxn_device_h_l327_c19_6e15_iffalse <= VAR_MUX_uxn_device_h_l327_c19_6e15_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l327_c19_6e15_return_output := MUX_uxn_device_h_l327_c19_6e15_return_output;

     -- color_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_color_MUX_uxn_device_h_l292_c7_e7b7_cond;
     color_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_color_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     color_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_color_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l292_c7_e7b7_return_output := color_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- MUX[uxn_device_h_l328_c19_ed25] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l328_c19_ed25_cond <= VAR_MUX_uxn_device_h_l328_c19_ed25_cond;
     MUX_uxn_device_h_l328_c19_ed25_iftrue <= VAR_MUX_uxn_device_h_l328_c19_ed25_iftrue;
     MUX_uxn_device_h_l328_c19_ed25_iffalse <= VAR_MUX_uxn_device_h_l328_c19_ed25_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l328_c19_ed25_return_output := MUX_uxn_device_h_l328_c19_ed25_return_output;

     -- BIN_OP_EQ[uxn_device_h_l388_c19_acf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l388_c19_acf6_left <= VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_left;
     BIN_OP_EQ_uxn_device_h_l388_c19_acf6_right <= VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_return_output := BIN_OP_EQ_uxn_device_h_l388_c19_acf6_return_output;

     -- flip_y_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_cond;
     flip_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     flip_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_return_output := flip_y_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- layer_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_cond;
     layer_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     layer_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_return_output := layer_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l363_c9_70da] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_cond;
     result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_return_output := result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_return_output;

     -- MUX[uxn_device_h_l329_c20_7d1d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l329_c20_7d1d_cond <= VAR_MUX_uxn_device_h_l329_c20_7d1d_cond;
     MUX_uxn_device_h_l329_c20_7d1d_iftrue <= VAR_MUX_uxn_device_h_l329_c20_7d1d_iftrue;
     MUX_uxn_device_h_l329_c20_7d1d_iffalse <= VAR_MUX_uxn_device_h_l329_c20_7d1d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l329_c20_7d1d_return_output := MUX_uxn_device_h_l329_c20_7d1d_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_device_h_l388_c19_50b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l388_c19_acf6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_right := VAR_MUX_uxn_device_h_l327_c19_6e15_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_right := VAR_MUX_uxn_device_h_l327_c19_6e15_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_right := VAR_MUX_uxn_device_h_l327_c19_6e15_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_right := VAR_MUX_uxn_device_h_l327_c19_6e15_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_MUX_uxn_device_h_l327_c19_6e15_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_right := VAR_MUX_uxn_device_h_l328_c19_ed25_return_output;
     VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_right := VAR_MUX_uxn_device_h_l328_c19_ed25_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_right := VAR_MUX_uxn_device_h_l328_c19_ed25_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_right := VAR_MUX_uxn_device_h_l328_c19_ed25_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_MUX_uxn_device_h_l328_c19_ed25_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_right := VAR_MUX_uxn_device_h_l329_c20_7d1d_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_MUX_uxn_device_h_l329_c20_7d1d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_auto_length_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_color_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_color_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_ctrl_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_flip_x_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_flip_y_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_layer_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l363_c9_70da_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l363_c9_70da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l363_c9_70da_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l363_c9_70da_return_output;
     VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_iffalse := VAR_tmp4_MUX_uxn_device_h_l363_c9_70da_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l333_c51_3e54] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_left <= VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_left;
     BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_right <= VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_return_output := BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l333_c24_2e95] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_left <= VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_left;
     BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_right <= VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_return_output := BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_return_output;

     -- layer_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_cond;
     layer_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     layer_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_return_output := layer_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l334_c58_90ac] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_left <= VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_left;
     BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_right <= VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_return_output := BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_return_output;

     -- flip_y_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_cond;
     flip_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     flip_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_return_output := flip_y_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond;
     x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output := x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- tmp4_MUX[uxn_device_h_l357_c9_5337] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l357_c9_5337_cond <= VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_cond;
     tmp4_MUX_uxn_device_h_l357_c9_5337_iftrue <= VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_iftrue;
     tmp4_MUX_uxn_device_h_l357_c9_5337_iffalse <= VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_return_output := tmp4_MUX_uxn_device_h_l357_c9_5337_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l335_c36_d369] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l335_c36_d369_left <= VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_left;
     BIN_OP_MINUS_uxn_device_h_l335_c36_d369_right <= VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_return_output := BIN_OP_MINUS_uxn_device_h_l335_c36_d369_return_output;

     -- auto_advance_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_cond;
     auto_advance_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_iftrue;
     auto_advance_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_return_output := auto_advance_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_cond;
     ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output := ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l332_c49_53f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_left <= VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_left;
     BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_right <= VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_return_output := BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l334_c36_3893] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l334_c36_3893_left <= VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_left;
     BIN_OP_MINUS_uxn_device_h_l334_c36_3893_right <= VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_return_output := BIN_OP_MINUS_uxn_device_h_l334_c36_3893_return_output;

     -- MUX[uxn_device_h_l388_c19_50b2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l388_c19_50b2_cond <= VAR_MUX_uxn_device_h_l388_c19_50b2_cond;
     MUX_uxn_device_h_l388_c19_50b2_iftrue <= VAR_MUX_uxn_device_h_l388_c19_50b2_iftrue;
     MUX_uxn_device_h_l388_c19_50b2_iffalse <= VAR_MUX_uxn_device_h_l388_c19_50b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l388_c19_50b2_return_output := MUX_uxn_device_h_l388_c19_50b2_return_output;

     -- auto_length_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_cond;
     auto_length_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     auto_length_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_return_output := auto_length_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_cond;
     y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output := y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- flip_x_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_cond;
     flip_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     flip_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_return_output := flip_x_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- BIN_OP_MINUS[uxn_device_h_l332_c23_759c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_device_h_l332_c23_759c_left <= VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_left;
     BIN_OP_MINUS_uxn_device_h_l332_c23_759c_right <= VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_return_output := BIN_OP_MINUS_uxn_device_h_l332_c23_759c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l335_c58_cd7b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_left;
     BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_return_output := BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l357_c9_5337] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_cond;
     result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_return_output := result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l358_c5_04a9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_left;
     BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_return_output := BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l357_c9_5337] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_cond;
     result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_return_output := result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l357_c9_5337] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l357_c9_5337] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_return_output := result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_cond;
     ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_return_output := ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- color_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_color_MUX_uxn_device_h_l288_c7_0d6e_cond;
     color_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_color_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     color_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_color_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l288_c7_0d6e_return_output := color_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- ctrl_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_cond;
     ctrl_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     ctrl_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_return_output := ctrl_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l332_c13_f57b_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l332_c23_759c_return_output;
     VAR_MUX_uxn_device_h_l333_c14_1b6d_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l333_c24_2e95_return_output;
     VAR_MUX_uxn_device_h_l334_c26_d460_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l334_c36_3893_return_output;
     VAR_MUX_uxn_device_h_l335_c26_a624_iftrue := VAR_BIN_OP_MINUS_uxn_device_h_l335_c36_d369_return_output;
     VAR_MUX_uxn_device_h_l332_c13_f57b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l332_c49_53f3_return_output, 16);
     VAR_MUX_uxn_device_h_l333_c14_1b6d_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l333_c51_3e54_return_output, 16);
     VAR_MUX_uxn_device_h_l334_c26_d460_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l334_c58_90ac_return_output, 16);
     VAR_MUX_uxn_device_h_l335_c26_a624_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l335_c58_cd7b_return_output, 16);
     VAR_ram_addr_uxn_device_h_l358_c5_05ac := resize(VAR_BIN_OP_PLUS_uxn_device_h_l358_c5_04a9_return_output, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_iffalse := VAR_MUX_uxn_device_h_l388_c19_50b2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_auto_advance_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_auto_length_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_color_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_color_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_ctrl_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_flip_x_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_flip_y_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_layer_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_layer_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l357_c9_5337_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l357_c9_5337_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l357_c9_5337_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l357_c9_5337_return_output;
     VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_iffalse := VAR_tmp4_MUX_uxn_device_h_l357_c9_5337_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_CONST_SR_8_uxn_device_h_l361_c33_463c_x := VAR_ram_addr_uxn_device_h_l358_c5_05ac;
     VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_iftrue := VAR_ram_addr_uxn_device_h_l358_c5_05ac;
     -- ram_addr_incr_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_cond;
     ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output := ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- auto_length_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_cond;
     auto_length_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_iftrue;
     auto_length_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_return_output := auto_length_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond;
     y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output := y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_cond;
     ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_return_output := ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_cond;
     x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output := x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- MUX[uxn_device_h_l334_c26_d460] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l334_c26_d460_cond <= VAR_MUX_uxn_device_h_l334_c26_d460_cond;
     MUX_uxn_device_h_l334_c26_d460_iftrue <= VAR_MUX_uxn_device_h_l334_c26_d460_iftrue;
     MUX_uxn_device_h_l334_c26_d460_iffalse <= VAR_MUX_uxn_device_h_l334_c26_d460_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l334_c26_d460_return_output := MUX_uxn_device_h_l334_c26_d460_return_output;

     -- ctrl_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_cond;
     ctrl_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     ctrl_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_return_output := ctrl_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l352_c9_73d0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_cond;
     result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_return_output := result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_return_output;

     -- layer_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_layer_MUX_uxn_device_h_l283_c7_8eff_cond;
     layer_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_layer_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     layer_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_layer_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l283_c7_8eff_return_output := layer_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l352_c9_73d0] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_return_output;

     -- CONST_SR_8[uxn_device_h_l361_c33_463c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l361_c33_463c_x <= VAR_CONST_SR_8_uxn_device_h_l361_c33_463c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l361_c33_463c_return_output := CONST_SR_8_uxn_device_h_l361_c33_463c_return_output;

     -- flip_y_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_cond;
     flip_y_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     flip_y_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_return_output := flip_y_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- MUX[uxn_device_h_l333_c14_1b6d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l333_c14_1b6d_cond <= VAR_MUX_uxn_device_h_l333_c14_1b6d_cond;
     MUX_uxn_device_h_l333_c14_1b6d_iftrue <= VAR_MUX_uxn_device_h_l333_c14_1b6d_iftrue;
     MUX_uxn_device_h_l333_c14_1b6d_iffalse <= VAR_MUX_uxn_device_h_l333_c14_1b6d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l333_c14_1b6d_return_output := MUX_uxn_device_h_l333_c14_1b6d_return_output;

     -- ram_addr_MUX[uxn_device_h_l357_c9_5337] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l357_c9_5337_cond <= VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_cond;
     ram_addr_MUX_uxn_device_h_l357_c9_5337_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_iftrue;
     ram_addr_MUX_uxn_device_h_l357_c9_5337_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_return_output := ram_addr_MUX_uxn_device_h_l357_c9_5337_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- is_last_blit_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_cond;
     is_last_blit_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_iftrue;
     is_last_blit_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_return_output := is_last_blit_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- MUX[uxn_device_h_l335_c26_a624] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l335_c26_a624_cond <= VAR_MUX_uxn_device_h_l335_c26_a624_cond;
     MUX_uxn_device_h_l335_c26_a624_iftrue <= VAR_MUX_uxn_device_h_l335_c26_a624_iftrue;
     MUX_uxn_device_h_l335_c26_a624_iffalse <= VAR_MUX_uxn_device_h_l335_c26_a624_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l335_c26_a624_return_output := MUX_uxn_device_h_l335_c26_a624_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l352_c9_73d0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_return_output := result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l352_c9_73d0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_cond;
     result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_return_output := result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_return_output;

     -- tmp4_MUX[uxn_device_h_l352_c9_73d0] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l352_c9_73d0_cond <= VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_cond;
     tmp4_MUX_uxn_device_h_l352_c9_73d0_iftrue <= VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_iftrue;
     tmp4_MUX_uxn_device_h_l352_c9_73d0_iffalse <= VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_return_output := tmp4_MUX_uxn_device_h_l352_c9_73d0_return_output;

     -- color_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_color_MUX_uxn_device_h_l283_c7_8eff_cond;
     color_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_color_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     color_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_color_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l283_c7_8eff_return_output := color_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- flip_x_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_cond;
     flip_x_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     flip_x_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_return_output := flip_x_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- MUX[uxn_device_h_l332_c13_f57b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l332_c13_f57b_cond <= VAR_MUX_uxn_device_h_l332_c13_f57b_cond;
     MUX_uxn_device_h_l332_c13_f57b_iftrue <= VAR_MUX_uxn_device_h_l332_c13_f57b_iftrue;
     MUX_uxn_device_h_l332_c13_f57b_iffalse <= VAR_MUX_uxn_device_h_l332_c13_f57b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l332_c13_f57b_return_output := MUX_uxn_device_h_l332_c13_f57b_return_output;

     -- auto_advance_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_cond;
     auto_advance_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_iftrue;
     auto_advance_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_return_output := auto_advance_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_MUX_uxn_device_h_l332_c13_f57b_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_MUX_uxn_device_h_l333_c14_1b6d_return_output;
     VAR_MUX_uxn_device_h_l334_c10_c672_iftrue := VAR_MUX_uxn_device_h_l334_c26_d460_return_output;
     VAR_MUX_uxn_device_h_l335_c10_1ddf_iftrue := VAR_MUX_uxn_device_h_l335_c26_a624_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_auto_length_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_color_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_color_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_ctrl_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_flip_x_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_flip_y_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_layer_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_iffalse := VAR_ram_addr_MUX_uxn_device_h_l357_c9_5337_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l352_c9_73d0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l352_c9_73d0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l352_c9_73d0_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l352_c9_73d0_return_output;
     VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_iffalse := VAR_tmp4_MUX_uxn_device_h_l352_c9_73d0_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     -- tmp16b_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_cond;
     tmp16b_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     tmp16b_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_return_output := tmp16b_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- auto_length_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_cond;
     auto_length_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_iftrue;
     auto_length_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_return_output := auto_length_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l347_c9_b1bb] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_return_output;

     -- color_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_color_MUX_uxn_device_h_l280_c7_7bdc_cond;
     color_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_color_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     color_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_color_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l280_c7_7bdc_return_output := color_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond;
     x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output := x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l361_c23_d6ed] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l361_c23_d6ed_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l361_c33_463c_return_output);

     -- MUX[uxn_device_h_l335_c10_1ddf] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l335_c10_1ddf_cond <= VAR_MUX_uxn_device_h_l335_c10_1ddf_cond;
     MUX_uxn_device_h_l335_c10_1ddf_iftrue <= VAR_MUX_uxn_device_h_l335_c10_1ddf_iftrue;
     MUX_uxn_device_h_l335_c10_1ddf_iffalse <= VAR_MUX_uxn_device_h_l335_c10_1ddf_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l335_c10_1ddf_return_output := MUX_uxn_device_h_l335_c10_1ddf_return_output;

     -- ram_addr_MUX[uxn_device_h_l352_c9_73d0] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l352_c9_73d0_cond <= VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_cond;
     ram_addr_MUX_uxn_device_h_l352_c9_73d0_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_iftrue;
     ram_addr_MUX_uxn_device_h_l352_c9_73d0_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_return_output := ram_addr_MUX_uxn_device_h_l352_c9_73d0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- MUX[uxn_device_h_l334_c10_c672] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l334_c10_c672_cond <= VAR_MUX_uxn_device_h_l334_c10_c672_cond;
     MUX_uxn_device_h_l334_c10_c672_iftrue <= VAR_MUX_uxn_device_h_l334_c10_c672_iftrue;
     MUX_uxn_device_h_l334_c10_c672_iffalse <= VAR_MUX_uxn_device_h_l334_c10_c672_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l334_c10_c672_return_output := MUX_uxn_device_h_l334_c10_c672_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_cond;
     ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_return_output := ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- tmp4_MUX[uxn_device_h_l347_c9_b1bb] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l347_c9_b1bb_cond <= VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_cond;
     tmp4_MUX_uxn_device_h_l347_c9_b1bb_iftrue <= VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_iftrue;
     tmp4_MUX_uxn_device_h_l347_c9_b1bb_iffalse <= VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_return_output := tmp4_MUX_uxn_device_h_l347_c9_b1bb_return_output;

     -- ctrl_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_cond;
     ctrl_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     ctrl_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_return_output := ctrl_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- tmp16_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_cond;
     tmp16_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     tmp16_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_return_output := tmp16_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- is_last_blit_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_cond;
     is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_return_output := is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_cond;
     y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output := y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l347_c9_b1bb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_return_output := result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_return_output;

     -- flip_x_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_cond;
     flip_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     flip_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_return_output := flip_x_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l347_c9_b1bb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_cond;
     result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_return_output := result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_cond;
     ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_return_output := ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l347_c9_b1bb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_cond;
     result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_return_output := result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_return_output;

     -- layer_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_cond;
     layer_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     layer_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_return_output := layer_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- flip_y_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_cond;
     flip_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     flip_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_return_output := flip_y_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- auto_advance_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_cond;
     auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_return_output := auto_advance_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l361_c23_d6ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_CONST_SR_8_uxn_device_h_l340_c33_c0b0_x := VAR_MUX_uxn_device_h_l334_c10_c672_return_output;
     VAR_x_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_MUX_uxn_device_h_l334_c10_c672_return_output;
     VAR_y_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_MUX_uxn_device_h_l335_c10_1ddf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_auto_length_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_color_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_color_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_ctrl_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_flip_x_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_flip_y_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_layer_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iffalse := VAR_ram_addr_MUX_uxn_device_h_l352_c9_73d0_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l347_c9_b1bb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l347_c9_b1bb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l347_c9_b1bb_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l347_c9_b1bb_return_output;
     VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_tmp16_MUX_uxn_device_h_l331_c4_97ca_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_tmp16b_MUX_uxn_device_h_l331_c4_97ca_return_output;
     VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_iffalse := VAR_tmp4_MUX_uxn_device_h_l347_c9_b1bb_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l301_c7_045a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l357_c9_5337] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l357_c9_5337_cond <= VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_cond;
     result_u8_value_MUX_uxn_device_h_l357_c9_5337_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_iftrue;
     result_u8_value_MUX_uxn_device_h_l357_c9_5337_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_return_output := result_u8_value_MUX_uxn_device_h_l357_c9_5337_return_output;

     -- is_last_blit_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_cond;
     is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_return_output := is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- ram_addr_MUX[uxn_device_h_l347_c9_b1bb] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l347_c9_b1bb_cond <= VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_cond;
     ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iftrue;
     ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_return_output := ram_addr_MUX_uxn_device_h_l347_c9_b1bb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l342_c9_e832] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_cond;
     result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_return_output := result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_return_output;

     -- y_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_y_MUX_uxn_device_h_l331_c4_97ca_cond;
     y_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_y_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     y_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_y_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l331_c4_97ca_return_output := y_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond;
     x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output := x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l342_c9_e832] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_return_output;

     -- tmp16_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_cond;
     tmp16_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_iftrue;
     tmp16_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_return_output := tmp16_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- ctrl_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_cond;
     ctrl_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     ctrl_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_return_output := ctrl_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- CONST_SR_8[uxn_device_h_l340_c33_c0b0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l340_c33_c0b0_x <= VAR_CONST_SR_8_uxn_device_h_l340_c33_c0b0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l340_c33_c0b0_return_output := CONST_SR_8_uxn_device_h_l340_c33_c0b0_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l342_c9_e832] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_return_output := result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_return_output;

     -- layer_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_cond;
     layer_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     layer_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_return_output := layer_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_cond;
     ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_return_output := ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- flip_x_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_cond;
     flip_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     flip_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_return_output := flip_x_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_cond;
     y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output := y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- x_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_x_MUX_uxn_device_h_l331_c4_97ca_cond;
     x_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_x_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     x_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_x_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l331_c4_97ca_return_output := x_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l342_c9_e832] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_cond;
     result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_return_output := result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_return_output;

     -- tmp4_MUX[uxn_device_h_l342_c9_e832] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l342_c9_e832_cond <= VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_cond;
     tmp4_MUX_uxn_device_h_l342_c9_e832_iftrue <= VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_iftrue;
     tmp4_MUX_uxn_device_h_l342_c9_e832_iffalse <= VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_return_output := tmp4_MUX_uxn_device_h_l342_c9_e832_return_output;

     -- color_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_color_MUX_uxn_device_h_l273_c2_e4b6_cond;
     color_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_color_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     color_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_color_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l273_c2_e4b6_return_output := color_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- auto_length_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_cond;
     auto_length_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     auto_length_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_return_output := auto_length_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_cond;
     ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_return_output := ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- tmp16b_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_cond;
     tmp16b_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_iftrue;
     tmp16b_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_return_output := tmp16b_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- flip_y_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_cond;
     flip_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     flip_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_return_output := flip_y_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- auto_advance_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_cond;
     auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_return_output := auto_advance_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_auto_advance_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_auto_length_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_iffalse := VAR_ram_addr_MUX_uxn_device_h_l347_c9_b1bb_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l342_c9_e832_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l342_c9_e832_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l342_c9_e832_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l357_c9_5337_return_output;
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l342_c9_e832_return_output;
     VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_tmp16_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_tmp16b_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_tmp4_MUX_uxn_device_h_l342_c9_e832_return_output;
     VAR_x_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_x_MUX_uxn_device_h_l331_c4_97ca_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_y_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_y_MUX_uxn_device_h_l331_c4_97ca_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l297_c7_f065_return_output;
     -- tmp16b_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_cond;
     tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_return_output := tmp16b_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l340_c23_bf94] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l340_c23_bf94_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l340_c33_c0b0_return_output);

     -- ram_addr_incr_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_cond;
     ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output := ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- auto_length_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_cond;
     auto_length_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     auto_length_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_return_output := auto_length_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- tmp4_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_cond;
     tmp4_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     tmp4_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_return_output := tmp4_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- result_u8_value_MUX[uxn_device_h_l352_c9_73d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l352_c9_73d0_cond <= VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_cond;
     result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iftrue;
     result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_return_output := result_u8_value_MUX_uxn_device_h_l352_c9_73d0_return_output;

     -- y_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_y_MUX_uxn_device_h_l330_c3_af90_cond;
     y_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_y_MUX_uxn_device_h_l330_c3_af90_iftrue;
     y_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_y_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l330_c3_af90_return_output := y_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_return_output := result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- screen_blit_result_is_blit_done_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_cond;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_return_output := screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond;
     y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output := y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- auto_advance_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_cond;
     auto_advance_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     auto_advance_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_return_output := auto_advance_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- tmp16_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_cond;
     tmp16_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     tmp16_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_return_output := tmp16_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_cond;
     result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_return_output := result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- ram_addr_MUX[uxn_device_h_l342_c9_e832] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l342_c9_e832_cond <= VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_cond;
     ram_addr_MUX_uxn_device_h_l342_c9_e832_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_iftrue;
     ram_addr_MUX_uxn_device_h_l342_c9_e832_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_return_output := ram_addr_MUX_uxn_device_h_l342_c9_e832_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_cond;
     result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_return_output := result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_cond;
     x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output := x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- is_last_blit_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_cond;
     is_last_blit_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_iftrue;
     is_last_blit_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_return_output := is_last_blit_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- x_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_x_MUX_uxn_device_h_l330_c3_af90_cond;
     x_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_x_MUX_uxn_device_h_l330_c3_af90_iftrue;
     x_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_x_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l330_c3_af90_return_output := x_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l340_c23_bf94_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_auto_advance_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_auto_length_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_ram_addr_MUX_uxn_device_h_l342_c9_e832_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l352_c9_73d0_return_output;
     VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_tmp16_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_tmp16b_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_tmp4_MUX_uxn_device_h_l331_c4_97ca_return_output;
     VAR_x_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_x_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_y_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_y_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     -- ram_addr_incr_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_cond;
     ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output := ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond;
     x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output := x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- x_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_x_MUX_uxn_device_h_l315_c7_ebbd_cond;
     x_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_x_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     x_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_x_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l315_c7_ebbd_return_output := x_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- tmp4_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_cond;
     tmp4_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_iftrue;
     tmp4_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_return_output := tmp4_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- auto_length_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_cond;
     auto_length_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     auto_length_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_return_output := auto_length_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- auto_advance_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_cond;
     auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_return_output := auto_advance_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- ram_addr_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_cond;
     ram_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     ram_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_return_output := ram_addr_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- result_u8_value_MUX[uxn_device_h_l347_c9_b1bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_cond <= VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_cond;
     result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iftrue;
     result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_return_output := result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_cond;
     y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output := y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- tmp16b_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_cond;
     tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_return_output := tmp16b_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- y_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_y_MUX_uxn_device_h_l315_c7_ebbd_cond;
     y_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_y_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     y_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_y_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l315_c7_ebbd_return_output := y_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l324_c1_dbb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_return_output;

     -- is_last_blit_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_cond;
     is_last_blit_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_iftrue;
     is_last_blit_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_return_output := is_last_blit_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63[uxn_device_h_l330_c3_af90] LATENCY=0
     VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l330_c3_af90_return_output := CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63(
     screen_blit_result,
     VAR_screen_blit_result_is_blit_done_MUX_uxn_device_h_l331_c4_97ca_return_output);

     -- tmp16_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_cond;
     tmp16_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     tmp16_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_return_output := tmp16_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l324_c1_dbb0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_auto_length_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_ram_addr_MUX_uxn_device_h_l331_c4_97ca_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l347_c9_b1bb_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_screen_blit_result_TRUE_INPUT_MUX_CONST_REF_RD_screen_blit_result_t_screen_blit_result_t_fe63_uxn_device_h_l330_c3_af90_return_output;
     VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_tmp16_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_tmp16b_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_tmp4_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_x_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_x_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_y_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_y_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     -- auto_advance_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_cond;
     auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_return_output := auto_advance_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- tmp16b_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_cond;
     tmp16b_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_iftrue;
     tmp16b_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_return_output := tmp16b_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l342_c9_e832] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l342_c9_e832_cond <= VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_cond;
     result_u8_value_MUX_uxn_device_h_l342_c9_e832_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_iftrue;
     result_u8_value_MUX_uxn_device_h_l342_c9_e832_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_return_output := result_u8_value_MUX_uxn_device_h_l342_c9_e832_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_cond;
     ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_return_output := ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- tmp4_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_cond;
     tmp4_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     tmp4_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_return_output := tmp4_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- ram_addr_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_cond;
     ram_addr_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_iftrue;
     ram_addr_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_return_output := ram_addr_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- x_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_x_MUX_uxn_device_h_l310_c7_2ba2_cond;
     x_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_x_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     x_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_x_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l310_c7_2ba2_return_output := x_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- tmp16_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_cond;
     tmp16_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_iftrue;
     tmp16_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_return_output := tmp16_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond;
     x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output := x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- y_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_y_MUX_uxn_device_h_l310_c7_2ba2_cond;
     y_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_y_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     y_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_y_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l310_c7_2ba2_return_output := y_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l375_c1_35a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output;

     -- is_last_blit_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_cond;
     is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_return_output := is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- auto_length_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_cond;
     auto_length_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     auto_length_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_return_output := auto_length_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_cond;
     y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output := y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l375_c1_35a1_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_auto_length_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_ram_addr_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l342_c9_e832_return_output;
     VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_tmp16_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_tmp16b_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_tmp4_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_x_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_x_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_y_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_y_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l283_c7_8eff_return_output;
     -- result_u8_value_MUX[uxn_device_h_l331_c4_97ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l331_c4_97ca_cond <= VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_cond;
     result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iftrue;
     result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_return_output := result_u8_value_MUX_uxn_device_h_l331_c4_97ca_return_output;

     -- ram_addr_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_cond;
     ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_return_output := ram_addr_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- tmp4_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_cond;
     tmp4_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     tmp4_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_return_output := tmp4_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- x_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_x_MUX_uxn_device_h_l301_c7_045a_cond;
     x_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_x_MUX_uxn_device_h_l301_c7_045a_iftrue;
     x_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_x_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l301_c7_045a_return_output := x_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- tmp16b_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_cond;
     tmp16b_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_iftrue;
     tmp16b_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_return_output := tmp16b_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- tmp16_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_cond;
     tmp16_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_iftrue;
     tmp16_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_return_output := tmp16_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l376_c1_216f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond;
     x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output := x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l378_c1_c15b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_return_output;

     -- y_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_y_MUX_uxn_device_h_l301_c7_045a_cond;
     y_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_y_MUX_uxn_device_h_l301_c7_045a_iftrue;
     y_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_y_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l301_c7_045a_return_output := y_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- is_last_blit_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_cond;
     is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_return_output := is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_cond;
     ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output := ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_cond;
     y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output := y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- auto_length_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     auto_length_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_cond;
     auto_length_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     auto_length_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_return_output := auto_length_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- Submodule level 12
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l378_c1_c15b_return_output;
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l376_c1_216f_return_output;
     REG_VAR_auto_length := VAR_auto_length_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_ram_addr_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_ram_addr_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_tmp16_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_tmp16b_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_tmp4_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_x_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_x_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_x_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_y_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_y_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_y_sprite_incr_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     -- tmp16b_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_cond;
     tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_return_output := tmp16b_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- screen_2bpp[uxn_device_h_l377_c26_6ab1] LATENCY=0
     -- Clock enable
     screen_2bpp_uxn_device_h_l377_c26_6ab1_CLOCK_ENABLE <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_CLOCK_ENABLE;
     -- Inputs
     screen_2bpp_uxn_device_h_l377_c26_6ab1_phase <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_phase;
     screen_2bpp_uxn_device_h_l377_c26_6ab1_x1 <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_x1;
     screen_2bpp_uxn_device_h_l377_c26_6ab1_y1 <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_y1;
     screen_2bpp_uxn_device_h_l377_c26_6ab1_color <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_color;
     screen_2bpp_uxn_device_h_l377_c26_6ab1_fx <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_fx;
     screen_2bpp_uxn_device_h_l377_c26_6ab1_fy <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_fy;
     screen_2bpp_uxn_device_h_l377_c26_6ab1_ram_addr <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_ram_addr;
     screen_2bpp_uxn_device_h_l377_c26_6ab1_previous_ram_read <= VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_previous_ram_read;
     -- Outputs
     VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_return_output := screen_2bpp_uxn_device_h_l377_c26_6ab1_return_output;

     -- ram_addr_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_cond;
     ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_return_output := ram_addr_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- screen_1bpp[uxn_device_h_l379_c26_71a6] LATENCY=0
     -- Clock enable
     screen_1bpp_uxn_device_h_l379_c26_71a6_CLOCK_ENABLE <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_CLOCK_ENABLE;
     -- Inputs
     screen_1bpp_uxn_device_h_l379_c26_71a6_phase <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_phase;
     screen_1bpp_uxn_device_h_l379_c26_71a6_x1 <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_x1;
     screen_1bpp_uxn_device_h_l379_c26_71a6_y1 <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_y1;
     screen_1bpp_uxn_device_h_l379_c26_71a6_color <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_color;
     screen_1bpp_uxn_device_h_l379_c26_71a6_fx <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_fx;
     screen_1bpp_uxn_device_h_l379_c26_71a6_fy <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_fy;
     screen_1bpp_uxn_device_h_l379_c26_71a6_ram_addr <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_ram_addr;
     screen_1bpp_uxn_device_h_l379_c26_71a6_previous_ram_read <= VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_previous_ram_read;
     -- Outputs
     VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_return_output := screen_1bpp_uxn_device_h_l379_c26_71a6_return_output;

     -- tmp16_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_cond;
     tmp16_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     tmp16_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_return_output := tmp16_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- x_sprite_incr_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond;
     x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output := x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc[uxn_device_h_l330_c3_af90] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc_uxn_device_h_l330_c3_af90_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l331_c4_97ca_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l331_c4_97ca_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l331_c4_97ca_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l331_c4_97ca_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l331_c4_97ca_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l331_c4_97ca_return_output);

     -- y_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_y_MUX_uxn_device_h_l297_c7_f065_cond;
     y_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_y_MUX_uxn_device_h_l297_c7_f065_iftrue;
     y_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_y_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l297_c7_f065_return_output := y_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- y_sprite_incr_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_cond;
     y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output := y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- is_last_blit_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_cond;
     is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_return_output := is_last_blit_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- x_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_x_MUX_uxn_device_h_l297_c7_f065_cond;
     x_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_x_MUX_uxn_device_h_l297_c7_f065_iftrue;
     x_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_x_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l297_c7_f065_return_output := x_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- tmp4_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_cond;
     tmp4_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_iftrue;
     tmp4_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_return_output := tmp4_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- ram_addr_incr_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_cond;
     ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output := ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- Submodule level 13
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_ram_addr_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     REG_VAR_ram_addr_incr := VAR_ram_addr_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_result_MUX_uxn_device_h_l330_c3_af90_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc_uxn_device_h_l330_c3_af90_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iffalse := VAR_screen_1bpp_uxn_device_h_l379_c26_71a6_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iftrue := VAR_screen_2bpp_uxn_device_h_l377_c26_6ab1_return_output;
     VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_tmp16_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_tmp16b_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_tmp4_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_x_MUX_uxn_device_h_l297_c7_f065_return_output;
     REG_VAR_x_sprite_incr := VAR_x_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_y_MUX_uxn_device_h_l297_c7_f065_return_output;
     REG_VAR_y_sprite_incr := VAR_y_sprite_incr_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l376_c4_f294] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l376_c4_f294_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_cond;
     screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iftrue;
     screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output := screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output;

     -- x_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_x_MUX_uxn_device_h_l292_c7_e7b7_cond;
     x_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_x_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     x_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_x_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l292_c7_e7b7_return_output := x_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- tmp16_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_cond;
     tmp16_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     tmp16_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_return_output := tmp16_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- tmp4_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_cond;
     tmp4_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_iftrue;
     tmp4_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_return_output := tmp4_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- y_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_y_MUX_uxn_device_h_l292_c7_e7b7_cond;
     y_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_y_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     y_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_y_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l292_c7_e7b7_return_output := y_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- ram_addr_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_cond;
     ram_addr_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_iftrue;
     ram_addr_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_return_output := ram_addr_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- tmp16b_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_cond;
     tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_return_output := tmp16b_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- is_last_blit_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_cond;
     is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_return_output := is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- Submodule level 14
     VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_is_last_blit_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_ram_addr_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output;
     VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_tmp16_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_tmp16b_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_tmp4_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_x_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_y_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     -- tmp16_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_cond;
     tmp16_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     tmp16_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_return_output := tmp16_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- x_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_x_MUX_uxn_device_h_l288_c7_0d6e_cond;
     x_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_x_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     x_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_x_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l288_c7_0d6e_return_output := x_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- tmp16b_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_cond;
     tmp16b_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     tmp16b_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_return_output := tmp16b_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- tmp4_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_cond;
     tmp4_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     tmp4_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_return_output := tmp4_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_cond;
     screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iftrue;
     screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output := screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- ram_addr_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_cond;
     ram_addr_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_iftrue;
     ram_addr_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_return_output := ram_addr_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d[uxn_device_h_l384_c27_059c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l384_c27_059c_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d[uxn_device_h_l387_c22_e5de] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l387_c22_e5de_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output.u8_value;

     -- is_last_blit_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_cond;
     is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_return_output := is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- y_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_y_MUX_uxn_device_h_l288_c7_0d6e_cond;
     y_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_y_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     y_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_y_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l288_c7_0d6e_return_output := y_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d[uxn_device_h_l385_c22_9174] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l385_c22_9174_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l376_c4_f294_return_output.u16_addr;

     -- Submodule level 15
     REG_VAR_is_last_blit := VAR_is_last_blit_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_ram_addr_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_tmp16_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_tmp16b_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_tmp4_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_x_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_x_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_y_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_y_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     -- tmp16_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_cond;
     tmp16_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     tmp16_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_return_output := tmp16_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- x_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_x_MUX_uxn_device_h_l283_c7_8eff_cond;
     x_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_x_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     x_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_x_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l283_c7_8eff_return_output := x_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- ram_addr_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_cond;
     ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_return_output := ram_addr_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_3315 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_3315_return_output := VAR_screen_blit_result_MUX_uxn_device_h_l330_c3_af90_return_output.is_blit_done;

     -- tmp4_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_cond;
     tmp4_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     tmp4_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_return_output := tmp4_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- tmp16b_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_cond;
     tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_return_output := tmp16b_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7[uxn_device_h_l330_c3_af90] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l330_c3_af90_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39b7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l382_c4_efff,
     to_unsigned(0, 1),
     VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_vram_write_d41d_uxn_device_h_l384_c27_059c_return_output,
     VAR_CONST_REF_RD_uint16_t_screen_blit_result_t_u16_addr_d41d_uxn_device_h_l385_c22_9174_return_output,
     layer,
     VAR_CONST_REF_RD_uint8_t_screen_blit_result_t_u8_value_d41d_uxn_device_h_l387_c22_e5de_return_output);

     -- y_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_y_MUX_uxn_device_h_l283_c7_8eff_cond;
     y_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_y_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     y_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_y_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l283_c7_8eff_return_output := y_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_cond;
     screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_return_output := screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- Submodule level 16
     VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_right := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_3315_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_CONST_REF_RD_uint1_t_screen_blit_result_t_is_blit_done_d41d_uxn_device_h_l392_l391_DUPLICATE_3315_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_ram_addr_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_result_MUX_uxn_device_h_l330_c3_af90_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39b7_uxn_device_h_l330_c3_af90_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_tmp16_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_tmp16b_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_tmp4_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_x_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_y_MUX_uxn_device_h_l283_c7_8eff_return_output;
     -- is_blit_done_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_cond;
     is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_return_output := is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- tmp4_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_cond;
     tmp4_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     tmp4_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_return_output := tmp4_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- x_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_x_MUX_uxn_device_h_l280_c7_7bdc_cond;
     x_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_x_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     x_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_x_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l280_c7_7bdc_return_output := x_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- BIN_OP_XOR[uxn_device_h_l391_c11_a3d4] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_left <= VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_left;
     BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_right <= VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_return_output := BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_return_output;

     -- tmp16_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_cond;
     tmp16_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     tmp16_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_return_output := tmp16_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- result_MUX[uxn_device_h_l330_c3_af90] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l330_c3_af90_cond <= VAR_result_MUX_uxn_device_h_l330_c3_af90_cond;
     result_MUX_uxn_device_h_l330_c3_af90_iftrue <= VAR_result_MUX_uxn_device_h_l330_c3_af90_iftrue;
     result_MUX_uxn_device_h_l330_c3_af90_iffalse <= VAR_result_MUX_uxn_device_h_l330_c3_af90_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l330_c3_af90_return_output := result_MUX_uxn_device_h_l330_c3_af90_return_output;

     -- ram_addr_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_cond;
     ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_return_output := ram_addr_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- tmp16b_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_cond;
     tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_return_output := tmp16b_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_cond;
     screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_return_output := screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- y_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_y_MUX_uxn_device_h_l280_c7_7bdc_cond;
     y_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_y_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     y_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_y_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l280_c7_7bdc_return_output := y_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- Submodule level 17
     VAR_MUX_uxn_device_h_l391_c11_192e_cond := VAR_BIN_OP_XOR_uxn_device_h_l391_c11_a3d4_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_ram_addr_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_result_MUX_uxn_device_h_l330_c3_af90_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     REG_VAR_tmp16b := VAR_tmp16b_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_tmp4_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_x_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_y_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     -- x_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_x_MUX_uxn_device_h_l273_c2_e4b6_cond;
     x_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_x_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     x_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_x_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l273_c2_e4b6_return_output := x_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- result_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_result_MUX_uxn_device_h_l315_c7_ebbd_cond;
     result_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_result_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     result_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_result_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l315_c7_ebbd_return_output := result_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- MUX[uxn_device_h_l391_c11_192e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l391_c11_192e_cond <= VAR_MUX_uxn_device_h_l391_c11_192e_cond;
     MUX_uxn_device_h_l391_c11_192e_iftrue <= VAR_MUX_uxn_device_h_l391_c11_192e_iftrue;
     MUX_uxn_device_h_l391_c11_192e_iffalse <= VAR_MUX_uxn_device_h_l391_c11_192e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l391_c11_192e_return_output := MUX_uxn_device_h_l391_c11_192e_return_output;

     -- tmp4_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_cond;
     tmp4_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     tmp4_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_return_output := tmp4_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- is_blit_done_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_cond;
     is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_return_output := is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_cond;
     screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iftrue;
     screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_return_output := screen_blit_result_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- ram_addr_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_cond;
     ram_addr_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     ram_addr_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_return_output := ram_addr_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- y_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_y_MUX_uxn_device_h_l273_c2_e4b6_cond;
     y_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_y_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     y_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_y_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l273_c2_e4b6_return_output := y_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- Submodule level 18
     VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_iffalse := VAR_MUX_uxn_device_h_l391_c11_192e_return_output;
     VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_ram_addr_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_result_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_tmp4_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     -- tmp12_MUX[uxn_device_h_l315_c7_ebbd] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l315_c7_ebbd_cond <= VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_cond;
     tmp12_MUX_uxn_device_h_l315_c7_ebbd_iftrue <= VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_iftrue;
     tmp12_MUX_uxn_device_h_l315_c7_ebbd_iffalse <= VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_return_output := tmp12_MUX_uxn_device_h_l315_c7_ebbd_return_output;

     -- ram_addr_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_cond;
     ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_return_output := ram_addr_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- tmp4_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     tmp4_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_cond;
     tmp4_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     tmp4_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_return_output := tmp4_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- result_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_result_MUX_uxn_device_h_l310_c7_2ba2_cond;
     result_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_result_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     result_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_result_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l310_c7_2ba2_return_output := result_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- is_blit_done_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_cond;
     is_blit_done_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_iftrue;
     is_blit_done_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_return_output := is_blit_done_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_cond;
     screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iftrue;
     screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_return_output := screen_blit_result_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- Submodule level 19
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_ram_addr_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_result_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_result_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_iffalse := VAR_tmp12_MUX_uxn_device_h_l315_c7_ebbd_return_output;
     REG_VAR_tmp4 := VAR_tmp4_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     -- ram_addr_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     ram_addr_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_cond;
     ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_return_output := ram_addr_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_cond;
     screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_return_output := screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- result_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_result_MUX_uxn_device_h_l301_c7_045a_cond;
     result_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_result_MUX_uxn_device_h_l301_c7_045a_iftrue;
     result_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_result_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l301_c7_045a_return_output := result_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- is_blit_done_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_cond;
     is_blit_done_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_iftrue;
     is_blit_done_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_return_output := is_blit_done_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- tmp12_MUX[uxn_device_h_l310_c7_2ba2] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l310_c7_2ba2_cond <= VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_cond;
     tmp12_MUX_uxn_device_h_l310_c7_2ba2_iftrue <= VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_iftrue;
     tmp12_MUX_uxn_device_h_l310_c7_2ba2_iffalse <= VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_return_output := tmp12_MUX_uxn_device_h_l310_c7_2ba2_return_output;

     -- Submodule level 20
     VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l297_c7_f065_return_output;
     REG_VAR_ram_addr := VAR_ram_addr_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_result_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_result_MUX_uxn_device_h_l301_c7_045a_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_iffalse := VAR_tmp12_MUX_uxn_device_h_l310_c7_2ba2_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_cond;
     screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_return_output := screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- is_blit_done_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_cond;
     is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_return_output := is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- tmp12_MUX[uxn_device_h_l301_c7_045a] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l301_c7_045a_cond <= VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_cond;
     tmp12_MUX_uxn_device_h_l301_c7_045a_iftrue <= VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_iftrue;
     tmp12_MUX_uxn_device_h_l301_c7_045a_iffalse <= VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_return_output := tmp12_MUX_uxn_device_h_l301_c7_045a_return_output;

     -- result_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_result_MUX_uxn_device_h_l297_c7_f065_cond;
     result_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_result_MUX_uxn_device_h_l297_c7_f065_iftrue;
     result_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_result_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l297_c7_f065_return_output := result_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- Submodule level 21
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_result_MUX_uxn_device_h_l297_c7_f065_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_iffalse := VAR_tmp12_MUX_uxn_device_h_l301_c7_045a_return_output;
     -- result_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_result_MUX_uxn_device_h_l292_c7_e7b7_cond;
     result_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_result_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     result_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_result_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l292_c7_e7b7_return_output := result_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- is_blit_done_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_cond;
     is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_return_output := is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_cond;
     screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_return_output := screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- tmp12_MUX[uxn_device_h_l297_c7_f065] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l297_c7_f065_cond <= VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_cond;
     tmp12_MUX_uxn_device_h_l297_c7_f065_iftrue <= VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_iftrue;
     tmp12_MUX_uxn_device_h_l297_c7_f065_iffalse <= VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_return_output := tmp12_MUX_uxn_device_h_l297_c7_f065_return_output;

     -- Submodule level 22
     VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_result_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_iffalse := VAR_tmp12_MUX_uxn_device_h_l297_c7_f065_return_output;
     -- tmp12_MUX[uxn_device_h_l292_c7_e7b7] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l292_c7_e7b7_cond <= VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_cond;
     tmp12_MUX_uxn_device_h_l292_c7_e7b7_iftrue <= VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_iftrue;
     tmp12_MUX_uxn_device_h_l292_c7_e7b7_iffalse <= VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_return_output := tmp12_MUX_uxn_device_h_l292_c7_e7b7_return_output;

     -- is_blit_done_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_cond;
     is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_return_output := is_blit_done_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- result_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_result_MUX_uxn_device_h_l288_c7_0d6e_cond;
     result_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_result_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     result_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_result_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l288_c7_0d6e_return_output := result_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- screen_blit_result_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_cond;
     screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_return_output := screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- Submodule level 23
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l283_c7_8eff_return_output;
     VAR_result_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_result_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_screen_blit_result_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_iffalse := VAR_tmp12_MUX_uxn_device_h_l292_c7_e7b7_return_output;
     -- screen_blit_result_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_cond;
     screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_return_output := screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- result_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_result_MUX_uxn_device_h_l283_c7_8eff_cond;
     result_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_result_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     result_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_result_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l283_c7_8eff_return_output := result_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- is_blit_done_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_cond;
     is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_return_output := is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- tmp12_MUX[uxn_device_h_l288_c7_0d6e] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l288_c7_0d6e_cond <= VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_cond;
     tmp12_MUX_uxn_device_h_l288_c7_0d6e_iftrue <= VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_iftrue;
     tmp12_MUX_uxn_device_h_l288_c7_0d6e_iffalse <= VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_return_output := tmp12_MUX_uxn_device_h_l288_c7_0d6e_return_output;

     -- Submodule level 24
     VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_is_blit_done_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_result_MUX_uxn_device_h_l283_c7_8eff_return_output;
     REG_VAR_screen_blit_result := VAR_screen_blit_result_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_iffalse := VAR_tmp12_MUX_uxn_device_h_l288_c7_0d6e_return_output;
     -- result_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_result_MUX_uxn_device_h_l280_c7_7bdc_cond;
     result_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_result_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     result_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_result_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l280_c7_7bdc_return_output := result_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- is_blit_done_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_cond;
     is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_return_output := is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- tmp12_MUX[uxn_device_h_l283_c7_8eff] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l283_c7_8eff_cond <= VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_cond;
     tmp12_MUX_uxn_device_h_l283_c7_8eff_iftrue <= VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_iftrue;
     tmp12_MUX_uxn_device_h_l283_c7_8eff_iffalse <= VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_return_output := tmp12_MUX_uxn_device_h_l283_c7_8eff_return_output;

     -- Submodule level 25
     REG_VAR_is_blit_done := VAR_is_blit_done_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_result_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_iffalse := VAR_tmp12_MUX_uxn_device_h_l283_c7_8eff_return_output;
     -- tmp12_MUX[uxn_device_h_l280_c7_7bdc] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l280_c7_7bdc_cond <= VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_cond;
     tmp12_MUX_uxn_device_h_l280_c7_7bdc_iftrue <= VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_iftrue;
     tmp12_MUX_uxn_device_h_l280_c7_7bdc_iffalse <= VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_return_output := tmp12_MUX_uxn_device_h_l280_c7_7bdc_return_output;

     -- result_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_result_MUX_uxn_device_h_l273_c2_e4b6_cond;
     result_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_result_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     result_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_result_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l273_c2_e4b6_return_output := result_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- Submodule level 26
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l273_c2_e4b6_return_output;
     VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_iffalse := VAR_tmp12_MUX_uxn_device_h_l280_c7_7bdc_return_output;
     -- tmp12_MUX[uxn_device_h_l273_c2_e4b6] LATENCY=0
     -- Inputs
     tmp12_MUX_uxn_device_h_l273_c2_e4b6_cond <= VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_cond;
     tmp12_MUX_uxn_device_h_l273_c2_e4b6_iftrue <= VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_iftrue;
     tmp12_MUX_uxn_device_h_l273_c2_e4b6_iffalse <= VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_iffalse;
     -- Outputs
     VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_return_output := tmp12_MUX_uxn_device_h_l273_c2_e4b6_return_output;

     -- Submodule level 27
     REG_VAR_tmp12 := VAR_tmp12_MUX_uxn_device_h_l273_c2_e4b6_return_output;
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
